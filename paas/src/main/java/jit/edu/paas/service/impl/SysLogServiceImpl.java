package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import jit.edu.paas.commons.util.HttpClientUtils;
import jit.edu.paas.domain.dto.SysLogDTO;
import jit.edu.paas.domain.entity.SysLog;
import jit.edu.paas.domain.enums.SysLogTypeEnum;
import jit.edu.paas.domain.select.SysLogSelect;
import jit.edu.paas.mapper.SysLogMapper;
import jit.edu.paas.service.SysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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
    public void saveLog(HttpServletRequest request, SysLogTypeEnum enums) {
        saveLog(request, enums, null);
    }

    @Override
    public void saveLog(HttpServletRequest request, SysLogTypeEnum enums, Exception ex) {
        SysLog log = new SysLog();

        log.setType(enums.getCode());
        log.setDescription(enums.getMessage());
        log.setUserId((String)request.getAttribute("uid"));
        log.setAction(request.getRequestURI());
        log.setMethod(request.getMethod());
        log.setIp(HttpClientUtils.getRemoteAddr(request));
        log.setUserAgent(request.getHeader("user-agent"));
        log.setParam(request.getParameterMap());
        if(ex != null) {
            log.setException(ex.getMessage());
        }

        logMapper.insert(log);
    }

    @Override
    public Page<SysLogDTO> listSystemLog(SysLogSelect sysLogSelect, Page<SysLogDTO> page) {
        List<SysLogDTO> list = logMapper.listSystemLog(sysLogSelect, page);

        return page.setRecords(list);
    }
}
