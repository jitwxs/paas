package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import jit.edu.paas.domain.entity.SysRole;
import jit.edu.paas.mapper.SysRoleMapper;
import jit.edu.paas.service.SysRoleService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import jit.edu.paas.commons.util.CollectionUtils;
import jit.edu.paas.commons.util.jedis.JedisClient;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Service
@Slf4j
public class SysRoleServiceImpl extends ServiceImpl<SysRoleMapper, SysRole> implements SysRoleService {
    @Autowired
    private SysRoleMapper roleMapper;
    @Autowired
    private JedisClient jedisClient;

    @Value("${redis.role.key}")
    private String key;

    @Override
    public String getName(Integer id) {
        try {
            String res = jedisClient.hget(key, String.valueOf(id));
            if(StringUtils.isNotBlank(res)) {
                return res;
            }
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：SysRoleServiceImpl.getName()");
        }

        SysRole sysRole = roleMapper.selectById(id);
        if(sysRole == null) {
            return null;
        }

        try {
            jedisClient.hset(key, String.valueOf(id), sysRole.getName());
        } catch (Exception e) {
            log.error("缓存存储异常，错误位置：SysRoleServiceImpl.getName()");
        }

        return sysRole.getName();
    }

    @Override
    public Integer getId(String name) {
        try {
            String res = jedisClient.hget(key, name);
            if(StringUtils.isNotBlank(res)) {
                return Integer.parseInt(res);
            }
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：SysRoleServiceImpl.getId()");
        }

        List<SysRole> list = roleMapper.selectList(new EntityWrapper<SysRole>().eq("name", name));
        SysRole sysRole = CollectionUtils.getListFirst(list);
        if(sysRole == null) {
            return null;
        }

        try {
            // 存入缓存
            jedisClient.hset(key, name, String.valueOf(sysRole.getRoleId()));
        } catch (Exception e) {
            log.error("缓存存储异常，错误位置：SysRoleServiceImpl.getId()");
        }

        return sysRole.getRoleId();
    }
}
