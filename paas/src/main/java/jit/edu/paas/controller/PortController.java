package jit.edu.paas.controller;

import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.domain.vo.ResultVO;
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
    public ResultVO hasUse(@PathVariable Integer port) {
        return ResultVOUtils.success(portService.hasUse(port));
    }

    /**
     * 随即返回一个可用端口
     * @author jitwxs
     * @since 2018/7/7 17:49
     */
    @GetMapping("/random")
    public ResultVO randomPort() {
        return ResultVOUtils.success(portService.randomPort());
    }

}
