package jit.edu.paas.domain.enums;

import lombok.Getter;

/**
 * 系统日志类型枚举
 * @author jitwxs
 * @since 2018/6/5 23:53
 */
@Getter
public enum SysLogTypeEnum {
    CREATE_PROJECT("创建项目", 10),
    DELETE_PROJECT("删除项目", 11),
    CREATE_CONTAINER("创建容器", 20),
    DELETE_CONTAINER("删除容器", 21),
    SYNC_SYS_IMAGE("同步镜像", 22),
    DELETE_IMAGE("删除镜像", 23),
    PULL_IMAGE_FROM_DOCKER_HUB("从DockerHub拉取镜像", 24),
    PUSH_IMAGE_TO_DOCKER_HUB("上传镜像到DockerHub", 25),
    IMPORT_IMAGE("导入镜像", 26),
    CREATE_REPOSITORY("创建仓储", 30),
    DELETE_REPOSITORY("删除仓储", 31),
    PUSH_IMAGE_TO_HUB("上传镜像到Hub", 40),
    PULL_IMAGE_FROM_HUB("拉取镜像从Hub", 41),
    DELETE_IMAGE_FROM_HUB("删除Hub上镜像", 42),
    SYNC_HUB_IMAGE("同步Hub上镜像", 43),
    CLEAN_VOLUMES("清理数据卷", 50),
    FREEZE_USER("冻结用户", 60);

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
