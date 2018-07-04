package jit.edu.paas.domain.enums;

import lombok.Getter;

/**
 * 系统日志类型枚举
 * @author jitwxs
 * @since 2018/6/5 23:53
 */
@Getter
public enum SysLogTypeEnum {
    USER_LOGIN("申请TOKEN", 1),
    DELETE_PROJECT("删除项目", 2);

    private String message;
    private int code;

    SysLogTypeEnum(String message, int code) {
        this.message = message;
        this.code = code;
    }

    public static String getMessage(int code) {
        for (SysLogTypeEnum enums : SysLogTypeEnum.values()) {
            if (enums.getCode() == code) {
                return enums.message;
            }
        }
        return null;
    }
}
