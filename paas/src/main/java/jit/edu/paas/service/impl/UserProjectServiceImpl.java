package jit.edu.paas.service.impl;

import jit.edu.paas.domain.entity.UserProject;
import jit.edu.paas.mapper.UserProjectMapper;
import jit.edu.paas.service.UserProjectService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Service
public class UserProjectServiceImpl extends ServiceImpl<UserProjectMapper, UserProject> implements UserProjectService {
    @Autowired
    private UserProjectMapper projectMapper;

}
