package jit.edu.paas.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.convert.UserContainerDTOConvert;
import jit.edu.paas.commons.util.CollectionUtils;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.dto.UserContainerDTO;
import jit.edu.paas.domain.entity.UserContainer;
import jit.edu.paas.domain.enums.ContainerOpEnum;
import jit.edu.paas.domain.enums.ContainerStatusEnum;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.enums.RoleEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.service.SysLoginService;
import jit.edu.paas.service.UserContainerService;
import jit.edu.paas.service.UserProjectService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 容器Controller
 *
 * @author jitwxs
 * @since 2018/6/28 14:27
 */
@Slf4j
@RestController
@RequestMapping("/container")
public class ContainerController {
    @Autowired
    private UserContainerService containerService;
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private UserProjectService projectService;

    @Value("${docker.server.address}")
    private String dockerAddress;
    @Value("${docker.server.port}")
    private String dockerPort;
    @Value("${server.ip}")
    private String serverIp;
    @Value("${server.port}")
    private String serverPort;
    @Autowired
    private UserContainerDTOConvert dtoConvert;

    /**
     * 获取容器
     *
     * @author jitwxs
     * @since 2018/7/9 22:59
     */
    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO getById(@RequestAttribute String uid, @PathVariable String id) {
        ResultVO resultVO = containerService.checkPermission(uid, id);
        if (ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }
        UserContainerDTO containerDTO = containerService.getById(id);

        return ResultVOUtils.success(containerDTO);
    }

    /**
     * 获取容器状态（包含状态同步）
     *
     * @author jitwxs
     * @since 2018/7/13 14:34
     */
    @GetMapping("/status/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO getStatus(@PathVariable String id) {
        ContainerStatusEnum status = containerService.getStatus(id);

        return ResultVOUtils.success(status.getCode());
    }

    /**
     * 获取容器列表
     * 普通用户获取本人容器，系统管理员获取所有容器
     *
     * @param name 容器名
     * @author jitwxs
     * @since 2018/7/9 11:19
     */
    @GetMapping("/list")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO listContainer(@RequestAttribute String uid, String name, Integer status,
                                  @RequestParam(defaultValue = "1") Integer current,
                                  @RequestParam(defaultValue = "10") Integer size) {
        // 鉴权
        String roleName = loginService.getRoleName(uid);
        // 角色无效
        if (StringUtils.isBlank(roleName)) {
            return ResultVOUtils.error(ResultEnum.AUTHORITY_ERROR);
        }

        Page<UserContainer> page = new Page<>(current, size, "update_date", false);
        Page<UserContainerDTO> selectPage = null;

        if (RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            selectPage = containerService.listContainerByUserId(uid, name, status, page);
        } else if (RoleEnum.ROLE_SYSTEM.getMessage().equals(roleName)) {
            selectPage = containerService.listContainerByUserId(null, name, status, page);
        }

        return ResultVOUtils.success(selectPage);
    }


    /**
     * 获取项目容器列表
     * 普通用户获取本人项目的容器，系统管理员任意项目的容器
     *
     * @author jitwxs
     * @since 2018/7/1 15:16
     */
    @GetMapping("/project/{projectId}/list")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO listContainerByProject(@RequestAttribute String uid, @PathVariable String projectId, Page<UserContainer> page) {
        // 1、鉴权
        String roleName = loginService.getRoleName(uid);
        // 1.1、角色无效
        if (StringUtils.isBlank(roleName)) {
            return ResultVOUtils.error(ResultEnum.AUTHORITY_ERROR);
        }
        // 1.2、越权访问
        if (RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            if (!projectService.hasBelong(projectId, uid)) {
                return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
            }
        }

        // 2、查询
        Page<UserContainer> selectPage = containerService.selectPage(page,
                new EntityWrapper<UserContainer>().eq("project_id", projectId));

        return ResultVOUtils.success(dtoConvert.convert(selectPage));
    }

