package jit.edu.paas.service;

import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.entity.SysRepository;

import java.util.List;

/**
 * <p>
 *  仓储服务类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
public interface SysRepositoryService extends IService<SysRepository> {
    /**
     * 获取指定类型的所有仓储
     * @author jitwxs
     * @since 2018/6/28 14:18
     */
    List<SysRepository> listByType(Integer type);
}
