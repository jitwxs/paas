package jit.edu.paas.controller;


import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.domain.entity.RepositoryImage;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.service.RepositoryImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 仓储镜像 前端控制器
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-05
 */
@RestController
@RequestMapping("/repository/image")
public class RepositoryImageController {
    @Autowired
    private RepositoryImageService repositoryImageService;

    /**
     * 获取镜像名称列表
     * 仅包含name，不包含tag
     * @author jitwxs
     * @since 2018/7/6 8:44
     */
    @GetMapping("/list")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO listName(Page<RepositoryImage> page) {
        return ResultVOUtils.success(repositoryImageService.listRepositoryFromDb(page));
    }

    /**
     * 获取镜像tag列表
     * @author jitwxs
     * @since 2018/7/6 8:59
     */
    @GetMapping("/list/name")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO listTagByName(String name) {
        List<RepositoryImage> list = repositoryImageService.listByName(name);

        return ResultVOUtils.success(list);
    }

    /**
     * 上传镜像到Hub
     * @param imageId 镜像ID【SysImage表主键】
     * @author jitwxs
     * @since 2018/7/6 9:01
     */
    @PostMapping("/push")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO pushImage(@RequestAttribute String uid, String imageId) {
        return repositoryImageService.pushToHub(imageId, uid);
    }

    /**
     * 从Hub上拉取镜像
     * @author jitwxs
     * @since 2018/7/6 9:02
     */
    @PostMapping("/pull")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO pullImage(String id) {
        return repositoryImageService.pullFromHub(id);
    }

    /**
     * 从Hub上删除镜像【逻辑删除】
     * @author jitwxs
     * @since 2018/7/6 9:01
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO pushImage(@PathVariable String id) {
        return repositoryImageService.deleteFromHub(id);
    }

    /**
     * 镜像同步
     * @author jitwxs
     * @since 2018/7/6 9:01
     */
    @GetMapping("/sync")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO syncImage() {
        return repositoryImageService.sync();
    }
}

