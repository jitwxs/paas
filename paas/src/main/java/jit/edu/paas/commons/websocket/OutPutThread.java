package jit.edu.paas.commons.websocket;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.io.InputStream;

/**
 * 输出线程
 * 使用线程输出，方式流等待卡住
 * @author jitwxs
 * @since 2018/7/1 14:23
 */
public class OutPutThread extends Thread {
    private InputStream inputStream;
    private WebSocketSession session;

    public OutPutThread(InputStream inputStream, WebSocketSession session){
        super("OutPut"+ System.currentTimeMillis());
        this.session=session;
        this.inputStream=inputStream;
    }

    @Override
    public void run() {
        try{
            byte[] bytes=new byte[1024];
            while(!this.isInterrupted()){
                int n=inputStream.read(bytes);

                // 当n=-1时，代表连接关闭，例如用户输入exit
                if( n == -1) {
                    session.close();
                    return;
                }

                String msg=new String(bytes,0,n);
                session.sendMessage(new TextMessage(msg));
                bytes=new byte[1024];
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
