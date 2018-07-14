package jit.edu.paas.commons.websocket;

import jit.edu.paas.commons.util.SpringBeanFactoryUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.commons.util.jedis.JedisClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;


/**
 * WebSocket服务器
 * @author jitwxs
 * @since 2018/7/9 16:08
 */
@ServerEndpoint(value = "/ws/{userId}")
@Component
@Slf4j
public class WebSocketServer {
    @Autowired
    private JedisClient jedisClient;

    private static HashMap<String, Session> webSocketSet = new HashMap<>();

    private final String key = "session";

    private final String ID_PREFIX = "UID:";

    private Session session;

    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("userId") String userId) {
        if (jedisClient == null) {
            jedisClient = SpringBeanFactoryUtils.getBean(JedisClient.class);
        }

        this.session = session;
        webSocketSet.put(session.getId(), session);
        String field = ID_PREFIX + userId;
        try {
            String res = jedisClient.hget(key, field);
            if (StringUtils.isNotBlank(res)) {
                //如果有，则删除原来的sessionId
                jedisClient.hdel(key, field);
            }
//            log.info("WebSocket连接建立成功，用户ID：{}", userId);
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：{}", "WebSocketServer.onOpen()");
        }

        try {
            jedisClient.hset(key, field, session.getId());
        } catch (Exception e) {
            log.error("缓存存储异常，错误位置：{}", "WebSocketServer.onOpen()");
        }
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(@PathParam("userId") String userId) {
        webSocketSet.remove(this.session.getId());
        String field = ID_PREFIX + userId;
        try {
            String res = jedisClient.hget(key, field);
            if (StringUtils.isNotBlank(res)) {
                //如果有，则删除原来的sessionId
                jedisClient.hdel(key, field);
            }
//            log.info("WebSocket连接关闭，用户ID：{}", userId);
        } catch (Exception e) {
            log.error("缓存读取异常，错误位置：{}", "WebSocketServer.OnClose()");
        }
    }

    /**
     * 连接出错调用的方法
     */
    @OnError
    public void onError(Throwable error) {
        log.error("WebSocket连接出错");
    }

    /**
     * 发送消息
     * @author jitwxs
     * @since 2018/7/9 16:55
     */
    public void sendMessage(String message, String sessionId) throws IOException {
        Session session = webSocketSet.get(sessionId);
        if(session != null) {
            session.getBasicRemote().sendText(message);
        } else {
            throw new IOException("WebSocket连接中断");
        }
    }
}
