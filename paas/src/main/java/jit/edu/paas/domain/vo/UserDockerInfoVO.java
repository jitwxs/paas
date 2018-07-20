package jit.edu.paas.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @author jitwxs
 * @since 2018/7/9 23:54
 */
@Data
public class UserDockerInfoVO {
    /**
     * 最后登录时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date lastLogin;

    /**
     * 最后登录IP
     */
    private String ip;

    /**
     * 项目数
     */
    private Integer projectNum;
    /**
     * 容器数目
     */
    private Integer containerNum;
    /**
     * 容器运行数目
     */
    private Integer containerRunningNum;
    /**
     * 容器暂停数目
     */
    private Integer containerPauseNum;
    /**
     * 容器停止数目
     */
    private Integer containerStopNum;
    /**
     * 上传镜像数目
     */
    private Integer uploadImageNum;
    /**
     * Hub镜像数目
     */
    private Integer hubImageNum;
    /**
     * 服务数目
     */
    private Integer serviceNum;
}
