package jit.edu.paas.domain.select;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 用户项目搜索条件
 * @author jitwxs
 * @since 2018/6/29 15:05
 */
@Data
public class UserProjectSelect {
    /**
     * 名称【模糊】
     */
    private String name;
    /**
     * 用户ID
     */
    private String userId;
    /**
     * 用户名【模糊】
     */
    private String username;
    /**
     * 起始时间【创建时间】
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startDate;
    /**
     * 截至时间【创建时间】
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endDate;
}
