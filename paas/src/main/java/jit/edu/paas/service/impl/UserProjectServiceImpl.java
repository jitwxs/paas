package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import jit.edu.paas.commons.StringUtils;
import jit.edu.paas.commons.util.JsonUtils;
import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.commons.util.jedis.JedisClient;
import jit.edu.paas.domain.entity.UserProject;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.mapper.UserProjectMapper;
import jit.edu.paas.service.SysLogService;
import jit.edu.paas.service.UserProjectService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Service
@Slf4j
public class UserProjectServiceImpl extends ServiceImpl<UserProjectMapper, UserProject> implements UserProjectService {
    @Autowired
    private UserProjectMapper projectMapper;
    @Autowired
    private JedisClient jedisClient;

    @Value("${redis.project.key}")
    private String key;

    @Override
    public ResultVo getProjectById(String id, String userId) {
        try {
            String res = jedisClient.hget(key, id);
            if(StringUtils.isNotBlank(res)) {
                UserProject project = JsonUtils.jsonToObject(res, UserProject.class);
                if(project != null) {
                    return ResultVoUtils.success(project);
                } else {
                    cleanCache(id);
                }
            }
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：UserProjectServiceImpl.getProjectById()");
        }

        UserProject project = projectMapper.selectById(id);

        if(project == null) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }

        try {
            jedisClient.hset(key, id, JsonUtils.objectToJson(project));
        } catch (Exception e) {
            log.error("缓存存储异常，错误位置：UserProjectServiceImpl.getProjectById()");
        }

        // 鉴权
        if(StringUtils.isNotBlank(userId)) {
            if(!userId.equals(project.getUserId())) {
                return ResultVoUtils.error(ResultEnum.PERMISSION_ERROR);
            }
        }

        return ResultVoUtils.success(project);
    }

    @Override
    public void cleanCache(String id) {
        try {
            jedisClient.hdel(key, id);
        } catch (Exception e) {
            log.error("缓存删除异常，错误位置：UserProjectServiceImpl.cleanCache()");
        }
    }

    @Override
    public ResultVo createProject(String userId, String name, String description) {
        if(StringUtils.isBlank(userId, name)) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }

        UserProject project = new UserProject();
        project.setUserId(userId);
        project.setName(name);
        if(StringUtils.isNotBlank(description)) {
            project.setDescription(description);
        }
        project.setCreateDate(new Date());

        projectMapper.insert(project);

        return ResultVoUtils.success();
    }

    @Override
    public ResultVo deleteProject(String id, String userId) {
        ResultVo resultVo = getProjectById(id, userId);
        if(resultVo.getCode() != ResultEnum.OK.getCode()) {
            return resultVo;
        }

        projectMapper.deleteById(id);
        cleanCache(id);
        return ResultVoUtils.success();
    }

    @Override
    public ResultVo updateProject(String userId, String id, String name, String description) {
        ResultVo resultVo = getProjectById(id, userId);
        if(resultVo.getCode() != ResultEnum.OK.getCode()) {
            return resultVo;
        }

        UserProject project = (UserProject)resultVo.getData();
        boolean updateFlag = false;

        if(!project.getName().equals(name)) {
            project.setName(name);
            updateFlag = true;
        }
        if(!project.getDescription().equals(description)) {
            project.setDescription(description);
            updateFlag = true;
        }

        if(updateFlag) {
            projectMapper.updateById(project);
            // 清理缓存
            cleanCache(id);
        }

        return ResultVoUtils.success();
    }
}
