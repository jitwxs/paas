package jit.edu.paas.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.domain.dto.SysLogDTO;
import jit.edu.paas.domain.entity.SysLog;
import jit.edu.paas.domain.select.SysLogSelect;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  系统日志 Mapper 接口
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
public interface SysLogMapper extends BaseMapper<SysLog> {
    /**
     * 获取系统日志列表
     * @author jitwxs
     * @since 2018/7/11 10:14
     */
    List<SysLogDTO> listSystemLog(@Param("sysLogSelect") SysLogSelect sysLogSelect, Page<SysLogDTO> page);
}
