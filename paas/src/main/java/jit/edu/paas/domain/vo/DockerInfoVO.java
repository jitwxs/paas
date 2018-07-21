package jit.edu.paas.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * Docker信息VO
 * @author jitwxs
 * @since 2018/7/9 13:54
 */
@Data
public class DockerInfoVO {
    /* 主机信息 */
    /**
     * 主机名
     */
    private String hostName;
    /**
     * 架构
     */
    private String architecture;
    /**
     * 操作系统
     */
    private String osName;
    /**
     * CPU数目
     */
    private Integer cupNum;
    /**
     * 内存大小
     * 单位：GB
     */
    private Double memorySize;

    /* Docker 信息 */
    /**
     * Docker版本
     */
    private String dockerVersion;
    /**
     * 镜像数目
     */
    private Integer imageNum;
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

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date time;

    /**
     * Swarm节点信息
     */
    private List<DockerNodeInfoVO> nodes;

    /**
     * 运行服务数
     */
    private Integer serviceNum;
}
