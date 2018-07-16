package jit.edu.paas.commons.schedule;

import jit.edu.paas.domain.entity.UserContainer;
import jit.edu.paas.domain.enums.ContainerStatusEnum;
import jit.edu.paas.service.MonitorService;
import jit.edu.paas.service.UserContainerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 监控任务
 * @author jitwxs
 * @since 2018/7/8 11:21
 */
@Component
public class MonitorSchedule {
    @Autowired
    private UserContainerService containerService;
    @Autowired
    private MonitorService monitorService;

    /**
     * 保存容器监控日志
     * 从0s开始，每隔5s
     * @author jitwxs
     * @since 2018/7/9 13:44
     */
    @Scheduled(cron = "0/5 * * * * ? ")
    public void saveContainerMonitorLog() {
        LocalDateTime time = LocalDateTime.now();

        // 获取所有启动的容器列表
        List<UserContainer> containers = containerService.listByStatus(ContainerStatusEnum.RUNNING);
        for(UserContainer container : containers) {
            // 实时监控，粒度：5s
            if(time.getSecond() % 5 == 0) {
                monitorService.setMonitorInfo(container.getId(), 1);
            }
            // 24小时监控，粒度：5分钟
            if(time.getSecond() % 5 == 0) {
                monitorService.setMonitorInfo(container.getId(), 2);
            }
            // 7日监控，粒度：1小时
            if(time.getMinute() == 0 && time.getSecond() == 0) {
                monitorService.setMonitorInfo(container.getId(), 3);
            }
        }
    }
}