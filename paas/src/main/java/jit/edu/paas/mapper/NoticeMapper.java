package jit.edu.paas.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import jit.edu.paas.domain.dto.NoticeDTO;
import jit.edu.paas.domain.entity.UserNotice;
import jit.edu.paas.domain.entity.UserNoticeDesc;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 用户通知表 Mapper 接口
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-16
 */
public interface NoticeMapper extends BaseMapper<NoticeDTO> {
    /**
     * 保存消息
     * @author jitwxs
     * @since 2018/7/16 20:10
     */
    void saveNotice(@Param("notice") UserNotice notice);

    /**
     * 保存消息详情
     * @author jitwxs
     * @since 2018/7/16 20:10
     */
    void saveNoticeDesc(@Param("noticeDesc") UserNoticeDesc noticeDesc);

    List<NoticeDTO> listUserNotice(@Param("userId") String userId, @Param("type") Integer type, Pagination page);

    void readNotice(@Param("ids") String[] ids, @Param("userId") String userId);

    /**
     * 获取指定用户未读消息的ID集合
     */
    List<String> listUnReadIds(@Param("userId") String userId, @Param("type") Integer type);

    List<NoticeDTO> listSelfSendHistory(@Param("userId") String userId, Page<NoticeDTO> page);

    List<UserNotice> listSelfSendNotice(@Param("userId") String userId, Page<UserNotice> page);

    NoticeDTO getSelfSendNoticeDTO(@Param("noticeId") String noticeId);

    int countUnread(@Param("uid") String uid);

    void deleteNotice(@Param("ids") String[] idArray, @Param("userId") String userId);
}
