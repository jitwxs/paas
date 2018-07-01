package jit.edu.paas.commons.websocket;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.net.Socket;

/**
 * WebSocket Session实体
 * 用户区分不同的连接
 * @author jitwxs
 * @since 2018/7/1 14:22
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExecSession {
    private String ip;
    private String containerId;
    private Socket socket;
    private OutPutThread outPutThread;
}
