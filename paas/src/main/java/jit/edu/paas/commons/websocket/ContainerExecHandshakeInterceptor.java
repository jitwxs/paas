package jit.edu.paas.commons.websocket;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import java.util.Map;

/**
 * WebSocket拦截器
 * 获取前台传递的参数
 *
 * @author jitwxs
 * @since 2018/7/1 10:48
 */
public class ContainerExecHandshakeInterceptor extends HttpSessionHandshakeInterceptor {
    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
                                   Map<String, Object> attributes) throws Exception {
        if (request.getHeaders().containsKey("Sec-WebSocket-Extensions")) {
            request.getHeaders().set("Sec-WebSocket-Extensions", "permessage-deflate");
        }

        String ip = ((ServletServerHttpRequest) request).getServletRequest().getParameter("ip");
        String port = ((ServletServerHttpRequest) request).getServletRequest().getParameter("port");
        String containerId = ((ServletServerHttpRequest) request).getServletRequest().getParameter("containerId");
        String width = ((ServletServerHttpRequest) request).getServletRequest().getParameter("width");
        String height = ((ServletServerHttpRequest) request).getServletRequest().getParameter("height");
        attributes.put("ip", ip);
        attributes.put("port", port);
        attributes.put("containerId", containerId);
        attributes.put("width", width);
        attributes.put("height", height);

        return super.beforeHandshake(request, response, wsHandler, attributes);
    }

    @Override
    public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
                               Exception ex) {
        super.afterHandshake(request, response, wsHandler, ex);
    }
}