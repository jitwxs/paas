package jit.edu.paas.domain.enums;

import lombok.Getter;

/**
 * 日志类型枚举
 * @author jitwxs
 * @since 2018/6/5 23:53
 */
@Getter
public enum LogTypeEnum {
    USER_LOGIN("用户登录", 1),
    DELETE_PROJECT("删除项目", 2);

    private String message;
    private int code;

    LogTypeEnum(String message, int code) {
        this.message = message;
        this.code = code;
    }

    public static String getMessage(int code) {
        for (LogTypeEnum enums : LogTypeEnum.values()) {
            if (enums.getCode() == code) {
                return enums.message;
            }
        }
        return null;
    }
}
