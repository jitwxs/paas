package jit.edu.paas.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import jit.edu.paas.domain.dto.UserProjectDTO;
import jit.edu.paas.domain.entity.UserProject;
import jit.edu.paas.domain.select.UserProjectSelect;
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
public interface UserProjectMapper extends BaseMapper<UserProject> {
    /**
     * 根据ID查找
     * @author jitwxs
     * @since 2018/7/11 18:22
     */
    UserProjectDTO getById(String id);
    /**
     * 查询列表
     * @author jitwxs
     * @since 2018/7/11 18:24
     */
    List<UserProjectDTO> list(@Param("projectSelect") UserProjectSelect projectSelect, Pagination page);
    /**
     * 判断项目是否属于用户
     * @author jitwxs
     * @since 2018/7/1 15:26
     */
    Boolean hasBelong(@Param("projectId") String projectId, @Param("userId") String userId);
}
