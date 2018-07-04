package jit.edu.paas.domain.enums;

import lombok.Getter;

/**
 * 系统日志类型枚举
 * @author jitwxs
 * @since 2018/6/5 23:53
 */
@Getter
public enum ProjectLogTypeEnum {
    PROJECT_CREATE("创建项目", 1),
    CONTAINER_CREATE("创建容器", 2),
    CONTAINER_START("启动容器", 3),
    CONTAINER_PAUSE("暂停容器", 4),
    CONTAINER_CONTINUE("恢复容器", 5),
    CONTAINER_STOP("停止容器", 6),
    CONTAINER_KILL("强制停止容器", 7),
    CONTAINER_REMOVE("删除容器", 8);

    private String message;
    private int code;

    ProjectLogTypeEnum(String message, int code) {
        this.message = message;
        this.code = code;
    }

    public static String getMessage(int code) {
        for (ProjectLogTypeEnum enums : ProjectLogTypeEnum.values()) {
            if (enums.getCode() == code) {
                return enums.message;
            }
        }
        return null;
    }
}
