package jit.edu.paas.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.google.common.collect.ImmutableSet;
import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.entity.UserContainer;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.enums.RoleEnum;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.service.SysImageService;
import jit.edu.paas.service.SysLoginService;
import jit.edu.paas.service.UserContainerService;
import jit.edu.paas.service.UserProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 容器Controller
 * @author jitwxs
 * @since 2018/6/28 14:27
 */
@RestController
@RequestMapping("/container")
public class ContainerController {
    @Autowired
    private UserContainerService userContainerService;
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private SysImageService imageService;
    @Autowired
    private UserProjectService projectService;

    @Value("${docker.server.address}")
    private String dockerAddress;
    @Value("${docker.server.port}")
    private String dockerPort;
    @Value("${server.port}")
    private String serverPort;

    /**
     * 获取某一项目容器列表
     * @author jitwxs
     * @since 2018/7/1 15:16
     */
    @GetMapping("/list/{projectId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo listContainer(@RequestAttribute String uid, @PathVariable String projectId, Page<UserContainer> page) {
        // 1、鉴权
        String roleName = loginService.getRoleName(uid);
        // 1.1、角色无效
        if(StringUtils.isBlank(roleName)) {
            return ResultVoUtils.error(ResultEnum.AUTHORITY_ERROR);
        }
        // 1.2、越权访问
        if(RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            if(!projectService.hasBelong(projectId, uid)) {
                return ResultVoUtils.error(ResultEnum.PERMISSION_ERROR);
            }
        }

        // 2、查询
        Page<UserContainer> selectPage = userContainerService.selectPage(page,
                new EntityWrapper<UserContainer>().eq("project_id", projectId));

        return ResultVoUtils.success(selectPage);
    }

    /**
     * 创建容器
     * @param imageId 镜像ID
     * @param cmd 执行命令，如若为空，使用默认的命令
     * @param containerName 容器名
     * @param projectId 所属项目
     * @destination 容器内部目录
     * @author jitwxs
     * @since 2018/7/1 15:52
     */
    @PostMapping("/create")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVo createContainer(@RequestAttribute String uid, String imageId, String[] cmd,
                                    String containerName,String projectId,String env, String[] destination){
        // 1、输入验证
        if(StringUtils.isBlank(imageId,containerName,projectId)) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }

        // 2、获取暴露接口
        ImmutableSet<String> exportPorts = imageService.listExportPorts(imageId);
        return userContainerService.createContainer(uid, imageId, cmd, exportPorts, containerName, projectId, env, destination);
    }

    /**
     * 开启容器
     * @author jitwxs
     * @since 2018/7/1 15:39
     */
    @GetMapping("/start/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo startContainer(@RequestAttribute String uid, @PathVariable String containerId){
        return userContainerService.startContainer(uid, containerId);
    }

    /**
     * 暂停容器
     * @author jitwxs
     * @since 2018/7/1 16:07
     */
    @GetMapping("/pause/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo pauseContainer(@RequestAttribute String uid, @PathVariable String containerId){
        return userContainerService.pauseContainer(uid, containerId);
    }

    /**
     * 把容器从暂停状态恢复
     * @author jitwxs
     * @since 2018/7/1 16:09
     */
    @GetMapping("/continue/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo continueContainer(@RequestAttribute String uid, @PathVariable String containerId){
        return userContainerService.continueContainer(uid, containerId);
    }

    /**
     * 停止容器
     * @author jitwxs
     * @since 2018/7/1 15:59
     */
    @GetMapping("/stop/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo stopContainer(@RequestAttribute String uid, @PathVariable String containerId){
        return userContainerService.stopContainer(uid, containerId);
    }

    /**
     * 强制停止容器
     * @author jitwxs
     * @since 2018/7/1 16:02
     */
    @GetMapping("/kill/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo killContainer(@RequestAttribute String uid, @PathVariable String containerId){
        return userContainerService.killContainer(uid, containerId);
    }

    /**
     * 获取运行容器的内部状态
     * @author jitwxs
     * @since 2018/7/1 16:12
     */
    @GetMapping("/top/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo topContainer(@RequestAttribute String uid, @PathVariable String containerId){
        return userContainerService.topContainer(uid, containerId);
    }

    /**
     * 删除容器
     * @author jitwxs
     * @since 2018/7/1 16:05
     */
    @DeleteMapping("/remove/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo removeContainer(@RequestAttribute String uid, @PathVariable String containerId){
        return userContainerService.removeContainer(uid, containerId);
    }

    /**
     * 调用Terminal
     * @param containerId 容器ID
     * @author jitwxs
     * @since 2018/7/1 14:35
     */
    @GetMapping("/terminal/{containerId}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public void showTerminal(@PathVariable String containerId, HttpServletResponse response) {
        try {
            response.getWriter().write("<html>\n" +
                    "<head>\n" +
                    "    <meta charset=\"UTF-8\">\n" +
                    "    <title>xtermjs</title>\n" +
                    "    <link rel=\"stylesheet\" href=\"/webjars/xterm/2.9.2/dist/xterm.css\" />\n" +
                    "    <script type=\"application/javascript\" src=\"/webjars/xterm/2.9.2/dist/xterm.js\"></script>\n" +
                    "    <script type=\"application/javascript\" src=\"/webjars/xterm/2.9.2/dist/addons/attach/attach.js\"></script>\n" +
                    "</head>\n" +
                    "<body>\n" +
                    "<div style=\"width:1000px;\" id=\"xterm\"></div>\n" +
                    "<script type=\"application/javascript\">\n" +
                    "    var term = new Terminal({\n" +
                    "        cursorBlink: false,\n" +
                    "        cols: 100,\n" +
                    "        rows: 50\n" +
                    "    });\n" +
                    "    term.open(document.getElementById('xterm'));\n" +
                    "    var socket = new WebSocket('ws://localhost:"+serverPort+"/ws/container/exec?width=100&height=50&ip=" + dockerAddress + "&port=" + dockerPort + "&containerId="+containerId+"');\n" +
                    "    term.attach(socket);\n" +
                    "    term.focus();\n" +
                    "</script>\n" +
                    "</body>\n" +
                    "</html>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
