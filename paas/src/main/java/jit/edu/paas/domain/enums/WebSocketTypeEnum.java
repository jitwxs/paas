package jit.edu.paas.domain.enums;

import lombok.Getter;

/**
 * WebSocket消息类型枚举
 * @author jitwxs
 * @since 2018/6/5 23:53
 */
@Getter
public enum WebSocketTypeEnum {
    CONTAINER("容器操作", 0),
    SYS_IMAGE("系统镜像操作", 1),
    HUB_IMAGE("Hub镜像操作", 2),
    SERVICE("服务操作", 3),
    NOTICE("通知操作", 4),
    VOLUME("数据卷操作", 5);

    private String message;
    private int code;

    WebSocketTypeEnum(String message, int code) {
        this.message = message;
        this.code = code;
    }
    public static String getMessage(int code) {
        for (WebSocketTypeEnum enums : WebSocketTypeEnum.values()) {
            if (enums.getCode() == code) {
                String message = enums.message;
                return message;
            }
        }
        return null;
    }
}
