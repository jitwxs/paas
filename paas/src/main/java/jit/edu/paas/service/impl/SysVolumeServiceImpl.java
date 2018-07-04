package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.spotify.docker.client.DockerClient;
import com.spotify.docker.client.exceptions.DockerException;
import com.spotify.docker.client.messages.Volume;
import jit.edu.paas.commons.util.CollectionUtils;
import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.domain.entity.SysVolume;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.mapper.SysVolumesMapper;
import jit.edu.paas.service.SysVolumeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class SysVolumeServiceImpl extends ServiceImpl<SysVolumesMapper,SysVolume> implements SysVolumeService {
    @Autowired
    private DockerClient dockerClient;
    @Autowired
    private SysVolumesMapper sysVolumesMapper;

    @Override
    public SysVolume getById(String id) {
        return sysVolumesMapper.selectById(id);
    }

    @Override
    public SysVolume getByVolumeName(String volumeName) {
        List<SysVolume> list = sysVolumesMapper.selectList(new EntityWrapper<SysVolume>().eq("volume_name", volumeName));
        return CollectionUtils.getListFirst(list);
    }

    @Override
    public ResultVo listByContainerId(String containerId) {
        List<SysVolume> list = sysVolumesMapper.selectList(new EntityWrapper<SysVolume>().eq("container_id",containerId));
        return ResultVoUtils.success(list);
    }

    @Override
    public ResultVo createVolume(String volumeName, String containerId) {
        // 校验数据卷名字
        if(getByVolumeName(volumeName) != null) {
            return ResultVoUtils.error(ResultEnum.VOLUME_NAME_ERROR);
        }

        Volume volume = Volume.builder()
                .name(volumeName)
                .driver("local")
                .build();
        try {
            dockerClient.createVolume(volume);
        } catch (Exception e) {
          log.error("创建数据卷失败，错误位置：{}", "SysVolumeServiceImpl.createVolume()");
          return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }

        SysVolume sysVolume = new SysVolume();
        sysVolume.setVolumeName(volumeName);
        sysVolume.setContainerId(containerId);

        // 获取挂载点
        try {
            String source = dockerClient.inspectVolume(volumeName).mountpoint();
            sysVolume.setSource(source);
            sysVolumesMapper.insert(sysVolume);

            return ResultVoUtils.success();
        } catch (Exception e) {
            log.error("创建挂载点失败，错误位置：{}", "SysVolumeServiceImpl.createVolume()");
            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    public ResultVo inspectVolumes(String id) {
        SysVolume sysVolume = getById(id);
        if(sysVolume == null) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }

        try {
            Volume volume = dockerClient.inspectVolume(sysVolume.getVolumeName());
            return ResultVoUtils.success(volume);
        } catch (Exception e) {
            log.error("获取数据卷详情异常，错误位置：{}", "SysVolumeServiceImpl.inspectVolumes()");
            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVo removeVolmue(String id) {
        SysVolume sysVolume = getById(id);
        if(sysVolume == null) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }

        try {
            dockerClient.removeVolume(sysVolume.getVolumeName());
            sysVolumesMapper.deleteById(id);

            return ResultVoUtils.success();
        } catch (Exception e) {
            log.error("删除数据卷异常，错误位置：{}", "SysVolumeServiceImpl.removeVolmue()");
            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }
}
