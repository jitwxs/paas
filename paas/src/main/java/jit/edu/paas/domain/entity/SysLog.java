package jit.edu.paas.domain.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 *  系统日志
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Data
public class SysLog implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.UUID)
    private String id;
    /**
     * 操作用户ID
     */
    private Integer userId;
    /**
     * 请求Url
     */
    private String action;
    /**
     * 请求方式
     */
    private String method;
    /**
     * 访问IP
     */
    private String ip;
    /**
     * 用户代理
     */
    private String userAgent;
    /**
     * 请求参数
     */
    private String param;
    /**
     * 异常
     */
    private String exception;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createDate;
}
