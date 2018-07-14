package jit.edu.paas.domain.enums;

import lombok.Getter;

/**
 * 项目日志类型枚举
 * @author jitwxs
 * @since 2018/7/7 8:58
 */
@Getter
public enum ProjectLogTypeEnum {
    CREATE_PROJECT("创建项目", 10),
    EDIT_PROJECT("修改项目信息", 11),
    CREATE_CONTAINER("创建容器", 20),
    CREATE_CONTAINER_ERROR("创建容器失败", 21),
    START_CONTAINER("开启容器", 22),
    START_CONTAINER_ERROR("开启容器失败", 23),
    PAUSE_CONTAINER("暂停容器", 24),
    PAUSE_CONTAINER_ERROR("暂停容器失败", 25),
    CONTINUE_CONTAINER("恢复容器", 26),
    CONTINUE_CONTAINER_ERROR("恢复容器失败", 27),
    STOP_CONTAINER("停止容器", 28),
    STOP_CONTAINER_ERROR("停止容器失败", 29),
    KILL_CONTAINER("强制停止容器", 30),
    KILL_CONTAINER_ERROR("强制停止容器失败", 31),
    DELETE_CONTAINER("删除容器", 32),
    DELETE_CONTAINER_ERROR("删除容器失败", 33),
    RESTART_CONTAINER("重启容器", 34),
    RESTART_CONTAINER_ERROR("重启容器失败", 35),
    DELETE_SERVICE("删除服务", 36),
    DELETE_SERVICE_ERROR("删除服务失败", 37),
    CREATE_SERVICE("新建服务", 38),
    CREATE_SERVICE_ERROR("新建服务失败", 39);
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
