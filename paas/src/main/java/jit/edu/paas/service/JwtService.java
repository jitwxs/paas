package jit.edu.paas.service;

import jit.edu.paas.domain.vo.UserVO;

public interface JwtService {
    /**
     * 生成token
     * @author jitwxs
     * @since 2018/6/27 16:58
     */
    String genToken(String username);

    UserVO getUserInfo(String token);
}
