package jit.edu.paas.commons.socket;

import lombok.Cleanup;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.Socket;

/**
 * 文件传输Client端<br>
 * @author hf
 * @date 2018/07/10
 */
public class FileTransferClient extends Socket {
    /**
     * 服务端IP
     */
    private static String SERVER_IP = "192.168.100.213";

    /**
     * 服务端端口
     */
    private static final int SERVER_PORT = 8899;

    private Socket client;

    /**
     * 与服务器建立连接
     */
    public FileTransferClient() throws IOException {
        super(SERVER_IP, SERVER_PORT);
        this.client = this;

        System.out.println("Client["+client.getLocalPort()+"] 成功连接服务端");
    }

    public FileTransferClient(String serverIp, Integer port) throws IOException {
        super(serverIp, port);
        this.client = this;

        System.out.println("Client["+client.getLocalPort()+"] 成功连接服务端");
    }

    private void sendFile(String sourcePath, String srcPath) throws IOException {
        File file = new File(sourcePath);
        if (file.exists()) {
            @Cleanup FileInputStream fis = new FileInputStream(file);
            @Cleanup DataOutputStream dos = new DataOutputStream(client.getOutputStream());

            // 发送文件名、文件大小、保存路径
            dos.writeUTF(file.getName());
            dos.flush();
            dos.writeLong(file.length());
            dos.flush();
            dos.writeUTF(srcPath);
            dos.flush();

            // 开始传输文件
            System.out.println("======== 开始传输文件 ========");
            byte[] bytes = new byte[1024];
            int len;
            long progress = 0;
            while ((len = fis.read(bytes, 0, bytes.length)) != -1) {
                dos.write(bytes, 0, len);
                dos.flush();
                progress += len;

//                System.out.println("| "+100 * progress / file.length()+"% |");
            }
            System.out.println("======== 文件传输成功 ========");
        } else {
            System.out.println("======== 文件不存在 ========");
        }
    }

    /**
     * 发送文件
     * @param fis 输入流
     * @param srcPath 保存路径
     * @param fileName 保存文件名
     * @param length 文件大小
     * @author jitwxs
     * @since 2018/7/11 14:18
     */
    private void sendFile(InputStream fis, String srcPath, String fileName, long length) throws IOException {
        @Cleanup DataOutputStream dos = new DataOutputStream(client.getOutputStream());

        // 发送文件名、文件大小、保存路径
        dos.writeUTF(fileName);
        dos.flush();
        dos.writeLong(length);
        dos.flush();
        dos.writeUTF(srcPath);
        dos.flush();

        // 开始传输文件
        System.out.println("======== 开始传输文件 ========");
        byte[] bytes = new byte[1024];
        int len;
        long progress = 0;
        while ((len = fis.read(bytes, 0, bytes.length)) != -1) {
            dos.write(bytes, 0, len);
            dos.flush();
            progress += len;

//            System.out.println("| "+100 * progress / length+"% |");
        }
        System.out.println("======== 文件传输成功 ========");
    }

    /**
     * 文件传输
     * @param srcPath 保存路径
     * @param file MultipartFile对象
     * @author jitwxs
     * @since 2018/7/11 14:10
     * @return -1：参数错误；其他：耗时
     */
    public int sendFile(String srcPath, MultipartFile file) throws IOException {
        // 文件传输
        long startTime = System.currentTimeMillis();

        String fileNames = file.getOriginalFilename();
        // 文件名
        fileNames = new String(fileNames.getBytes("UTF-8"));
        // 文件大小
        Long fileSize = file.getSize();
        sendFile(file.getInputStream(), srcPath, fileNames, fileSize);

        long endTime = System.currentTimeMillis();

        return (int)(endTime - startTime) / 1000;
    }

    public void closeClient() throws IOException {
        if(client != null) {
            client.close();
        }
    }

//    public static void main(String[] args) {
//        try {
//            // 启动客户端连接
//            FileTransferClient client = new FileTransferClient();
//            // 传输文件
//            client.sendFile("E:\\啊哈！算法.pdf", "/home/wxs");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
}