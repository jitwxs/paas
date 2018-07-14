package jit.edu.paas.controller;

import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.domain.vo.UserVO;
import jit.edu.paas.service.JwtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * TokenController
 * @author jitwxs
 * @since 2018/6/27 21:29
 */
@RestController
@RequestMapping("/token")
public class TokenController {
    @Autowired
    private JwtService jwtService;

    /**
     * 获取用户信息
     * @author jitwxs
     * @since 2018/6/28 11:26
     */
    @PostMapping("")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO getUserInfo(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        UserVO userInfo = jwtService.getUserInfo(token);

        return ResultVOUtils.success(userInfo);
    }

    /**
     * 获取所有Token
     * @author jitwxs
     * @since 2018/7/14 9:27
     */
    @GetMapping("/list")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO listToken() {
        return jwtService.listToken();
    }

    /**
     * 删除Token
     * @author jitwxs
     * @since 2018/7/14 9:28
     */
    @DeleteMapping("/delete/{username}")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO deleteToken(@PathVariable String username) {
        if(StringUtils.isBlank(username)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        return jwtService.deleteToken(username);
    }
}
