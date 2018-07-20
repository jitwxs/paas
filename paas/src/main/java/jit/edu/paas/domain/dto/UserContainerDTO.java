package jit.edu.paas.domain.dto;

import jit.edu.paas.domain.entity.UserContainer;
import lombok.Data;

/**
 * 容器DTO
 * @author jitwxs
 * @since 2018/7/9 22:29
 */
@Data
public class UserContainerDTO extends UserContainer {
    /**
     * 所属项目名
     */
    private String projectName;

    /**
     * 状态名
     */
    private String statusName;

    /**
     * 所属用户名
     */
    private String username;
    /**
     * docker主机ip地址
     */
    private String ip;

}
