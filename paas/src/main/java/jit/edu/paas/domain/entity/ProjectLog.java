package jit.edu.paas.domain.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 项目日志
 * @author jitwxs
 * @since 2018/7/3 13:37
 */
@Data
public class ProjectLog implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.UUID)
    private String id;
    /**
     * 项目ID
     */
    private String projectId;
    /**
     * 容器ID
     */
    private String containerId;
    /**
     * 事件类型
     */
    private String type;
    /**
     * 名称
     */
    private String name;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createDate;
}
