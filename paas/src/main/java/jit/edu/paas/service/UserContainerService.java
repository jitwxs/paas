package jit.edu.paas.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.dto.UserContainerDTO;
import jit.edu.paas.domain.entity.UserContainer;
import jit.edu.paas.domain.enums.ContainerOpEnum;
import jit.edu.paas.domain.enums.ContainerStatusEnum;
import jit.edu.paas.domain.vo.ResultVO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

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
    UserContainerDTO getById(String id);

    /**
     * 获取容器名
     * @author jitwxs
     * @since 2018/7/13 14:09
     */
    String getName(String id);
    /**
     * 是否允许容器操作
     * @param userId 用户ID
     * @param containerId 容器ID
     * @param containerOpEnum 目标操作
     * @author jitwxs
     * @since 2018/7/10 17:14
     */
    ResultVO hasAllowOp(String userId, String containerId, ContainerOpEnum containerOpEnum);

    /**
     * 创建容器前校验
     * @author jitwxs
     * @since 2018/7/10 20:11
     */
    ResultVO createContainerCheck(String userId, String imageId,Map<String, String> portMap, String projectId);

    /**
     * 创建容器任务
     * @author hf
     * @since 2018/7/1 16:00
     */
    void createContainerTask(String userId, String imageId, String[] cmd, Map<String, String> portMap,
                             String containerName, String projectId, String[] env, String[]destination,
                             HttpServletRequest request);

    /**
     * 开启容器任务
     * @author jitwxs
     * @since 2018/7/1 15:41
     */
    void startContainerTask(String userId, String containerId);

    /**
     * 停止容器服务
     * @author hf
     * @since 2018/7/1 16:00
     */
    void stopContainerTask(String userId, String containerId);

    /**
     * 强制停止容器
     * @author hf
     * @since 2018/7/1 16:03
     */
    void killContainerTask(String userId, String containerId);

    /**
     * 移除容器任务
     * @author hf
     * @since 2018/7/1 16:06
     */
    void removeContainerTask(String userId, String containerId, HttpServletRequest request);

    /**
     * 暂停容器
     * @author jitwxs
     * @since 2018/7/1 16:08
     */
    void pauseContainerTask(String userId, String containerId);

    /**
     * 重启容器
     * @author hf
     * @since 2018/7/9 15:52
     */
    void restartContainerTask(String userId, String containerId);

    /**
     * 从暂停状态恢复
     * @author hf
     * @since 2018/7/1 16:10
     */
    void continueContainerTask(String userId, String containerId);

    /**
     * 获取运行容器的内部状态
     * @author jitwxs
     * @since 2018/7/1 16:13
     */
    ResultVO topContainer(String userId, String containerId);

    ResultVO checkPermission(String userId, String containerId);

    /**
     * 获取容器状态
     * @author jitwxs
     * @since 2018/7/1 16:44
     */
    ContainerStatusEnum getStatus(String containerId);

    /**
     * 获取用户所有镜像
     * @param name 容器名
     * @author jitwxs
     * @since 2018/6/28 16:15
     */
    Page<UserContainerDTO> listContainerByUserId(String userId, String name, Integer status, Page<UserContainer> page);

    /**
     * 根据状态获取容器列表
     * @author jitwxs
     * @since 2018/7/8 20:48
     */
    List<UserContainer> listByStatus(ContainerStatusEnum statusEnum);

    /**
     * 同步容器状态
     * @param userId 用户ID，为空时同步所有
     * @author jitwxs
     * @since 2018/7/9 11:13
     */
    Map<String,Integer> syncStatus(String userId);

    /**
     * 修改数据库中容器状态
     * @author jitwxs
     * @since 2018/7/1 16:48
     */
    ResultVO changeStatus(String containerId);

    /**
     * 修改容器所属项目
     * @author jitwxs
     * @since 2018/7/14 8:36
     */
    ResultVO changeBelongProject(String containerId, String projectId, String uid);

    ResultVO commitContainerCheck(String containerId, String name, String tag, String userId);

    /**
     * 打包容器
     * @author jitwxs
     * @since 2018/7/26 19:45
     */
    void commitContainerTask(String containerId, String name, String tag, String userId);
}