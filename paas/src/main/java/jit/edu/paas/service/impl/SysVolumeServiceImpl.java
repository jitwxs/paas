package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.ImmutableList;
import com.spotify.docker.client.DockerClient;
import com.spotify.docker.client.messages.Volume;
import com.spotify.docker.client.messages.VolumeList;
import jit.edu.paas.commons.socket.FileTransferClient;
import jit.edu.paas.commons.util.*;
import jit.edu.paas.commons.util.jedis.JedisClient;
import jit.edu.paas.domain.entity.SysVolume;
import jit.edu.paas.domain.entity.UserContainer;
import jit.edu.paas.domain.entity.UserService;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.enums.RoleEnum;
import jit.edu.paas.domain.enums.SysLogTypeEnum;
import jit.edu.paas.domain.enums.VolumeTypeEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.exception.CustomException;
import jit.edu.paas.mapper.SysVolumesMapper;
import jit.edu.paas.mapper.UserContainerMapper;
import jit.edu.paas.mapper.UserServiceMapper;
import jit.edu.paas.service.SysLogService;
import jit.edu.paas.service.SysLoginService;
import jit.edu.paas.service.SysVolumeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.*;

@Service
@Slf4j
public class SysVolumeServiceImpl extends ServiceImpl<SysVolumesMapper,SysVolume> implements SysVolumeService {
    @Autowired
    private DockerClient dockerClient;
    @Autowired
    private DockerClient dockerSwarmClient;
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private SysLogService sysLogService;
    @Autowired
    private SysVolumesMapper volumesMapper;
    @Autowired
    private UserContainerMapper containerMapper;
    @Autowired
    private UserServiceMapper serviceMapper;
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
    public SysVolume getBySource(String source) {
        List<SysVolume> list = volumesMapper.selectList(new EntityWrapper<SysVolume>().eq("source", source));
        SysVolume volume = CollectionUtils.getListFirst(list);
        if(volume == null) {
            return null;
        }
        return volume;
    }

    @Override
    public ResultVO listByObjId(Page<SysVolume> page, String objId, String uid) {
        // 1、鉴权
        String roleName = loginService.getRoleName(uid);
        if(StringUtils.isBlank(roleName)) {
            return ResultVOUtils.error(ResultEnum.AUTHORITY_ERROR);
        }
        if(RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            if(!containerMapper.hasBelongSb(objId, uid)) {
                return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
            }
        }

        List<SysVolume> list = volumesMapper.selectByObjId(objId, page);
        return ResultVOUtils.success(page.setRecords(list));
    }

    @Override
    public ResultVO inspectVolumes(String id, String uid) {
        SysVolume sysVolume = getById(id);

        ResultVO resultVO = checkPermission(uid, sysVolume);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }

