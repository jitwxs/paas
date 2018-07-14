package jit.edu.paas.service;

import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.domain.vo.UserVO;

public interface JwtService {

    /**
     * 生成Token
     * @author jitwxs
     * @since 2018/7/13 21:13
     */
    String genToken(String username);

    /**
     * 校验Token
     * @author jitwxs
     * @since 2018/7/13 21:13
     */
    ResultVO checkToken(String token);

    /**
     * 读取用户信息
     * @author jitwxs
     * @since 2018/7/13 21:13
     */
    UserVO getUserInfo(String token);

    /**
     * 获取所有token
     * @author jitwxs
     * @since 2018/7/14 8:54
     */
    ResultVO listToken();

    /**
     * 删除Token
     * @author jitwxs
     * @since 2018/7/14 9:32
     */
    ResultVO deleteToken(String username);
}
