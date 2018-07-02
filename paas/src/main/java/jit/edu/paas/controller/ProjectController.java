package jit.edu.paas.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.commons.component.WrapperComponent;
import jit.edu.paas.domain.entity.UserProject;
import jit.edu.paas.domain.select.UserProjectSelect;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.service.UserProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * 项目Controller
 * @author jitwxs
 * @since 2018/6/28 14:29
 */
@RestController
@RequestMapping("/project")
public class ProjectController {
    @Autowired
    private UserProjectService projectService;
    @Autowired
    private WrapperComponent wrapperComponent;

    /**
     * 所有项目列表
     * @author jitwxs
     * @since 2018/6/29 15:01
     */
    @GetMapping("/list")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVo listProject(UserProjectSelect projectSelect, Page<UserProject> page) {
        // 1、生成筛选条件
        EntityWrapper<UserProject> wrapper = wrapperComponent.genUserProjectWrapper(projectSelect);
        // 2、分页查询
        Page<UserProject> selectPage = projectService.selectPage(page, wrapper);
        // 3、返回前台
        return ResultVoUtils.success(selectPage);
    }

    /**
     * 用户项目列表
     * @author jitwxs
     * @since 2018/6/29 15:01
     */
    @GetMapping("/self/list")
    @PreAuthorize("hasRole('ROLE_USER')")
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

    /**
     * 根据ID查询项目
     * @author jitwxs
     * @since 2018/6/29 18:43
     */
    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo getById(@RequestAttribute String uid, @PathVariable String id) {
        return projectService.getProjectById(id, uid);
    }

    /**
     * 创建项目
     * @author jitwxs
     * @since 2018/6/29 18:44
     */
    @PostMapping("/create")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVo createProject(@RequestAttribute String uid, String name, String description) {
        return projectService.createProject(uid, name, description);
    }

    /**
     * 更新项目
     * @author jitwxs
     * @since 2018/6/29 18:53
     */
    @PutMapping("/update")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVo updateProject(@RequestAttribute String uid, String id, String name, String description) {
        return projectService.updateProject(uid, id, name, description);
    }

    /**
     * 删除项目
     * @author jitwxs
     * @since 2018/6/29 18:53
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVo updateProject(@RequestAttribute String uid, @PathVariable String id, HttpServletRequest request) {
        return projectService.deleteProject(id, uid);
    }
}