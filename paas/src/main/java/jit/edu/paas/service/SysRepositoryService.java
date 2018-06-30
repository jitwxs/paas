package jit.edu.paas.service;

import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.entity.SysRepository;
import jit.edu.paas.domain.vo.ResultVo;

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
     * 创建一个仓储
     * @param address 仓储地址
     * @param type 仓储类型
     * @author jitwxs
     * @since 2018/6/30 14:10
     */
    ResultVo createRepository(String address, Integer type);

    /**
     * 判断仓储是否存在
     * @author jitwxs
     * @since 2018/6/30 14:11
     * @return 存在：true
     */
    Boolean hasExist(String address, Integer type);

    /**
     * 删除仓储
     * @author jitwxs
     * @since 2018/6/30 14:23
     */
    ResultVo deleteRepository(Integer id);

}
