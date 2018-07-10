package jit.edu.paas.service;

import jit.edu.paas.domain.vo.ContainerMonitorVO;
import jit.edu.paas.domain.vo.ResultVO;

/**
 * 监控Service
 * @author jitwxs
 * @since 2018/7/8 16:20
 */
public interface MonitorService {
    /**
     * 读取监控信息
     * @author jitwxs
     * @since 2018/7/8 17:21
     */
    ContainerMonitorVO getCurrentInfo(String containerId);

    /**
     * 设置监控信息
     * @param type 1：实时；2：24小时；3：7日
     * @author jitwxs
     * @since 2018/7/8 20:39
     */
    boolean setMonitorInfo(String containerId, Integer type);

    /**
     * 获取容器实时监控信息
     * @author jitwxs
     * @since 2018/7/8 16:35
     */
    ResultVO getActualMonitor(String containerId);

    /**
     * 获取容器24小时监控信息
     * @author jitwxs
     * @since 2018/7/8 20:32
     */
    ResultVO getTodayMonitor(String containerId);

    /**
     * 获取容器7日监控信息
     * @author jitwxs
     * @since 2018/7/8 20:32
     */
    ResultVO getWeekMonitor(String containerId);

    /**
     * 获取Docker宿主机信息
     * @author jitwxs
     * @since 2018/7/9 10:19
     */
    ResultVO getDockerInfo();

    /**
     * 读取用户Docker信息
     * @author jitwxs
     * @since 2018/7/9 23:53
     */
    ResultVO getUserDockerInfo(String uid);
}
