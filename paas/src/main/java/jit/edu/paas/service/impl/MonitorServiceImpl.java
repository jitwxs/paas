package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.spotify.docker.client.DockerClient;
import com.spotify.docker.client.messages.ContainerStats;
import com.spotify.docker.client.messages.Info;
import com.spotify.docker.client.messages.NetworkStats;
import com.spotify.docker.client.messages.swarm.Node;
import jit.edu.paas.commons.util.*;
import jit.edu.paas.commons.util.jedis.JedisClient;
import jit.edu.paas.domain.entity.RepositoryImage;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.entity.UserProject;
import jit.edu.paas.domain.entity.UserService;
import jit.edu.paas.domain.enums.ContainerStatusEnum;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.*;
import jit.edu.paas.mapper.RepositoryImageMapper;
import jit.edu.paas.mapper.UserContainerMapper;
import jit.edu.paas.mapper.UserProjectMapper;
import jit.edu.paas.mapper.UserServiceMapper;
import jit.edu.paas.service.MonitorService;
import jit.edu.paas.service.SysImageService;
import jit.edu.paas.service.UserContainerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author jitwxs
 * @since 2018/7/8 16:20
 */
@Service
@Slf4j
public class MonitorServiceImpl implements MonitorService {
    @Autowired
    private UserProjectMapper userProjectMapper;
    @Autowired
    private UserContainerMapper containerMapper;
    @Autowired
    private UserContainerService containerService;
    @Autowired
    private SysImageService sysImageService;
    @Autowired
    private RepositoryImageMapper repositoryImageMapper;
    @Autowired
    private UserServiceMapper userServiceMapper;

    @Autowired
    private DockerClient dockerClient;
    @Autowired
    private DockerClient dockerSwarmClient;
    @Autowired
    private JedisClient jedisClient;

    @Value("${redis.monitor-actual.prefix}")
    private String ACTUAL_PREFIX;
    @Value("${redis.monitor-day.prefix}")
    private String DAY_PREFIX;
    @Value("${redis.monitor-week.prefix}")
    private String WEEK_PREFIX;

    /**
     * 如果某个容器多次无法获取信息，就有可能状态发生改变，需要检测状态
     */
    private Map<String, Integer> map = new ConcurrentHashMap<>();

    @Override
    public ContainerMonitorVO getCurrentInfo(String containerId) {
        ContainerStats stats;
        try {
            stats = dockerClient.stats(containerId);
            if(stats.read().getTime() < 0 ) {
                throw new Exception("读取信息错误");
            }
        } catch (Exception e) {
            log.error("获取实时监控数据异常，错误位置：{}，容器ID：{}",
                    "MonitorServiceImpl.getCurrentInfo", containerId);

            if(map.containsKey(containerId)) {
                Integer times = map.get(containerId);
                if(times > 3) {
                    containerService.changeStatus(containerId);
                    times -= 3;
                }
                map.put(containerId, times + 1);
            } else {
                map.put(containerId, 1);
            }
            return null;
        }

        ContainerMonitorVO monitorVo = new ContainerMonitorVO();

        monitorVo.setTimestamp(stats.read().getTime());

        // 1、设置网络相关
        double rxBytes = 0, txBytes = 0;
        int rxPackets = 0, txPackets = 0;
        try {
            ImmutableMap<String, NetworkStats> networks = stats.networks();
            if(networks != null) {
                for (Map.Entry<String, NetworkStats> entry : networks.entrySet()) {
                    NetworkStats networkStats = entry.getValue();
                    rxBytes += networkStats.rxBytes();
                    txBytes += networkStats.txBytes();
                    rxPackets += networkStats.rxPackets();
                    txPackets += networkStats.txPackets();
                }
            }
        } catch (Exception e) {}

        // bps --> Mbps，保留三位小数
        monitorVo.setRxBytes(NumberUtils.decimal3Bit(rxBytes / 1048576));
        monitorVo.setTxBytes(NumberUtils.decimal3Bit(txBytes / 1048576));
        monitorVo.setRxPackets(rxPackets);
        monitorVo.setTxPackets(txPackets);

        // 2、设置CPU利用率
        double cpuUtilization = 0;
        try {
            double systemCpuUsage = stats.cpuStats().systemCpuUsage();
            double totalUsage = stats.cpuStats().cpuUsage().totalUsage();
            cpuUtilization = totalUsage / systemCpuUsage * 100;
        } catch (Exception e) {}

        // 保留三位小数
        monitorVo.setCpuUtilization(NumberUtils.decimal3Bit(cpuUtilization));

        // 3、设置内存相关
        double memoryUsage = 0, memoryLimit = 0, memoryUtilization = 0;
        try {
            memoryUsage = stats.memoryStats().stats().activeAnon();
            memoryLimit = stats.memoryStats().limit();
            memoryUtilization = memoryUsage / memoryLimit * 100;
        } catch (Exception e) {}
        // bit --> Mb，保留三位小数
        monitorVo.setMemoryUsage(NumberUtils.decimal3Bit(memoryUsage / 1048576));
        monitorVo.setMemoryLimit(NumberUtils.decimal3Bit(memoryLimit / 1048576));
        monitorVo.setMemoryUtilization(NumberUtils.decimal3Bit(memoryUtilization));

        // 4、IO相关
        double blockRead = 0, blockWrite = 0;
        try {
            ImmutableList<Object> recursive = stats.blockIoStats().ioServiceBytesRecursive();
            if(recursive != null) {
                for(Object obj : recursive) {
                    Map<String, Object> map = (Map<String, Object>) obj;

                    String op = (String) map.get("op");
                    switch (op) {
                        case "Read":
                            blockRead += (int)map.get("value");
                            break;
                        case "Write":
                            blockWrite += (int)map.get("value");
                            break;
                        default:
                            break;
                    }
                }
            }
        } catch (Exception e) {}

        // B -> MB，保留三位小数
        monitorVo.setBlockRead(NumberUtils.decimal3Bit(blockRead / 1048576));
        monitorVo.setBlockWrite(NumberUtils.decimal3Bit(blockWrite / 1048576));

        return monitorVo;
    }

