package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import jit.edu.paas.domain.entity.ProjectLog;
import jit.edu.paas.mapper.ProjectLogMapper;
import jit.edu.paas.service.ProjectLogService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  ContainerLog服务实现类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Service
public class ProjectLogServiceImpl extends ServiceImpl<ProjectLogMapper, ProjectLog> implements ProjectLogService {
}
