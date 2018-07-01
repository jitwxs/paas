package jit.edu.paas.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import jit.edu.paas.domain.entity.SysLogin;

/**
 * <p>
 * 登陆表 Mapper 接口
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
public interface SysLoginMapper extends BaseMapper<SysLogin> {
    /**
     * 获取用户角色名
     * @author jitwxs
     * @since 2018/7/1 15:21
     */
    String getRoleName(String userId);
}
