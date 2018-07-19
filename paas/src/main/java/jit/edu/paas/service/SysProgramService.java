package jit.edu.paas.service;

import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.entity.SysProgram;
import jit.edu.paas.domain.vo.ResultVO;

/**
 * <p>
 * 系统服务表 服务类
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-12
 */
public interface SysProgramService extends IService<SysProgram> {

    /**
     * 根据ID数组删除
     * @author jitwxs
     * @since 2018/7/13 17:37
     */
    ResultVO deleteByIds(String[] ids);
}
