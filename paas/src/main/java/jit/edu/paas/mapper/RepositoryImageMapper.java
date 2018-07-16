package jit.edu.paas.mapper;


import com.baomidou.mybatisplus.mapper.BaseMapper;
import jit.edu.paas.domain.entity.RepositoryImage;
import jit.edu.paas.domain.vo.HubImageVO;

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
     * 获取所有仓储镜像名列表
     * @author jitwxs
     * @since 2018/7/5 21:08
     */
    List<HubImageVO> listHubImageVO();
}
