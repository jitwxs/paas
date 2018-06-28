package jit.edu.paas.service;

import jit.edu.paas.domain.entity.SysRole;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * 角色表 服务类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
public interface SysRoleService extends IService<SysRole> {
    String getName(Integer id);

    Integer getId(String name);
}
