package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import jit.edu.paas.commons.util.HttpClientUtils;
import jit.edu.paas.domain.entity.SysLog;
import jit.edu.paas.mapper.SysLogMapper;
import jit.edu.paas.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Service
public class SysLogServiceImpl extends ServiceImpl<SysLogMapper, SysLog> implements SysLogService {
    @Autowired
    private SysLogMapper logMapper;

    @Override
    public void saveLog(HttpServletRequest request, Integer type) {
        saveLog(request, null, type);
    }

    @Override
    public void saveLog(HttpServletRequest request, Exception ex, Integer type) {
        SysLog log = new SysLog();

        log.setType(type);
        log.setUserId((String)request.getAttribute("uid"));
        log.setAction(request.getRequestURI());
        log.setMethod(request.getMethod());
        log.setIp(HttpClientUtils.getRemoteAddr(request));
        log.setUserAgent(request.getHeader("user-agent"));
        log.setParam(request.getParameterMap());
        log.setException(HttpClientUtils.getStackTraceAsString(ex));

        logMapper.insert(log);
    }
}
