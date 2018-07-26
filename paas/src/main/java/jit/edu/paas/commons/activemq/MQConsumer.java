package jit.edu.paas.commons.activemq;

import jit.edu.paas.commons.util.JsonUtils;
import jit.edu.paas.commons.util.jedis.JedisClient;
import jit.edu.paas.commons.websocket.WebSocketServer;
import jit.edu.paas.domain.entity.SysLogin;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.service.SysLoginService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * MQ消费者
 * @author jitwxs
 * @since 2018/6/29 17:14
 */
@Slf4j
@Component
public class MQConsumer {
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private WebSocketServer webSocketServer;
    @Autowired
    private JedisClient jedisClient;
    private final String key = "session" ;
    private final String ID_PREFIX = "UID:";

    /**
     * 接收邮箱注册消息
     * @author jitwxs
     * @since 2018/7/9 16:05
     */
    @JmsListener(destination = "MQ_QUEUE_REGISTER")
    public void receiveRegister(String text) {
        if(StringUtils.isNotBlank(text)){
            Task task = JsonUtils.jsonToObject(text, Task.class);

            Map<String, String> map = task.getData();
            String email = map.get("email");
            log.info("验证未激活邮箱，目标邮箱：{}", email);

            SysLogin login = loginService.getByEmail(email);
            if(login != null && login.getHasFreeze()) {
                loginService.deleteById(login);
            }
        }
    }

    /**
     * 接收容器信息
     * @author jitwxs
     * @since 2018/7/9 17:08
     */
    @JmsListener(destination = "MQ_QUEUE_CONTAINER")
    public void receiveContainer(String text) {
        if (StringUtils.isNotBlank(text)) {
            Task task = JsonUtils.jsonToObject(text, Task.class);

            Map<String, String> map = task.getData();
            String userId = map.get("uid");

            String field = ID_PREFIX + userId;
            try {
                String sessionId = jedisClient.hget(key, field);
                if (StringUtils.isNotBlank(sessionId)) {
                    webSocketServer.sendMessage(map.get("data"), sessionId);
                } else {
                    throw new Exception("session未找到");
                }
            } catch (Exception e) {
                log.error("接收容器消息错误，错误位置：{}，错误信息：{}", "MQConsumer.receiveContainer()", e.getMessage());
            }
        }
    }

    /**
     * 接收系统镜像信息
     * @author jitwxs
     * @since 2018/7/9 17:08
     */
    @JmsListener(destination = "MQ_QUEUE_SYS_IMAGE")
    public void receiveSysImage(String text) {
        if (StringUtils.isNotBlank(text)) {
            Task task = JsonUtils.jsonToObject(text, Task.class);

            Map<String, String> map = task.getData();
            String userId = map.get("uid");

            String field = ID_PREFIX + userId;
            try {
                String sessionId = jedisClient.hget(key, field);
                if (StringUtils.isNotBlank(sessionId)) {
                    webSocketServer.sendMessage(map.get("data"), sessionId);
                } else {
                    throw new Exception("session未找到");
                }
            } catch (Exception e) {
                log.error("接收系统镜像消息错误，错误位置：{}，错误信息：{}", "MQConsumer.receiveSysImage()", e.getMessage());
            }
        }
    }

    /**
     * 接收HUB镜像信息
     * @author jitwxs
     * @since 2018/7/9 17:08
     */
    @JmsListener(destination = "MQ_QUEUE_HUB_IMAGE")
    public void receiveHubImage(String text) {
        if (StringUtils.isNotBlank(text)) {
            Task task = JsonUtils.jsonToObject(text, Task.class);

            Map<String, String> map = task.getData();
            String userId = map.get("uid");

            String field = ID_PREFIX + userId;
            try {
                String sessionId = jedisClient.hget(key, field);
                if (StringUtils.isNotBlank(sessionId)) {
                    webSocketServer.sendMessage(map.get("data"), sessionId);
                } else {
                    throw new Exception("session未找到");
                }
            } catch (Exception e) {
                log.error("接收HUB镜像消息错误，错误位置：{}，错误信息：{}", "MQConsumer.receiveHubImage()", e.getMessage());
            }
        }
    }

    /**
     * 接收服务信息
     * @author hf
     * @since 2018/7/13 17:08
     */
    @JmsListener(destination = "MQ_QUEUE_SERVICE")
    public void receiveService(String text) {
        if (StringUtils.isNotBlank(text)) {
            Task task = JsonUtils.jsonToObject(text, Task.class);

            Map<String, String> map = task.getData();
            String userId = map.get("uid");
            ResultVO resultVO = JsonUtils.jsonToObject(map.get("data"), ResultVO.class);

            String field = ID_PREFIX + userId;
            try {
                String sessionId = jedisClient.hget(key, field);
                if (StringUtils.isNotBlank(sessionId)) {
                    webSocketServer.sendMessage(JsonUtils.objectToJson(resultVO), sessionId);
                } else {
                    throw new Exception("session未找到");
                }
            } catch (Exception e) {
                log.error("接收服务消息错误，错误位置：{}，错误信息：{}", "MQConsumer.receiveService()", e.getMessage());
            }
        }
    }

    /**
     * 接收通知信息
     * @author hf
     * @since 2018/7/13 17:08
     */
    @JmsListener(destination = "MQ_QUEUE_NOTICE")
    public void receiveNotice(String text) {
        if (StringUtils.isNotBlank(text)) {
            Task task = JsonUtils.jsonToObject(text, Task.class);

            Map<String, String> map = task.getData();
            String userId = map.get("uid");
            ResultVO resultVO = JsonUtils.jsonToObject(map.get("data"), ResultVO.class);

            String field = ID_PREFIX + userId;
            try {
                String sessionId = jedisClient.hget(key, field);
                if (StringUtils.isNotBlank(sessionId)) {
                    webSocketServer.sendMessage(JsonUtils.objectToJson(resultVO), sessionId);
                } else {
                    throw new Exception("session未找到");
                }
            } catch (Exception e) {
                log.error("接收通知消息错误，错误位置：{}，错误信息：{}", "MQConsumer.receiveService()", e.getMessage());
            }
        }
    }

    /**
     * 接收数据卷信息
     * @author hf
     * @since 2018/7/13 17:08
     */
    @JmsListener(destination = "MQ_QUEUE_VOLUME")
    public void receiveVolume(String text) {
        if (StringUtils.isNotBlank(text)) {
            Task task = JsonUtils.jsonToObject(text, Task.class);

            Map<String, String> map = task.getData();
            String userId = map.get("uid");
            ResultVO resultVO = JsonUtils.jsonToObject(map.get("data"), ResultVO.class);

            String field = ID_PREFIX + userId;
            try {
                String sessionId = jedisClient.hget(key, field);
                if (StringUtils.isNotBlank(sessionId)) {
                    webSocketServer.sendMessage(JsonUtils.objectToJson(resultVO), sessionId);
                } else {
                    throw new Exception("session未找到");
                }
            } catch (Exception e) {
                log.error("接收通知消息错误，错误位置：{}，错误信息：{}", "MQConsumer.接收到消息()", e.getMessage());
            }
        }
    }
}