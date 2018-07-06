package jit.edu.paas.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
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
    List<UserContainer> listContainerById(String userId);

    /**
     * 判断容器是否属于指定用户
     * @author jitwxs
     * @since 2018/7/5 11:44
     */
    Boolean hasBelongSb(@Param("containerId") String containerId,@Param("userId") String userId);
}
