package jit.edu.paas.service;

import jit.edu.paas.domain.entity.SysLogin;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * 登陆表 服务类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
public interface SysLoginService extends IService<SysLogin> {
    /**
     * 根据用户名获取用户
     * @author jitwxs
     * @since 2018/6/27 14:33
     */
    SysLogin getByUsername(String username);

    /**
     * 获取权限Id
     * @author jitwxs
     * @since 2018/6/27 17:24
     */
    Integer getRoleId(String username);

    boolean checkPassword(String username, String password);
}
