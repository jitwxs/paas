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
 * 仓储镜像
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-05
 */
@Data
public class RepositoryImage implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 镜像ID
     */
    @TableId(type = IdType.UUID)
    private String id;
    /**
     * 镜像完整名
     */
    private String fullName;
    private String name;
    private String tag;
    /**
     * 上传用户
     */
    private String userId;
    private String digest;
    /**
     * 仓储
     */
    private String repo;
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
