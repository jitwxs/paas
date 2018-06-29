package jit.edu.paas.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.domain.vo.UserVO;
import jit.edu.paas.service.JwtService;
import jit.edu.paas.commons.util.ResultVoUtils;
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
@Api(tags={"TokenController"})
public class TokenController {
    @Autowired
    private JwtService jwtService;

    /**
     * 获取用户信息
     * @author jitwxs
     * @since 2018/6/28 11:26
     */
    @PostMapping("/token")
    @ApiOperation("获取用户信息")
    public ResultVo getUserInfo(HttpServletRequest request) {
        String token = request.getHeader("Authorization");
        UserVO userInfo = jwtService.getUserInfo(token);

        return ResultVoUtils.success(userInfo);
    }

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
}
