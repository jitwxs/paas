package jit.edu.paas.domain.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 消息发送详情表
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-16
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserNoticeDesc implements Serializable {

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
     * 是否已读
     */
    private Boolean hasRead;
}
