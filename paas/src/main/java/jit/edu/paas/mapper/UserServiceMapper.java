package jit.edu.paas.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import jit.edu.paas.domain.entity.UserService;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 用户服务表 Mapper 接口
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-11
 */
public interface UserServiceMapper extends BaseMapper<UserService> {
    /**
     * 获取某一用户所有服务 (分页）
     * @author hf
     * @since 2018/7/13 10:50
     */
    List<UserService> listServiceByUserId(Pagination page, @Param("userId") String userId);

    /**
     * 服务是否属于某一用户
     * @author jitwxs
     * @since 2018/7/15 14:48
     */
    boolean hasBelong(@Param("serviceId") String serviceId, @Param("userId") String userId);

    void changeBelongProject(@Param("serviceId") String serviceId, @Param("projectId") String projectId);
}