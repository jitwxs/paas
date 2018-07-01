package jit.edu.paas.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import jit.edu.paas.domain.entity.UserProject;
import org.apache.ibatis.annotations.Param;

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
     * 判断项目是否属于用户
     * @author jitwxs
     * @since 2018/7/1 15:26
     */
    Boolean hasBelong(@Param("projectId") String projectId, @Param("userId") String userId);
}
