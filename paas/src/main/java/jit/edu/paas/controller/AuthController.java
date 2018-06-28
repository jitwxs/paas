package jit.edu.paas.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.service.SysLoginService;
import jit.edu.paas.util.ResultVoUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;

/**
 * 鉴权Controller
 * @author jitwxs
 * @since 2018/6/27 15:56
 */
@RestController
@Api(tags={"鉴权Controller"})
public class AuthController {
    @Autowired
    private SysLoginService loginService;

//    @GetMapping("/api/test")
//    public Object hellWorld(@RequestAttribute(value = "uid")  String uid) {
//        return "Welcome! Your uid : " + uid;
//    }
//
//    @RequestMapping("/user")
//    @PreAuthorize("hasRole('ROLE_USER')")
//    public String printUser() {
//        return "如果你看见这句话，说明你user";
//    }
//
//    @RequestMapping("/system")
//    @PreAuthorize("hasRole('ROLE_SYSTEM')")
//    public String printSystem() {
//        return "如果你看见这句话，说明你system";
//    }
//
//    @RequestMapping("/all")
//    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
//    public String printALL() {
//        return "如果你看见这句话，说明你user or system";
//    }

//    /**
//     * 用户登陆
//     * @author jitwxs
//     * @since 2018/6/28 9:16
//     */
//    @PostMapping("/auth/login")
//    @ApiOperation("用户登陆")
//    @ApiImplicitParams({
//            @ApiImplicitParam(name = "username", value = "用户名", required = true, dataType = "String"),
//            @ApiImplicitParam(name = "password", value = "密码", required = true, dataType = "String")
//    })
//    public ResultVo login(@NotNull String username, @NotNull String password) {
//        boolean b = loginService.checkPassword(username, password);
//
//        if(!b) {
//            return ResultVoUtils.error(ResultEnum.LOGIN_ERROR);
//        }
//
//        String token = jwtService.genToken(username);
//        Map<String, String> map = new HashMap<>(16);
//
//        Integer roleId = loginService.getRoleId(username);
//
//        map.put("username", username);
//        map.put("roleId", String.valueOf(roleId));
//        map.put("token", token);
//
//        return ResultVoUtils.success(map);
//    }

    /**
     * 失败方法
     * @author jitwxs
     * @since 2018/6/28 9:16
     */
    @RequestMapping("/auth/error")
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
    @PostMapping("/auth/password/check")
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
     * @author jitwxs
     * @since 2018/6/28 9:17
     */
    @PostMapping("/auth/register")
    @ApiOperation("用户注册")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "username", value = "用户名", required = true, dataType = "String"),
            @ApiImplicitParam(name = "password", value = "密码", required = true, dataType = "String"),
            @ApiImplicitParam(name = "email", value = "邮箱", required = true, dataType = "String")
    })
    public ResultVo register(String username, String password, String email) {

        return ResultVoUtils.success();
    }
}
