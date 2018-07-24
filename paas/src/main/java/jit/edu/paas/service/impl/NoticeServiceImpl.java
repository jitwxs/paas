package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import jit.edu.paas.commons.activemq.MQProducer;
import jit.edu.paas.commons.activemq.Task;
import jit.edu.paas.commons.util.*;
import jit.edu.paas.domain.dto.NoticeDTO;
import jit.edu.paas.domain.entity.UserNotice;
import jit.edu.paas.domain.entity.UserNoticeDesc;
import jit.edu.paas.domain.enums.NoticeTypeEnum;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.enums.WebSocketTypeEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.mapper.NoticeMapper;
import jit.edu.paas.mapper.SysLoginMapper;
import jit.edu.paas.service.NoticeService;
import lombok.extern.slf4j.Slf4j;
import org.apache.activemq.command.ActiveMQQueue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.jms.Destination;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户通知表 服务实现类
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-16
 */
@Slf4j
@Service
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper, NoticeDTO> implements NoticeService {
    @Autowired
    private NoticeMapper noticeMapper;
    @Autowired
    private SysLoginMapper loginMapper;
    @Autowired
    private MQProducer mqProducer;

    @Override
    public ResultVO sendCheck(String title, String content, Integer type, boolean sendAll, List<String> receivers) {
        // 1、校验标题、内容
        if(StringUtils.isBlank(title, content)) {
            return ResultVOUtils.error(ResultEnum.NOTICE_TITLE_OR_CONTENT_BLANK);
        }
        if(title.length() > 50) {
            return ResultVOUtils.error(ResultEnum.NOTICE_TITLE_LENGTH_THAN_50);
        }
        if(content.length() > 65535) {
            return ResultVOUtils.error(ResultEnum.NOTICE_CONTENT_LENGTH_THAN_65535);
        }
        // 2、类型校验
        if(type == null || !checkType(type)) {
            return ResultVOUtils.error(ResultEnum.NOTICE_TYPE_ERROR);
        }
        // 3、接收用户校验
        if(!sendAll && CollectionUtils.isListEmpty(receivers)) {
            return ResultVOUtils.error(ResultEnum.NOTICE_RECEIVER_NOT_EMPTY);
        }

        return ResultVOUtils.success();
    }

    @Async("taskExecutor")
    @Override
    public void sendUserTask(String title, String content, Integer type, boolean sendAll, List<String> receivers, String sender) {
        try {
            // 1、保存消息
            UserNotice notice = new UserNotice();
            String noticeId = RandomUtils.time();
            notice.setId(noticeId);
            notice.setTitle(title);
            notice.setContent(content);
            notice.setType(type);
            notice.setSender(sender);
            notice.setHasAll(sendAll);
            noticeMapper.saveNotice(notice);

            // 2、保存消息记录
            if(sendAll) {
                receivers = loginMapper.listId();
            }
            int total = receivers.size(), count = 0;
            for(String id : receivers) {
                if(loginMapper.hasExist(id)) {
                    UserNoticeDesc noticeDesc = new UserNoticeDesc(RandomUtils.uuid(), noticeId, id, false);
                    noticeMapper.saveNoticeDesc(noticeDesc);
                    count++;
                }
            }

            String msg = "通知发送成功，预计发送数：" + total + "，实际发送数：" + count;
            sendMQ(sender, ResultVOUtils.successWithMsg(msg));
        } catch (Exception e) {
            log.error("通知发送失败，错误位置：{}，错误栈：{}",
                    "NoticeServiceImpl.sendUserTask()", HttpClientUtils.getStackTraceAsString(e));
            sendMQ(sender, ResultVOUtils.successWithMsg("通知发送失败"));
        }
    }

    @Override
    public Page<NoticeDTO> listSelfNotice(String userId, Integer type, Page<NoticeDTO> page) {
        List<NoticeDTO> noticeDTOS = noticeMapper.listUserNotice(userId, type, page);

        return page.setRecords(noticeDTOS);
    }

    @Override
    public ResultVO readNotice(String[] ids, String userId) {
        try {
            noticeMapper.readNotice(ids, userId);
            return ResultVOUtils.success();
        } catch (Exception e) {
            return ResultVOUtils.error(ResultEnum.NOTICE_READ_ERROR);
        }
    }

    @Override
    public ResultVO readAllNotice(String userId, Integer type) {
        try {
            List<String> ids = noticeMapper.listUnReadIds(userId, type);
            noticeMapper.readNotice(ids.toArray(new String[ids.size()]), userId);
            return ResultVOUtils.success();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultVOUtils.error(ResultEnum.NOTICE_READ_ERROR);
        }
    }

    @Override
    public Page<NoticeDTO> listSelfSendHistory(String userId, Page<NoticeDTO> page) {
        List<NoticeDTO> noticeDTOS = noticeMapper.listSelfSendHistory(userId, page);

        return page.setRecords(noticeDTOS);
    }

    @Override
    public boolean checkType(int type) {
        NoticeTypeEnum typeEnum = NoticeTypeEnum.getEnum(type);

        return typeEnum != null;
    }

    @Override
    public Page<UserNotice> listSelfSendNotice(String uid, Page<UserNotice> page) {
        List<UserNotice> notices = noticeMapper.listSelfSendNotice(uid, page);

        return page.setRecords(notices);
    }

    @Override
    public NoticeDTO getNoticeDTO(String id) {
        return noticeMapper.getSelfSendNoticeDTO(id);
    }

    @Override
    public int countUnread(String uid) {
        return noticeMapper.countUnread(uid);
    }

    @Override
    public ResultVO deleteNotice(String[] idArray, String userId) {
        noticeMapper.deleteNotice(idArray, userId);

        return ResultVOUtils.success();
    }

    /**
     * 发送通知消息
     * @author jitwxs
     * @since 2018/7/9 18:34
     */
    private void sendMQ(String userId, ResultVO resultVO) {
        Destination destination = new ActiveMQQueue("MQ_QUEUE_NOTICE");
        Task task = new Task();

        Map<String, Object> data = new HashMap<>(16);
        data.put("type", WebSocketTypeEnum.NOTICE.getCode());
        resultVO.setData(data);

        Map<String,String> map = new HashMap<>(16);
        map.put("uid",userId);
        map.put("data", JsonUtils.objectToJson(resultVO));
        task.setData(map);

        mqProducer.send(destination, JsonUtils.objectToJson(task));
    }
}
