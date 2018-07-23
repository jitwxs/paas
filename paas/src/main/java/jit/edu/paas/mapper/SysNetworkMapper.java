package jit.edu.paas.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.domain.entity.SysNetwork;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 系统网络表 Mapper 接口
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-14
 */
public interface SysNetworkMapper extends BaseMapper<SysNetwork> {

    List<SysNetwork> listAllNetwork(Page<SysNetwork> page, @Param("hasPublic") Boolean hasPublic);

    List<SysNetwork> listSelfNetwork(Page<SysNetwork> page, @Param("userId") String userId);

    List<SysNetwork> listSelfAndPublicNetwork(Page<SysNetwork> page, @Param("userId") String userId);
}
