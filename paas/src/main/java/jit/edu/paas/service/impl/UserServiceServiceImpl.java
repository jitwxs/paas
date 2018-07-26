package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.ImmutableList;
import com.spotify.docker.client.DockerClient;
import com.spotify.docker.client.exceptions.DockerRequestException;
import com.spotify.docker.client.messages.ServiceCreateResponse;
import com.spotify.docker.client.messages.mount.Mount;
import com.spotify.docker.client.messages.mount.VolumeOptions;
import com.spotify.docker.client.messages.swarm.*;
import jit.edu.paas.commons.activemq.MQProducer;
import jit.edu.paas.commons.activemq.Task;
import jit.edu.paas.commons.convert.UserServiceDTOConvert;
import jit.edu.paas.commons.util.*;
import jit.edu.paas.commons.util.jedis.JedisClient;
import jit.edu.paas.domain.dto.UserServiceDTO;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.entity.SysVolume;
import jit.edu.paas.domain.entity.UserService;
import jit.edu.paas.domain.enums.*;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.exception.CustomException;
import jit.edu.paas.mapper.UserProjectMapper;
import jit.edu.paas.mapper.UserServiceMapper;
import jit.edu.paas.service.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.activemq.command.ActiveMQQueue;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.jms.Destination;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

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
    private DockerClient dockerSwarmClient;
    @Autowired
    private UserServiceDTOConvert dtoConvert;
    @Autowired
    private UserServiceMapper userServiceMapper;
    @Autowired
    private UserProjectMapper projectMapper;
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private SysImageService imageService;
    @Autowired
    private SysLogService sysLogService;
    @Autowired
    private ProjectLogService projectLogService;
    @Autowired
    private SysVolumeService volumeService;
    @Autowired
    private MQProducer mqProducer;
    @Autowired
    private PortService portService;
    @Autowired
	private NoticeService noticeService;
    @Autowired
    private JedisClient jedisClient;

    @Value("${redis.user-service.ley}")
    private String key;

    @Override
    public ResultVO checkPermission(String userId, String serviceId) {
        // 1、鉴权
        String roleName = loginService.getRoleName(userId);
        // 1.1、角色无效
        if(StringUtils.isBlank(roleName)) {
            return ResultVOUtils.error(ResultEnum.AUTHORITY_ERROR);
        }
        // 1.2 是否存在
        UserServiceDTO serviceDTO = getById(serviceId);
        if(serviceDTO == null) {
            return ResultVOUtils.error(ResultEnum.SERVICE_NOT_FOUND);
        }
        // 1.3、越权访问
        if(RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            if(!projectMapper.hasBelong(serviceDTO.getProjectId(), userId)) {
                return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
            }
        }
        return ResultVOUtils.success(serviceDTO);
    }

    @Override
    public UserServiceDTO getById(String id) {
        try {
            String json = jedisClient.hget(key, id);
            if(StringUtils.isNotBlank(json)) {
                return JsonUtils.jsonToObject(json, UserServiceDTO.class);
            }
        } catch (Exception e) {
            log.error("缓存读取异常，异常位置：{}","UserServiceServiceImpl.getById()");
        }

        UserServiceDTO serviceDTO = dtoConvert.convert(userServiceMapper.selectById(id));
        if(serviceDTO == null) {
            return null;
        }

        try {
            jedisClient.hset(key, id, JsonUtils.objectToJson(serviceDTO));
        } catch (Exception e) {
            log.error("缓存存储异常，异常位置：{}", "UserServiceServiceImpl.getById()");
        }

        return serviceDTO;
    }

    @Override
    public String getName(String id) {
        UserService service = getById(id);

        if(service != null) {
            return service.getName();
        } else {
            return null;
        }
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
            return dockerSwarmClient.inspectService(id);
        } catch (Exception e) {
            log.error("获取服务详细出现异常，异常位置：{}，错误信息：{}","UserServiceServiceImpl.inspectById()", e.getMessage());
            return null;
        }
    }

    @Override
    public ResultVO checkServiceName(String serviceName, String userId) {
        // 判断特殊字符
        if(StringUtils.isNotAlphaOrNumeric(serviceName)) {
            return ResultVOUtils.error(ResultEnum.SERVICE_NAME_ILLEGAL);
        }

        // 判断fullName是否存在
        List<UserService> services = userServiceMapper.selectList(new EntityWrapper<UserService>()
                .eq("name", serviceName)
                .eq("user_id", userId));

        if(CollectionUtils.getListFirst(services) != null) {
            return ResultVOUtils.error(ResultEnum.SERVICE_NAME_EXIST);
        }

        return ResultVOUtils.success();
    }

    @Async("taskExecutor")
    @Transactional(rollbackFor = CustomException.class)
    @Override
    public void deleteServiceTask(String userId, String serviceId,HttpServletRequest request) {
        String serviceName = getById(serviceId).getName();
        try {
            dockerSwarmClient.removeService(serviceId);
            // 删除数据
            userServiceMapper.deleteById(serviceId);
            cleanCache(serviceId);
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.DELETE_SERVICE);

            projectLogService.saveSuccessLog(getProjectId(serviceId), serviceId, ProjectLogTypeEnum.DELETE_SERVICE);

            // 发送通知
            List<String> receiverList = new ArrayList<>();
            receiverList.add(userId);
            noticeService.sendUserTask("删除服务", "删除服务【" +serviceName+ "】成功", 3, false, receiverList, null);

            // 发送成功消息
            sendMQ(userId, serviceId, ResultVOUtils.successWithMsg("删除服务成功"));
        } catch (Exception e) {
            log.error("删除服务出现异常，异常位置：{}，错误栈：{}",
                    "UserServiceServiceImpl.deleteServiceTask()", HttpClientUtils.getStackTraceAsString(e));
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.DELETE_SERVICE, e);
            projectLogService.saveErrorLog(getProjectId(serviceId),serviceId, ProjectLogTypeEnum.DELETE_SERVICE_ERROR,ResultEnum.DOCKER_EXCEPTION);

            // 发送通知
            List<String> receiverList = new ArrayList<>();
            receiverList.add(userId);
            noticeService.sendUserTask("删除服务","删除服务【"+serviceName+"】失败,Docker异常", 3, false, receiverList, null);

            // 发送异常消息
            sendMQ(userId, serviceId, ResultVOUtils.error(ResultEnum.DOCKER_EXCEPTION));
        }
    }

    @Transactional(rollbackFor = CustomException.class)
    @Override
    public ResultVO scale(String serviceId, Integer num) {
        try {
            UserServiceDTO serviceDTO = getById(serviceId);
            ServiceSpec.Builder builder = ServiceSpec.builder();
            builder.name(serviceDTO.getFullName());
            // 更新横向扩展数目
            builder.mode(ServiceMode.withReplicas(num));
            // 设置任务模板
            TaskSpec.Builder taskBuilder = TaskSpec.builder();

            ContainerSpec.Builder containerBuilder = ContainerSpec.builder();
            containerBuilder.image(serviceDTO.getImage());

            taskBuilder.containerSpec(containerBuilder.build());
            builder.taskTemplate(taskBuilder.build());

            dockerSwarmClient.updateService(serviceId,dockerSwarmClient.inspectService(serviceId).version().index(),builder.build());
            // 更新数据库
            serviceDTO.setReplicas(num);
            userServiceMapper.updateById(serviceDTO);

            return ResultVOUtils.success();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultVOUtils.error(ResultEnum.SERVICE_SCALE_ERROR);
        }
    }

    @Override
    public ResultVO changeBelongProject(String serviceId, String projectId, String uid) {
        if(!userServiceMapper.hasBelong(serviceId, uid)) {
            return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
        }

        if(!projectMapper.hasBelong(projectId, uid)) {
            return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
        }

        userServiceMapper.changeBelongProject(serviceId, projectId);
        cleanCache(serviceId);

        return ResultVOUtils.success();
    }

    @Override
    public void cleanCache(String id) {
        try {
            jedisClient.hdel(key, id);
        } catch (Exception e) {
            log.error("缓存清理异常，异常位置：{}", "UserServiceServiceImpl.cleanCache()");
        }
    }

    @Async("taskExecutor")
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void createServiceTask(String userId, String imageId, String[] cmd, Map<String,String> portMap, int replicas,
                                  String serviceName, String projectId, String[] env, String[] destination,
                                  Map<String,String> labels, HttpServletRequest request) {
        SysImage image = imageService.getById(imageId);
        UserService us = new UserService();
        ServiceSpec.Builder builder = ServiceSpec.builder();
        TaskSpec.Builder taskBuilder = TaskSpec.builder();

        // 1、设置任务模板
        ContainerSpec.Builder containerBuilder = ContainerSpec.builder();
        containerBuilder.image(image.getFullName());
        containerBuilder.tty(true);
        // 设置CMD
        if(CollectionUtils.isNotArrayEmpty(cmd)) {
            containerBuilder.command(cmd);
            us.setCommand(Arrays.toString(cmd));
        }

        // 设置destination
        if(CollectionUtils.isNotArrayEmpty(destination)) {
            List<Mount> mounts = new ArrayList<>();
            for(String d : destination) {
                // 创建数据卷
                SysVolume volumes = volumeService.createVolumes(null, VolumeTypeEnum.SERVICE);

                Mount.Builder mountBuilder = Mount.builder();
                //mountBuilder.type("volume");
                mountBuilder.source(volumes.getSource());
                mountBuilder.target(d);
                //mountBuilder.volumeOptions(VolumeOptions.builder().build());

                mounts.add(mountBuilder.build());
            }
            containerBuilder.mounts(mounts);
        }

        // 设置环境变量
        if(CollectionUtils.isNotArrayEmpty(env)) {
            containerBuilder.env(env);
            us.setEnv(Arrays.toString(env));
        }
        taskBuilder.containerSpec(containerBuilder.build());
        builder.taskTemplate(taskBuilder.build());

        // 设置名称
        builder.name(userId + "-" + serviceName);
        // 设置策略
        builder.mode(ServiceMode.withReplicas(replicas));
        // 设置标签
        if(labels != null) {
            builder.labels(labels);
        }

        // 设置暴露端口
        if(portMap != null) {
            Map<Integer, Integer> portBindings = new HashMap<>(16);

            PortConfig.Builder portBuilder = PortConfig.builder();
            portBuilder.protocol("tcp");

            for (Map.Entry<String, String> entry : portMap.entrySet()) {
                int k = Integer.parseInt(entry.getKey()), v = Integer.parseInt(entry.getValue());
                // 分配主机端口，如果用户输入端口被占用，随机分配
                Integer hostPort = portService.hasUse(v) ? portService.randomPort() : v;
                // 设置暴露端口与内部端口
                portBuilder.targetPort(k);
                portBuilder.publishedPort(hostPort);

                // 假如集合，存储数据库
                portBindings.put(k, hostPort);
            }

            us.setPort(JsonUtils.objectToJson(portBindings));

            EndpointSpec endpointSpec = EndpointSpec.builder()
                    .ports(portBuilder.build())
                    .build();

            builder.endpointSpec(endpointSpec);
        }

        // 2、创建服务
        try {
            ServiceCreateResponse creation = dockerSwarmClient.createService(builder.build());

            us.setId(creation.id());
            us.setName(serviceName);
            us.setUserId(userId);
            us.setProjectId(projectId);
            us.setImage(image.getFullName());
            us.setReplicas(replicas);

            // 为数据库中的sysvolumes插入
            if(CollectionUtils.isNotArrayEmpty(destination)) {
                ImmutableList<Mount> info = dockerSwarmClient.inspectService(creation.id()).spec().taskTemplate().containerSpec().mounts();
                if(info != null) {
                    for(Mount mount : info) {
                        String source = mount.source();
                        SysVolume sysVolume = volumeService.getBySource(source);
                        if(sysVolume != null) {
                            volumeService.bind(sysVolume.getId(), creation.id(), mount.target(), VolumeTypeEnum.SERVICE);
                        }
                    }
                }
            }

            // 3、插入数据库
            userServiceMapper.insert(us);

            // 4、写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.CREATE_SERVICE);
            projectLogService.saveSuccessLog(projectId,us.getId(),ProjectLogTypeEnum.CREATE_SERVICE);

            // 发送通知
            List<String> receiverList = new ArrayList<>();
            receiverList.add(userId);
            noticeService.sendUserTask("创建服务","创建服务【"+serviceName+"】成功", 3, false, receiverList, null);

            sendMQ(userId, creation.id(), ResultVOUtils.successWithMsg("服务创建成功"));
        } catch (DockerRequestException requestException){
            log.error("服务创建失败，错误位置：{}，错误原因：{}",
                    "UserServiceServiceImpl.createServiceTask()", requestException.getMessage());
            sendMQ(userId, null, ResultVOUtils.error(
                    ResultEnum.SERVICE_CREATE_ERROR.getCode(),HttpClientUtils.getErrorMessage(requestException.getMessage())));
        } catch (Exception e) {
            log.error("创建服务出现异常，异常位置：{}，错误栈：{}",
                    "UserServiceServiceImpl.createServiceTask()", HttpClientUtils.getStackTraceAsString(e));

            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.CREATE_SERVICE, e);
            projectLogService.saveErrorLog(projectId,us.getId(),ProjectLogTypeEnum.CREATE_SERVICE_ERROR,ResultEnum.DOCKER_EXCEPTION);

            // 发送通知
            List<String> receiverList = new ArrayList<>();
            receiverList.add(userId);
            noticeService.sendUserTask("创建服务","创建服务【"+serviceName+"】失败,Docker异常", 3, false, receiverList, null);

            sendMQ(userId, null, ResultVOUtils.error(ResultEnum.DOCKER_EXCEPTION));
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

        Map<String, Object> data = new HashMap<>(16);
        data.put("type", WebSocketTypeEnum.SERVICE.getCode());
        data.put("serviceId",serviceId);
        resultVO.setData(data);

        Map<String,String> map = new HashMap<>(16);
        map.put("uid",userId);
        map.put("data", JsonUtils.objectToJson(resultVO));
        task.setData(map);

        mqProducer.send(destination, JsonUtils.objectToJson(task));
    }
}