package jit.edu.paas.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.component.WrapperComponent;
import jit.edu.paas.domain.entity.UserProject;
import jit.edu.paas.domain.select.UserProjectSelect;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.service.UserProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 项目Controller
 * @author jitwxs
 * @since 2018/6/28 14:29
 */
@RestController
@RequestMapping("/project")
@Api(tags={"项目Controller"})
public class ProjectController {
    @Autowired
    private UserProjectService projectService;
    @Autowired
    private WrapperComponent wrapperComponent;

    /**
     * 获取所有项目列表
     * @author jitwxs
     * @since 2018/6/29 15:01
     */
    @GetMapping("/list")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    @ApiOperation("所有项目列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "projectSelect", value = "筛选条件", dataType = "UserProjectSelect"),
            @ApiImplicitParam(name = "page", value = "分页",dataType = "Page")
    })
    public ResultVo listProject(UserProjectSelect projectSelect, Page<UserProject> page) {
        // 1、生成筛选条件
        EntityWrapper<UserProject> wrapper = wrapperComponent.genUserProjectWrapper(projectSelect);
        // 2、分页查询
        Page<UserProject> selectPage = projectService.selectPage(page, wrapper);
        // 3、返回前台
        return ResultVoUtils.success(selectPage);
    }

    /**
     * 获取用户个人项目列表
     * @author jitwxs
     * @since 2018/6/29 15:01
     */
    @GetMapping("/self/list")
    @PreAuthorize("hasRole('ROLE_USER')")
    @ApiOperation("个人项目列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "projectSelect", value = "筛选条件", dataType = "UserProjectSelect"),
            @ApiImplicitParam(name = "page", value = "分页",dataType = "Page")
    })
    public ResultVo listSelfProject(@RequestAttribute String uid,UserProjectSelect projectSelect, Page<UserProject> page) {
        // 1、设置筛选条件uid为当前用户
        projectSelect.setUserId(uid);
        // 2、生成筛选条件
        EntityWrapper<UserProject> wrapper = wrapperComponent.genUserProjectWrapper(projectSelect);
        // 3、分页查询
        Page<UserProject> selectPage = projectService.selectPage(page, wrapper);
        // 4、返回前台
        return ResultVoUtils.success(selectPage);
    }
}
