package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import jit.edu.paas.domain.entity.UserService;
import jit.edu.paas.mapper.UserServiceMapper;
import jit.edu.paas.service.UserServiceService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户服务表 服务实现类
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-11
 */
@Service
public class UserServiceServiceImpl extends ServiceImpl<UserServiceMapper, UserService> implements UserServiceService {

}