    /**
     * 创建容器【WebSocket】
     *
     * @param imageId        镜像ID 必填
     * @param containerName  容器名 必填
     * @param projectId      所属项目 必填
     * @param portMapStr     端口映射，Map<String,String> JSON字符串
     * @param cmdStr         执行命令，如若为空，使用默认的命令，多个分号连接
     * @param envStr         环境变量，多个分号连接
     * @param destinationStr 容器内部目录，多个分号连接
     * @author jitwxs
     * @since 2018/7/1 15:52
     */
    @PostMapping("/create")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO createContainer(String imageId, String containerName, String projectId,
                                    String portMapStr, String cmdStr, String envStr, String destinationStr,
                                    @RequestAttribute String uid, HttpServletRequest request) {
        // 输入验证
        if (StringUtils.isBlank(imageId, containerName, projectId)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        // 前端传递map字符串
        Map<String, String> portMap;
        try {
            portMap = CollectionUtils.mapJson2map(portMapStr);
        } catch (Exception e) {
            log.error("Json格式解析错误，错误位置：{}，错误信息：{}", "ContainerController.createContainer()", e.getMessage());
            return ResultVOUtils.error(ResultEnum.JSON_ERROR);
        }

        // 前台字符串转换
        String[] cmd = CollectionUtils.str2Array(cmdStr, ";"),
                env = CollectionUtils.str2Array(envStr, ";"),
                destination = CollectionUtils.str2Array(destinationStr, ";");

        // 创建校验
        ResultVO resultVO = containerService.createContainerCheck(uid, imageId, portMap, projectId);
        if (ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        } else {
            containerService.createContainerTask(uid, imageId, cmd, portMap, containerName, projectId, env, destination, request);
            return ResultVOUtils.success("开始创建容器");
        }
    }

    /**
     * 开启容器【WebSocket】
     *
     * @author jitwxs
     * @since 2018/7/1 15:39
     */
    @GetMapping("/start/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO startContainer(@RequestAttribute String uid, @PathVariable String containerId) {
        ResultVO resultVO = containerService.hasAllowOp(uid, containerId, ContainerOpEnum.START);

        if (ResultEnum.OK.getCode() == resultVO.getCode()) {
            containerService.startContainerTask(uid, containerId);
            return ResultVOUtils.success("开始启动容器");
        } else {
            return resultVO;
        }
    }

    /**
     * 暂停容器【WebSocket】
     *
     * @author jitwxs
     * @since 2018/7/1 16:07
     */
    @GetMapping("/pause/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO pauseContainer(@RequestAttribute String uid, @PathVariable String containerId) {
        ResultVO resultVO = containerService.hasAllowOp(uid, containerId, ContainerOpEnum.PAUSE);

        if (ResultEnum.OK.getCode() == resultVO.getCode()) {
            containerService.pauseContainerTask(uid, containerId);
            return ResultVOUtils.success("开始暂停容器");
        } else {
            return resultVO;
        }
    }

    /**
     * 把容器从暂停状态恢复【WebSocket】
     *
     * @author jitwxs
     * @since 2018/7/1 16:09
     */
    @GetMapping("/continue/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO continueContainer(@RequestAttribute String uid, @PathVariable String containerId) {
        ResultVO resultVO = containerService.hasAllowOp(uid, containerId, ContainerOpEnum.CONTINUE);

        if (ResultEnum.OK.getCode() == resultVO.getCode()) {
            containerService.continueContainerTask(uid, containerId);
            return ResultVOUtils.success("开始恢复容器");
        } else {
            return resultVO;
        }
    }

    /**
     * 停止容器【WebSocket】
     *
     * @author jitwxs
     * @since 2018/7/1 15:59
     */
    @GetMapping("/stop/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO stopContainer(@RequestAttribute String uid, @PathVariable String containerId) {
        ResultVO resultVO = containerService.hasAllowOp(uid, containerId, ContainerOpEnum.STOP);

        if (ResultEnum.OK.getCode() == resultVO.getCode()) {
            containerService.stopContainerTask(uid, containerId);
            return ResultVOUtils.success("开始停止容器");
        } else {
            return resultVO;
        }
    }

    /**
     * 强制停止容器【WebSocket】
     *
     * @author jitwxs
     * @since 2018/7/1 16:02
     */
    @GetMapping("/kill/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO killContainer(@RequestAttribute String uid, @PathVariable String containerId) {
        ResultVO resultVO = containerService.hasAllowOp(uid, containerId, ContainerOpEnum.KILL);

        if (ResultEnum.OK.getCode() == resultVO.getCode()) {
            containerService.killContainerTask(uid, containerId);
            return ResultVOUtils.success("开始强制停止容器");
        } else {
            return resultVO;
        }
    }

    /**
     * 重启容器【WebSocket】
     *
     * @author jitwxs
     * @since 2018/7/1 16:02
     */
    @GetMapping("/restart/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO restartContainer(@RequestAttribute String uid, @PathVariable String containerId) {
        ResultVO resultVO = containerService.hasAllowOp(uid, containerId, ContainerOpEnum.RESTART);

        if (ResultEnum.OK.getCode() == resultVO.getCode()) {
            containerService.restartContainerTask(uid, containerId);
            return ResultVOUtils.success("开始重启容器");
        } else {
            return resultVO;
        }
    }

    /**
     * 获取运行容器的内部状态
     *
     * @author jitwxs
     * @since 2018/7/1 16:12
     */
    @GetMapping("/top/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO topContainer(@RequestAttribute String uid, @PathVariable String containerId) {
        return containerService.topContainer(uid, containerId);
    }

    /**
     * 删除容器【WebSocket】
     *
     * @author jitwxs
     * @since 2018/7/1 16:05
     */
    @DeleteMapping("/delete/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO removeContainer(@PathVariable String containerId, @RequestAttribute String uid, HttpServletRequest request) {
        ResultVO resultVO = containerService.hasAllowOp(uid, containerId, ContainerOpEnum.DELETE);

        if (ResultEnum.OK.getCode() == resultVO.getCode()) {
            containerService.removeContainerTask(uid, containerId, request);
            return ResultVOUtils.success("开始删除容器");
        } else {
            return resultVO;
        }
    }

    /**
     * 打包容器【WebSocket】
     *
     * @author jitwxs
     * @since 2018/7/1 16:05
     */
    @PostMapping("/commit")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO commitContainer(String containerId, String name,
                                    @RequestParam(defaultValue = "latest") String tag,
                                    @RequestAttribute String uid) {
        ResultVO resultVO = containerService.commitContainerCheck(containerId, name, tag, uid);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }

        containerService.commitContainerTask(containerId,name, tag, uid);
        return ResultVOUtils.success("开始打包镜像");
    }

