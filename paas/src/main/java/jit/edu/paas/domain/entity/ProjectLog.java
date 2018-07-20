package jit.edu.paas.domain.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * 项目日志
 * @author jitwxs
 * @since 2018/7/3 13:37
 */
@Data
@NoArgsConstructor
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
    private String objId;
    /**
     * 事件类型
     */
    private Integer type;
    /**
     * 名称
     */
    private String description;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createDate;

    public ProjectLog(String projectId, String objId, Integer type, String description) {
        this.projectId = projectId;
        this.objId = objId;
        this.type = type;
        this.description = description;
    }
}