        try {
            Volume volume;
            int type = sysVolume.getType();

            // 根据数据卷类型查询
            if(type == VolumeTypeEnum.CONTAINER.getCode()) {
                volume = dockerClient.inspectVolume(sysVolume.getName());
            } else if(type == VolumeTypeEnum.SERVICE.getCode()) {
                volume = dockerSwarmClient.inspectVolume(sysVolume.getName());
            } else {
                throw new CustomException(ResultEnum.OTHER_ERROR.getCode(), "数据卷类型不被接收");
            }

            return ResultVOUtils.success(volume);
        } catch (Exception e) {
            log.error("获取数据卷详情异常，错误位置：{}", "SysVolumeServiceImpl.inspectVolumes()");
            return ResultVOUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    public ResultVO listFromLocal(VolumeTypeEnum enums) {
        try {
            VolumeList volumeList;

            // 根据数据卷类型查询
            if(enums == VolumeTypeEnum.CONTAINER) {
                volumeList = dockerClient.listVolumes();
            } else if(enums == VolumeTypeEnum.SERVICE) {
                volumeList = dockerSwarmClient.listVolumes();
            } else {
                throw new CustomException(ResultEnum.OTHER_ERROR.getCode(), "数据卷类型不被接收");
            }

            return ResultVOUtils.success(volumeList);
        } catch (Exception e) {
            log.error("获取本地数据卷异常，错误位置：{}，错误栈：{}",
                    "SysVolumeServiceImpl.listFromLocal()", HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.VOLUME_LIST_ERROR);
        }
    }

    @Override
    public SysVolume createVolumes(String name, VolumeTypeEnum enums) {
        Volume.Builder builder = Volume.builder();

        if(StringUtils.isNotBlank(name)) {
            builder.name(name);
        }
        builder.driver("local");

        try {
            Volume created;

            // 根据数据卷类型创建
            if(enums == VolumeTypeEnum.CONTAINER) {
                created = dockerClient.createVolume(builder.build());
            } else if(enums == VolumeTypeEnum.SERVICE) {
                created = dockerSwarmClient.createVolume(builder.build());
            } else {
                throw new CustomException(ResultEnum.OTHER_ERROR.getCode(), "数据卷类型不被接收");
            }

            // 保存数据库
            SysVolume sysVolume = volume2SysVolume(created);
            volumesMapper.insert(sysVolume);

            return sysVolume;
        } catch (Exception e) {
            log.error("生成数据卷失败，错误位置：{}，错误栈：{}",
                    "SysVolumeServiceImpl.createVolumes()", HttpClientUtils.getStackTraceAsString(e));
            return null;
        }
    }

    @Override
    public boolean bind(String id, String objId, String destination, VolumeTypeEnum enums) {
        // 判断是否可用
        boolean b = volumesMapper.hasUser(id);
        if(!b) {
            return false;
        }

        try {
            SysVolume sysVolume = volumesMapper.selectById(id);
            sysVolume.setObjId(objId);
            sysVolume.setDestination(destination);
            sysVolume.setType(enums.getCode());

            volumesMapper.updateById(sysVolume);

            return true;
        } catch (Exception e) {
            log.error("绑定失败，错误位置：{}，错误栈：{}",
                    "SysVolumeServiceImpl.bind()", HttpClientUtils.getStackTraceAsString(e));
            return false;
        }
    }

    @Override
    @Transactional(rollbackFor = CustomException.class)
    public ResultVO cleanVolumes(VolumeTypeEnum enums) {
        List<SysVolume> volumes = volumesMapper.selectList(new EntityWrapper<SysVolume>().eq("type", enums.getCode()));
        int successCount = 0, errorCount = 0;

        // 根据类型删除
        if(enums == VolumeTypeEnum.CONTAINER) {
            for(SysVolume volume : volumes) {
                // 如果容器不存在，清理数据
                UserContainer container = containerMapper.selectById(volume.getObjId());
                if(container == null) {
                    try {
                        volumesMapper.deleteById(volume.getId());
                        dockerClient.removeVolume(volume.getName());
                        successCount++;
                    } catch (Exception e) {
                        errorCount++;
                    }
                }
            }
        } else if(enums == VolumeTypeEnum.SERVICE) {
            for(SysVolume volume : volumes) {
                // 如果容器不存在，清理数据
                UserService userService = serviceMapper.selectById(volume.getObjId());
                if(userService == null) {
                    try {
                        volumesMapper.deleteById(volume.getId());
                        dockerSwarmClient.removeVolume(volume.getName());
                        successCount++;
                    } catch (Exception e) {
                        errorCount++;
                    }
                }
            }
        } else {
            return ResultVOUtils.error(ResultEnum.OTHER_ERROR.getCode(), "数据卷类型不被接收");
        }


        Map<String, Integer> map = new HashMap<>(16);
        map.put("success", successCount);
        map.put("error", errorCount);
        // 写入日志
        sysLogService.saveLog(request, SysLogTypeEnum.CLEAN_VOLUMES);

        return ResultVOUtils.success(map);
    }

    @Override
    public ResultVO uploadToVolumes(String uid, HttpServletRequest request) {
        StandardMultipartHttpServletRequest req;
        try {
            req = (StandardMultipartHttpServletRequest) request;
        } catch (Exception e) {
            return ResultVOUtils.error(ResultEnum.UPLOAD_TYPE_ERROR);
        }

        // 1、校验参数
        String id = null;
        Iterator<String> iterator = req.getFileNames();
        Enumeration<String> names = req.getParameterNames();

        while (names.hasMoreElements()) {
            String key = names.nextElement();
            if("id".equals(key)) {
                id = req.getParameter(key);
                break;
            }
        }
        if(StringUtils.isEmpty(id) || !iterator.hasNext()) {
            ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        // 2、鉴权
        SysVolume volume = getById(id);
        ResultVO resultVO = checkPermission(uid, volume);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }

        // 3、上传
        int successCount = 0, errorCount = 0,times = 0;
        try {
            FileTransferClient transferClient = new FileTransferClient();
            while (iterator.hasNext()) {
                MultipartFile file = req.getFile(iterator.next());
                int i = transferClient.sendFile(volume.getSource(), file);
                if(i != -1) {
                    successCount++;
                    times += i;
                } else {
                    errorCount++;
                }
            }
        } catch (IOException e) {
            log.error("上传数据卷出现错误，错误位置：{}，错误栈：{}",
                    "SysVolumeServiceImpl.uploadToVolumes()", HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.VOLUME_UPLOAD_ERROR);
        }


        Map<String, Integer> map = new HashMap<>(16);
        map.put("success", successCount);
        map.put("error", errorCount);
        map.put("times", times);
        return ResultVOUtils.success(map);
    }

    @Override
    public ResultVO checkPermission(String uid, SysVolume volume) {
        if(volume == null) {
            return ResultVOUtils.error(ResultEnum.VOLUME_NOT_EXIST);
        }

        String roleName = loginService.getRoleName(uid);
        if(StringUtils.isBlank(roleName)) {
            return ResultVOUtils.error(ResultEnum.AUTHORITY_ERROR);
        }

        // 管理员无需鉴权
        if(RoleEnum.ROLE_SYSTEM.getMessage().equals(roleName)) {
            return ResultVOUtils.success();
        }


        Integer type = volume.getType();

        // 容器鉴权
        if(VolumeTypeEnum.CONTAINER.getCode() == type) {
            if(!containerMapper.hasBelongSb(volume.getObjId(), uid)) {
                return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
            }
            return ResultVOUtils.success();
        }

        // 服务鉴权
        if(VolumeTypeEnum.SERVICE.getCode() == type) {
            if(!serviceMapper.hasBelong(volume.getObjId(), uid)) {
                return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
            }
            return ResultVOUtils.success();
        }

        return ResultVOUtils.error(ResultEnum.AUTHORITY_ERROR);
    }

    private SysVolume volume2SysVolume(Volume volume) {
        SysVolume sysVolume = new SysVolume();
        sysVolume.setName(volume.name());
        sysVolume.setSource(volume.mountpoint());

        return sysVolume;
    }
}
