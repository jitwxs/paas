package jit.edu.paas.controller;

import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.util.CollectionUtils;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.domain.dto.NoticeDTO;
import jit.edu.paas.domain.entity.UserNotice;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * 通知Controller
 * @author jitwxs
 * @since 2018/7/16 19:05
 */
@RequestMapping("/notice")
@RestController
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    /**
     * 发送通知【WebSocket】
     * @author jitwxs
     * @since 2018/7/16 20:55
     */
    @PostMapping("/send")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO sendNotice(String title, String content, Integer type, boolean sendAll, String[] receivers,
                               @RequestAttribute String uid) {
        List<String> receiverList = null;
        if(receivers != null) {
            receiverList = Arrays.asList(receivers);
        }

        ResultVO resultVO = noticeService.sendCheck(title, content, type, sendAll, receiverList);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }

        noticeService.sendUserTask(title, content, type, sendAll, receiverList, uid);
        return ResultVOUtils.success("开始发送通知");
    }

    /**
     * 获取个人所有通知
     * @author jitwxs
     * @since 2018/7/16 21:05
     */
    @GetMapping("/list")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO listSelfNotice(Integer type,
                                   @RequestParam(defaultValue = "1") Integer current,
                                   @RequestParam(defaultValue = "10") Integer size,
                                   @RequestAttribute String uid) {
        Page<NoticeDTO> selectPage = noticeService.listSelfNotice(uid, type, new Page<>(current, size, "create_date", false));

        return ResultVOUtils.success(selectPage);
    }

    /**
     * 获取个人发送的所有通知
     * @author jitwxs
     * @since 2018/7/16 21:05
     */
    @GetMapping("/send/list")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO listSelfSendNotice(@RequestParam(defaultValue = "1") Integer current,
                                       @RequestParam(defaultValue = "10") Integer size,
                                       @RequestAttribute String uid) {

        Page<UserNotice> selectPage = noticeService.listSelfSendNotice(uid, new Page<>(current, size, "create_date", false));
        return ResultVOUtils.success(selectPage);
    }

    /**
     * 获取通知详细
     * @author jitwxs
     * @since 2018/7/16 21:05
     */
    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO getNoticeDTO(@PathVariable String id) {
        NoticeDTO noticeDTO = noticeService.getNoticeDTO(id);

        return ResultVOUtils.success(noticeDTO);
    }

    /**
     * 统计当前未读消息个数
     */
    @GetMapping("/countUnRead")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO countUnread(@RequestAttribute String uid) {
        return ResultVOUtils.success(noticeService.countUnread(uid));
    }

    /**
     * 将选中通知已读
     * @author jitwxs
     * @since 2018/7/16 21:05
     */
    @PostMapping("/read")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO readSelect(@RequestAttribute String uid, String[] ids) {
        return noticeService.readNotice(ids, uid);
    }

    /**
     * 已读所有通知
     * @param type 通知类别，为null时已读所有
     * @author jitwxs
     * @since 2018/7/23 9:18
     */
    @PostMapping("/readAll")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO readAll(@RequestAttribute String uid, Integer type) {
        return noticeService.readAllNotice(uid, type);
    }

    /**
     * 批量删除通知
     * @author jitwxs
     * @since 2018/7/23 9:19
     */
    @PostMapping("/delete")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO deleteNotices(String ids, @RequestAttribute String uid) {
        String[] idArray = ids.split(",");
        if(CollectionUtils.isArrayEmpty(idArray)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }
        return noticeService.deleteNotice(idArray, uid);
    }

}
