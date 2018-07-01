package jit.edu.paas.service.impl;

import jit.edu.paas.domain.enums.ImageTypeEnum;
import jit.edu.paas.domain.enums.LogTypeEnum;
import jit.edu.paas.domain.enums.RepositoryTypeEnum;
import jit.edu.paas.domain.enums.ResultEnum;
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
    public Map<Integer, String> listResultCode() {
        Map<Integer, String> map = new TreeMap<>(Integer::compareTo);
        for (ResultEnum s : ResultEnum.values()) {
            map.put(s.ordinal(), s.getMessage());
        }
        return map;
    }

    @Override
    public Map<Integer, String> listLogType() {
        Map<Integer, String> map = new TreeMap<>(Integer::compareTo);
        for (LogTypeEnum s : LogTypeEnum.values()) {
            map.put(s.ordinal(), s.getMessage());
        }
        return map;
    }

    @Override
    public Map<Integer, String> listRepositoryType() {
        Map<Integer, String> map = new TreeMap<>(Integer::compareTo);
        for (RepositoryTypeEnum s : RepositoryTypeEnum.values()) {
            map.put(s.ordinal(), s.getMessage());
        }
        return map;
    }

    @Override
    public Map<Integer, String> listImageType() {
        Map<Integer, String> map = new TreeMap<>(Integer::compareTo);
        for (ImageTypeEnum s : ImageTypeEnum.values()) {
            map.put(s.ordinal(), s.getMessage());
        }
        return map;
    }
}
