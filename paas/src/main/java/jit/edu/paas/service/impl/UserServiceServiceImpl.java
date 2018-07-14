package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import jit.edu.paas.domain.entity.UserService;
import jit.edu.paas.mapper.UserServiceMapper;
import jit.edu.paas.service.UserServiceService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.ImmutableList;
import com.spotify.docker.client.DockerClient;
import com.spotify.docker.client.LogStream;
import com.spotify.docker.client.exceptions.DockerException;
import com.spotify.docker.client.messages.*;
import com.spotify.docker.client.messages.mount.Mount;
import com.spotify.docker.client.messages.mount.VolumeOptions;
import com.spotify.docker.client.messages.swarm.*;
import jit.edu.paas.commons.activemq.MQProducer;
import jit.edu.paas.commons.activemq.Task;
import jit.edu.paas.commons.convert.UserServiceDTOConvert;
import jit.edu.paas.commons.util.*;
import jit.edu.paas.domain.dto.UserServiceDTO;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.entity.SysVolume;
import jit.edu.paas.domain.entity.UserService;
import jit.edu.paas.domain.enums.*;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.mapper.SysVolumesMapper;
import jit.edu.paas.mapper.UserProjectMapper;
import jit.edu.paas.mapper.UserServiceMapper;
import jit.edu.paas.service.*;
import lombok.extern.slf4j.Slf4j;

import javax.imageio.spi.ServiceRegistry;
import javax.jms.Destination;
import org.apache.activemq.command.ActiveMQQueue;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

/**
 * <p>
 * 用户服务表 服务实现类
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-11
 */
@Service
@Slf4j
public class UserServiceServiceImpl extends ServiceImpl<UserServiceMapper, UserService> implements UserServiceService {

    @Autowired
    private DockerClient dockerClient;
    @Autowired
    private UserServiceDTOConvert dtoConvert;
    @Autowired
    private UserServiceMapper userServiceMapper;
    @Autowired
    private UserProjectMapper projectMapper;
    @Autowired
    private SysVolumesMapper sysVolumesMapper;
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private SysImageService imageService;
    @Autowired
    private SysLogService sysLogService;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private ProjectLogService projectLogService;
    @Autowired
    private MQProducer mqProducer;
    @Autowired
    private PortService portService;

    @Override
    public ResultVO checkPermission(String userId, String serviceId) {
        // 1、鉴权
        String roleName = loginService.getRoleName(userId);
        // 1.1、角色无效
        if(StringUtils.isBlank(roleName)) {
            return ResultVOUtils.error(ResultEnum.AUTHORITY_ERROR);
        }
        // 1.2、越权访问
        if(RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            UserServiceDTO serviceDTO = getById(serviceId);
            if(serviceDTO == null) {
                return ResultVOUtils.error(ResultEnum.SERVICE_NOT_FOUND);
            }
            if(!projectMapper.hasBelong(serviceDTO.getProjectId(), userId)) {
                return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
            }
        }
        return ResultVOUtils.success();
    }

    @Override
    public UserServiceDTO getById(String id) {
        return dtoConvert.convert(userServiceMapper.selectById(id));
    }

    @Override
    public Page<UserServiceDTO> listUserServiceByUserId(String userId, Page<UserService> page) {
        List<UserService> services = userServiceMapper.listServiceByUserId(page, userId);

        Page<UserServiceDTO> page1 = new Page<>();
        BeanUtils.copyProperties(page, page1);
        return page1.setRecords(dtoConvert.convert(services));
    }

    @Override
    public com.spotify.docker.client.messages.swarm.Service inspectById(String id) {
        try {
            return dockerClient.inspectService(id);
        } catch (Exception e) {
            log.error("获取服务详细出现异常，异常位置：{}，错误栈：{}","UserServiceServiceImpl.inspectById()",HttpClientUtils.getStackTraceAsString(e));
            return null;
        }
    }

