package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.commons.util.CollectionUtils;
import jit.edu.paas.domain.entity.SysRepository;
import jit.edu.paas.domain.enums.RepositoryTypeEnum;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.enums.SysLogTypeEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.mapper.SysRepositoryMapper;
import jit.edu.paas.service.SysLogService;
import jit.edu.paas.service.SysRepositoryService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Service
public class SysRepositoryServiceImpl extends ServiceImpl<SysRepositoryMapper, SysRepository> implements SysRepositoryService {
    @Autowired
    private SysRepositoryMapper repositoryMapper;
    @Autowired
    private SysLogService sysLogService;
    @Autowired
    private HttpServletRequest request;

    @Override
    public ResultVO createRepository(String address, Integer type) {
        // 判断类型是否正确
        if(StringUtils.isBlank(RepositoryTypeEnum.getMessage(type))) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        // 判断是否存在
        if(hasExist(address,type)) {
            return ResultVOUtils.error(ResultEnum.REPOSITORY_EXIST);
        }

        // 插入记录
        SysRepository repository = new SysRepository(type, address);
        repositoryMapper.insert(repository);

        // 写入日志
        sysLogService.saveLog(request, SysLogTypeEnum.CREATE_REPOSITORY);

        return ResultVOUtils.success();
    }

    @Override
    public Boolean hasExist(String address, Integer type) {
        List<SysRepository> list = repositoryMapper.selectList(new EntityWrapper<SysRepository>()
                .eq("address", address)
                .eq("type", type));

        return CollectionUtils.getListFirst(list) != null;
    }

    @Override
    public ResultVO deleteRepository(Integer id) {
        repositoryMapper.deleteById(id);
        // 写入日志
        sysLogService.saveLog(request, SysLogTypeEnum.DELETE_REPOSITORY);

        return ResultVOUtils.success();
    }
}
