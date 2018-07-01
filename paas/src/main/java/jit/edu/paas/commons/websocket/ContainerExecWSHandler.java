package jit.edu.paas.commons.websocket;

import com.spotify.docker.client.DockerClient;
import com.spotify.docker.client.messages.ExecCreation;
import jit.edu.paas.commons.util.DockerHelper;
import jit.edu.paas.commons.util.JsonUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.HashMap;
import java.util.Map;

/**
 * 连接容器，并进行操作
 *
 * @author jitwxs
 * @since 2018/7/1 14:09
 */
@Component
public class ContainerExecWSHandler extends TextWebSocketHandler {
    private Map<String, ExecSession> execSessionMap = new HashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        //获得传参
        String ip = session.getAttributes().get("ip").toString();
        String port = session.getAttributes().get("port").toString();
        String containerId = session.getAttributes().get("containerId").toString();
        String width = session.getAttributes().get("width").toString();
        String height = session.getAttributes().get("height").toString();

        //创建Bash
        String execId = createExec(ip, port, containerId);
        //连接bash
        Socket socket = connectExec(ip, port, execId);
        //获得输出
        getExecMessage(session, ip, containerId, socket);
        //修改tty大小
        resizeTty(ip, port, width, height, execId);
    }

    /**
     * 创建Bash
     *
     * @param ip 宿主机ip地址
     * @param port 宿主机Remote端口
     * @param containerId 容器id
     * @return 命令ID
     * @author jitwxs
     * @since 2018/7/1 14:13
     */
    private String createExec(String ip, String port, String containerId) throws Exception {
        return DockerHelper.query(ip, port, docker -> {
            ExecCreation execCreation = docker.execCreate(containerId, new String[]{"/bin/bash"},
                    DockerClient.ExecCreateParam.attachStdin(), DockerClient.ExecCreateParam.attachStdout(), DockerClient.ExecCreateParam.attachStderr(),
                    DockerClient.ExecCreateParam.tty(true));
            return execCreation.id();
        });
    }

    /**
     * 连接Bash
     *
     * @param ip     宿主机ip地址
     * @param port   宿主机Remote端口
     * @param execId 命令id
     * @return Socket连接对象
     * @author jitwxs
     * @since 2018/7/1 14:12
     */
    private Socket connectExec(String ip, String port, String execId) throws IOException {
        Socket socket = new Socket(ip, 2375);
        socket.setKeepAlive(true);

        OutputStream out = socket.getOutputStream();

        StringBuilder sb = new StringBuilder();
        sb.append("POST /exec/" + execId + "/start HTTP/1.1\r\n");
        sb.append("Host: " + ip + ":" + port + "\r\n");
        sb.append("User-Agent: Docker-Client\r\n");
        sb.append("Content-Type: application/json\r\n");
        sb.append("Connection: Upgrade\r\n");

        Map<String, Object> map = new HashMap<>(16);
        map.put("Detach", false);
        map.put("Tty", true);
        String json = JsonUtils.mapToJson(map);

        sb.append("Content-Length: " + json.length() + "\r\n");
        sb.append("Upgrade: tcp\r\n");
        sb.append("\r\n");
        sb.append(json);

        out.write(sb.toString().getBytes("UTF-8"));
        out.flush();

        return socket;
    }

    /**
     * 获得输出
     *
     * @param session     websocket session
     * @param ip          宿主机ip地址
     * @param containerId 容器id
     * @param socket      命令连接socket
     */
    private void getExecMessage(WebSocketSession session, String ip, String containerId, Socket socket) throws IOException {
        InputStream inputStream = socket.getInputStream();
        byte[] bytes = new byte[1024];
        StringBuffer returnMsg = new StringBuffer();
        while (true) {
            int n = inputStream.read(bytes);
            String msg = new String(bytes, 0, n);
            returnMsg.append(msg);
            bytes = new byte[10240];
            if (returnMsg.indexOf("\r\n\r\n") != -1) {
                session.sendMessage(new TextMessage(returnMsg.substring(returnMsg.indexOf("\r\n\r\n") + 4, returnMsg.length())));
                break;
            }
        }
        OutPutThread outPutThread = new OutPutThread(inputStream, session);
        outPutThread.start();
        execSessionMap.put(containerId, new ExecSession(ip, containerId, socket, outPutThread));
    }

    /**
     * 修改tty大小
     * @author jitwxs
     * @since 2018/7/1 14:21
     */
    private void resizeTty(String ip, String port, String width, String height, String execId) throws Exception {
        DockerHelper.execute(ip, port, docker -> {
            docker.execResizeTty(execId, Integer.parseInt(height), Integer.parseInt(width));
        });
    }

    /**
     * webSocket关闭后关闭线程
     * @author jitwxs
     * @since 2018/7/1 14:22
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        String containerId = session.getAttributes().get("containerId").toString();
        ExecSession execSession = execSessionMap.get(containerId);
        if (execSession != null) {
            execSession.getOutPutThread().interrupt();
        }
    }

    /**
     * 处理输入内容
     * @author jitwxs
     * @since 2018/7/1 14:22
     */
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String containerId = session.getAttributes().get("containerId").toString();
        ExecSession execSession = execSessionMap.get(containerId);
        OutputStream out = execSession.getSocket().getOutputStream();
        out.write(message.asBytes());
        out.flush();
    }
}
