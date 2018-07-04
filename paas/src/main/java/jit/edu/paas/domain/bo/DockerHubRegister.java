package jit.edu.paas.domain.bo;

import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * DockerHub注册信息
 * @author jitwxs
 * @since 2018/7/3 21:31
 */
@Data
public class DockerHubRegister implements Serializable {
    private static final long serialVersionUID = 1L;

    @NotNull(message = "DockerHub用户名不能为空")
    private String username;

    @NotNull(message = "DockerHub密码不能为空")
    private String password;
}
