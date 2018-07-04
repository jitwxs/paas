package jit.edu.paas.service;

import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.entity.SysVolume;
import jit.edu.paas.domain.vo.ResultVo;

public interface SysVolumeService extends IService<SysVolume> {
    /**
     *
     * @author jitwxs
     * @since 2018/7/4 17:33
     */
    SysVolume getById(String id);

    SysVolume getByVolumeName(String volumeName);

     /**
     * 获取挂载列表
     */
    ResultVo listByContainerId(String containerId);

    /**
     * 创建挂载
     */
    ResultVo createVolume(String volumeName, String containerId);

    /**
     * 查看挂载信息
     */
    ResultVo inspectVolumes(String id);

    /**
     * 移除挂载
     */
    ResultVo removeVolmue(String id);
}
