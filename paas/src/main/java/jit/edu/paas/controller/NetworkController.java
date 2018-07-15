package jit.edu.paas.controller;

import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.entity.SysNetwork;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.service.SysNetworkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 网络 Controller
 * @author jitwxs
 * @since 2018/7/14 15:16
 */
@RestController
@RequestMapping("/network")
public class NetworkController {
    @Autowired
    private SysNetworkService networkService;

    /**
     * 获取网络列表 - 用户接口
     * @param type 1：公共网络；2：个人网络
     * @author jitwxs
     * @since 2018/7/14 16:43
     */
    @GetMapping("/list")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO listNetwork(@RequestParam(defaultValue = "-1") int type, Page<SysNetwork> page, @RequestAttribute String uid) {
        switch (type) {
            case 1:
                return ResultVOUtils.success(networkService.listAllNetwork(page, true));
            case 2:
                return ResultVOUtils.success(networkService.listSelfNetwork(page, uid));
            default:
                return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }
    }

    /**
     * 获取网络接口 - 管理员接口
     * @param hasPublic 是否公共镜像
     * @author jitwxs
     * @since 2018/7/14 16:47
     */
    @GetMapping("/listAll")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO listAllNetwork(Boolean hasPublic, Page<SysNetwork> page) {
        return ResultVOUtils.success(networkService.listAllNetwork(page, hasPublic));
    }

    /**
     * 网络同步
     * @author jitwxs
     * @since 2018/7/14 16:48
     */
    @GetMapping("/sync")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO sync() {
        return ResultVOUtils.success(networkService.sync());
    }

    /**
     * 创建公共网络
     * @author jitwxs
     * @since 2018/7/14 17:45
     */
    @PostMapping("/public/create")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO createPublicNetwork(String name, String driver, Map<String, String> labels, Boolean hasIpv6, HttpServletRequest request) {
        return networkService.createPublicNetwork(name, driver, labels, hasIpv6, request);
    }

    /**
     * 创建个人网络
     * @author jitwxs
     * @since 2018/7/14 19:31
     */
    @PostMapping("/self/create")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO createUserNetwork(String name, String driver, Map<String, String> labels, Boolean hasIpv6,
                                      @RequestAttribute String uid) {
        return networkService.createUserNetwork(name, driver, labels, hasIpv6, uid);
    }

    /**
     * 删除网络
     * @author jitwxs
     * @since 2018/7/14 19:58
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO deleteUserNetwork(@PathVariable String id, @RequestAttribute String uid, HttpServletRequest request) {
        return networkService.deleteNetwork(id, uid, request);
    }

    /**
     * 连接网络
     * @param containerId 容器ID
     * @author jitwxs
     * @since 2018/7/14 20:41
     */
    @PostMapping("/connect")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO connectNetwork(String containerId, String networkId, @RequestAttribute String uid) {
        if(StringUtils.isBlank(containerId, networkId)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }
        return networkService.connectNetwork(networkId, containerId, uid);
    }

    /**
     * 取消连接网络
     * @param containerId 容器ID
     * @author jitwxs
     * @since 2018/7/14 20:41
     */
    @PostMapping("/disConnect")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO disConnectNetwork(String containerId, String networkId, @RequestAttribute String uid) {
        if(StringUtils.isBlank(containerId, networkId)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }
        return networkService.disConnectNetwork(networkId, containerId, uid);
    }
}
