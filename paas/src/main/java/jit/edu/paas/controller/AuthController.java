package jit.edu.paas.controller;

import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.entity.SysLogin;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.service.SysLoginService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 鉴权Controller
 * 该Controller无需权限即可访问
 * @author jitwxs
 * @since 2018/6/27 15:56
 */
@RestController
@RequestMapping("/auth")
@Slf4j
public class AuthController {
    @Autowired
    private SysLoginService loginService;
    @Value("${nginx.server}")
    private String nginxServer;
    @Value("${server.addr}")
    private String serverAddress;

    /**
     * 验证密码是否正确
     * @author jitwxs
     * @since 2018/6/28 11:11
     */
    @PostMapping("/password/check")
    public ResultVO checkPassword(String username, String password) {
        if(StringUtils.isBlank(username, password)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        boolean b = loginService.checkPassword(username, password);

        return b ? ResultVOUtils.success() : ResultVOUtils.error(ResultEnum.LOGIN_ERROR);
    }

    /**
     * 注册校验
     * @author jitwxs
     * @since 2018/7/1 8:40
     */
    @PostMapping("/register/check")
    public ResultVO checkRegister(String username, String email) {
        return loginService.registerCheck(username, email);
    }

    /**
     * 用户注册
     * @author hf
     * @since 2018/6/28 9:17
     */
    @PostMapping("/register")
    public ResultVO register(String username, String password, String email) {
        if(StringUtils.isBlank(username,password,email)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        // 1、校验用户名、密码
        ResultVO resultVO = loginService.registerCheck(username, email);
        if(resultVO.getCode() != ResultEnum.OK.getCode()) {
            return resultVO;
        }

        // 2、生成用户
        SysLogin sysLogin = new SysLogin(username,password,email);
        // 设置为冻结状态
        sysLogin.setHasFreeze(true);
        loginService.save(sysLogin);

        // 3、发送邮件
        Boolean b = loginService.sendRegisterEmail(email);
        return b ? ResultVOUtils.success("已经发送验证邮件") : ResultVOUtils.error(ResultEnum.EMAIL_SEND_ERROR);
    }

    /**
     * 邮件验证
     * @author hf
     * @since 2018/6/28 9:17
     */
    @GetMapping("/email")
    public void email(String token, HttpServletResponse response) {
        Boolean b = loginService.verifyRegisterEmail(token);

        String subject = b ? "注册成功" : "注册失败";
        String content = b ? "欢迎注册无道PASS平台，点击此处进入" : "用户已注册或邮件验证已过期，请重新注册";
        String imgUrl = nginxServer + "/img/registerCallback.jpg";
        try {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("<!DOCTYPE html>\n" +
                    "<html>\n" +
                    "<head>\n" +
                    "    <meta charset='utf-8'>\n" +
                    "    <title></title>\n" +
                    "</head>\n" +
                    "<body background='"+imgUrl+"'>\n" +
                    "<div style='position: absolute; bottom:70%;left:50%;margin-left:-60px;'>\n" +
                    "    <h1>"+ subject +"</h1>\n" +
                    "</div>\n" +
                    "<div style='position: absolute; bottom:65%;left:45.5%;margin-left:-60px;'>\n" +
                    "    <a href='"+serverAddress+"'>" + content + "</a>\n" +
                    "</div>\n" +
                    "</body>\n" +
                    "</html>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 失败方法
     * @author jitwxs
     * @since 2018/6/28 9:16
     */
    @RequestMapping("/error")
    public ResultVO loginError(HttpServletRequest request) {
        // 如果Spring Security中有异常，输出
        AuthenticationException exception =
                (AuthenticationException)request.getSession().getAttribute("SPRING_SECURITY_LAST_EXCEPTION");
        if(exception != null) {
            return ResultVOUtils.error(ResultEnum.AUTHORITY_ERROR.getCode(), exception.toString());
        }

        // 其次从ERR_MSG中取
        Object obj = request.getAttribute("ERR_MSG");
        if(obj instanceof ResultVO) {
            return (ResultVO)obj;
        }
        if(obj instanceof ResultEnum) {
            return ResultVOUtils.error((ResultEnum)obj);
        } else {
            return ResultVOUtils.error(ResultEnum.OTHER_ERROR);
        }
    }
}