package jit.edu.paas.domain.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 用户容器表
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Data
public class UserContainer implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 容器ID
     */
    private String id;
    /**
     * 项目ID
     */
    private String projectId;
    /**
     * 容器名
     */
    private String name;
    /**
     * 执行命令
     */
    private String command;
    /**
     * 端口
     */
    private String port;
    /**
     * 镜像名
     */
    private String image;
    /**
     * 容器状态
     */
    private String status;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createDate;
    /**
     * 修改时间
     */
    @TableField(update = "now()")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateDate;
}
