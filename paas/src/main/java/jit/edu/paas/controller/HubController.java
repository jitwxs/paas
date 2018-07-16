package jit.edu.paas.controller;


import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.domain.entity.RepositoryImage;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.service.RepositoryImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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
@RequestMapping("/hub")
public class HubController {
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
    public ResultVO listName() {
        return ResultVOUtils.success(repositoryImageService.listHubImageVO());
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
     * 上传镜像到Hub【WebSocket】
     * @param imageId 镜像ID【SysImage表主键】
     * @author jitwxs
     * @since 2018/7/6 9:01
     */
    @PostMapping("/push")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO pushImage(String imageId, @RequestAttribute String uid, HttpServletRequest request) {
        // 校验
        ResultVO resultVO = repositoryImageService.pushCheck(imageId, uid);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }

        SysImage sysImage = (SysImage) resultVO.getData();
        repositoryImageService.pushTask(sysImage, uid, request);

        return ResultVOUtils.success("开始上传镜像");
    }

    /**
     * 从Hub上拉取镜像【WebSocket】
     * @author jitwxs
     * @since 2018/7/6 9:02
     */
    @PostMapping("/pull")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO pullImage(String id, @RequestAttribute String uid, HttpServletRequest request) {
        // 校验
        ResultVO resultVO = repositoryImageService.pullCheck(id);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }

        RepositoryImage repositoryImage = (RepositoryImage) resultVO.getData();
        repositoryImageService.pullTask(repositoryImage, uid, request);

        return ResultVOUtils.success("开始拉取镜像");
    }

    /**
     * 从Hub上删除镜像【逻辑删除】
     * @author jitwxs
     * @since 2018/7/6 9:01
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO pushImage(@PathVariable String id, HttpServletRequest request) {
        return repositoryImageService.deleteImage(id, request);
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

