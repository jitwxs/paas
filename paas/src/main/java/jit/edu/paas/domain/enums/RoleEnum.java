package jit.edu.paas.domain.enums;

import lombok.Getter;

/**
 * 角色枚举
 * @author jitwxs
 * @since 2018/6/5 23:53
 */
@Getter
public enum RoleEnum {
    /**
     * 普通用户
     */
    ROLE_USER("ROLE_USER", 1),
    /**
     * 管理员
     */
    ROLE_SYSTEM("ROLE_SYSTEM", 2);

    private String message;
    private int code;

    RoleEnum(String message, int code) {
        this.message = message;
        this.code = code;
    }

    public static String getMessage(int code) {
        for (RoleEnum enums : RoleEnum.values()) {
            if (enums.getCode() == code) {
                return enums.message;
            }
        }
        return null;
    }
}
