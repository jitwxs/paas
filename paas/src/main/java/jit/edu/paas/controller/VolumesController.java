package jit.edu.paas.controller;

import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.service.SysVolumeService;
import org.springframework.beans.factory.annotation.Autowired;
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
    SysVolumeService sysVolumeService;

    /**
     * 列出某一项目所有数据卷
     * @author jitwxs
     * @since 2018/7/4 17:32
     */
    @GetMapping("/list/{containerId}")
    public ResultVo listByContainerId(@PathVariable String containerId) {
        return sysVolumeService.listByContainerId(containerId);
    }

    /**
     * 创建数据卷
     * @author jitwxs
     * @since 2018/7/4 17:31
     */
    @PostMapping("/create")
    public ResultVo createVolume(String volumeName,String containerId) {
        return sysVolumeService.createVolume(volumeName, containerId);
    }

    /**
     * 获取数据卷详情
     * @author jitwxs
     * @since 2018/7/4 17:32
     */
    @GetMapping("/inspect/{id}")
    public ResultVo inspectVolumes(@PathVariable String id){
        return sysVolumeService.inspectVolumes(id);
    }

    /**
     * 删除数据卷
     * @author jitwxs
     * @since 2018/7/4 17:36
     */
    @DeleteMapping("/delete/{id}")
    public ResultVo removeVolumes(@PathVariable String id){
        return sysVolumeService.removeVolmue(id);
    }
}
