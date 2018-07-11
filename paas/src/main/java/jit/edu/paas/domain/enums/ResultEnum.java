package jit.edu.paas.domain.enums;

import lombok.Getter;

/**
 * 返回枚举
 * @author jitwxs
 * @since 2018/6/5 23:53
 */
@Getter
public enum ResultEnum {
    OK("成功",0),
    NETWORK_ERROR("网络错误", 9),
    OTHER_ERROR("其他错误", 10),
    LOGIN_ERROR("用户名或密码错误", 11),
    LOGIN_FREEZE("用户被冻结，请联系管理员", 12),
    AUTHORITY_ERROR("鉴权错误", 13),
    PERMISSION_ERROR("权限错误", 14),
    PARAM_ERROR("参数错误", 15),
    REGISTER_USERNAME_ERROR("注册失败，用户名已注册",16),
    REGISTER_EMAIL_ERROR("注册失败，邮箱已注册",17),
    EMAIL_SEND_ERROR("邮件发送错误",18),
    EMAIL_ERROR("邮件验证错误，用户已注册或验证时间已过期",19),
    REPOSITORY_EXIST("仓储已经存在",20),
    DOCKER_TIMEOUT("Docker超时",21),
    DOCKER_EXCEPTION("Docker异常",22),
    IMAGE_EXCEPTION("镜像异常",23),
    SERVER_EXCEPTION("服务器异常",24),
    INSPECT_ERROR("查看镜像信息错误,未找到此镜像",25),
    MODIFY_ERROR("修改镜像错误，用户无权修改或重命名失败：原镜像正在被使用或该镜像名已经被使用",26),
    IMPORT_ERROR_BY_NAME("导入镜像错误，镜像名本地已存在",27),
    IMPORT_ERROR("导入镜像错误，文件上传失败或导入异常",28),
    PUSH_ERROR("push镜像失败",29),
    PULL_ERROR_BY_EXIST("pull镜像错误，本地已存在",30),
    PULL_ERROR("pull镜像失败",31),
    DELETE_IMAGE_PERMISSION_ERROR("删除镜像错误，没有权限",32),
    DELETE_IMAGE_BY_CONTAINER_ERROR("删除镜像错误，有容器正在使用该镜像",33),
    VOLUME_NAME_ERROR("数据卷名称错误，请更换其他名称",34),
    VOLUME_LIST_ERROR("获取数据卷列表失败",35),
    PUBLIC_IMAGE_UPLOAD_ERROR("镜像上传失败，公有镜像不支持上传",36),
    IMAGE_UPLOAD_ERROR_BY_EXIST("镜像上传失败，镜像已经上传",37),
    DELETE_HUB_IMAGE_ERROR("删除Hub上镜像失败",38),
    BUILD_ERROR_BY_SUFFIX("编译DockerFile失败，后缀名错误",39),
    BUILD_ERROR("编译DockerFile失败",40),
    CREATE_PROJECT_ERROR("创建项目失败",41),
    DELETE_PROJECT_ERROR("删除项目失败",42),
    INPUT_PORT_ERROR("输入端口错误，请检查端口是否合法、是否可用，暴露端口是否均设置",43),
    MONITOR_DATA_ERROR("获取监控数据错误",44),
    CONTAINER_NOT_FOUND("容器不存在",45),
    CONTAINER_STATUS_REFUSE("容器状态拒绝操作",46),
    CONTAINER_START_ERROR("容器启动失败",47),
    USER_AUTHORITY_ERROR("用户身份获取失败",48),
    CONTAINER_ALREADY_START("容器正运行，操作被拒绝",49),
    CONTAINER_ALREADY_PAUSE("容器已经暂停，操作被拒绝",50),
    CONTAINER_ALREADY_STOP("容器已经停止，操作被拒绝",51),
    REQUEST_TIMEOUT("请求超时",52),
    REQUEST_ERROR("请求错误",53),
    CONTAINER_STATUS_ERROR("容器状态错误",54),
    VOLUME_NOT_EXIST("数据卷不存在",55),
    VOLUME_UPLOAD_ERROR("数据卷上传失败",56),
    UPLOAD_TYPE_ERROR("上传类型错误",57);

    private String message;
    private int code;

    ResultEnum(String message, int code) {
        this.message = message;
        this.code = code;
    }

    public static String getMessage(int code) {
        for (ResultEnum enums : ResultEnum.values()) {
            if (enums.getCode() == code) {
                return enums.message;
            }
        }
        return null;
    }
}