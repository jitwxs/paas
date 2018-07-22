package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import jit.edu.paas.commons.util.HttpClientUtils;
import jit.edu.paas.commons.util.JsonUtils;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.commons.util.jedis.JedisClient;
import jit.edu.paas.domain.dto.UserProjectDTO;
import jit.edu.paas.domain.entity.ProjectLog;
import jit.edu.paas.domain.entity.UserContainer;
import jit.edu.paas.domain.entity.UserProject;
import jit.edu.paas.domain.entity.UserService;
import jit.edu.paas.domain.enums.ProjectLogTypeEnum;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.enums.RoleEnum;
import jit.edu.paas.domain.enums.SysLogTypeEnum;
import jit.edu.paas.domain.select.UserProjectSelect;
import jit.edu.paas.domain.vo.ProjectLogVO;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.exception.CustomException;
import jit.edu.paas.mapper.ProjectLogMapper;
import jit.edu.paas.mapper.UserContainerMapper;
import jit.edu.paas.mapper.UserProjectMapper;
import jit.edu.paas.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.stream.Collectors;

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
    private UserServiceService userServiceService;
    @Autowired
    private UserContainerService containerService;

    @Autowired
    private UserContainerMapper containerMapper;
    @Autowired
    private UserProjectMapper projectMapper;
    @Autowired
    private ProjectLogMapper projectLogMapper;

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
                UserProjectDTO projectDTO = JsonUtils.jsonToObject(res, UserProjectDTO.class);
                if(projectDTO != null) {
                    return projectDTO.getName();
                }
            }
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：UserProjectServiceImpl.getProjectName()");
        }

        UserProjectDTO projectDTO = projectMapper.getById(projectId);

        if(projectDTO == null) {
            return null;
        }

        try {
            jedisClient.hset(key, projectId, JsonUtils.objectToJson(projectDTO));
        } catch (Exception e) {
            log.error("缓存存储异常，错误位置：UserProjectServiceImpl.getProjectById()");
        }
        return projectDTO.getName();
    }

    @Override
    public ResultVO getProjectById(String id, String userId) {
        try {
            String res = jedisClient.hget(key, id);
            if(StringUtils.isNotBlank(res)) {
                UserProjectDTO projectDTO = JsonUtils.jsonToObject(res, UserProjectDTO.class);
                if(projectDTO != null) {
                    return ResultVOUtils.success(projectDTO);
                } else {
                    cleanCache(id);
                }
            }
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：UserProjectServiceImpl.getProjectById()");
        }

        UserProjectDTO projectDTO = projectMapper.getById(id);

        if(projectDTO == null) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        try {
            jedisClient.hset(key, id, JsonUtils.objectToJson(projectDTO));
        } catch (Exception e) {
            log.error("缓存存储异常，错误位置：UserProjectServiceImpl.getProjectById()");
        }

        // 鉴权（管理员查看所有，用户查看自己）
        String roleName = loginService.getRoleName(userId);
        if(RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            if(!userId.equals(projectDTO.getUserId())) {
                return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
            }
        }

        return ResultVOUtils.success(projectDTO);
    }

    @Override
    public Page<UserProjectDTO> list(UserProjectSelect projectSelect, Page<UserProjectDTO> page) {
        List<UserProjectDTO> list = projectMapper.list(projectSelect, page);

        return page.setRecords(list);
    }

    @Override
    public void cleanCache(String id) {
        try {
            // 清理项目缓存
            jedisClient.hdel(key, id);

            // 更新所属容器
            List<UserContainer> containers = containerService.selectList(new EntityWrapper<UserContainer>().eq("project_id",id));
            for(UserContainer container : containers) {
                container.setProjectId(null);
                containerService.updateById(container);
            }
            // 更新所属服务
            List<UserService> services = userServiceService.selectList(new EntityWrapper<UserService>().eq("project_id",id));
            for(UserService service : services) {
                service.setProjectId(null);
                userServiceService.updateById(service);
                userServiceService.cleanCache(service.getId());
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
    @Transactional(rollbackFor = CustomException.class)
    public ResultVO deleteProject(String id, String userId) {
        ResultVO resultVO = getProjectById(id, userId);
        if(resultVO.getCode() != ResultEnum.OK.getCode()) {
            return resultVO;
        }

        try {
            // 1、删除项目
            projectMapper.deleteById(id);
            // 2、清理缓存
            cleanCache(id);
            // 3、所属容器的项目设为空
            containerMapper.cleanProjectId(id);
            // 4、写入日志
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
                UserProjectDTO projectDTO = JsonUtils.jsonToObject(res, UserProjectDTO.class);
                return projectDTO == null ? null : projectDTO.getUserId();
            }
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：UserProjectServiceImpl.getProjectById()");
        }

        UserProjectDTO projectDTO = projectMapper.getById(projectId);

        if(projectDTO != null) {
            try {
                jedisClient.hset(key, projectId, JsonUtils.objectToJson(projectDTO));
            } catch (Exception e) {
                log.error("缓存存储异常，错误位置：UserProjectServiceImpl.getProjectById()");
            }
        }

        return null;
    }

    @Override
    public ResultVO listProjectLog(String projectId, Integer type, Page<ProjectLogVO> page) {
        List<ProjectLog> list = projectLogMapper.listProjectLog(projectId, page);
        List<ProjectLogVO> voList = projectLog2VO(list);

        return ResultVOUtils.success(page.setRecords(voList));
    }

    /**
     * ProjectLog --> ProjectLogVO
     * @author jitwxs
     * @since 2018/7/22 8:39
     */
    private ProjectLogVO projectLog2VO(ProjectLog log) {
        ProjectLogVO vo = new ProjectLogVO();
        BeanUtils.copyProperties(log, vo);

        String objId = log.getObjId();

        if (StringUtils.isNotBlank(objId)) {
            UserContainer container = containerService.getById(objId);
            if (container != null) {
                vo.setObjName(container.getName());
                return vo;
            }

            UserService userService = userServiceService.getById(objId);
            if (userService != null) {
                vo.setObjName(userService.getName());
                return vo;
            }
        }


        return vo;
    }
    /**
     * ProjectLog --> ProjectLogVO
     * @author jitwxs
     * @since 2018/7/22 8:39
     */
    private List<ProjectLogVO> projectLog2VO(List<ProjectLog> list) {
        return list.stream().map(this::projectLog2VO).collect(Collectors.toList());
    }
}
