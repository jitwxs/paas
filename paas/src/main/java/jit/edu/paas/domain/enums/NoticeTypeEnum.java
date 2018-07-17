package jit.edu.paas.domain.enums;

import lombok.Getter;

/**
 * 通知类型枚举
 * @author jitwxs
 * @since 2018/6/5 23:53
 */
@Getter
public enum NoticeTypeEnum {
    /**
     * 系统通知
     */
    SYSTEM_NOTICE("系统通知", 1),
    /**
     * 容器通知
     */
    CONTAINER_NOTICE("容器通知", 2),
    /**
     * 服务通知
     */
    SERVICE_NOTICE("服务通知", 3),
    /**
     * 镜像通知
     */
    IMAGE_NOTICE("镜像通知", 4),
    /**
     * 其他通知
     */
    OTHER_NOTICE("其他通知", 5);

    private String message;
    private int code;

    NoticeTypeEnum(String message, int code) {
        this.message = message;
        this.code = code;
    }

    public static String getMessage(int code) {
        for (NoticeTypeEnum enums : NoticeTypeEnum.values()) {
            if (enums.getCode() == code) {
                return enums.message;
            }
        }
        return null;
    }

    public static NoticeTypeEnum getEnum(Integer code){
        for(NoticeTypeEnum enums : NoticeTypeEnum.values()){
            if(code == enums.getCode()){
                return enums;
            }
        }
        return null;
    }
}
