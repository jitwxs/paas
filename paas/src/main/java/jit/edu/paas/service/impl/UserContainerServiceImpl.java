package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.UnmodifiableIterator;
import com.spotify.docker.client.DockerClient;
import com.spotify.docker.client.messages.*;
import jit.edu.paas.commons.util.*;
import jit.edu.paas.commons.util.jedis.JedisClient;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.entity.SysVolume;
import jit.edu.paas.domain.entity.UserContainer;
import jit.edu.paas.domain.enums.*;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.exception.CustomException;
import jit.edu.paas.mapper.SysVolumesMapper;
import jit.edu.paas.mapper.UserContainerMapper;
import jit.edu.paas.mapper.UserProjectMapper;
import jit.edu.paas.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.*;


/**
 * <p>
 * 用户容器表 服务实现类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Service
@Slf4j
public class UserContainerServiceImpl extends ServiceImpl<UserContainerMapper, UserContainer> implements UserContainerService {
    @Autowired
    private DockerClient dockerClient;
    @Autowired
    private PortService portService;
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private SysImageService imageService;
    @Autowired
    private SysLogService sysLogService;
    @Autowired
    private ProjectLogService projectLogService;
    @Autowired
	private SysVolumesMapper sysVolumesMapper;
    @Autowired
    private UserProjectMapper projectMapper;
    @Autowired
    private UserContainerMapper userContainerMapper;
    @Autowired
    private JedisClient jedisClient;
    @Autowired
    private HttpServletRequest request;

    @Value("${redis.user-container.key}")
    private String key;

    @Override
    public UserContainer getById(String id) {
        try {
            String json = jedisClient.hget(key, id);
            if(StringUtils.isNotBlank(json)) {
                return JsonUtils.jsonToObject(json, UserContainer.class);
            }
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：UserContainerServiceImpl.getById()");
        }

        UserContainer container = userContainerMapper.selectById(id);

        if(container == null) {
            return null;
        }

        try {
            jedisClient.hset(key, id, JsonUtils.objectToJson(container));
        } catch (Exception e) {
            log.error("缓存存储异常，错误位置：UserContainerServiceImpl.getById()");
        }

        return container;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVo startContainer(String userId, String containerId) {
        // 1、鉴权
        ResultVo resultVo = checkPermission(userId, containerId);
        if(ResultEnum.OK.getCode() != resultVo.getCode()) {
            return resultVo;
        }

        // 2、开启容器
        try {
            dockerClient.startContainer(containerId);
            // 写入日志
            projectLogService.saveSuccessLog(getProjectId(containerId),containerId,ProjectLogTypeEnum.START_CONTAINER);

            // 查询并修改状态
            return changeStatus(containerId);
        } catch (Exception e) {
            log.error("开启容器出现异常，异常位置：{}，错误信息：{}",
                    "UserContainerServiceImpl.startContainer()",HttpClientUtils.getStackTraceAsString(e));
            // 写入日志
            projectLogService.saveErrorLog(getProjectId(containerId),containerId,ProjectLogTypeEnum.START_CONTAINER_ERROR,ResultEnum.DOCKER_EXCEPTION);

            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVo createContainer(String userId, String imageId, String[] cmd, ImmutableSet<String> exportPorts,
                                    String containerName, String projectId, String[] env, String[] destination) {
        // Project鉴权
        Boolean b = projectMapper.hasBelong(projectId, userId);
        if(!b) {
            return ResultVoUtils.error(ResultEnum.PERMISSION_ERROR.getCode(), "项目不存在或权限错误");
        }

        // 校验Image
        SysImage image = imageService.getById(imageId);
        if(image == null) {
            return ResultVoUtils.error(ResultEnum.IMAGE_EXCEPTION);
        }
        if(!imageService.hasAuthImage(userId, image)) {
            return ResultVoUtils.error(ResultEnum.PERMISSION_ERROR);
        }

        UserContainer uc = new UserContainer();
        HostConfig hostConfig;
        ContainerConfig.Builder builder = ContainerConfig.builder();

        // 设置暴露端口
        if(exportPorts != null) {
            // 宿主机端口与暴露端口绑定
            Set<String> realExportPorts = new HashSet<>();
            Map<String, List<PortBinding>> portBindings = new HashMap<>(16);
            UnmodifiableIterator<String> iterator = exportPorts.iterator();

            // 去除/tcp后的端口集合
            while(iterator.hasNext()) {
                // 取出暴露端口号,形如：80/tcp
                String exportPort = iterator.next();
                // 取出去除/tcp后的端口号
                String tmp = exportPort.trim().split("/")[0];
                realExportPorts.add(tmp);

                // 捆绑端口
                List<PortBinding> hostPorts = new ArrayList<>();
                // 随机分配主机端口
                Integer hostPort = portService.randomPort();
                hostPorts.add(PortBinding.of("0.0.0.0", hostPort));
                portBindings.put(exportPort, hostPorts);
            }

            uc.setPort(JsonUtils.objectToJson(portBindings));

            builder.exposedPorts(realExportPorts);

            hostConfig = HostConfig.builder()
                    .portBindings(portBindings)
                    .build();
        } else {
            hostConfig = HostConfig.builder().build();
        }


        // 构建ContainerConfig
        builder.hostConfig(hostConfig);
        builder.image(image.getFullName());
        builder.tty(true);
        if(CollectionUtils.isNotArrayBlank(cmd)) {
            builder.cmd(cmd);
            uc.setCommand(Arrays.toString(cmd));
        }
        if(CollectionUtils.isNotArrayBlank(destination)) {
            builder.volumes(destination);
        }
        if(CollectionUtils.isNotArrayBlank(env)) {
            builder.env(env);
            uc.setEnv(Arrays.toString(env));
        }
        ContainerConfig containerConfig = builder.build();

        try {
            ContainerCreation creation = dockerClient.createContainer(containerConfig);

            uc.setId(creation.id());
            // 仅存在于数据库，不代表实际容器名
            uc.setName(containerName);
            uc.setProjectId(projectId);
            uc.setImage(image.getFullName());

            if(CollectionUtils.isNotArrayBlank(destination)) {
                // 为数据库中的sysvolumes插入
                ImmutableList<ContainerMount> info = dockerClient.inspectContainer(creation.id()).mounts();
                for(int i = 0;i<destination.length;i++){
                    SysVolume sysVolume = new SysVolume();
                    sysVolume.setContainerId(creation.id());
                    sysVolume.setDestination(destination[i]);
                    sysVolume.setName(info.get(i).name());
                    sysVolume.setSource(info.get(i).source());
                    sysVolumesMapper.insert(sysVolume);
                }
            }

            // 设置状态
            ContainerStatusEnum status = getStatus(creation.id());
            if(status == null) {
                throw new CustomException(ResultEnum.DOCKER_EXCEPTION.getCode(), "读取容器状态异常");
            }
            uc.setStatus(status.getCode());
            uc.setCreateDate(new Date());

            userContainerMapper.insert(uc);

            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.CREATE_CONTAINER);
            projectLogService.saveSuccessLog(projectId,uc.getId(),ProjectLogTypeEnum.CREATE_CONTAINER);

            return ResultVoUtils.success();
        } catch (Exception e) {
            log.error("创建容器出现异常，异常位置：{}，错误信息：{}",
                    "UserContainerServiceImpl.createContainer()", HttpClientUtils.getStackTraceAsString(e));

            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.CREATE_CONTAINER, e);
            projectLogService.saveErrorLog(projectId,uc.getId(),ProjectLogTypeEnum.CREATE_CONTAINER_ERROR,ResultEnum.DOCKER_EXCEPTION);

            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVo stopContainer(String userId, String containerId) {
        // 鉴权
        ResultVo resultVo = checkPermission(userId, containerId);
        if(ResultEnum.OK.getCode() != resultVo.getCode()) {
            return resultVo;
        }

        try {
            dockerClient.stopContainer(containerId, 5);
            // 写入日志
            projectLogService.saveSuccessLog(getProjectId(containerId), containerId, ProjectLogTypeEnum.STOP_CONTAINER);

            // 查询并修改状态
            return changeStatus(containerId);
        } catch (Exception e) {
            log.error("停止容器出现异常，异常位置：{}，错误信息：{}","UserContainerServiceImpl.stopContainer()",HttpClientUtils.getStackTraceAsString(e));
            // 写入日志
            projectLogService.saveErrorLog(getProjectId(containerId), containerId, ProjectLogTypeEnum.STOP_CONTAINER_ERROR,ResultEnum.DOCKER_EXCEPTION);

            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVo killContainer(String userId, String containerId) {
        // 鉴权
        ResultVo resultVo = checkPermission(userId, containerId);
        if(ResultEnum.OK.getCode() != resultVo.getCode()) {
            return resultVo;
        }

        try {
            dockerClient.killContainer(containerId);
            // 写入日志
            projectLogService.saveSuccessLog(getProjectId(containerId), containerId, ProjectLogTypeEnum.KILL_CONTAINER);
            // 查询并修改状态
            return changeStatus(containerId);
        } catch (Exception e) {
            log.error("强制停止容器出现异常，异常位置：{}，错误信息：{}","UserContainerServiceImpl.killContainer()",HttpClientUtils.getStackTraceAsString(e));
            // 写入日志
            projectLogService.saveErrorLog(getProjectId(containerId), containerId, ProjectLogTypeEnum.KILL_CONTAINER_ERROR,ResultEnum.DOCKER_EXCEPTION);

            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVo removeContainer(String userId, String containerId) {
        // 鉴权
        ResultVo resultVo = checkPermission(userId, containerId);
        if(ResultEnum.OK.getCode() != resultVo.getCode()) {
            return resultVo;
        }

        try {
            dockerClient.removeContainer(containerId);
            // 删除数据
            userContainerMapper.deleteById(containerId);
            // 清理缓存
            cleanCache(containerId);
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.DELETE_CONTAINER);
            projectLogService.saveSuccessLog(getProjectId(containerId), containerId, ProjectLogTypeEnum.DELETE_CONTAINER);

            return ResultVoUtils.success();
        } catch (Exception e) {
            log.error("删除容器出现异常，异常位置：{}，错误信息：{}",
                    "UserContainerServiceImpl.removeContainer()", HttpClientUtils.getStackTraceAsString(e));
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.DELETE_CONTAINER, e);
            projectLogService.saveErrorLog(getProjectId(containerId), containerId, ProjectLogTypeEnum.DELETE_CONTAINER_ERROR,ResultEnum.DOCKER_EXCEPTION);

            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVo pauseContainer(String userId, String containerId) {
        // 鉴权
        ResultVo resultVo = checkPermission(userId, containerId);
        if(ResultEnum.OK.getCode() != resultVo.getCode()) {
            return resultVo;
        }

        try {
            dockerClient.pauseContainer(containerId);
            // 写入日志
            projectLogService.saveSuccessLog(getProjectId(containerId), containerId, ProjectLogTypeEnum.PAUSE_CONTAINER);

            // 查询并修改状态
            return changeStatus(containerId);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("暂停容器出现异常，异常位置：{}，错误信息：{}","UserContainerServiceImpl.pauseContainer()",HttpClientUtils.getStackTraceAsString(e));
            // 写入日志
            projectLogService.saveErrorLog(getProjectId(containerId), containerId, ProjectLogTypeEnum.PAUSE_CONTAINER_ERROR,ResultEnum.DOCKER_EXCEPTION);

            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    public ResultVo continueContainer(String userId, String containerId) {
        // 鉴权
        ResultVo resultVo = checkPermission(userId, containerId);
        if(ResultEnum.OK.getCode() != resultVo.getCode()) {
            return resultVo;
        }

        try {
            dockerClient.unpauseContainer(containerId);
            // 写入日志
            projectLogService.saveSuccessLog(getProjectId(containerId), containerId, ProjectLogTypeEnum.CONTINUE_CONTAINER);
            // 查询并修改状态
            return changeStatus(containerId);
        } catch (Exception e) {
            log.error("继续容器出现异常，异常位置：{}，错误信息：{}","UserContainerServiceImpl.continueContainer()",HttpClientUtils.getStackTraceAsString(e));
            // 写入日志
            projectLogService.saveErrorLog(getProjectId(containerId), containerId, ProjectLogTypeEnum.CONTINUE_CONTAINER,ResultEnum.DOCKER_EXCEPTION);

            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    public ResultVo topContainer(String userId, String containerId) {
        // 鉴权
        ResultVo resultVo = checkPermission(userId, containerId);
        if(ResultEnum.OK.getCode() != resultVo.getCode()) {
            return resultVo;
        }

        try {
            TopResults results = dockerClient.topContainer(containerId);
            return ResultVoUtils.success(results);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("继续容器出现异常，异常位置：{}，错误信息：{}","UserContainerServiceImpl.continueContainer()",e.getMessage());
            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    public ResultVo checkPermission(String userId, String containerId) {
        // 1、鉴权
        String roleName = loginService.getRoleName(userId);
        // 1.1、角色无效
        if(StringUtils.isBlank(roleName)) {
            return ResultVoUtils.error(ResultEnum.AUTHORITY_ERROR);
        }
        // 1.2、越权访问
        if(RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            UserContainer container = userContainerMapper.selectById(containerId);
            if(container == null) {
                return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
            }
            if(!projectMapper.hasBelong(container.getProjectId(), userId)) {
                return ResultVoUtils.error(ResultEnum.PERMISSION_ERROR);
            }
        }

        return ResultVoUtils.success();
    }

    @Override
    public ContainerStatusEnum getStatus(String containerId) {
        try {
            ContainerInfo info = dockerClient.inspectContainer(containerId);
            ContainerState state = info.state();

            if(state.running()) {
                if(state.paused()) {
                    return ContainerStatusEnum.PAUSE;
                } else {
                    return ContainerStatusEnum.START;
                }
            } else {
                return ContainerStatusEnum.STOP;
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("获取容器状态出现异常，异常位置：{}，错误信息：{}","UserContainerServiceImpl.getStatus()",e.getMessage());
            return null;
        }
    }

    @Override
    public void cleanCache(String containerId) {
        try {
            jedisClient.hdel(key, containerId);
        } catch (Exception e) {
            log.error("缓存清理异常，错误位置：UserContainerServiceImpl.cleanCache()");
        }
    }

    /**
     * 修改数据库中容器状态
     * @author jitwxs
     * @since 2018/7/1 16:48
     */
    private ResultVo changeStatus(String containerId) {
        ContainerStatusEnum statusEnum = getStatus(containerId);
        if(statusEnum == null) {
            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }

        UserContainer container = userContainerMapper.selectById(containerId);
        if(container == null) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }

        if(container.getStatus() != statusEnum.getCode()) {
            container.setStatus(statusEnum.getCode());
            userContainerMapper.updateById(container);
        }

        return ResultVoUtils.success(statusEnum.getCode());
    }

    private String getProjectId(String containerId) {
        UserContainer container = getById(containerId);

        return  container == null ? null : container.getProjectId();
    }
}
