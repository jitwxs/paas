package jit.edu.paas.domain.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 用户服务表
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-11
 */
@Data
public class UserService implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;
    /**
     * 项目ID
     */
    private String projectId;
    /**
     * 服务名
     */
    private String name;
    /**
     * 横向扩展数量
     */
    private Integer replicas;
    /**
     * 执行命令
     */
    private String command;
    /**
     * 端口
     */
    private String port;
    /**
     * 使用镜像
     */
    private String image;
    /**
     * 服务状态
     */
    private Integer status;
    /**
     * 环境变量
     */
    private String env;
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
