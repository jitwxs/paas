package jit.edu.paas.domain.select;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 *
 * 用户搜索条件
 * @author zj
 * @since 2018/6/30 10:05
 */
@Data
public class UserSelect {

    private String id;
    /**
     * 用户名
     */
    private String username;
    /**
     * 邮箱
     */
    private String email;

    /**
     * 是否冻结
     */
    private Boolean hasFreeze;

    /**
     * 创建开始时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startDate;
    /**
     * 创建截至时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endDate;
}

