package jit.edu.paas.controller;

import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.domain.vo.UserVO;
import jit.edu.paas.service.JwtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * TokenController
 * @author jitwxs
 * @since 2018/6/27 21:29
 */
@RestController
public class TokenController {
    @Autowired
    private JwtService jwtService;

    /**
     * 获取用户信息
     * @author jitwxs
     * @since 2018/6/28 11:26
     */
    @PostMapping("/token")
    public ResultVo getUserInfo(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        UserVO userInfo = jwtService.getUserInfo(token);

        return ResultVoUtils.success(userInfo);
    }
}
