package jit.edu.paas.domain.select;

import lombok.Data;

import java.util.Date;

/**
 * 用户项目搜索条件
 * @author jitwxs
 * @since 2018/6/29 15:05
 */
@Data
public class UserProjectSelect {
    /**
     * 名称
     * @author jitwxs
     * @since 2018/6/29 15:06
     */
    private String name;
    /**
     * 用户ID
     * @author jitwxs
     * @since 2018/6/29 15:06
     */
    private String userId;
    /**
     * 起始时间【创建时间】
     * @author jitwxs
     * @since 2018/6/29 15:06
     */
    private Date startDate;
    /**
     * 截至时间【创建时间】
     * @author jitwxs
     * @since 2018/6/29 15:07
     */
    private Date endDate;
}
