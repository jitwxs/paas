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
    UPLOAD_ERROR("上传错误", 6),
    CONNECTION_REFUSED("连接拒绝，请联系管理员", 7),
    EMAIL_DIS_LEGAL("邮箱不合法", 8),
    JSON_ERROR("JSON解析错误", 9),
    AUTHORITY_ERROR("鉴权错误", 10),
    PERMISSION_ERROR("权限错误", 11),
    PARAM_ERROR("参数错误", 12),
    NETWORK_ERROR("网络错误", 13),
    REQUEST_TIMEOUT("请求超时",14),
    REQUEST_ERROR("请求错误",15),
    UPLOAD_TYPE_ERROR("上传类型错误",16),
    DATA_UPDATE_ERROR("数据更新错误",17),
    DATA_INSERT_ERROR("数据插入错误",18),
    DATA_DELETE_ERROR("数据删除错误",19),
    OTHER_ERROR("其他错误", 20),
    LOGIN_ERROR("用户名或密码错误", 21),
    LOGIN_FREEZE("用户被冻结或未激活，请联系管理员", 22),
    REGISTER_USERNAME_ERROR("注册失败，用户名已注册",23),
    REGISTER_EMAIL_ERROR("注册失败，邮箱已注册",24),
    EMAIL_SEND_ERROR("邮件发送错误",25),
    EMAIL_ERROR("邮件验证错误，用户已注册或验证时间已过期",27),
    TOKEN_NOT_ACCEPT("token未被服务器接受，请重新登陆",28),
    TOKEN_EXPIRE("token已过期，请重新登陆",29),
    TOKEN_READ_ERROR("token读取失败，请重试",30),
    CREATE_PROJECT_ERROR("创建项目失败",31),
    DELETE_PROJECT_ERROR("删除项目失败",32),
    PROJECT_NOT_EXIST("项目不存在",33),
    PROJECT_ACCESS_ERROR("没有权限访问项目",34),
    DOCKER_TIMEOUT("Docker超时",35),
    DOCKER_EXCEPTION("Docker异常",36),
    MONITOR_DATA_ERROR("获取监控数据错误",37),
    IMAGE_NOT_EXIST("镜像不存在",40),
    INSPECT_ERROR("查看镜像信息错误,未找到此镜像",41),
    IMPORT_ERROR_BY_NAME("导入镜像错误，镜像名本地已存在",42),
    IMPORT_ERROR("导入镜像错误，文件上传失败或导入异常",43),
    PUSH_ERROR("push镜像失败",44),
    PULL_ERROR_BY_EXIST("pull镜像错误，本地已存在",45),
    PULL_ERROR("pull镜像失败",46),
    PUBLIC_IMAGE_UPLOAD_ERROR("镜像上传失败，公有镜像不支持上传",47),
    IMAGE_UPLOAD_ERROR_BY_EXIST("镜像上传失败，镜像已经存在",48),
    DELETE_HUB_IMAGE_ERROR("删除Hub上镜像失败",49),
    DELETE_IMAGE_PERMISSION_ERROR("删除镜像错误，没有权限",50),
    DELETE_IMAGE_BY_CONTAINER_ERROR("删除镜像错误，有容器正在使用该镜像",51),
    DELETE_IMAGE_ERROR("删除镜像错误",52),
    IMAGE_EXCEPTION("镜像异常",53),
    IMAGE_NAME_CONTAIN_UPPER("镜像名包含大写字符",54),
    IMAGE_UPLOAD_ERROR_BY_SUFFIX("镜像文件后缀名错误，只能为tar.gz文件",55),
    IMAGE_NAME_AND_TAG_EXIST("镜像名和tag已存在",56),
    IMAGE_COMMIT_ERROR("打包镜像错误",57),
    CREATE_CONTAINER_ERROR("容器创建错误",59),
    INPUT_PORT_ERROR("输入端口错误，请检查端口是否合法、是否可用，暴露端口是否均设置",60),
    CONTAINER_NOT_FOUND("容器不存在",61),
    CONTAINER_STATUS_REFUSE("容器状态拒绝操作",62),
    CONTAINER_START_ERROR("容器启动失败",63),
    USER_AUTHORITY_ERROR("用户身份获取失败",64),
    CONTAINER_ALREADY_START("容器正运行，操作被拒绝",65),
    CONTAINER_ALREADY_PAUSE("容器已经暂停，操作被拒绝",66),
    CONTAINER_ALREADY_STOP("容器已经停止，操作被拒绝",67),
    CONTAINER_NOT_RUNNING("容器尚未运行，操作被拒绝",68),
    CONTAINER_STATUS_ERROR("容器状态错误",69),
    VOLUME_LIST_ERROR("获取数据卷列表失败",70),
    VOLUME_NOT_EXIST("数据卷不存在",71),
    VOLUME_UPLOAD_ERROR("数据卷上传失败",72),
    VOLUME_NOT_SUPPORT_VIEW("该数据卷不支持查看",73),
    VOLUME_INFO_ERROR("数据卷信息错误",74),
    VOLUME_OBJ_NOT_EXIST("数据卷目标对象不存在",75),
    NETWORK_NAME_EXIST("网络名已存在",80),
    NETWORK_NAME_ILLEGAL("网络名不合法，只能为字母或数字",81),
    NETWORK_HOST_EXIST("Host网络已存在，只允许存在一个",82),
    PUBLIC_NETWORK_CREATE_ERROR("公共网络创建失败",83),
    USER_NETWORK_CREATE_ERROR("用户网络创建失败",84),
    NETWORK_NOT_EXIST("网络不存在",85),
    DELETE_NETWORK_ERROR("删除网络错误",86),
    DELETE_NETWORK_ERROR_BY_BRIDGE("Bridge网络不支持删除，为预定义网络",87),
    CONNECT_NETWORK_ERROR("连接网络错误",88),
    DIS_CONNECT_NETWORK_ERROR("取消连接网络错误",89),
    NETWORK_CONNECT_REFUSED("网络连接拒绝，没有权限",90),
    NETWORK_DIS_CONNECT_REFUSED("网络取消连接拒绝，没有权限",91),
    CREATE_NETWORK_ERROR_BY_DRIVER("公共网络创建失败，Driver无效",92),
    DELETE_NETWORK_ERROR_BY_USED("删除网络错误,请先清空网络内容器或服务",93),
    CONTAINER_NETWORK_SYNC_ERROR("容器网络同步失败",94),
    SERVICE_NOT_FOUND("服务不存在",100),
    SERVICE_INSPECT_ERROR("服务查询失败",101),
    SERVICE_NAME_ILLEGAL("服务名不合法，只能为字母或数字",102),
    SERVICE_NAME_EXIST("服务名不合法，已经存在",103),
    SERVICE_SCALE_ERROR("服务横向扩展失败",104),
    SERVICE_CREATE_ERROR("服务创建失败",104),
    NOTICE_TITLE_OR_CONTENT_BLANK("通知标题或内容不能为空",110),
    NOTICE_TITLE_LENGTH_THAN_50("通知标题不能超过50个字符",111),
    NOTICE_TYPE_ERROR("通知类型错误",112),
    NOTICE_RECEIVER_NOT_EMPTY("通知接收用户不能为空",113),
    NOTICE_READ_ERROR("读取通知错误",114),
    NOTICE_CONTENT_LENGTH_THAN_65535("通知内容不能超过65535个字符", 115);

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