package jit.edu.paas.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.entity.SysVolume;
import jit.edu.paas.domain.vo.ResultVO;

import javax.servlet.http.HttpServletRequest;

public interface SysVolumeService extends IService<SysVolume> {
    /**
     *
     * @author jitwxs
     * @since 2018/7/4 17:33
     */
    SysVolume getById(String id);

    SysVolume getByName(String name);

     /**
     * 获取挂载列表
     */
    ResultVO listByContainerId(Page<SysVolume> page, String containerId, String uid);

    /**
     * 查看挂载信息
     */
    ResultVO inspectVolumes(String id, String uid);

    /**
     * 获取本地所有数据卷
     * @author jitwxs
     * @since 2018/7/5 13:03
     */
    ResultVO listFromLocal();

    /**
     * 清理无效数据卷
     * @author jitwxs
     * @since 2018/7/5 13:03
     */
    ResultVO cleanVolumes();

    /**
     * 上传文件到数据卷
     * @author jitwxs
     * @since 2018/7/11 14:27
     */
    ResultVO uploadToVolumes(String uid, HttpServletRequest request);

    /**
     * 检查权限
     * @param uid 用户ID
     * @param volume 数据卷
     * @author jitwxs
     * @since 2018/7/11 14:31
     */
    ResultVO checkPermission(String uid, SysVolume volume);
}
