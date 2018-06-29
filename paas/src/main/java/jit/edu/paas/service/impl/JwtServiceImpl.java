package jit.edu.paas.service.impl;

import jit.edu.paas.domain.entity.SysLogin;
import jit.edu.paas.domain.vo.UserVO;
import jit.edu.paas.service.JwtService;
import jit.edu.paas.service.SysLoginService;
import jit.edu.paas.commons.util.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @author jitwxs
 * @since 2018/6/27 16:36
 */
@Service
public class JwtServiceImpl implements JwtService {
    @Autowired
    private SysLoginService loginService;

    /**
     * JWT有效时间（单位：ms）
     */
    private Integer maxAge = 3600_000;

    @Override
    public String genToken(String username) {
        SysLogin login = loginService.getByUsername(username);

        Map<String,Object> map = new HashMap<>(16);
        map.put("uid", login.getId());
        map.put("rid", login.getRoleId());

        return JwtUtils.sign(map, maxAge);
    }

    @Override
    public UserVO getUserInfo(String token) {
        Map map = JwtUtils.unSign(token);
        String userId = (String)map.get("uid");
        Integer roleId = (Integer)map.get("rid");

        SysLogin login = loginService.selectById(userId);

        UserVO userVO = new UserVO();
        userVO.setUserId(userId);
        userVO.setRoleId(roleId);
        userVO.setUsername(login.getUsername());
        userVO.setEmail(login.getEmail());

        return userVO;
    }
}
