package jit.edu.paas.config;

import jit.edu.paas.commons.util.jedis.JedisClientCluster;
import jit.edu.paas.commons.util.jedis.JedisClientPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.JedisCluster;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.Protocol;

import java.util.HashSet;
import java.util.Set;

/**
 * @author jitwxs
 * @date 2018/4/19 23:05
 */
@Configuration
public class JedisConfig {
//    /* 以下为单机版配置 **/
//    @Value("${redis.standalone.host}")
//    private String STANDALONE_HOST;
//
//    @Value("${redis.standalone.port}")
//    private Integer STANDALONE_PORT;
//
//    @Value("${redis.standalone.password}")
//    private String STANDALONE_PASSWORD;
//
//    @Bean
//    public JedisClientPool jedisClientPool() {
//        JedisClientPool jedisClientPool = new JedisClientPool();
//        jedisClientPool.setJedisPool(jedisPool());
//
//        return jedisClientPool;
//    }
//
//    @Bean
//    public JedisPool jedisPool() {
//        return new JedisPool(new GenericObjectPoolConfig(), STANDALONE_HOST, STANDALONE_PORT,
//                Protocol.DEFAULT_TIMEOUT, STANDALONE_PASSWORD, Protocol.DEFAULT_DATABASE, null);
//    }

    /* 以下为集群版配置 **/

    @Value("${redis.cluster.01.host}")
    private String cluster01Host;
    @Value("${redis.cluster.01.port}")
    private Integer cluster01Port;
    @Value("${redis.cluster.02.host}")
    private String cluster02Host;
    @Value("${redis.cluster.02.port}")
    private Integer cluster02Port;
    @Value("${redis.cluster.03.host}")
    private String cluster03Host;
    @Value("${redis.cluster.03.port}")
    private Integer cluster03Port;
    @Value("${redis.cluster.04.host}")
    private String cluster04Host;
    @Value("${redis.cluster.04.port}")
    private Integer cluster04Port;
    @Value("${redis.cluster.05.host}")
    private String cluster05Host;
    @Value("${redis.cluster.05.port}")
    private Integer cluster05Port;
    @Value("${redis.cluster.06.host}")
    private String cluster06Host;
    @Value("${redis.cluster.06.port}")
    private Integer cluster06Port;

    @Bean
    public JedisClientCluster jedisClientCluster() {
        JedisClientCluster cluster = new JedisClientCluster();
        cluster.setJedisCluster(jedisCluster());
        return cluster;
    }

    @Bean
    public JedisCluster jedisCluster() {
        Set<HostAndPort> set = new HashSet<>();
        set.add(new HostAndPort(cluster01Host, cluster01Port));
        set.add(new HostAndPort(cluster02Host, cluster02Port));
        set.add(new HostAndPort(cluster03Host, cluster03Port));
        set.add(new HostAndPort(cluster04Host, cluster04Port));
        set.add(new HostAndPort(cluster05Host, cluster05Port));
        set.add(new HostAndPort(cluster06Host, cluster06Port));

        return new JedisCluster(set);
    }
}