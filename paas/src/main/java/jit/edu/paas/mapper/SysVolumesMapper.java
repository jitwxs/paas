package jit.edu.paas.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import jit.edu.paas.domain.entity.SysVolume;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysVolumesMapper extends BaseMapper<SysVolume> {

    List<SysVolume> selectByObjId(@Param("objId") String objId, Pagination page);

    /**
     * 查看数据卷是否被使用
     * destination + objId 均为空，代表未使用
     * @author jitwxs
     * @since 2018/7/16 10:54
     */
    boolean hasUser(String id);

    void deleteByObjId(@Param("objId") String objId);
}
