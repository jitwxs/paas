package jit.edu.paas.service;

import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.entity.SysLog;
import jit.edu.paas.domain.enums.SysLogTypeEnum;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
public interface SysLogService extends IService<SysLog> {
    void saveLog(HttpServletRequest request, SysLogTypeEnum enums);

    void saveLog(HttpServletRequest request, SysLogTypeEnum enums, Exception ex);
}
