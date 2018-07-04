package jit.edu.paas.domain.select;

import lombok.Data;

import java.util.Date;

/**
 * 镜像搜索条件
 * @author hf
 * @since 2018/6/30 10:30
 */
@Data
public class SysImageSelect {
    /**
     * Id
     * @author hf
     * @since 2018/6/30 10:30
     */
    private String id;
    /**
     * 名称
     * @author hf
     * @since 2018/6/30 10:30
     */
    private String name;
    /**
     * 用户ID
     * @author hf
     * @since 2018/6/30 10:30
     */
    private String userId;
    /**
     * 标签
     * @author hf
     * @since 2018/6/30 10:30
     */
    private String tag;
    /**
     * 类型 type 【1：本地公共镜像；2：本地用户镜像】
     * @author hf
     * @since 2018/6/30 10:30
     */
    private Integer type;
    /**
     * 是否公开
     * @author hf
     * @since 2018/6/30 10:30
     */
    private String hasOpen;
    /**
     * 起始时间【创建时间】
     * @author hf
     * @since 2018/6/30 10:30
     */
    private Date startDate;
    /**
     * 截止时间【创建时间】
     * @author hf
     * @since 2018/6/30 10:30
     */
    private Date endDate;
    /**
     * labels 描述
     */
    private String labels;
}
