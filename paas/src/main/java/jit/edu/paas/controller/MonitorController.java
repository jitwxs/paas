package jit.edu.paas.controller;

import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.service.MonitorService;
import jit.edu.paas.service.UserContainerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 监控Controller
 * @author jitwxs
 * @since 2018/7/8 20:59
 */
@RestController
@RequestMapping("/monitor")
public class MonitorController {
    @Autowired
    private UserContainerService containerService;
    @Autowired
    private MonitorService monitorService;

    /**
     * 获取容器实时监控【粒度：5s】
     * @author jitwxs
     * @since 2018/7/8 21:13
     */
    @GetMapping("/container/actual/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO getActual(@RequestAttribute String uid, @PathVariable String containerId) {
        // 鉴权
        ResultVO resultVO = containerService.checkPermission(uid, containerId);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }
        return monitorService.getActualMonitor(containerId);
    }

    /**
     * 获取容器24小时监控【粒度：1m】
     * @author jitwxs
     * @since 2018/7/8 21:19
     */
    @GetMapping("/container/today/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO getToday(@RequestAttribute String uid, @PathVariable String containerId) {
        // 鉴权
        ResultVO resultVO = containerService.checkPermission(uid, containerId);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }
        return monitorService.getTodayMonitor(containerId);
    }

    /**
     * 获取容器7日监控【粒度：1h】
     * @author jitwxs
     * @since 2018/7/8 21:19
     */
    @GetMapping("/container/week/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO getWeek(@RequestAttribute String uid, @PathVariable String containerId) {
        // 鉴权
        ResultVO resultVO = containerService.checkPermission(uid, containerId);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }
        return monitorService.getWeekMonitor(containerId);
    }

    /**
     * 读取Docker宿主机信息
     * @author jitwxs
     * @since 2018/7/9 10:30
     */
    @GetMapping("/host")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO getHostInfo() {
        return monitorService.getDockerInfo();
    }

    /**
     * 读取用户Docker信息
     * @author jitwxs
     * @since 2018/7/10 0:26
     */
    @GetMapping("/info")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO getDockerInfo(@RequestAttribute String uid) {
        return monitorService.getUserDockerInfo(uid);
    }
}