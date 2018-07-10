package jit.edu.paas.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import jit.edu.paas.domain.entity.ProjectLog;
import jit.edu.paas.domain.vo.ProjectLogVO;
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
    /**
     * 获取项目日志
     * @param projectId 项目ID
     * @param type 日志类型
     * @author jitwxs
     * @since 2018/7/8 8:57
     */
    List<ProjectLogVO> listProjectLog(@Param("projectId") String projectId, @Param("type") Integer type, Pagination page);
}
