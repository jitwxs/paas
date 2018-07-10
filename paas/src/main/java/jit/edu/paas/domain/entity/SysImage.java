package jit.edu.paas.domain.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 *  镜像
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Data
public class SysImage implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.UUID)
    private String id;
    /**
     * 镜像ID
     */
    private String imageId;
    /**
     * 镜像完整名，唯一
     * 注：容器实际操作时请使用该变量，而不要使用name
     */
    private String fullName;
    /**
     * 镜像名
     */
    private String name;
    /**
     * TAG
     */
    private String tag;
    /**
     * 所占大小
     */
    private Long size;
    /**
     * 镜像类型【1：本地公共镜像；2：本地用户镜像】
     */
    private Integer type;
    /**
     * 如果是用户镜像，指明用户ID
     */
    private String userId;
    /**
     * 如果是用户镜像，是否公开
     */
    private Boolean hasOpen;
    /**
     * 镜像虚拟大小
     */
    private Long virtualSize;
    /**
     * labels
     */
    private String labels;
    /**
     * 镜像默认CMD
     */
    private String cmd;
    /**
     *仓库地址【官方：library】
     */
    private String repo;
    /**
     * parent_id
     */
    private String parentId;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createDate;
    /**
     * 更新时间
     */
    @TableField(update = "now()")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateDate;
}