    @Override
    public void removeServiceTask(String userId, String serviceId) {
        try {
            // 执行任务
            Future<ResultVO> future = removeService(serviceId);
            // 获取执行结果，不超过10s
            ResultVO resultVO = future.get(10, TimeUnit.SECONDS);

            if(resultVO == null) {
                sendMQ(userId, serviceId, ResultVOUtils.error(ResultEnum.REQUEST_TIMEOUT));
            } else {
                sendMQ(userId, serviceId, resultVO);
            }
        } catch (Exception e) {
            log.error("执行删除服务异步任务出现错误，错误位置：{}，错误栈：{}",
                    "UserServiceServiceImpl.removeServiceTask()", HttpClientUtils.getStackTraceAsString(e));
            sendMQ(userId, serviceId, ResultVOUtils.error(ResultEnum.REQUEST_ERROR));
        }
    }

    @Override
    public LogStream logById(String id) {
        try {
            return dockerClient.serviceLogs(id,DockerClient.LogsParam.stdout());
        } catch (Exception e) {
            log.error("获取服务日志出现异常，异常位置：{}，错误栈：{}","UserServiceServiceImpl.logById",HttpClientUtils.getStackTraceAsString(e));
            return null;
        }
    }

    @Async("taskExecutor")
    @Transactional(rollbackFor = Exception.class)
    public Future<ResultVO> removeService(String serviceId) {
        try {
            dockerClient.removeService(serviceId);
            // 删除数据
            userServiceMapper.deleteById(serviceId);
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.DELETE_SERVICE);
            String projectId = getProjectId(serviceId);
            projectLogService.saveSuccessLog(getProjectId(serviceId), serviceId, ProjectLogTypeEnum.DELETE_SERVICE);
            // 发送成功消息
            return new AsyncResult<>(ResultVOUtils.success("删除服务成功"));
        } catch (Exception e) {
            log.error("删除服务出现异常，异常位置：{}，错误栈：{}",
                    "UserServiceServiceImpl.removeService()", HttpClientUtils.getStackTraceAsString(e));
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.DELETE_SERVICE, e);
            projectLogService.saveErrorLog(getProjectId(serviceId),serviceId, ProjectLogTypeEnum.DELETE_SERVICE_ERROR,ResultEnum.DOCKER_EXCEPTION);
            // 发送异常消息
            return new AsyncResult<>(ResultVOUtils.error(ResultEnum.DOCKER_EXCEPTION));
        }
    }

    @Override
    public void createServiceTask(String userId,String imageId, String[] cmd, Map<String,Integer> portMap,int replicas,
                                  String serviceName, String projectId, String[] env, String source,String destination,Map<String,String> lables) {
        try {
            // 执行任务
            Future<ResultVO> future = createService(imageId,cmd, portMap,replicas, serviceName, projectId,env,source,destination,lables);
            // 获取执行结果，不超过10s
            ResultVO resultVO = future.get(10, TimeUnit.SECONDS);

            if(resultVO == null) {
                sendMQ(userId, null, ResultVOUtils.error(ResultEnum.REQUEST_TIMEOUT));
            } else {
                String serviceId = (String)resultVO.getData();
                sendMQ(userId, serviceId, resultVO);
            }
        } catch (Exception e) {
            log.error("执行创建服务异步任务出现错误，错误位置：{}，错误栈：{}",
                    "UserServiceServiceImpl.createServiceTask()", HttpClientUtils.getStackTraceAsString(e));
            sendMQ(userId, null, ResultVOUtils.error(ResultEnum.REQUEST_ERROR));
        }
    }

    @Async("taskExecutor")
    @Transactional(rollbackFor = Exception.class)
    public Future<ResultVO> createService(String imageId, String[] cmd, Map<String,Integer> portMap,int replicas,
                                          String serviceName, String projectId, String[] env, String source,String destination,Map<String,String> lables) {
        SysImage image = imageService.getById(imageId);
        UserService us = new UserService();
        ServiceSpec.Builder builder = ServiceSpec.builder();
        TaskSpec.Builder taskBuilder = TaskSpec.builder();

        //设置任务模板
        ContainerSpec.Builder containerBuilder = ContainerSpec.builder();
        containerBuilder.image(image.getFullName());
        containerBuilder.tty(true);
        if(CollectionUtils.isNotArrayEmpty(cmd)) {
            containerBuilder.command(cmd);
            us.setCommand(Arrays.toString(cmd));
        }
        if(StringUtils.isNotBlank(destination)) {
            Mount.Builder mountBuilder = Mount.builder();
            mountBuilder.type("volume");
            mountBuilder.source(source);
            mountBuilder.target(destination);
            mountBuilder.volumeOptions(VolumeOptions.builder().build());
            containerBuilder.mounts(mountBuilder.build());
        }
        if(CollectionUtils.isNotArrayEmpty(env)) {
            containerBuilder.env(env);
            us.setEnv(Arrays.toString(env));
        }
        taskBuilder.containerSpec(containerBuilder.build());
        builder.taskTemplate(taskBuilder.build());

        //设置服务名
        builder.name(serviceName);
        //设置服务策略
        builder.mode(ServiceMode.withReplicas(replicas));
        //设置服务标签
        if(lables != null) {
            builder.labels(lables);
        }

        // 设置暴露端口
        if(portMap != null) {
            // 宿主机端口与暴露端口绑定
            Map<String, List<PortBinding>> portBindings = new HashMap<>(16);

            PortConfig.Builder portBuilder = PortConfig.builder();
            portBuilder.protocol("tcp");

            portMap.forEach((k, v) -> {
                // 捆绑端口
                List<PortBinding> hostPorts = new ArrayList<>();
                // 分配主机端口，如果用户输入端口被占用，随机分配
                Integer hostPort = portService.hasUse(v) ? portService.randomPort() : v;
                hostPorts.add(PortBinding.of("0.0.0.0", hostPort));
                portBindings.put(k, hostPorts);

                portBuilder.targetPort(Integer.valueOf(k.substring(0, k.indexOf('/'))));
                portBuilder.publishedPort(hostPort);
            });

            us.setPort(JsonUtils.objectToJson(portBindings));

            EndpointSpec.Builder endBuilder = EndpointSpec.builder();
            endBuilder.ports(portBuilder.build());
        }

        try {
            ServiceCreateResponse creation = dockerClient.createService(builder.build());

            us.setId(creation.id());
            // 仅存在于数据库，不代表实际容器名
            us.setName(serviceName);
            us.setProjectId(projectId);
            us.setImage(image.getFullName());

            if(StringUtils.isNotBlank(destination)) {
                // 为数据库中的sysvolumes插入
                ImmutableList<Mount> info = dockerClient.inspectService(creation.id()).spec().taskTemplate().containerSpec().mounts();
                if (info != null) {
                    SysVolume sysVolume = new SysVolume();
                    sysVolume.setContainerId(creation.id());
                    sysVolume.setDestination(destination);
                    sysVolume.setName(info.get(0).target());
                    sysVolume.setSource(info.get(0).source());
                    sysVolumesMapper.insert(sysVolume);
                }
            }

            // 3、设置状态
            us.setStatus(1);
            us.setCreateDate(new Date());
            us.setUpdateDate(new Date());

            userServiceMapper.insert(us);

            // 4、写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.CREATE_SERVICE);
            projectLogService.saveSuccessLog(projectId,us.getId(),ProjectLogTypeEnum.CREATE_SERVICE);

            return new AsyncResult<>(ResultVOUtils.success(creation.id()));
        } catch (Exception e) {
            log.error("创建服务出现异常，异常位置：{}，错误栈：{}",
                    "UserServiceServiceImpl.createService()", HttpClientUtils.getStackTraceAsString(e));

            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.CREATE_SERVICE, e);
            projectLogService.saveErrorLog(projectId,us.getId(),ProjectLogTypeEnum.CREATE_SERVICE_ERROR,ResultEnum.DOCKER_EXCEPTION);

            return new AsyncResult<>(ResultVOUtils.error(ResultEnum.DOCKER_EXCEPTION));
        }
    }

    /**
     * 根据服务ID获取项目ID
     * @author hf
     * @since 2018/7/13 16:47
     */
    private String getProjectId(String serviceId) {
        UserService userService = userServiceMapper.selectById(serviceId);
        return  userService == null ? null : userService.getProjectId();
    }

    /**
     * 发送容器消息
     * @author hf
     * @since 2018/7/13 18:34
     */
    private void sendMQ(String userId, String serviceId, ResultVO resultVO) {
        Destination destination = new ActiveMQQueue("MQ_QUEUE_SERVICE");
        Task task = new Task();
        Map<String,String> map = new HashMap<>(16);
        map.put("uid",userId);
        map.put("serviceId",serviceId);
        map.put("data", JsonUtils.objectToJson(resultVO));
        task.setData(map);

        mqProducer.send(destination, JsonUtils.objectToJson(task));
    }
}