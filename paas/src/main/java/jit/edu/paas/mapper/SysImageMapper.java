package jit.edu.paas.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import jit.edu.paas.domain.dto.SysImageDTO;
import jit.edu.paas.domain.entity.SysImage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
public interface SysImageMapper extends BaseMapper<SysImage> {
    /**
     * 获取本地公共镜像
     * @author jitwxs
     * @since 2018/6/28 16:19
     */
    List<SysImageDTO> listLocalPublicImage(Pagination page, @Param("name") String name);

    /**
     * 获取本地用户镜像
     * @author jitwxs
     * @since 2018/6/28 16:19
     */
    List<SysImageDTO> listLocalUserImage(Pagination page, @Param("name") String name);

    /**
     * 获取当前用户所有镜像
     * @author jitwxs
     * @since 2018/7/12 14:35
     */
    List<SysImage> listSelfImage(@Param("userId") String userId, Pagination page);
}
