package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import jit.edu.paas.commons.util.HttpClientUtils;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.commons.util.JsonUtils;
import jit.edu.paas.commons.util.jedis.JedisClient;
import jit.edu.paas.domain.entity.UserContainer;
import jit.edu.paas.domain.entity.UserProject;
import jit.edu.paas.domain.enums.ProjectLogTypeEnum;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.enums.RoleEnum;
import jit.edu.paas.domain.enums.SysLogTypeEnum;
import jit.edu.paas.domain.vo.ProjectLogVO;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.mapper.ProjectLogMapper;
import jit.edu.paas.mapper.UserContainerMapper;
import jit.edu.paas.mapper.UserProjectMapper;
import jit.edu.paas.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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
    private SysLoginService loginService;
    @Autowired
    private SysLogService sysLogService;
    @Autowired
    private ProjectLogService projectLogService;

    @Autowired
    private UserProjectMapper projectMapper;
    @Autowired
    private ProjectLogMapper projectLogMapper;
    @Autowired
    private UserContainerMapper containerMapper;

    @Autowired
    private JedisClient jedisClient;
    @Autowired
    private HttpServletRequest request;

    @Value("${redis.project.key}")
    private String key;

    @Override
    public String getProjectName(String projectId) {
        try {
            String res = jedisClient.hget(key, projectId);
            if(StringUtils.isNotBlank(res)) {
                UserProject project = JsonUtils.jsonToObject(res, UserProject.class);
                if(project != null) {
                    return project.getName();
                }
            }
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：UserProjectServiceImpl.getProjectName()");
        }

        UserProject project = projectMapper.selectById(projectId);

        if(project == null) {
            return null;
        }

        try {
            jedisClient.hset(key, projectId, JsonUtils.objectToJson(project));
        } catch (Exception e) {
            log.error("缓存存储异常，错误位置：UserProjectServiceImpl.getProjectById()");
        }
        return project.getName();
    }

    @Override
    public ResultVO getProjectById(String id, String userId) {
        try {
            String res = jedisClient.hget(key, id);
            if(StringUtils.isNotBlank(res)) {
                UserProject project = JsonUtils.jsonToObject(res, UserProject.class);
                if(project != null) {
                    return ResultVOUtils.success(project);
                } else {
                    cleanCache(id);
                }
            }
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：UserProjectServiceImpl.getProjectById()");
        }

        UserProject project = projectMapper.selectById(id);

        if(project == null) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        try {
            jedisClient.hset(key, id, JsonUtils.objectToJson(project));
        } catch (Exception e) {
            log.error("缓存存储异常，错误位置：UserProjectServiceImpl.getProjectById()");
        }

        // 鉴权（管理员查看所有，用户查看自己）
        String roleName = loginService.getRoleName(userId);
        if(RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            if(!userId.equals(project.getUserId())) {
                return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
            }
        }

        return ResultVOUtils.success(project);
    }

    @Override
    public void cleanCache(String id) {
        try {
            // 清理项目缓存
            jedisClient.hdel(key, id);

            // 更新所属容器
            List<UserContainer> containers = containerMapper.selectList(new EntityWrapper<UserContainer>().eq("project_id",id));
            for(UserContainer container : containers) {
                container.setProjectId(null);
                containerMapper.updateById(container);
            }

        } catch (Exception e) {
            log.error("缓存删除异常，错误位置：UserProjectServiceImpl.cleanCache()");
        }
    }

    @Override
    public ResultVO createProject(String userId, String name, String description) {
        if(StringUtils.isBlank(userId, name)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        UserProject project = new UserProject();
        project.setUserId(userId);
        project.setName(name);
        if(StringUtils.isNotBlank(description)) {
            project.setDescription(description);
        }

        try {
            projectMapper.insert(project);
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.CREATE_PROJECT);
            projectLogService.saveSuccessLog(project.getId(),null,ProjectLogTypeEnum.CREATE_PROJECT);

            return ResultVOUtils.success();
        } catch (Exception e) {
            log.error("创建项目出现错误，错误位置：{}，错误栈：{}",
                    "UserProjectServiceImpl.createProject()", HttpClientUtils.getStackTraceAsString(e));
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.CREATE_PROJECT, e);

            return ResultVOUtils.error(ResultEnum.CREATE_PROJECT_ERROR);
        }
    }

    @Override
    public ResultVO deleteProject(String id, String userId) {
        ResultVO resultVO = getProjectById(id, userId);
        if(resultVO.getCode() != ResultEnum.OK.getCode()) {
            return resultVO;
        }

        try {
            projectMapper.deleteById(id);
            // 清理缓存
            cleanCache(id);
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.DELETE_PROJECT);

            return ResultVOUtils.success();
        } catch (Exception e) {
            log.error("删除项目出现错误，错误位置：{}，错误栈：{}",
                    "UserProjectServiceImpl.deleteProject()", HttpClientUtils.getStackTraceAsString(e));
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.DELETE_PROJECT,e);

            return ResultVOUtils.error(ResultEnum.DELETE_PROJECT_ERROR);
        }
    }

    @Override
    public ResultVO updateProject(String userId, String id, String name, String description) {
        ResultVO resultVO = getProjectById(id, userId);
        if(resultVO.getCode() != ResultEnum.OK.getCode()) {
            return resultVO;
        }

        UserProject project = (UserProject) resultVO.getData();

        if(StringUtils.isNotBlank(name)) {
            project.setName(name);
        }
        if(StringUtils.isNotBlank(description)) {
            project.setDescription(description);
        }

        projectMapper.updateById(project);
        // 清理缓存
        cleanCache(id);

        return ResultVOUtils.success();
    }

    @Override
    public Boolean hasBelong(String projectId, String userId) {
        return projectMapper.hasBelong(projectId, userId);
    }

    @Override
    public String getUserId(String projectId) {
        try {
            String res = jedisClient.hget(key, projectId);
            if(StringUtils.isNotBlank(res)) {
                UserProject project = JsonUtils.jsonToObject(res, UserProject.class);
                return project.getUserId();
            }
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：UserProjectServiceImpl.getProjectById()");
        }

        UserProject project = projectMapper.selectById(projectId);

        if(project != null) {
            try {
                jedisClient.hset(key, projectId, JsonUtils.objectToJson(project));
            } catch (Exception e) {
                log.error("缓存存储异常，错误位置：UserProjectServiceImpl.getProjectById()");
            }
        }

        return null;
    }

    @Override
    public ResultVO listProjectLog(String projectId, Integer type, Page<ProjectLogVO> page) {
        List<ProjectLogVO> list = projectLogMapper.listProjectLog(projectId, type, page);

        return ResultVOUtils.success(page.setRecords(list));
    }

}
