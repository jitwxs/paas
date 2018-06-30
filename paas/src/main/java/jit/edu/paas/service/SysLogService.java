package jit.edu.paas.service;

import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.entity.SysLog;

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
    void saveLog(HttpServletRequest request, Integer type);

    void saveLog(HttpServletRequest request, Exception ex, Integer type);
}
