package jit.edu.paas.domain.dto;

import jit.edu.paas.domain.entity.UserService;
import lombok.Data;

/**
 * 容器DTO
 * @author hf
 * @since 2018/7/13 09:10
 */
@Data
public class UserServiceDTO extends UserService {
    /**
     * 所属项目名
     */
    private String projectName;

    /**
     * 状态名
     */
    private String statusName;

    /**
     * IP
     */
    private String ip;
}