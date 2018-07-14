package jit.edu.paas.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.component.WrapperComponent;
import jit.edu.paas.commons.util.HttpClientUtils;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.domain.entity.SysLogin;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.select.UserSelect;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.service.JwtService;
import jit.edu.paas.service.SysLoginService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 用户Controller
 *
 * @author jitwxs
 * @since 2018/6/28 14:23
 */
@Slf4j
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private WrapperComponent wrapperComponent;
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private JwtService jwtService;

    /**
     * 获取用户列表
     * @Auther: zj
     * @Date: 2018/6/30 9:00
     */
    @GetMapping("/list")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO getSelfInfo(UserSelect userSelect, Page<SysLogin> page) {
        // 1、生成筛选条件
        EntityWrapper<SysLogin> wrapper = wrapperComponent.genUserWrapper(userSelect);
        // 2、分页查询
        Page<SysLogin> selectPage = loginService.selectPage(page, wrapper);
        // 3、返回前台
        return ResultVOUtils.success(selectPage);
    }

    /**
     * 冻结用户
     * @author jitwxs
     * @since 2018/6/30 16:33
     */
    @PostMapping("/freeze")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO freezeUser(String[] ids) {
        if(ids == null || ids.length == 0) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        int count = loginService.freezeUser(ids);

        return ResultVOUtils.success(count);
    }

    @PostMapping("/cancelFreeze")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO cancelFreezeUser(String[] ids) {
        if(ids == null || ids.length == 0) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        int count = loginService.cancelFreezeUser(ids);

        return ResultVOUtils.success(count);
    }

    @GetMapping("/logout")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO logout(@RequestAttribute String uid) {
       try {
           SysLogin sysLogin = loginService.getById(uid);
           jwtService.deleteToken(sysLogin.getUsername());

           return ResultVOUtils.success();
       } catch (Exception e) {
           log.error("退出登录失败，错误位置：{}，错误栈：{}", "UserController.logout()", HttpClientUtils.getStackTraceAsString(e));
           return ResultVOUtils.error(ResultEnum.OTHER_ERROR);
       }
    }
}