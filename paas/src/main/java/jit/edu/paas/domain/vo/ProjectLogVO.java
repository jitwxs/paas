package jit.edu.paas.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * 项目日志VO
 * @author jitwxs
 * @since 2018/7/8 8:41
 */
@Data
public class ProjectLogVO {
    /**
     * 日志ID
     */
    private String id;

    /**
     *日志类别
     */
    private Integer type;

    /**
     * 日志描述
     */
    private String description;

    /**
     * 目标容器或服务名
     */
    private String objName;

    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createDate;
}
