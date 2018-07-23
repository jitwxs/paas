package jit.edu.paas.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.entity.SysNetwork;
import jit.edu.paas.domain.vo.ResultVO;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * <p>
 * 系统网络表 服务类
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-14
 */
public interface SysNetworkService extends IService<SysNetwork> {
    SysNetwork getById(String id);
    /**
     * 网络名是否存在
     * @author jitwxs
     * @since 2018/7/14 17:48
     */
    boolean hasExistName(String name);
    /**
     * 网络名 + 用户ID是否存在
     * @author jitwxs
     * @since 2018/7/14 17:48
     */
    boolean hasExistName(String name, String userId);

    /**
     * 获取所有网络
     * @param hasPublic 是否公开
     * @author jitwxs
     * @since 2018/7/14 16:00
     */
    Page<SysNetwork> listAllNetwork(Page<SysNetwork> page, Boolean hasPublic);

    /**
     * 获取个人网络
     * @author jitwxs
     * @since 2018/7/14 16:00
     */
    Page<SysNetwork> listSelfNetwork(Page<SysNetwork> page, String userId);

    /**
     * 获取个人网络 + 公共网络
     */
    Page<SysNetwork> listSelfAndPublicNetwork(Page<SysNetwork> page, String uid);

    /**
     * 创建公共网络
     * @author jitwxs
     * @since 2018/7/14 16:01
     */
    ResultVO createPublicNetwork(String name, String driver, Map<String, String> labels, HttpServletRequest request);

    /**
     * 创建用户网络
     * @author jitwxs
     * @since 2018/7/14 19:33
     */
    ResultVO createUserNetwork(String name, String driver, Map<String,String> labels, String uid);

    /**
     * 是否有权限访问
     * @author jitwxs
     * @since 2018/7/14 20:31
     */
    ResultVO hasPermission(String networkId, String userId);

    /**
     * 连接网络
     * @author jitwxs
     * @since 2018/7/14 16:04
     */
    ResultVO connectNetwork(String networkId, String containerId, String userId);

    /**
     * 取消连接网络
     * @author jitwxs
     * @since 2018/7/14 16:04
     */
    ResultVO disConnectNetwork(String networkId, String containerId, String userId);

    /**
     * 删除前校验
     * @author jitwxs
     * @since 2018/7/14 20:00
     */
    ResultVO deleteCheck(String id, String userId);

    /**
     * 删除网络
     * @author jitwxs
     * @since 2018/7/14 16:05
     */
    ResultVO deleteNetwork(String networkId, String userId, HttpServletRequest request);

    /**
     * 数据同步
     * @author jitwxs
     * @since 2018/7/14 16:05
     */
    ResultVO sync();

    /**
     * 获取容器所有网络
     * @author jitwxs
     */
    ResultVO listByContainerId(String containerId);
    /**
     * 同步容器网络
     * @author jitwxs
     */
    ResultVO syncByContainerId(String containerId);

    /**
     * 判断是否存在driver为host的网络
     * host网络只允许存在一个
     * @author jitwxs
     * @since 2018/7/14 17:56
     */
    boolean hasExistHostDriver();
}
