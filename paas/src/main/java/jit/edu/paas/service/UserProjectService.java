package jit.edu.paas.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.dto.UserProjectDTO;
import jit.edu.paas.domain.entity.UserProject;
import jit.edu.paas.domain.select.UserProjectSelect;
import jit.edu.paas.domain.vo.ProjectLogVO;
import jit.edu.paas.domain.vo.ResultVO;

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
     * 获取项目名
     * @author jitwxs
     * @since 2018/7/9 22:34
     */
    String getProjectName(String projectId);

    /**
     * 获取用户ID
     * @author jitwxs
     * @since 2018/7/11 18:39
     */
    String getUserId(String projectId);

    /**
     * 根据ID获取项目信息
     * @param userId 用户ID
     * @author jitwxs
     * @since 2018/6/29 18:29
     */
    ResultVO getProjectById(String id, String userId);

    /**
     * 获取项目列表
     * @author getProjectById
     * @since 2018/7/11 18:40
     */
    Page<UserProjectDTO> list(UserProjectSelect projectSelect, Page<UserProjectDTO> page);

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
    ResultVO createProject(String userId, String name, String description);

    /**
     * 根据Id删除项目
     * @author jitwxs
     * @since 2018/6/29 18:49
     */
    ResultVO deleteProject(String id, String userId);

    /**
     * 更新项目
     * @author jitwxs
     * @since 2018/7/11 18:40
     */
    ResultVO updateProject(String userId, String id, String name, String description);

    /**
     * 项目是否属于用户
     * @author jitwxs
     * @since 2018/7/1 15:34
     */
    Boolean hasBelong(String projectId, String userId);

    /**
     * 获取某个项目日志
     * @param projectId 项目ID
     * @param type 日志类型
     * @author jitwxs
     * @since 2018/7/8 8:47
     */
    ResultVO listProjectLog(String projectId, Integer type, Page<ProjectLogVO> page);
}
