package jit.edu.paas.domain.vo;

import lombok.Data;

/**
 * @author jitwxs
 * @since 2018/6/27 21:27
 */
@Data
public class UserVO {
    private String userId;

    private String username;

    private String email;

    private Integer roleId;
}
