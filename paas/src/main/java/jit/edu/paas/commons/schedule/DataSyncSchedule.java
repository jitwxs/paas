package jit.edu.paas.commons.schedule;

import jit.edu.paas.service.RepositoryImageService;
import jit.edu.paas.service.SysImageService;
import jit.edu.paas.service.UserContainerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 数据同步定时任务
 * @author jitwxs
 * @since 2018/7/9 13:41
 */
@Component
public class DataSyncSchedule {
    @Autowired
    private UserContainerService containerService;
    @Autowired
    private SysImageService sysImageService;
    @Autowired
    private RepositoryImageService repositoryImageService;

    /**
     * 同步容器状态
     * 启动后延迟1s执行，每15分钟执行一次
     * @author jitwxs
     * @since 2018/7/9 11:08
     */
    @Scheduled(initialDelay=1000, fixedRate=900_000)
    public void syncContainerStatus() {
        containerService.syncStatus(null);
    }

    /**
     * 同步系统镜像
     * 启动后延迟1s执行，每15分钟执行一次
     * @author jitwxs
     * @since 2018/7/9 11:08
     */
    @Scheduled(initialDelay=1000, fixedRate=900_000)
    public void syncSystemImage() {
        sysImageService.sync();
    }

    /**
     * 同步Hub镜像
     * 启动后延迟1s执行，每15分钟执行一次
     * @author jitwxs
     * @since 2018/7/9 11:08
     */
    @Scheduled(initialDelay=1000, fixedRate=900_000)
    public void syncHubImage() {
        repositoryImageService.sync();
    }
}
