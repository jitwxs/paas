package jit.edu.paas.controller;

import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.service.EnumsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 枚举Controller
 * @author jitwxs
 * @since 2018/6/30 14:45
 */
@RestController
@RequestMapping("/enums")
public class EnumsController {
    @Autowired
    private EnumsService enumsService;

    /**
     * 获取所有状态码
     * @author jitwxs
     * @since 2018/6/30 14:46
     */
    @GetMapping("/result")
    public ResultVo listErrorCode() {
        return ResultVoUtils.success(enumsService.listResultCode());
    }

    /**
     * 获取所有系统日志类型
     * @author jitwxs
     * @since 2018/6/30 14:46
     */
    @GetMapping("/log/sys")
    public ResultVo listSysLogType() {
        return ResultVoUtils.success(enumsService.listSysLogType());
    }

    /**
     * 获取所有项目日志类型
     * @author jitwxs
     * @since 2018/6/30 14:46
     */
    @GetMapping("/log/project")
    public ResultVo listProjectLogType() {
        return ResultVoUtils.success(enumsService.listProjectLogType());
    }

    /**
     * 获取所有仓储类型
     * @author jitwxs
     * @since 2018/6/30 14:46
     */
    @GetMapping("/repository")
    public ResultVo listRepositoryType() {
        return ResultVoUtils.success(enumsService.listRepositoryType());
    }

    /**
     * 获取所有镜像类型
     * @author jitwxs
     * @since 2018/6/30 14:46
     */
    @GetMapping("/image")
    public ResultVo listImageType() {
        return ResultVoUtils.success(enumsService.listImageType());
    }

    /**
     * 获取所有容器状态
     * @author jitwxs
     * @since 2018/7/1 20:03
     */
    @GetMapping("/container")
    public ResultVo listContainerStatus() {
        return ResultVoUtils.success(enumsService.listContainerStatus());
    }
}