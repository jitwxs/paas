package jit.edu.paas.domain.enums;


import lombok.Getter;

/**
 * 服务状态枚举
 * @author hf
 * @since 2018/7/13 09:15
 */
@Getter
public enum UserServiceStatusEnum {
    STOP("服务关闭", 0),
    RUNNING("服务运行", 1);

    private String message;
    private int code;

    UserServiceStatusEnum(String message, int code) {
        this.message = message;
        this.code = code;
    }

    public static String getMessage(int code) {
        for (UserServiceStatusEnum enums : UserServiceStatusEnum.values()) {
            if (enums.getCode() == code) {
                return enums.message;
            }
        }
        return null;
    }
}