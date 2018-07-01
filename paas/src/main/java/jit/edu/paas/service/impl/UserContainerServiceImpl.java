package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.spotify.docker.client.DockerClient;
import com.spotify.docker.client.exceptions.DockerException;
import com.spotify.docker.client.messages.*;
import jit.edu.paas.commons.util.CollectionUtils;
import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.entity.UserContainer;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.mapper.SysLoginMapper;
import jit.edu.paas.mapper.UserContainerMapper;
import jit.edu.paas.mapper.UserProjectMapper;
import jit.edu.paas.service.UserContainerService;
import jit.edu.paas.service.UserProjectService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.transform.Result;
import java.lang.reflect.Array;
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
    private SysLoginMapper loginMapper;
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
            // TODO 查询容器状态，并更新
            return ResultVoUtils.success();
        } catch (Exception e) {
            log.error("开启容器出现异常，异常位置：{}，错误信息：{}","UserContainerServiceImpl.startContainer()",e.getMessage());
            e.printStackTrace();
            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVo createContainer(String imageName, String[] cmd, String[] ports, String containerName, String projectId) {
        Map<String, List<PortBinding>> portBindings = new HashMap<>(16);

        for (String port : ports) {
            List<PortBinding> hostPorts = new ArrayList<>();
            hostPorts.add(PortBinding.of("0.0.0.0", port));
            portBindings.put(port, hostPorts);
        }

        List<PortBinding> randomPort = new ArrayList<>();
        randomPort.add(PortBinding.randomPort("0.0.0.0"));
        portBindings.put("443", randomPort);

        HostConfig hostConfig = HostConfig.builder().portBindings(portBindings).build();

        ContainerConfig containerConfig = ContainerConfig.builder()
                .hostConfig(hostConfig)
                .image(imageName).exposedPorts(ports)
                .cmd(cmd)
                .build();

        try {
            ContainerCreation creation = dockerClient.createContainer(containerConfig);

            UserContainer uc = new UserContainer();
            uc.setId(creation.id());
            uc.setName(containerName);
            uc.setCommand(Arrays.toString(cmd));
            uc.setProjectId(projectId);
            uc.setPort(Arrays.toString(ports));
            // TODO 容器状态修改为API获取
            uc.setStatus("0");
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

            // TODO 修改为根据API更新容器状态
            List<UserContainer> list = userContainerMapper.selectList(new EntityWrapper<UserContainer>().eq("id", containerId));
            UserContainer uc = CollectionUtils.getListFirst(list);
            uc.setStatus("0");
            userContainerMapper.updateById(uc);

            return ResultVoUtils.success();
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

            // TODO 修改为根据API更新容器状态
            List<UserContainer> list = userContainerMapper.selectList(new EntityWrapper<UserContainer>().eq("id", containerId));
            UserContainer uc = CollectionUtils.getListFirst(list);
            uc.setStatus("0");
            userContainerMapper.updateById(uc);

            return ResultVoUtils.success();
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
            // TODO 修改为根据API决定删除记录
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

            // TODO 修改为根据API决定暂定
            List<UserContainer> list = userContainerMapper.selectList(new EntityWrapper<UserContainer>().eq("id", containerId));
            UserContainer uc = CollectionUtils.getListFirst(list);
            uc.setStatus("2");
            userContainerMapper.updateById(uc);

            return ResultVoUtils.success();
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

            // TODO 修改为根据API决定继续
            List<UserContainer> list = userContainerMapper.selectList(new EntityWrapper<UserContainer>().eq("id", containerId));
            UserContainer uc = CollectionUtils.getListFirst(list);
            uc.setStatus("1");
            userContainerMapper.updateById(uc);

            return ResultVoUtils.success();
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
        String roleName = loginMapper.getRoleName(userId);
        // 1.1、角色无效
        if(StringUtils.isBlank(roleName)) {
            return ResultVoUtils.error(ResultEnum.AUTHORITY_ERROR);
        }
        // 1.2、越权访问
        if("ROLE_USER".equals(roleName)) {
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

}
