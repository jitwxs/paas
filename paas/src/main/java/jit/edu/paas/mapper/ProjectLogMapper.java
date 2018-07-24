package jit.edu.paas.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import jit.edu.paas.domain.entity.ProjectLog;
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
public interface ProjectLogMapper extends BaseMapper<ProjectLog> {
    List<ProjectLog> listProjectLog(@Param("projectId") String projectId, Pagination page);
}