    /**
     * 修改容器所属项目
     *
     * @param projectId 新项目ID
     * @author jitwxs
     * @since 2018/7/14 8:35
     */
    @PostMapping("/changeProject")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO changeBelongProject(String containerId, String projectId, @RequestAttribute String uid) {
        if (StringUtils.isBlank(containerId, projectId)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }
        return containerService.changeBelongProject(containerId, projectId, uid);
    }

    /**
     * 调用终端
     *
     * @param containerId 容器ID
     * @author jitwxs
     * @since 2018/7/1 14:35
     */
    @PostMapping("/terminal")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO showTerminal(@RequestAttribute String uid, String containerId,
                                 @RequestParam(defaultValue = "false") Boolean cursorBlink,
                                 @RequestParam(defaultValue = "100") Integer cols,
                                 @RequestParam(defaultValue = "50") Integer rows,
                                 @RequestParam(defaultValue = "100") Integer width,
                                 @RequestParam(defaultValue = "50") Integer height) {
        UserContainer container = containerService.getById(containerId);
        if (container == null) {
            return ResultVOUtils.error(ResultEnum.CONTAINER_NOT_FOUND);
        }

        // 只有启动状态容器才能调用Terminal
        ContainerStatusEnum status = containerService.getStatus(containerId);
        if (status != ContainerStatusEnum.RUNNING) {
            return ResultVOUtils.error(ResultEnum.CONTAINER_NOT_RUNNING);
        }

        // 鉴权
        ResultVO resultVO = containerService.checkPermission(uid, containerId);
        if (ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }

//            String html = "<html>\n" +
//                    "<head>\n" +
//                    "    <meta charset=\"UTF-8\">\n" +
//                    "    <title>xtermjs</title>\n" +
//                    "    <link rel=\"stylesheet\" href=\"/webjars/xterm/2.9.2/dist/xterm.css\" />\n" +
//                    "    <script type=\"application/javascript\" src=\"/webjars/xterm/2.9.2/dist/xterm.js\"></script>\n" +
//                    "    <script type=\"application/javascript\" src=\"/webjars/xterm/2.9.2/dist/addons/attach/attach.js\"></script>\n" +
//                    "</head>\n" +
//                    "<body>\n" +
//                    "<div style=\"width:1000px;\" id=\"xterm\"></div>\n" +
//                    "<script type=\"application/javascript\">\n" +
//                    "    var term = new Terminal({\n" +
//                    "        cursorBlink: false,\n" +
//                    "        cols: 100,\n" +
//                    "        rows: 50\n" +
//                    "    });\n" +
//                    "    term.open(document.getElementById('xterm'));\n" +
//                    "    var socket = new WebSocket('ws://localhost:"+serverPort+"/ws/container/exec?width=100&height=50&ip=" + dockerAddress + "&port=" + dockerPort + "&containerId="+containerId+"');\n" +
//                    "    term.attach(socket);\n" +
//                    "    term.focus();\n" +
//                    "</script>\n" +
//                    "</body>\n" +
//                    "</html>";
        String url = "ws://" + serverIp + ":" + serverPort + "/ws/container/exec?width=" + width + "&height=" + height +
                "&ip=" + dockerAddress + "&port=" + dockerPort + "&containerId=" + containerId;

        Map<String, Object> map = new HashMap<>(16);
        map.put("cursorBlink", cursorBlink);
        map.put("cols", cols);
        map.put("rows", rows);
        map.put("url", url);
        return ResultVOUtils.success(map);
    }

    /**
     * 同步容器状态
     * 普通用户同步本人容器，系统管理员同步所有容器
     *
     * @author jitwxs
     * @since 2018/7/9 13:09
     */
    @GetMapping("/sync")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO sync(@RequestAttribute String uid) {
        String roleName = loginService.getRoleName(uid);

        if (RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            return ResultVOUtils.success(containerService.syncStatus(uid));
        } else if (RoleEnum.ROLE_SYSTEM.getMessage().equals(roleName)) {
            return ResultVOUtils.success(containerService.syncStatus(null));
        } else {
            return ResultVOUtils.error(ResultEnum.AUTHORITY_ERROR);
        }
    }
}