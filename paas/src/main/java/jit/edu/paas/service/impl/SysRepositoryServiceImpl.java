package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import jit.edu.paas.domain.entity.SysRepository;
import jit.edu.paas.mapper.SysRepositoryMapper;
import jit.edu.paas.service.SysRepositoryService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    @Override
    public List<SysRepository> listByType(Integer type) {
        return repositoryMapper.selectList(new EntityWrapper<SysRepository>().eq("type", type));
    }
}
