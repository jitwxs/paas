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

    /**
     * 镜像ID
     */
    @TableId(type = IdType.INPUT)
    private String id;
    /**
     * 镜像名
     */
    private String name;
    /**
     * TAG
     */
    private String tag;
    /**
     * 来源仓库
     */
    private Integer repository;
    /**
     * 所占大小
     */
    private String size;
    /**
     * 如果用户上传镜像，指明用户ID
     */
    private String userId;
    /**
     * 如果用户上传镜像，是否公开
     */
    private Boolean hasOpen;
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
