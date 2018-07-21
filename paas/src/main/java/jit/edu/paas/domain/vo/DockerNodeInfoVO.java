package jit.edu.paas.domain.vo;

import lombok.Data;

/**
 * Docker Node节点信息
 */
@Data
public class DockerNodeInfoVO {
    /**
     * 主机名
     */
    private String hostName;
    /**
     * 架构
     */
    private String architecture;
    /**
     * docker版本
     */
    private String dockerVersion;
    /**
     * IP
      */
    private String ip;
    /**
     * 状态
     */
    private String state;
    /**
     * 是否是Leader
     */
    private Boolean hasLeader;
}
