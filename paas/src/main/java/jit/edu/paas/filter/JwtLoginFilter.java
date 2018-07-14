package jit.edu.paas.filter;

import jit.edu.paas.commons.util.JsonUtils;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.commons.util.SpringBeanFactoryUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.entity.SysLogin;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.UserVO;
import jit.edu.paas.service.JwtService;
import jit.edu.paas.service.SysLoginService;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;

/**
 * 该filter继承自UsernamePasswordAuthenticationFilter
 * 在验证用户名密码正确后，生成一个token，并将token返回给客户端
 * @author jitwxs
 * @since 2018/5/4 10:34
 */
public class JwtLoginFilter extends UsernamePasswordAuthenticationFilter {
    private AuthenticationManager authenticationManager;

    public JwtLoginFilter(AuthenticationManager authenticationManager) {
        this.authenticationManager = authenticationManager;
    }

    /**
     * 该方法在Spring Security验证前调用
     * 将用户信息从request中取出，并放入authenticationManager中
     * @author jitwxs
     * @since 2018/5/4 10:35
     */
    @Override
    public Authentication attemptAuthentication(HttpServletRequest req, HttpServletResponse res) throws AuthenticationException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if(StringUtils.isBlank(username, password)) {
            return null;
        }

        try {
            // 将用户信息放入authenticationManager
            password = getEncryPassword(username, password);

            return authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(
                            username,
                            password,
                            Collections.emptyList())
            );
        } catch (Exception e) {
            try {
                req.setAttribute("ERR_MSG", ResultEnum.LOGIN_ERROR);
                req.getRequestDispatcher("/auth/error").forward(req, res);
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }
        return null;
    }

    /**
     * 该方法在Spring Security验证成功后调用
     * 在这个方法里生成JWT token，并返回给用户
     * @author jitwxs
     * @since 2018/5/4 10:37
     */
    @Override
    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication auth) throws IOException, ServletException {
        String username = ((User)auth.getPrincipal()).getUsername();

        // 判断用户是否被冻结
        SysLoginService loginService = SpringBeanFactoryUtils.getBean(SysLoginService.class);
        if(loginService.hasFreeze(username)) {
            request.setAttribute("ERR_MSG", ResultEnum.LOGIN_FREEZE);
            request.getRequestDispatcher("/auth/error").forward(request,response);
        }

        // 生成Token
        JwtService jwtService = SpringBeanFactoryUtils.getBean(JwtService.class);
        String token = jwtService.genToken(username);

        // 将token放入响应头中
        response.addHeader("Authorization", token);
        response.setHeader("Access-Control-Expose-Headers","Authorization");

        response.setContentType("text/html;charset=utf-8");
        // 读取用户信息
        UserVO userVO = jwtService.getUserInfo(token);
        String json = JsonUtils.objectToJson(ResultVOUtils.success(userVO));
        response.getWriter().write(json);
    }

    /**
     * 获取加密的密码
     * 如果用户身份验证失败，返回原密码
     * @author jitwxs
     * @since 2018/6/28 15:33
     */
    private String getEncryPassword(String username, String password) {
        SysLoginService loginService = SpringBeanFactoryUtils.getBean(SysLoginService.class);
        if(loginService.checkPassword(username, password)) {
            SysLogin sysLogin = loginService.getByUsername(username);
            return sysLogin.getPassword();
        } else {
            return password;
        }
    }
}
