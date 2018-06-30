package jit.edu.paas.service;

import jit.edu.paas.domain.entity.UserProject;
import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.vo.ResultVo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
public interface UserProjectService extends IService<UserProject> {
    /**
     * 根据ID获取项目信息
     * @param userId 用户ID
     * @author jitwxs
     * @since 2018/6/29 18:29
     */
    ResultVo getProjectById(String id, String userId);

    /**
     * 清理缓存
     * @author jitwxs
     * @since 2018/6/29 18:38
     */
    void cleanCache(String id);

    /**
     * 创建项目
     * @author jitwxs
     * @since 2018/6/29 18:47
     */
    ResultVo createProject(String userId, String name, String description);

    /**
     * 根据Id删除项目
     * @author jitwxs
     * @since 2018/6/29 18:49
     */
    ResultVo deleteProject(String id, String userId);

    ResultVo updateProject(String userId, String id, String name, String description);
}
