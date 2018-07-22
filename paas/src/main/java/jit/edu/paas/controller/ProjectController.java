package jit.edu.paas.controller;

import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.dto.UserProjectDTO;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.enums.RoleEnum;
import jit.edu.paas.domain.select.UserProjectSelect;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.service.SysLoginService;
import jit.edu.paas.service.UserProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 项目Controller
 * @author jitwxs
 * @since 2018/6/28 14:29
 */
@RestController
@RequestMapping("/project")
public class ProjectController {
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private UserProjectService projectService;

    /**
     * 所有项目列表
     * @author jitwxs
     * @since 2018/6/29 15:01
     */
    @GetMapping("/list")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO listProject(UserProjectSelect projectSelect,
                                @RequestParam(defaultValue = "1") Integer current,
                                @RequestParam(defaultValue = "10") Integer size) {
        Page<UserProjectDTO> selectPage = projectService.list(projectSelect, new Page<>(current, size));
        return ResultVOUtils.success(selectPage);
    }

    /**
     * 用户项目列表
     * @author jitwxs
     * @since 2018/6/29 15:01
     */
    @GetMapping("/self/list")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO listSelfProject(@RequestAttribute String uid, UserProjectSelect projectSelect,
                                @RequestParam(defaultValue = "1") Integer current,
                                @RequestParam(defaultValue = "10") Integer size) {
        // 设置筛选条件userId为当前用户
        projectSelect.setUserId(uid);
        // 设置筛选条件username为null
        projectSelect.setUsername(null);

        Page<UserProjectDTO> selectPage = projectService.list(projectSelect, new Page<>(current, size));
        return ResultVOUtils.success(selectPage);
    }

    /**
     * 根据ID查询项目
     * @author jitwxs
     * @since 2018/6/29 18:43
     */
    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO getById(@RequestAttribute String uid, @PathVariable String id) {
        return projectService.getProjectById(id, uid);
    }

    /**
     * 创建项目
     * @author jitwxs
     * @since 2018/6/29 18:44
     */
    @PostMapping("/create")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO createProject(@RequestAttribute String uid, String name, String description) {
        return projectService.createProject(uid, name, description);
    }

    /**
     * 更新项目
     * @author jitwxs
     * @since 2018/6/29 18:53
     */
    @PutMapping("/update")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO updateProject(@RequestAttribute String uid, String id, String name, String description) {
        return projectService.updateProject(uid, id, name, description);
    }

    /**
     * 删除项目
     * @author jitwxs
     * @since 2018/6/29 18:53
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO updateProject(@RequestAttribute String uid, @PathVariable String id) {
        return projectService.deleteProject(id, uid);
    }

    /**
     * 获取操作日志
     * @param projectId 项目ID
     * @param type 日志类型
     * @author jitwxs
     * @since 2018/7/7 10:27
     */
    @GetMapping("/log")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO getProjectLog(@RequestAttribute String uid, String projectId, Integer type,
                                  @RequestParam(defaultValue = "1") Integer current,
                                  @RequestParam(defaultValue = "10") Integer size) {
        if(StringUtils.isBlank(projectId)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }
        // 鉴权
        String roleName = loginService.getRoleName(uid);
        if(RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            String userId = projectService.getUserId(projectId);
            if(!uid.equals(userId)) {
                return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
            }
        }

        return projectService.listProjectLog(projectId, type, new Page<>(current, size, "create_date", false));
    }
}