    @Override
    public boolean setMonitorInfo(String containerId, Integer type) {
        try {
            ContainerMonitorVO currentInfo = getCurrentInfo(containerId);
            if(currentInfo == null) {
                return false;
            }

            double nowScore = (double) (currentInfo.getTimestamp()), endScore;
            String member = JsonUtils.objectToJson(currentInfo), key;
            switch (type) {
                case 1:
                    // 清理过期数据
                    key = ACTUAL_PREFIX + containerId;
                    endScore = nowScore - 15 * 60 * 1000;
                    jedisClient.zremrangeByScore(key,0,endScore);
                    // 插入记录
                    jedisClient.zadd(key, nowScore, member);
                    break;
                case 2:
                    // 清理过期数据
                    key = DAY_PREFIX + containerId;
                    endScore = nowScore - 60 * 60 * 24 * 1000;
                    jedisClient.zremrangeByScore(key,0,endScore);
                    // 插入记录
                    jedisClient.zadd(key, nowScore, member);
                    break;
                case 3:
                    // 清理过期数据
                    key = WEEK_PREFIX + containerId;
                    endScore = nowScore - 60 * 60 * 24 * 7 * 1000;
                    jedisClient.zremrangeByScore(key,0,endScore);
                    // 插入记录
                    jedisClient.zadd(key, nowScore, member);
                    break;
                default:
                    throw new Exception("参数错误");
            }

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 显示最近15分钟的数据
     * 数据粒度：5s
     * @author jitwxs
     * @since 2018/7/8 16:57
     */
    @Override
    public ResultVO getActualMonitor(String containerId) {
        try {
            String key = ACTUAL_PREFIX + containerId;
            // 1、根据当前时间戳，获取最近15分钟的所有数据
            // 获取当前到15分钟前的秒区间
            double endSeconds = (double)(System.currentTimeMillis());
            double startSeconds = endSeconds - 15 * 60 * 1000;
            // 取出区间内的所有数据
            Set<String> set = jedisClient.zrangeByScore(key, startSeconds, endSeconds);

            return ResultVOUtils.success(set);
        } catch (Exception e) {
            log.error("获取实时监控数据异常，错误位置：{}，错误栈：{}",
                    "MonitorServiceImpl.getActualMonitor", HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.MONITOR_DATA_ERROR);
        }
    }

    /**
     * 显示最近24小时的数据
     * 数据粒度：5分钟
     * @author jitwxs
     * @since 2018/7/8 20:34
     */
    @Override
    public ResultVO getTodayMonitor(String containerId) {
        try {
            String key = DAY_PREFIX + containerId;
            // 1、根据当前时间戳，获取最近24小时的所有数据
            // 获取当前到24小时前的秒区间
            double endSeconds = (double)(System.currentTimeMillis());
            double startSeconds = endSeconds - 60 * 60 * 24 * 1000;
            // 取出区间内的所有数据
            Set<String> set = jedisClient.zrangeByScore(key, startSeconds, endSeconds);

            return ResultVOUtils.success(set);
        } catch (Exception e) {
            log.error("获取24小时监控数据异常，错误位置：{}，错误栈：{}",
                    "MonitorServiceImpl.getTodayMonitor", HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.MONITOR_DATA_ERROR);
        }
    }

    /**
     * 显示最近7日的数据
     * 数据粒度：1小时
     * @author jitwxs
     * @since 2018/7/8 20:36
     */
    @Override
    public ResultVO getWeekMonitor(String containerId) {
        try {
            String key = WEEK_PREFIX + containerId;
            // 1、根据当前时间戳，获取最近7日的所有数据
            // 获取当前到7日前的秒区间
            double endSeconds = (double)(System.currentTimeMillis());
            double startSeconds = endSeconds - 60 * 60 * 24 * 7 * 1000;
            // 取出区间内的所有数据
            Set<String> set = jedisClient.zrangeByScore(key, startSeconds, endSeconds);

            return ResultVOUtils.success(set);
        } catch (Exception e) {
            log.error("获取7日监控数据异常，错误位置：{}，错误栈：{}",
                    "MonitorServiceImpl.getTodayMonitor", HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.MONITOR_DATA_ERROR);
        }
    }

    @Override
    public ResultVO getDockerInfo() {
        try {
            Info info = dockerClient.info();
            List<Node> nodes = dockerSwarmClient.listNodes();
            List<com.spotify.docker.client.messages.swarm.Service> services = dockerSwarmClient.listServices();

            DockerInfoVO infoVO = genDockerInfoVO(info);
            infoVO.setNodes(genDockerNodeInfoVO(nodes));
            infoVO.setServiceNum(services.size());

            return ResultVOUtils.success(infoVO);
        } catch (Exception e) {
            log.error("读取Docker宿主机信息错误，错误位置：{}，错误栈：{}",
                    "MonitorServiceImpl.getDockerInfo()", HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    public ResultVO getUserDockerInfo(String uid) {
        UserDockerInfoVO infoVO = new UserDockerInfoVO();

        infoVO.setContainerNum(containerMapper.countByUserId(uid, null));
        infoVO.setContainerRunningNum(containerMapper.countByUserId(uid, ContainerStatusEnum.RUNNING.getCode()));
        infoVO.setContainerPauseNum(containerMapper.countByUserId(uid, ContainerStatusEnum.PAUSE.getCode()));
        infoVO.setContainerStopNum(containerMapper.countByUserId(uid, ContainerStatusEnum.STOP.getCode()));

        infoVO.setHubImageNum(repositoryImageMapper.selectCount(new EntityWrapper<RepositoryImage>().eq("user_id", uid)));
        infoVO.setProjectNum(userProjectMapper.selectCount(new EntityWrapper<UserProject>().eq("user_id", uid)));
        infoVO.setUploadImageNum(sysImageService.selectCount(new EntityWrapper<SysImage>().eq("user_id", uid)));
        infoVO.setServiceNum(userServiceMapper.selectCount(new EntityWrapper<UserService>().eq("user_id", uid)));

        try {
            String hget = jedisClient.hget("last_login", uid);
            if(StringUtils.isNotBlank(hget)) {
                Map<String,String> map = JsonUtils.jsonToMap(hget);
                Long timestamp = Long.parseLong(map.get("timestamp"));
                String ip = map.get("ip");
                infoVO.setLastLogin(new Date(timestamp));
                infoVO.setIp(ip);
            }
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：{}", "MonitorServiceImpl.getUserDockerInfo()");
        }

        return ResultVOUtils.success(infoVO);
    }

    /**
     * Info --> DockerInfoVO
     * @author jitwxs
     */
    private DockerInfoVO genDockerInfoVO(Info info) {
        DockerInfoVO infoVO = new DockerInfoVO();

        infoVO.setHostName(info.name());
        infoVO.setArchitecture(info.architecture());
        infoVO.setOsName(info.operatingSystem());
        infoVO.setCupNum(info.cpus());
        infoVO.setMemorySize(NumberUtils.decimal2Bit((double)(info.memTotal()) / 1024 /1024 / 1024));

        infoVO.setDockerVersion(info.serverVersion());
        infoVO.setImageNum(info.images());
        infoVO.setContainerNum(info.containers());
        infoVO.setContainerRunningNum(info.containersRunning());
        infoVO.setContainerPauseNum(info.containersPaused());
        infoVO.setContainerStopNum(info.containersStopped());

        infoVO.setTime(new Date());

        return infoVO;
    }

    /**
     * Node --> DockerNodeInfoVO
     * @author jitwxs
     */
    private List<DockerNodeInfoVO> genDockerNodeInfoVO(List<Node> nodes) {
        if(nodes == null || nodes.size() == 0) {
            return null;
        }

        List<DockerNodeInfoVO> list = new ArrayList<>();
        for(Node node : nodes) {
            DockerNodeInfoVO nodeInfoVO = new DockerNodeInfoVO();

            nodeInfoVO.setHostName(node.description().hostname());
            nodeInfoVO.setArchitecture(node.description().platform().architecture());
            nodeInfoVO.setDockerVersion(node.description().engine().engineVersion());
            nodeInfoVO.setState(node.status().state());
            nodeInfoVO.setIp(node.status().addr());
            nodeInfoVO.setHasLeader(node.managerStatus() != null);

            list.add(nodeInfoVO);
        }

        return list;
    }
}