package jit.edu.paas.domain.enums;

import lombok.Getter;

/**
 * 容器操作枚举
 * @author jitwxs
 * @since 2018/6/5 23:53
 */
@Getter
public enum ContainerOpEnum {
    START("容器开启", 0),
    PAUSE("容器暂停", 1),
    CONTINUE("容器恢复", 2),
    STOP("容器停止", 3),
    KILL("容器强制停止", 4),
    RESTART("容器重启", 5),
    DELETE("容器删除", 6);

    private String message;
    private int code;

    ContainerOpEnum(String message, int code) {
        this.message = message;
        this.code = code;
    }

    public static String getMessage(int code) {
        for (ContainerOpEnum enums : ContainerOpEnum.values()) {
            if (enums.getCode() == code) {
                return enums.message;
            }
        }
        return null;
    }
}
