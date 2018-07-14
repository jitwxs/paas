package jit.edu.paas.service.impl;

import jit.edu.paas.commons.util.HttpClientUtils;
import jit.edu.paas.commons.util.JwtUtils;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.commons.util.jedis.JedisClient;
import jit.edu.paas.domain.entity.SysLogin;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.domain.vo.UserVO;
import jit.edu.paas.service.JwtService;
import jit.edu.paas.service.SysLoginService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.time.FastDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * JWT 服务
 * @author jitwxs
 * @since 2018/6/27 16:36
 */
@Slf4j
@Service
public class JwtServiceImpl implements JwtService {
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private JedisClient jedisClient;

    @Value("${redis.token.key}")
    private String key;

    /**
     * JWT有效时间（单位：小时）
     */
    @Value("${token.expire}")
    private Integer expireHour;

    /**
     * 生成token
     * 确保一个用户只有一个token有效，强依赖Redis
     * @author jitwxs
     * @since 2018/7/13 21:11
     */
    @Override
    public String genToken(String username) {
        SysLogin login = loginService.getByUsername(username);

        // 1、生成token
        Map<String,Object> map = new HashMap<>(16);
        map.put("uid", login.getId());
        map.put("rid", login.getRoleId());
        map.put("timestamp", System.currentTimeMillis());

        String token = JwtUtils.sign(map, 6 * 3600 * 1000);

        // 2、清理该用户其他token，确保只有一个token有效
        try {
            jedisClient.hdel(key, username);
            jedisClient.hset(key, username, token);

            return token;
        } catch (Exception e) {
            log.error("token缓存出现错误，错误位置：{}，错误栈：{}", "JwtServiceImpl.genToken()", HttpClientUtils.getStackTraceAsString(e));
            return null;
        }
    }

    @Override
    public ResultVO checkToken(String token) {
        try {
            // 1、判断Token是否存在于Redis
            List<String> tokens = jedisClient.hvals(key);
            if(!tokens.contains(token)) {
                return ResultVOUtils.error(ResultEnum.TOKEN_NOT_ACCEPT);
            }

            // 2、判断Token是否过期
            Map map = JwtUtils.unSign(token);
            if(map == null) {
                return ResultVOUtils.error(ResultEnum.TOKEN_EXPIRE);
            }

            return ResultVOUtils.success(map);
        } catch (Exception e) {
            log.error("token缓存出现错误，错误位置：{}，错误栈：{}", "JwtServiceImpl.checkToken()", HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.TOKEN_READ_ERROR);
        }
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

    @Override
    public ResultVO listToken() {
        FastDateFormat format = FastDateFormat.getInstance("yyyy-MM-dd HH:mm:ss");
        Map<String, Map<String, String>> map = new HashMap<>(16);
        try {
            // 取出所有用户
            Set<String> fields = jedisClient.hkeys(key);

            for(String uid : fields) {
                String token = jedisClient.hget(key, uid);
                Map<String, String> tokenMap = new HashMap<>(16);
                tokenMap.put("token", token);

                ResultVO resultVO = checkToken(token);
                if(resultVO.getCode() == ResultEnum.OK.getCode()) {
                    Map data = (Map) resultVO.getData();

                    long timestamp = (long) data.get("timestamp");
                    tokenMap.put("createDate", format.format(timestamp));
                } else {
                    tokenMap.put("createDate", "已过期");
                }

                map.put(uid, tokenMap);
            }

            return ResultVOUtils.success(map);
        } catch (Exception e) {
            log.error("token缓存出现错误，错误位置：{}，错误栈：{}", "JwtServiceImpl.listToken()", HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.TOKEN_READ_ERROR);
        }
    }

    @Override
    public ResultVO deleteToken(String username) {
        try {
            jedisClient.hdel(key, username);

            return ResultVOUtils.success();
        } catch (Exception e) {
            log.error("token缓存出现错误，错误位置：{}，错误栈：{}", "JwtServiceImpl.deleteToken()", HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.TOKEN_READ_ERROR);
        }
    }
}
