package jit.edu.paas.controller;

import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.util.CollectionUtils;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.domain.entity.SysProgram;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.service.SysProgramService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 运行程序Controller
 * @author jitwxs
 * @since 2018/7/12 16:07
 */
@RestController
@RequestMapping("/program")
public class ProgramController {
    @Autowired
    private SysProgramService programService;

    @GetMapping("/list")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO list(Page<SysProgram> page) {
        Page<SysProgram> selectPage = programService.selectPage(page);
        return ResultVOUtils.success(selectPage);
    }

    @PostMapping("/create")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO createProgram(SysProgram program) {
        boolean b = programService.insert(program);
        return b ? ResultVOUtils.success() : ResultVOUtils.error(ResultEnum.DATA_INSERT_ERROR);
    }

    @PutMapping("/update")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO updateProgram(SysProgram program) {
        if(program.getId() == null) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        boolean b = programService.updateById(program);
        return b ? ResultVOUtils.success() : ResultVOUtils.error(ResultEnum.DATA_UPDATE_ERROR);
    }

    /**
     * 批量删除
     * 解决前台无法发送数组
     * @author jitwxs
     * @since 2018/7/13 17:43
     */
    @PostMapping("/delete")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO deleteProgram(String ids) {
        String[] idArray = ids.split(",");
        if(CollectionUtils.isArrayEmpty(idArray)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }
        return programService.deleteByIds(idArray);
    }
}
