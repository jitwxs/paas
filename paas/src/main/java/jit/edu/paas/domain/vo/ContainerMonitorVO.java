package jit.edu.paas.domain.vo;

import lombok.Data;

/**
 * 容器监控VO
 * @author jitwxs
 * @since 2018/7/8 10:10
 */
@Data
public class ContainerMonitorVO {
    /**
     * 时间戳
     */
    private long timestamp;

    /* 网络相关 */
    /**
     * 网络入带宽
     * 描述：网卡的平均每秒入流量
     * 单位：Mbps
     */
    private double rxBytes;
    /**
     * 网络出带宽
     * 描述：网卡的平均每秒出流量
     * 单位：Mbps
     */
    private double txBytes;

    /**
     * 网络入包量
     * 描述：网卡的平均每秒入包量
     * 单位：个/秒
     */
    private int rxPackets;

    /**
     * 网络出包量
     * 描述：网卡的平均每秒出包量
     * 单位：个/秒
     */
    private int txPackets;

    /* CPU相关 */
    /**
     * CPU利用率
     * 描述：运行期间实时占用的CPU百分比
     * 单位：百分比
     */
    private double cpuUtilization;

    /* 内存相关 */
    /**
     * 内存使用量
     * 描述：使用的内存量，不包含系统缓冲区和缓存占用内存
     * 单位：Mb
     */
    private double memoryUsage;

    /**
     * 内存限制
     * 描述：可使用的内存上限
     * 单位：Mb
     */
    private double memoryLimit;
    /**
     * 内存使用率
     * 描述：用户实际使用的内存量与总内存量之比，不包含系统缓冲区和缓存占用内存
     * 单位：百分比
     */
    private double memoryUtilization;

    /* IO相关 */
    /**
     * 本地读流量
     * 描述：平均每秒从硬盘读到内存的流量
     * 单位：MB
     */
    private double blockRead;
    /**
     * 本地写流量
     * 描述：平均每秒从内存写道硬盘的流量
     * 单位：MB
     */
    private double blockWrite;
}
