package jit.edu.paas.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import jit.edu.paas.domain.entity.UserContainer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 用户容器表 Mapper 接口
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
public interface UserContainerMapper extends BaseMapper<UserContainer> {
    /**
     * 获取某一用户所有容器
     * @param name 容器名
     * @author jitwxs
     * @since 2018/7/9 11:24
     */
    List<UserContainer> listContainerByUserIdAndNameAndStatus(Pagination page, @Param("userId") String userId, @Param("name") String name, @Param("status") Integer status);

    /**
     * 判断容器是否属于指定用户
     * @author jitwxs
     * @since 2018/7/5 11:44
     */
    Boolean hasBelongSb(@Param("containerId") String containerId, @Param("userId") String userId);

    /**
     * 统计用户容器数目
     * @param status 容器状态，可选
     * @author jitwxs
     * @since 2018/7/10 0:16
     */
    Integer countByUserId(@Param("userId") String userId, @Param("status") Integer status);

    /**
     * 设置容器所属项目为NULL
     * @author jitwxs
     * @since 2018/7/12 14:47
     */
    Integer cleanProjectId(String projectId);
}