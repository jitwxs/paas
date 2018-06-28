package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import jit.edu.paas.domain.entity.SysLogin;
import jit.edu.paas.mapper.SysLoginMapper;
import jit.edu.paas.service.SysLoginService;
import jit.edu.paas.util.CollectionUtils;
import jit.edu.paas.util.JsonUtils;
import jit.edu.paas.util.jedis.JedisClient;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 登陆表 服务实现类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Service
@Slf4j
public class SysLoginServiceImpl extends ServiceImpl<SysLoginMapper, SysLogin> implements SysLoginService {
    @Autowired
    private SysLoginMapper loginMapper;
    @Autowired
    private JedisClient jedisClient;

    @Value("${redis.login.key}")
    private String key;

    @Override
    public SysLogin getByUsername(String username) {
        try {
            String res = jedisClient.hget(key, username);
            if(StringUtils.isNotBlank(res)) {
                return JsonUtils.jsonToPojo(res, SysLogin.class);
            }
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：SysLoginServiceImpl.getByUsername()");
        }


        List<SysLogin> list = loginMapper.selectList(new EntityWrapper<SysLogin>().eq("username", username));
        SysLogin first = CollectionUtils.getFirst(list);

        try {
            jedisClient.hset(key, username, JsonUtils.objectToJson(first));
        } catch (Exception e) {
            log.error("缓存存储异常，错误位置：SysLoginServiceImpl.getByUsername()");
        }

        return first;
    }

    @Override
    public Integer getRoleId(String username) {
        SysLogin login = getByUsername(username);

        if(login == null) {
            return null;
        }

        return login.getRoleId();
    }

    @Override
    public boolean checkPassword(String username, String password) {
        SysLogin login = getByUsername(username);
        if (login == null) {
            return false;
        }
        return new BCryptPasswordEncoder().matches(password, login.getPassword());
    }
}
