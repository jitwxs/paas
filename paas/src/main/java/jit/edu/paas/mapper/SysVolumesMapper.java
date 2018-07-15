package jit.edu.paas.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import jit.edu.paas.domain.entity.SysVolume;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysVolumesMapper extends BaseMapper<SysVolume> {

    List<SysVolume> selectByContainerId(@Param("containerId") String containerId, Pagination page);
}
