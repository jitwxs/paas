package jit.edu.paas.domain.select;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 系统日志搜索条件
 * @author jitwxs
 * @since 2018/7/11 10:08
 */
@Data
public class SysLogSelect {
    /**
     * 用户ID
     */
    private String userId;
    /**
     * 类别
     */
    private Integer type;
    /**
     * 是否有异常
     */
    private Boolean hasException;
    /**
     * 起始时间【创建时间】
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startDate;
    /**
     * 截止时间【创建时间】
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endDate;
}