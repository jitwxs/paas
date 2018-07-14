package jit.edu.paas.domain.dto;

import jit.edu.paas.domain.entity.UserProject;
import lombok.Data;

/**
 * 用户项目DTO
 * @author jitwxs
 * @since 2018/7/11 18:19
 */
@Data
public class UserProjectDTO extends UserProject {
    /**
     * 用户名
     */
    private String username;
}
