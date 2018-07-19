package jit.edu.paas.domain.dto;

import jit.edu.paas.domain.entity.SysImage;
import lombok.Data;

@Data
public class SysImageDTO extends SysImage {
    /**
     * 所属用户名
     */
    private String username;
}
