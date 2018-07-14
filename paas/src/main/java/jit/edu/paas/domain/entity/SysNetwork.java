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
 * 系统网络表
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-14
 */
@Data
public class SysNetwork implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 网络ID
     */
    @TableId(type = IdType.INPUT)
    private String id;
    /**
     * 网络名
     */
    private String name;
    /**
     * 网络范围
     */
    private String scope;
    /**
     * 网络驱动
     */
    private String driver;
    /**
     * 是否是内部网络
     */
    private Boolean hasInternal;
    /**
     * 是否开启ipv6
     */
    private Boolean hasIpv6;
    private String labels;
    /**
     * 是否是公开网络
     */
    private Boolean hasPublic;
    /**
     * 如果不是公开网络，所属用户
     */
    private String userId;
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
