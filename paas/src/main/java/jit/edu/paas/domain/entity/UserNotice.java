package jit.edu.paas.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 用户通知表
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-16
 */
@Data
public class UserNotice implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;
    /**
     * 发送用户
     */
    private String sender;
    /**
     * 通知类型
     */
    private Integer type;
    /**
     * 通知标题
     */
    private String title;
    /**
     * 通知内容
     */
    private String content;
    /**
     * 是否全体接收
     */
    private Boolean hasAll;
    /**
     * 发送时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createDate;
}
