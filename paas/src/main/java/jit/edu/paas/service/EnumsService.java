package jit.edu.paas.service;

import java.util.Map;

/**
 * 枚举Service
 * @author jitwxs
 * @since 2018/6/30 15:16
 */
public interface EnumsService {
    /**
     * 返回码列表
     * @author jitwxs
     * @since 2018/6/30 15:20
     */
    Map<Integer, String> listResultCode();

    /**
     * 日志类型列表
     * @author jitwxs
     * @since 2018/6/30 15:20
     */
    Map<Integer, String> listLogType();

    /**
     * 仓储类型列表
     * @author jitwxs
     * @since 2018/6/30 15:56
     */
    Map<Integer, String> listRepositoryType();

    /**
     * 镜像类型列表
     * @author jitwxs
     * @since 2018/6/30 15:56
     */
    Map<Integer, String > listImageType();

    /**
     * 容器状态列表
     * @author jitwxs
     * @since 2018/7/1 20:02
     */
    Map<Integer, String > listContainerStatus();
}
