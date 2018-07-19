package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.domain.entity.SysProgram;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.mapper.SysProgramMapper;
import jit.edu.paas.service.SysProgramService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 系统服务表 服务实现类
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-12
 */
@Service
public class SysProgramServiceImpl extends ServiceImpl<SysProgramMapper, SysProgram> implements SysProgramService {
    @Autowired
    private SysProgramMapper programMapper;

    @Override
    public ResultVO deleteByIds(String[] ids) {
        int successCount = 0, errorCount = 0;
        for(String id : ids) {
            Integer i = programMapper.deleteById(Integer.parseInt(id));

            if(i == 1) {
                successCount++;
            } else {
                errorCount++;
            }
        }

        Map<String, Integer> map = new HashMap<>(16);
        map.put("success", successCount);
        map.put("error", errorCount);

        return ResultVOUtils.success(map);
    }
}
