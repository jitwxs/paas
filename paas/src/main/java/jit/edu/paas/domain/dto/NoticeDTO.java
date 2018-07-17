package jit.edu.paas.domain.dto;

import com.baomidou.mybatisplus.annotations.TableField;
import com.fasterxml.jackson.annotation.JsonFormat;
import jit.edu.paas.domain.enums.NoticeTypeEnum;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author jitwxs
 * @since 2018/7/16 19:48
 */
@Data
public class NoticeDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    private String id;
    /**
     * 通知ID
     */
    private String noticeId;
    /**
     * 接收者
     */
    private String receive;
    /**
     * 接收者名
     */
    private String receiveName;
    /**
     * 是否已读
     */
    private Boolean hasRead;
    /**
     * 发送用户
     */
    private String sender;
    /**
     * 发送用户名
     */
    private String senderName;
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
     * 发送时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createDate;

    @TableField(exist = false)
    private String typeName;

    public String getTypeName() {
        return this.type == null ? null : NoticeTypeEnum.getMessage(this.type);
    }
}
