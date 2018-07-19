package jit.edu.paas.service.impl;

import jit.edu.paas.domain.enums.*;
import jit.edu.paas.service.EnumsService;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.TreeMap;

/**
 * @author jitwxs
 * @since 2018/6/30 14:47
 */
@Service
public class EnumsServiceImpl implements EnumsService {

    @Override
    public Map<Integer, String> listRole() {
        Map<Integer, String> map = new TreeMap<>(Integer::compareTo);

        for (RoleEnum s : RoleEnum.values()) {
            map.put(s.getCode(), s.getMessage());
        }
        return map;
    }

    @Override
    public Map<Integer, String> listResultCode() {
        Map<Integer, String> map = new TreeMap<>(Integer::compareTo);

        for (ResultEnum s : ResultEnum.values()) {
            map.put(s.getCode(), s.getMessage());
        }
        return map;
    }

    @Override
    public Map<Integer, String> listSysLogType() {
        Map<Integer, String> map = new TreeMap<>(Integer::compareTo);
        for (SysLogTypeEnum s : SysLogTypeEnum.values()) {
            map.put(s.getCode(), s.getMessage());
        }
        return map;
    }

    @Override
    public Map<Integer, String> listProjectLogType() {
        Map<Integer, String> map = new TreeMap<>(Integer::compareTo);
        for (ProjectLogTypeEnum s : ProjectLogTypeEnum.values()) {
            map.put(s.getCode(), s.getMessage());
        }
        return map;
    }

    @Override
    public Map<Integer, String> listImageType() {
        Map<Integer, String> map = new TreeMap<>(Integer::compareTo);
        for (ImageTypeEnum s : ImageTypeEnum.values()) {
            map.put(s.getCode(), s.getMessage());
        }
        return map;
    }

    @Override
    public Map<Integer, String> listWebSocketType() {
        Map<Integer, String> map = new TreeMap<>(Integer::compareTo);
        for (WebSocketTypeEnum s : WebSocketTypeEnum.values()) {
            map.put(s.getCode(), s.getMessage());
        }
        return map;
    }

    @Override
    public Map<Integer, String> listContainerStatus() {
        Map<Integer, String> map = new TreeMap<>(Integer::compareTo);
        for (ContainerStatusEnum s : ContainerStatusEnum.values()) {
            map.put(s.getCode(), s.getMessage());
        }
        return map;
    }

    @Override
    public Map<Integer, String> listVolumes() {
        Map<Integer, String> map = new TreeMap<>(Integer::compareTo);
        for (VolumeTypeEnum s : VolumeTypeEnum.values()) {
            map.put(s.getCode(), s.getMessage());
        }

        return map;
    }

    @Override
    public Map<Integer, String> listNotice() {
        Map<Integer, String> map = new TreeMap<>(Integer::compareTo);
        for (NoticeTypeEnum s : NoticeTypeEnum.values()) {
            map.put(s.getCode(), s.getMessage());
        }
        return map;
    }
}
