package jit.edu.paas.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.StringUtils;
import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.domain.entity.SysRepository;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.service.SysRepositoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 仓储Controller
 * @author jitwxs
 * @since 2018/6/28 14:21
 */
@RestController
@RequestMapping("/repository")
public class RepositoryController {
    @Autowired
    private SysRepositoryService repositoryService;

    /**
     * 获取仓储列表
     * @author jitwxs
     * @since 2018/6/30 14:02
     */
    @GetMapping("/list")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVo listRepository(Integer type, Page<SysRepository> page) {
        Page<SysRepository> selectPage;
        if(type != null) {
            selectPage = repositoryService.selectPage(page, new EntityWrapper<SysRepository>().eq("type", type));
        } else {
            selectPage = repositoryService.selectPage(page);
        }
        return ResultVoUtils.success(selectPage);
    }

    /**
     * 创建仓储
     * @author jitwxs
     * @since 2018/6/30 14:18
     */
    @PostMapping("/create")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVo createRepository(String address, Integer type) {
        if(StringUtils.isBlank(address) || type == null) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }
       return repositoryService.createRepository(address, type);
    }

    /**
     * 删除仓储
     * @author jitwxs
     * @since 2018/6/30 14:19
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVo deleteRepository(@PathVariable Integer id) {
        return repositoryService.deleteRepository(id);
    }
}