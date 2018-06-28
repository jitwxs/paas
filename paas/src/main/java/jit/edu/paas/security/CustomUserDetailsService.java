package jit.edu.paas.security;

import jit.edu.paas.domain.entity.SysLogin;
import jit.edu.paas.service.SysLoginService;
import jit.edu.paas.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;

/**
 * @author jitwxs
 * @since 2018/5/4 9:45
 */
@Service("userDetailsService")
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    private SysLoginService loginService;

    @Autowired
    private SysRoleService roleService;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        Collection<GrantedAuthority> authorities = new ArrayList<>();
        SysLogin login = loginService.getByUsername(s);

        // 判断用户是否存在
        if(login == null) {
            throw new UsernameNotFoundException("用户名不存在");
        }

        // 添加权限
        String roleName = roleService.getName(login.getRoleId());
        authorities.add(new SimpleGrantedAuthority(roleName));

        // 返回UserDetails实现类
        return new User(login.getUsername(), login.getPassword(), authorities);
    }
}