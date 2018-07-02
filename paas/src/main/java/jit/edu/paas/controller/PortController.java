package jit.edu.paas.controller;

import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.service.PortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 端口Controller
 * @author jitwxs
 * @since 2018/7/2 10:08
 */
@RestController
@RequestMapping("/port")
public class PortController {
    @Autowired
    private PortService portService;

    /**
     * 端口号是否被占用
     * @author jitwxs
     * @since 2018/7/2 10:09
     */
    @GetMapping("/hasUse/{port}")
    public ResultVo hasUse(@PathVariable Integer port) {
        return ResultVoUtils.success(portService.hasUse(port));
    }
}
