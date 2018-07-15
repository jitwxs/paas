package jit.edu.paas.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.spotify.docker.client.LogStream;
import com.spotify.docker.client.messages.swarm.Service;
import jit.edu.paas.domain.dto.UserServiceDTO;
import jit.edu.paas.domain.entity.UserService;
import jit.edu.paas.domain.vo.ResultVO;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * <p>
 * 用户服务表 服务类
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-11
 */
public interface UserServiceService extends IService<UserService> {
    /**
     * 获取服务信息
     * @author hf
     * @since 2018/7/13 9:20
     */
    UserServiceDTO getById(String id);

    /**
     * 检查权限
     * @author hf
     * @since 2018/7/13 9:25
     */
    ResultVO checkPermission(String userId, String serviceId);

    /**
     * 获取用户所有服务
     * @author hf
     * @since 2018/7/13 9:25
     */
    Page<UserServiceDTO> listUserServiceByUserId(String userId, Page<UserService> page);

    /**
     * 查询服务详情
     * @author hf
     * @since 2018/7/13 9:25
     */
    Service inspectById(String id);

    /**
     * 校验服务名
     * （1）只能由数字+字母组成
     * （2）用户名 - 服务名，组成，确保唯一
     * @author jitwxs
     * @since 2018/7/15 14:05
     */
    ResultVO checkServiceName(String serviceName, String userId);

    /**
     * 创建服务任务
     * @author hf
     * @since 2018/7/1 16:00
     */
    void createServiceTask(String userId, String imageId, String[] cmd, Map<String,String> portMap, int replicas,
                           String serviceName, String projectId, String[] env, String source,
                           String destination, Map<String,String> labels, HttpServletRequest request);

    /**
     * 删除服务任务
     * @author hf
     * @since 2018/7/13 16:06
     */
    void deleteServiceTask(String userId, String serviceId, HttpServletRequest request);

    /**
     * 查看服务日志
     * @author hf
     * @since 2018/7/13 9:25
     */
    LogStream logById(String id);
}