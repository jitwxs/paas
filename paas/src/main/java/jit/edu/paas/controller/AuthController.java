package jit.edu.paas.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import jit.edu.paas.commons.StringUtils;
import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.domain.entity.SysLogin;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.service.SysLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;

/**
 * 鉴权Controller
 * 该Controller无需权限即可访问
 * @author jitwxs
 * @since 2018/6/27 15:56
 */
@RestController
@RequestMapping("/auth")
@Api(tags={"鉴权Controller"})
public class AuthController {
    @Autowired
    private SysLoginService loginService;

    /**
     * 失败方法
     * @author jitwxs
     * @since 2018/6/28 9:16
     */
    @RequestMapping("/error")
    @ApiIgnore
    public ResultVo loginError(HttpServletRequest request) {
        AuthenticationException exception =
                (AuthenticationException)request.getSession().getAttribute("SPRING_SECURITY_LAST_EXCEPTION");

        // 如果Spring Security中没有异常，则从request中取
        String info;
        if(exception == null) {
            info = (String)request.getAttribute("ERR_MSG");
        } else {
            info = exception.toString();
        }

        return ResultVoUtils.error(ResultEnum.AUTHORITY_ERROR.getCode(), info);
    }

    /**
     * 验证密码是否正确
     * @author jitwxs
     * @since 2018/6/28 11:11
     */
    @PostMapping("/password/check")
    @ApiOperation("密码校验")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "username", value = "用户名", required = true, dataType = "String"),
            @ApiImplicitParam(name = "password", value = "密码", required = true, dataType = "String")
    })
    public ResultVo checkPassword(String username, String password) {
        boolean b = loginService.checkPassword(username, password);

        return b ? ResultVoUtils.success() : ResultVoUtils.error(ResultEnum.LOGIN_ERROR);
    }

    /**
     * 用户注册
     * @author hf
     * @since 2018/6/28 9:17
     */
    @PostMapping("/register")
    @ApiOperation("用户注册")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "username", value = "用户名", required = true, dataType = "String"),
            @ApiImplicitParam(name = "password", value = "密码", required = true, dataType = "String"),
            @ApiImplicitParam(name = "email", value = "邮箱", required = true, dataType = "String")
    })
    public ResultVo register(String username, String password,String email) {
        if(StringUtils.isBlank(username,password,email)) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }

        // 1、确认用户不存在
        if(loginService.getByUsername(username) != null || loginService.getByEmail(email) != null) {
            return ResultVoUtils.error(ResultEnum.REGISTER_ERROR);
        }

        // 2、生成用户
        SysLogin sysLogin = new SysLogin(username,password,email);
        // 设置为冻结状态
        sysLogin.setHasFreeze(true);
        loginService.save(sysLogin);

        // 3、发送邮件
        Boolean b = loginService.sendRegisterEmail(email);
        return b ? ResultVoUtils.success("已经发送验证邮件") : ResultVoUtils.error(ResultEnum.EMAIL_SEND_ERROR);
    }
    /**
     * 邮件验证
     * @author hf
     * @since 2018/6/28 9:17
     */
    @GetMapping("/email")
    @ApiOperation("邮件验证")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "token", value = "token", required = true, dataType = "String")
    })
    public ResultVo email(String token) {
        Boolean b = loginService.verifyRegisterEmail(token);

        return b ? ResultVoUtils.success("邮件验证通过，用户已成功注册") : ResultVoUtils.error(ResultEnum.EMAIL_ERROR);
    }
}
