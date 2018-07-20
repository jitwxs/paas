package jit.edu.paas.service;

import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.entity.ProjectLog;
import jit.edu.paas.domain.enums.ProjectLogTypeEnum;
import jit.edu.paas.domain.enums.ResultEnum;

/**
 * <p>
 *  ProjectLog服务类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
public interface ProjectLogService extends IService<ProjectLog> {
    /**
     * 保存成功操作日志
     * @author jitwxs
     * @since 2018/7/7 9:09
     */
    void saveSuccessLog(String projectId, String objId, ProjectLogTypeEnum projectLogTypeEnum);

    /**
     * 保存操作失败日志
     * @author jitwxs
     * @since 2018/7/7 9:09
     */
    void saveErrorLog(String projectId, String objId, ProjectLogTypeEnum projectLogTypeEnum, ResultEnum resultEnum);
}
