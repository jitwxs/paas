package jit.edu.paas.controller;

import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.domain.dto.SysLogDTO;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.select.SysLogSelect;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.service.MonitorService;
import jit.edu.paas.service.SysLogService;
import jit.edu.paas.service.UserContainerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
    private SysLogService sysLogService;
    @Autowired
    private UserContainerService containerService;
    @Autowired
    private MonitorService monitorService;

    @Value("${docker.server.address}")
    private String serverAddress;

    @Value("${docker.swarm.manager.address}")
    private String swarmManagerAddress;

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
     * 读取自身Docker信息
     * @author jitwxs
     * @since 2018/7/10 0:26
     */
    @GetMapping("/self/info")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO getSelfDockerInfo(@RequestAttribute String uid) {
        return monitorService.getUserDockerInfo(uid);
    }

    /**
     * 读取指定用户Docker信息
     * @author jitwxs
     * @since 2018/7/10 0:26
     */
    @GetMapping("/{userId}/info")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO getUserDockerInfo(@PathVariable String userId) {
        return monitorService.getUserDockerInfo(userId);
    }

    /**
     * 获取系统日志
     * @author jitwxs
     * @since 2018/7/11 9:59
     */
    @GetMapping("/log")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO listSystemLog(SysLogSelect sysLogSelect,
                                  @RequestParam(defaultValue = "1") Integer current,
                                  @RequestParam(defaultValue = "10") Integer size) {
        Page<SysLogDTO> selectPage = sysLogService.listSystemLog(sysLogSelect,
                new Page<>(current, size, "create_date", false));
        return ResultVOUtils.success(selectPage);
    }

    /**
     * portainer监控
     * @author jitwxs
     * @since 2018/7/15 9:01
     */
    @GetMapping("/portainer")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO portainer() {
        String url = "http://" + serverAddress + ":9000";
        return ResultVOUtils.success(url);
    }

    /**
     * visualizer监控
     * @author jitwxs
     * @since 2018/7/15 9:01
     */
    @GetMapping("/visualizer")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO visualizer() {
        String url = "http://" + swarmManagerAddress + ":8080";
        return ResultVOUtils.success(url);
    }
}