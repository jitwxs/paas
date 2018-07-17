package jit.edu.paas.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import jit.edu.paas.domain.entity.SysLogin;

import java.util.List;

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
     * 获取所有ID
     * @author jitwxs
     * @since 2018/7/16 20:17
     */
    List<String> listId();

    /**
     * 判断ID是否存在
     * @author jitwxs
     * @since 2018/7/17 8:37
     */
    boolean hasExist(String id);
}
