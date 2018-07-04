package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import com.google.common.collect.UnmodifiableIterator;
import com.spotify.docker.client.DockerClient;
import com.spotify.docker.client.messages.*;
import jit.edu.paas.commons.util.JsonUtils;
import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.entity.SysVolume;
import jit.edu.paas.domain.entity.UserContainer;
import jit.edu.paas.domain.enums.ContainerStatusEnum;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.enums.RoleEnum;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.exception.CustomException;
import jit.edu.paas.mapper.SysVolumesMapper;
import jit.edu.paas.mapper.UserContainerMapper;
import jit.edu.paas.mapper.UserProjectMapper;
import jit.edu.paas.service.PortService;
import jit.edu.paas.service.SysImageService;
import jit.edu.paas.service.SysLoginService;
import jit.edu.paas.service.UserContainerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	private SysVolumesMapper sysVolumesMapper;
    @Autowired
    private UserProjectMapper projectMapper;
    @Autowired
    private UserContainerMapper userContainerMapper;

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
            // 查询并修改状态
            return changeStatus(containerId);
        } catch (Exception e) {
            log.error("开启容器出现异常，异常位置：{}，错误信息：{}","UserContainerServiceImpl.startContainer()",e.getMessage());
            e.printStackTrace();
            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVo createContainer(String userId, String imageId, String[] cmd, ImmutableSet<String> exportPorts,
                                    String containerName, String projectId, String env, String[] destination) {
        // Project鉴权
        Boolean b = projectMapper.hasBelong(projectId, userId);
        if(!b) {
            return ResultVoUtils.error(ResultEnum.PERMISSION_ERROR.getCode(), "项目不存在或权限错误");
        }

        // 校验Image
        SysImage image = imageService.getById(imageId);
        if(image == null) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }
        if(!imageService.hasAuthImage(userId, image)) {
            return ResultVoUtils.error(ResultEnum.PERMISSION_ERROR);
        }

        // 设置cmd,如果参数为空。使用Image默认
        if(cmd == null || cmd.length == 0) {
            String json = image.getCmd();
            if(StringUtils.isNotBlank(json)) {
                cmd = JsonUtils.jsonToObject(json, String[].class);
            }
        }

        // 宿主机端口与暴露端口绑定
        Map<String, List<PortBinding>> portBindings = new HashMap<>(16);
        UnmodifiableIterator<String> iterator = exportPorts.iterator();

        // 去除/tcp后的端口集合
        Set<String> realExportPorts = new HashSet<>();
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

        HostConfig hostConfig = HostConfig.builder().portBindings(portBindings).build();

        ContainerConfig containerConfig = ContainerConfig.builder()
                .hostConfig(hostConfig)
                .image(image.getFullName()).exposedPorts(realExportPorts)
                .volumes(destination)
                .env(env)
                .cmd(cmd)
                .build();

        try {
            ContainerCreation creation = dockerClient.createContainer(containerConfig);

            List<SysVolume> sv = new ArrayList<>();
            UserContainer uc = new UserContainer();
            uc.setId(creation.id());
            // 仅存在于数据库，不代表实际容器名
            uc.setName(containerName);
            uc.setCommand(Arrays.toString(cmd));
            uc.setProjectId(projectId);
            uc.setPort(JsonUtils.objectToJson(portBindings));
            uc.setImage(image.getFullName());

            uc.setEnv(env);
            // 为数据库中的sysvolumes插入
            ImmutableList<ContainerMount> info = dockerClient.inspectContainer(creation.id()).mounts();
            for(int i = 0;i<destination.length;i++){
                SysVolume sysVolume = new SysVolume();
                sysVolume.setContainerId(creation.id());
                sysVolume.setVolumeName(info.get(i).name());
                sysVolume.setSource(info.get(i).source());
                sysVolumesMapper.insert(sysVolume);
            }

            // 设置状态
            ContainerStatusEnum status = getStatus(creation.id());
            if(status == null) {
                throw new CustomException(ResultEnum.DOCKER_EXCEPTION.getCode(), "读取容器状态异常");
            }
            uc.setStatus(status.getCode());
            uc.setCreateDate(new Date());

            userContainerMapper.insert(uc);

            return ResultVoUtils.success();
        } catch (Exception e) {
            e.printStackTrace();
            log.error("创建容器出现异常，异常位置：{}，错误信息：{}","UserContainerServiceImpl.createContainer()",e.getMessage());
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

            // 查询并修改状态
            return changeStatus(containerId);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("停止容器出现异常，异常位置：{}，错误信息：{}","UserContainerServiceImpl.stopContainer()",e.getMessage());
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
            // 查询并修改状态
            return changeStatus(containerId);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("强制停止容器出现异常，异常位置：{}，错误信息：{}","UserContainerServiceImpl.killContainer()",e.getMessage());
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
            return ResultVoUtils.success();
        } catch (Exception e) {
            e.printStackTrace();
            log.error("删除容器出现异常，异常位置：{}，错误信息：{}","UserContainerServiceImpl.removeContainer()",e.getMessage());
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

            // 查询并修改状态
            return changeStatus(containerId);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("暂停容器出现异常，异常位置：{}，错误信息：{}","UserContainerServiceImpl.pauseContainer()",e.getMessage());
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
            // 查询并修改状态
            return changeStatus(containerId);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("继续容器出现异常，异常位置：{}，错误信息：{}","UserContainerServiceImpl.continueContainer()",e.getMessage());
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
}
