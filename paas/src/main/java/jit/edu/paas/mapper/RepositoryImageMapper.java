package jit.edu.paas.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import jit.edu.paas.domain.entity.RepositoryImage;

import java.util.List;

/**
 * <p>
 * 仓储镜像 Mapper 接口
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-05
 */
public interface RepositoryImageMapper extends BaseMapper<RepositoryImage> {
    /**
     * 获取数据库镜像列表
     * 返回的是name的列表
     * @author jitwxs
     * @since 2018/7/5 21:08
     */
    List<RepositoryImage> listRepositoryFromDb(Pagination page);
}
