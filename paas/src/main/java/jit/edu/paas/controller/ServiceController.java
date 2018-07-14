package jit.edu.paas.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.spotify.docker.client.LogStream;
import com.spotify.docker.client.messages.swarm.Service;
import jit.edu.paas.commons.convert.UserServiceDTOConvert;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.dto.UserServiceDTO;
import jit.edu.paas.domain.entity.UserService;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.enums.RoleEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.service.SysLoginService;
import jit.edu.paas.service.UserContainerService;
import jit.edu.paas.service.UserProjectService;
import jit.edu.paas.service.UserServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/service")
public class ServiceController {
    @Autowired
    private UserServiceService userServiceService;
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private UserProjectService projectService;
    @Autowired
    private UserServiceDTOConvert dtoConvert;
    @Autowired
    private UserContainerService containerService;

    /**
     * 获取服务
     * @author
     * @since 2018/7/13 09:25
     */
    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO getById(@RequestAttribute String uid, @PathVariable String id) {
        ResultVO resultVO = userServiceService.checkPermission(uid,id);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }
        UserServiceDTO serviceDTO = userServiceService.getById(id);

        return ResultVOUtils.success(serviceDTO);
    }

    /**
     * 获取服务列表
     * 普通用户获取本人容器，系统管理员获取所有容器
     * @author hf
     * @since 2018/7/13 11:19
     */
    @GetMapping("/list")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO listService(@RequestAttribute String uid, Page<UserService> page) {
        // 鉴权
        String roleName = loginService.getRoleName(uid);

        // 角色无效
        if(StringUtils.isBlank(roleName)) {
            return ResultVOUtils.error(ResultEnum.AUTHORITY_ERROR);
        }

        Page<UserServiceDTO> selectPage = null;

        if(RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            selectPage = userServiceService.listUserServiceByUserId(uid, page);
        } else if(RoleEnum.ROLE_SYSTEM.getMessage().equals(roleName)) {
            selectPage = userServiceService.listUserServiceByUserId(null, page);
        }
        return ResultVOUtils.success(selectPage);
    }

    /**
     * 获取项目服务列表
     * 普通用户获取本人项目的容器，系统管理员任意项目的容器
     * @author hf
     * @since 2018/7/13 15:16
     */
    @GetMapping("/list/project/{projectId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO listServiceByProject(@RequestAttribute String uid, @PathVariable String projectId, Page<UserService> page) {
        // 1、鉴权
        String roleName = loginService.getRoleName(uid);
        // 1.1、角色无效
        if(StringUtils.isBlank(roleName)) {
            return ResultVOUtils.error(ResultEnum.AUTHORITY_ERROR);
        }
        // 1.2、越权访问
        if(RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            if(!projectService.hasBelong(projectId, uid)) {
                return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
            }
        }

        // 2、查询
        Page<UserService> selectPage = userServiceService.selectPage(page,
                new EntityWrapper<UserService>().eq("project_id", projectId));

        return ResultVOUtils.success(dtoConvert.convert(selectPage));
    }

    /**
     * 查询服务详细信息
     * @author hf
     * @since 2018/7/13 15:39
     */
    @GetMapping("/inspect/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO inspectById(@RequestAttribute String uid, @PathVariable String id) {
        ResultVO resultVO = userServiceService.checkPermission(uid,id);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }
        Service service = userServiceService.inspectById(id);

        return service != null ? ResultVOUtils.success(service) : ResultVOUtils.error(ResultEnum.SERVICE_INSPECT_ERROR) ;
    }

    /**
     * 创建服务【WebSocket】
     * @param imageId 镜像ID 必填
     * @param serviceName 容器名 必填
     * @param projectId 所属项目 必填
     * @param portMap 端口映射
     * @param cmd 执行命令，如若为空，使用默认的命令
     * @param env 环境变量
     * @destination 容器内部目录
     * @author jitwxs
     * @since 2018/7/1 15:52
     */
    @PostMapping("/create")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO createContainer(@RequestAttribute String uid, String imageId, String serviceName, String projectId,
                                    Map<String,Integer> portMap, String[] cmd, String[] env, String source,String destination,int replicas,Map<String,String> lables){
        // 输入验证
        if(StringUtils.isBlank(imageId,serviceName,projectId)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }
        // 创建校验（引用创建容器前的校验）
        ResultVO resultVO = containerService.createContainerCheck(uid, imageId, portMap, projectId);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        } else {
            userServiceService.createServiceTask(uid,imageId,cmd, portMap,replicas, serviceName, projectId,env,source,destination,lables);
            return ResultVOUtils.success("正在创建服务");
        }
    }

    /**
     * 删除容器【WebSocket】
     * @author jitwxs
     * @since 2018/7/1 16:05
     */
    @DeleteMapping("/delete/{serviceId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO removeContainer(@RequestAttribute String uid, @PathVariable String serviceId){
        ResultVO resultVO = userServiceService.checkPermission(uid,serviceId);
        if(ResultEnum.OK.getCode() == resultVO.getCode()) {
            userServiceService.removeServiceTask(uid,serviceId);
            return ResultVOUtils.success("正在删除服务");
        } else {
            return resultVO;
        }
    }

    /**
     * 查询服务日志信息
     * @author hf
     * @since 2018/7/13 15:39
     */
    @GetMapping("/log/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO logById(@RequestAttribute String uid, @PathVariable String id) {
        ResultVO resultVO = userServiceService.checkPermission(uid,id);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }
        LogStream serviceLog = userServiceService.logById(id);

        return serviceLog != null ? ResultVOUtils.success(serviceLog.readFully()) : ResultVOUtils.error(ResultEnum.SERVICE_INSPECT_ERROR) ;
    }
}
