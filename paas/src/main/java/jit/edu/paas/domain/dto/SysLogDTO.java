package jit.edu.paas.domain.dto;

import jit.edu.paas.domain.entity.SysLog;
import lombok.Data;

/**
 * 系统日志DTO
 * @author jitwxs
 * @since 2018/7/11 10:10
 */
@Data
public class SysLogDTO extends SysLog {
    /**
     * 用户名
     */
    private String username;

    /**
     * 是否有异常
     */
    private Boolean hasException;
}
