package jit.edu.paas.service;

/**
 * @author jitwxs
 * @since 2018/7/2 10:09
 */
public interface PortService {
    /**
     * 判断指定端口是否被占用
     * @author jitwxs
     * @since 2018/7/2 10:19
     */
    boolean hasUse(Integer port);

    /**
     * 返回一个可用端口
     * 端口范围：10000 ~65535
     * @author jitwxs
     * @since 2018/7/2 10:20
     */
    Integer randomPort();
}
