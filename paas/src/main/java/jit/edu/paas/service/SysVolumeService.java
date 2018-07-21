package jit.edu.paas.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.entity.SysVolume;
import jit.edu.paas.domain.enums.VolumeTypeEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.domain.vo.SysVolumeVO;

public interface SysVolumeService extends IService<SysVolume> {
    /**
     *
     * @author jitwxs
     * @since 2018/7/4 17:33
     */
    SysVolume getById(String id);

    SysVolume getByName(String name);

    SysVolume getBySource(String destination);

     /**
     * 获取挂载列表
     */
    ResultVO listByObjId(Page<SysVolumeVO> page, String objId, String uid);

    /**
     * 查看挂载信息
     */
    ResultVO inspectVolumes(String id, String uid);

    /**
     * 获取本地所有数据卷
     * @author jitwxs
     * @since 2018/7/5 13:03
     */
    ResultVO listFromLocal(VolumeTypeEnum enums);

    /**
     * 创建数据卷
     * @param name 数据卷名，如果为空，则为创建的目录名
     * @param enums 数据卷类型
     * @return 数据卷对象
     * @author jitwxs
     * @since 2018/7/16 10:47
     */
    SysVolume createVolumes(String name, VolumeTypeEnum enums);

    /**
     * 绑定容器/服务
     * @param objId 容器ID/服务ID
     * @param destination 内部目录
     * @author jitwxs
     * @since 2018/7/16 11:10
     */
    boolean bind(String id, String objId, String destination, VolumeTypeEnum enums);

    /**
     * 清理无效数据卷
     * @author jitwxs
     * @since 2018/7/5 13:03
     */
    ResultVO cleanVolumes(VolumeTypeEnum enums);

    /**
     * 检查权限
     * @param uid 用户ID
     * @param volume 数据卷
     * @author jitwxs
     * @since 2018/7/11 14:31
     */
    ResultVO checkPermission(String uid, SysVolume volume);
}
