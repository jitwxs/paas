package jit.edu.paas.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.dto.NoticeDTO;
import jit.edu.paas.domain.entity.UserNotice;
import jit.edu.paas.domain.vo.ResultVO;

import java.util.List;

/**
 * <p>
 * 用户通知表 服务类
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-16
 */
public interface NoticeService extends IService<NoticeDTO> {
    /**
     * 消息发送前校验
     * @author jitwxs
     * @since 2018/7/16 20:00
     */
    ResultVO sendCheck(String title, String content, Integer type, boolean sendAll, List<String> receivers);
    /**
     * 发送消息给用户任务
     * @param title 消息标题
     * @param content 消息内容
     * @param type 消息类型，不能为空
     * @param sendAll 是否发送全体用户
     * @param receivers 接收用户ID数组，当发送全体用户时，参数无效
     * @author jitwxs
     * @since 2018/7/16 19:23
     */
    void sendUserTask(String title, String content, Integer type, boolean sendAll, List<String> receivers, String sender);

    /**
     * 获取个人所有消息
     * @param type 消息类型，null查询所有
     * @author jitwxs
     * @since 2018/7/16 19:35
     */
    Page<NoticeDTO> listSelfNotice(String userId, Integer type, Page<NoticeDTO> page);

    /**
     * 已读指定消息
     * @author jitwxs
     * @since 2018/7/16 19:39
     */
    ResultVO readNotice(String[] ids, String userId);

    /**
     * 已读所有消息
     * @param type 消息类型，null已读所有类型
     * @author jitwxs
     * @since 2018/7/16 19:37
     */
    ResultVO readAllNotice(String userId, Integer type);

    /**
     * 消息发送记录
     * @author jitwxs
     * @since 2018/7/16 19:41
     */
    Page<NoticeDTO> listSelfSendHistory(String userId, Page<NoticeDTO> page);

    /**
     * 校验类型
     * @return 合法：true；
     * @author jitwxs
     * @since 2018/7/16 19:59
     */
    boolean checkType(int type);

    Page<UserNotice> listSelfSendNotice(String uid, Page<UserNotice> page);

    NoticeDTO getNoticeDTO(String id);

    /**
     * 统计未读消息个数
     */
    int countUnread(String uid);

    ResultVO deleteNotice(String[] idArray, String userId);
}
