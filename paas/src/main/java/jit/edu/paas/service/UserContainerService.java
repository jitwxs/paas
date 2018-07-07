package jit.edu.paas.service;

import com.baomidou.mybatisplus.service.IService;
import com.google.common.collect.ImmutableSet;
import jit.edu.paas.domain.entity.UserContainer;
import jit.edu.paas.domain.enums.ContainerStatusEnum;
import jit.edu.paas.domain.vo.ResultVo;

/**
 * <p>
 * 用户容器表 服务类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
public interface UserContainerService extends IService<UserContainer> {

    /**
     * 获取容器信息
     * @author jitwxs
     * @since 2018/7/7 9:20
     */
    UserContainer getById(String id);
    /**
     * 开启容器
     * @author jitwxs
     * @since 2018/7/1 15:41
     */
    ResultVo startContainer(String userId, String containerId);

    /**
     * 创建容器
     * @param exportPorts 镜像暴露的接口
     * @author jitwxs
     * @since 2018/7/1 16:00
     */
    ResultVo createContainer(String userId, String imageId, String[] cmd, ImmutableSet<String> exportPorts,
                             String containerName, String projectId, String[] env, String[] destination);

    /**
     * 停止容器
     * @author jitwxs
     * @since 2018/7/1 16:00
     */
    ResultVo stopContainer(String userId, String containerId);

    /**
     * 强制停止容器
     * @author jitwxs
     * @since 2018/7/1 16:03
     */
    ResultVo killContainer(String userId, String containerId);

    /**
     * 移除容器
     * @author jitwxs
     * @since 2018/7/1 16:06
     */
    ResultVo removeContainer(String userId, String containerId);

    /**
     * 暂停容器
     * @author jitwxs
     * @since 2018/7/1 16:08
     */
    ResultVo pauseContainer(String userId, String containerId);

    /**
     * 从暂停状态恢复
     * @author jitwxs
     * @since 2018/7/1 16:10
     */
    ResultVo continueContainer(String userId, String containerId);

    /**
     * 获取运行容器的内部状态
     * @author jitwxs
     * @since 2018/7/1 16:13
     */
    ResultVo topContainer(String userId, String containerId);

    ResultVo checkPermission(String userId, String containerId);

    /**
     * 获取容器状态
     * @author jitwxs
     * @since 2018/7/1 16:44
     */
    ContainerStatusEnum getStatus(String containerId);

    /**
     * 清理缓存
     * @author jitwxs
     * @since 2018/7/7 9:25
     */
    void cleanCache(String containerId);
}
