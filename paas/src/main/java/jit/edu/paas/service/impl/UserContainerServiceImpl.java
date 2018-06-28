package jit.edu.paas.service.impl;

import jit.edu.paas.domain.entity.UserContainer;
import jit.edu.paas.mapper.UserContainerMapper;
import jit.edu.paas.service.UserContainerService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户容器表 服务实现类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Service
public class UserContainerServiceImpl extends ServiceImpl<UserContainerMapper, UserContainer> implements UserContainerService {

}
