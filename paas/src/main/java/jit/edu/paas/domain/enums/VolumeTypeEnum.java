package jit.edu.paas.domain.enums;

import lombok.Getter;

/**
 * 数据卷类型枚举
 * @author jitwxs
 * @since 2018/6/5 23:53
 */
@Getter
public enum VolumeTypeEnum {
    /**
     * 容器数据卷
     */
    CONTAINER("容器数据卷", 1),
    /**
     * 服务数据卷
     */
    SERVICE("服务数据卷", 2);

    private String message;
    private int code;

    VolumeTypeEnum(String message, int code) {
        this.message = message;
        this.code = code;
    }

    public static String getMessage(int code) {
        for (VolumeTypeEnum enums : VolumeTypeEnum.values()) {
            if (enums.getCode() == code) {
                return enums.message;
            }
        }
        return null;
    }

    public static VolumeTypeEnum getEnum(Integer code){
        for(VolumeTypeEnum enums : VolumeTypeEnum.values()){
            if(code == enums.getCode()){
                return enums;
            }
        }
        return null;
    }
}
