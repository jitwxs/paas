package jit.edu.paas.domain.enums;

import lombok.Getter;

/**
 * 仓储类型枚举
 * @author jitwxs
 * @since 2018/6/5 23:53
 */
@Getter
public enum RepositoryTypeEnum {
    DOCKER_CONTAINER("Docker容器", 1),
    DOCKER_HUB("Docker HUB", 2);

    private String message;
    private int code;

    RepositoryTypeEnum(String message, int code) {
        this.message = message;
        this.code = code;
    }

    public static String getMessage(int code) {
        for (RepositoryTypeEnum enums : RepositoryTypeEnum.values()) {
            if (enums.getCode() == code) {
                return enums.message;
            }
        }
        return null;
    }
}
