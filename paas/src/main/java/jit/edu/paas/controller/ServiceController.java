package jit.edu.paas.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.spotify.docker.client.messages.swarm.Service;
import jit.edu.paas.commons.convert.UserServiceDTOConvert;
import jit.edu.paas.commons.util.CollectionUtils;
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
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 服务Controller
 * @author jitwxs
 * @since 2018/7/15 9:15
 */
@Slf4j
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
     * @author jitwxs
     * @since 2018/7/13 09:25
     */
    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO getById(@RequestAttribute String uid, @PathVariable String id) {
        if(StringUtils.isBlank(uid, id)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        return userServiceService.checkPermission(uid,id);
    }

    /**
     * 获取服务列表
     * 普通用户获取本人服务，系统管理员获取所有服务
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
    @GetMapping("{projectId}/list")
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
     * 服务横向扩展
     * @author jitwxs
     * @since 2018/7/16 10:11
     */
    @PostMapping("/scale")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO scaleService(@RequestAttribute String uid, String id , Integer num) {
        if(StringUtils.isBlank(id) || num == null) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        ResultVO resultVO = userServiceService.checkPermission(uid,id);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }

        return userServiceService.scale(id, num);
    }


    /**
     * 删除服务【WebSocket】
     * @author jitwxs
     * @since 2018/7/1 16:05
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO deleteServiceTask(@RequestAttribute String uid, @PathVariable String id, HttpServletRequest request) {
        // 鉴权
        ResultVO resultVO = userServiceService.checkPermission(uid, id);
        if (ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }

        userServiceService.deleteServiceTask(uid, id, request);
        return ResultVOUtils.success("开始删除服务");
    }

    /**
     * 创建服务【WebSocket】
     * @param imageId 镜像ID 必填
     * @param serviceName 服务名 必填
     * @param projectId 所属项目 必填
     * @param portMapStr 端口映射
     * @param cmdStr 执行命令，如若为空，使用默认的命令，多个使用分号连接
     * @param envStr 环境变量，多个使用分号连接
     * @param destinationStr 服务内部目录，多个使用分号连接
     * @param labelsStr 标签
     * @param replicas 横向扩展个数，默认为1
     * @author jitwxs
     * @since 2018/7/1 15:52
     */
    @PostMapping("/create")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO createService(String imageId, String serviceName, String projectId,
                                    String portMapStr, String cmdStr, String envStr, String destinationStr,
                                  @RequestParam(defaultValue = "1") int replicas, String labelsStr,
                                    @RequestAttribute String uid, HttpServletRequest request){
        // 输入验证
        if (StringUtils.isBlank(imageId, serviceName, projectId)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        // ServiceName校验
        ResultVO resultVO1 = userServiceService.checkServiceName(serviceName, uid);
        if (ResultEnum.OK.getCode() != resultVO1.getCode()) {
            return resultVO1;
        }

        // 前端传递map字符串
        Map<String, String> portMap, labels;
        try {
            portMap = CollectionUtils.mapJson2map(portMapStr);
            labels = CollectionUtils.mapJson2map(labelsStr);
        } catch (Exception e) {
            log.error("Json格式解析错误，错误位置：{}，错误信息：{}", "ServiceController.createService()", e.getMessage());
            return ResultVOUtils.error(ResultEnum.JSON_ERROR);
        }

        // 字符串数字转换
        String[] cmd = CollectionUtils.str2Array(cmdStr, ";"),
                env = CollectionUtils.str2Array(envStr, ";"),
                destination = CollectionUtils.str2Array(destinationStr, ";");

        // 创建校验
        ResultVO resultVO = containerService.createContainerCheck(uid, imageId, portMap, projectId);
        if (ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }

        // 创建服务
        userServiceService.createServiceTask(uid, imageId, cmd, portMap, replicas, serviceName, projectId,
                env, destination, labels, request);
        return ResultVOUtils.success("开始创建服务");
    }

    /**
     * 修改服务所属项目
     * @param projectId 新项目ID
     * @author jitwxs
     * @since 2018/7/14 8:35
     */
    @PostMapping("/changeProject")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO changeBelongProject(String serviceId, String projectId, @RequestAttribute String uid) {
        if(StringUtils.isBlank(serviceId, projectId)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }
        return userServiceService.changeBelongProject(serviceId, projectId, uid);
    }
}
