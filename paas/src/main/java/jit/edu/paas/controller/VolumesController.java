package jit.edu.paas.controller;

import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.service.SysVolumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 数据卷Controller
 * @author jitwxs
 * @since 2018/7/4 17:05
 */
@RestController
@RequestMapping("/volumes")
public class VolumesController {
    @Autowired
    private SysVolumeService sysVolumeService;

    /**
     * 列出某一容器所有数据卷
     * @author jitwxs
     * @since 2018/7/4 17:32
     */
    @GetMapping("/{containerId}/list")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO listByContainerId(@RequestAttribute String uid, @PathVariable String containerId) {
        return sysVolumeService.listByContainerId(containerId, uid);
    }

    /**
     * 获取数据卷详情
     * @author jitwxs
     * @since 2018/7/4 17:32
     */
    @GetMapping("/inspect/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO inspectVolumes(@RequestAttribute String uid, @PathVariable String id){
        return sysVolumeService.inspectVolumes(id, uid);
    }

    /**
     * 获取本地所有数据卷
     * @author jitwxs
     * @since 2018/7/5 13:02
     */
    @GetMapping("/list")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO listFromLocal() {
        return sysVolumeService.listFromLocal();
    }

    /**
     * 清理数据卷
     * @author jitwxs
     * @since 2018/7/4 17:36
     */
    @DeleteMapping("/clean")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO cleanVolumes(){
        return sysVolumeService.cleanVolumes();
    }
}
