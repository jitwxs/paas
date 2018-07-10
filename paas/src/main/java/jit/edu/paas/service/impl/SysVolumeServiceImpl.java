package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.ImmutableList;
import com.spotify.docker.client.DockerClient;
import com.spotify.docker.client.messages.Volume;
import com.spotify.docker.client.messages.VolumeList;
import jit.edu.paas.commons.util.*;
import jit.edu.paas.commons.util.jedis.JedisClient;
import jit.edu.paas.domain.entity.SysVolume;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.enums.RoleEnum;
import jit.edu.paas.domain.enums.SysLogTypeEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.mapper.SysVolumesMapper;
import jit.edu.paas.mapper.UserContainerMapper;
import jit.edu.paas.service.SysLogService;
import jit.edu.paas.service.SysLoginService;
import jit.edu.paas.service.SysVolumeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class SysVolumeServiceImpl extends ServiceImpl<SysVolumesMapper,SysVolume> implements SysVolumeService {
    @Autowired
    private DockerClient dockerClient;
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private SysLogService sysLogService;
    @Autowired
    private SysVolumesMapper volumesMapper;
    @Autowired
    private UserContainerMapper containerMapper;
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private JedisClient jedisClient;
    @Value("${redis.volumes.key}")
    private String key;
    private final String ID_PREFIX = "ID:";
    private final String NAME_PREFIX = "NAME:";

    @Override
    public SysVolume getById(String id) {
        String field = ID_PREFIX + id;
        try {
            String res = jedisClient.hget(key, field);
            if (StringUtils.isNotBlank(res)) {
                return JsonUtils.jsonToObject(res, SysVolume.class);
            }
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：SysVolumeServiceImpl.getById()");
        }

        SysVolume volume = volumesMapper.selectById(id);
        if(volume == null) {
            return null;
        }
        try {
            jedisClient.hset(key, field, JsonUtils.objectToJson(volume));
        } catch (Exception e) {
            log.error("缓存存储异常，错误位置：SysVolumeServiceImpl.getById()");
        }
        return volume;
    }

    @Override
    public SysVolume getByName(String name) {
        String field = NAME_PREFIX + name;
        try {
            String res = jedisClient.hget(key, field);
            if (StringUtils.isNotBlank(res)) {
                return JsonUtils.jsonToObject(res, SysVolume.class);
            }
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：SysVolumeServiceImpl.getByName()");
        }

        List<SysVolume> list = volumesMapper.selectList(new EntityWrapper<SysVolume>().eq("name", name));
        SysVolume volume = CollectionUtils.getListFirst(list);
        if(volume == null) {
            return null;
        }

        try {
            jedisClient.hset(key, field, JsonUtils.objectToJson(volume));
        } catch (Exception e) {
            log.error("缓存存储异常，错误位置：SysVolumeServiceImpl.getByName()");
        }

        return volume;
    }

    @Override
    public ResultVO listByContainerId(String containerId, String uid) {
        // 1、鉴权
        String roleName = loginService.getRoleName(uid);
        if(StringUtils.isBlank(roleName)) {
            return ResultVOUtils.error(ResultEnum.AUTHORITY_ERROR);
        }
        if(RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            if(!containerMapper.hasBelongSb(containerId, uid)) {
                return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
            }
        }

        List<SysVolume> list = volumesMapper.selectList(new EntityWrapper<SysVolume>().eq("container_id",containerId));
        return ResultVOUtils.success(list);
    }

    @Override
    public ResultVO inspectVolumes(String id, String uid) {
        SysVolume sysVolume = getById(id);
        if(sysVolume == null) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        // 鉴权
        String roleName = loginService.getRoleName(uid);
        if(StringUtils.isBlank(roleName)) {
            return ResultVOUtils.error(ResultEnum.AUTHORITY_ERROR);
        }
        if(RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            if(!containerMapper.hasBelongSb(sysVolume.getContainerId(), uid)) {
                return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
            }
        }

        try {
            Volume volume = dockerClient.inspectVolume(sysVolume.getName());
            return ResultVOUtils.success(volume);
        } catch (Exception e) {
            log.error("获取数据卷详情异常，错误位置：{}", "SysVolumeServiceImpl.inspectVolumes()");
            return ResultVOUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    public ResultVO listFromLocal() {
        try {
            VolumeList volumeList = dockerClient.listVolumes();
            return ResultVOUtils.success(volumeList);
        } catch (Exception e) {
            log.error("获取本地数据卷异常，错误位置：{}，错误栈：{}",
                    "SysVolumeServiceImpl.listFromLocal()", HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.VOLUME_LIST_ERROR);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVO cleanVolumes() {
        ResultVO resultVO = listFromLocal();
        if(resultVO.getCode() != ResultEnum.OK.getCode()) {
            return resultVO;
        }

        int successCount = 0, failCount = 0;
        ImmutableList<Volume> volumes = ((VolumeList) resultVO.getData()).volumes();
        if(volumes != null) {
            for(Volume volume : volumes) {
                try {
                    dockerClient.removeVolume(volume.name());

                    // 删除数据
                    SysVolume dbVolume = getByName(volume.name());
                    if(dbVolume != null) {
                        volumesMapper.deleteById(dbVolume.getId());
                    }

                    successCount++;
                } catch (Exception e) {
                    failCount++;
                }
            }
        }

        Map<String, Integer> map = new HashMap<>(16);
        map.put("success", successCount);
        map.put("fail", failCount);
        // 写入日志
        sysLogService.saveLog(request, SysLogTypeEnum.CLEAN_VOLUMES);

        return ResultVOUtils.success(map);
    }
}
