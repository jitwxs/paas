package jit.edu.paas.commons.util;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest;
import sun.misc.BASE64Encoder;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URLEncoder;
import java.util.*;
import java.util.List;

/**
 * @author jitwxs
 * @since 2018/6/16 21:02
 */
public class FileUtils extends org.apache.commons.io.FileUtils {
    /**
     * 重命名文件
     *
     * @param path    目录路径
     * @param oldName 源文件名
     * @param newName 目标文件名
     * @return true|false
     * @author jitwxs
     * @version 创建时间：2018年2月27日 上午10:59:33
     */
    public static boolean renameFile(String path, String oldName, String newName) {
        //新的文件名和以前文件名不同时,才有必要进行重命名
        if (!oldName.equals(newName)) {
            File oldfile = new File(path + "/" + oldName);
            File newfile = new File(path + "/" + newName);
            if (!oldfile.exists()) {
                System.out.println("重命名文件失败，" + oldName + "不存在！");
                return false;
            }
            //若在该目录下已经有一个文件和新文件名相同，则不允许重命名
            if (newfile.exists()) {
                System.out.println("重命名文件失败，" + newName + "已经存在！");
                return false;
            } else {
                oldfile.renameTo(newfile);
            }
        }
        return true;
    }

    /**
     * 获取指定路径下所有目录
     *
     * @author jitwxs
     * @since 2018/6/16 21:03
     */
    public static List<File> listDir(String path) {
        File file = new File(path);
        List<File> list = new ArrayList<>();
        // 如果这个路径是文件夹
        if (file.isDirectory()) {
            File[] files = file.listFiles();
            for (int i = 0; i < files.length; i++) {
                // 如果还是文件夹 递归获取里面的文件 文件夹
                if (files[i].isDirectory()) {
                    list.add(files[i]);
                }
            }
        }
        return list;
    }

    /**
     * 获取后缀名
     *
     * @author jitwxs
     * @since 2018/6/17 13:30
     */
    public static String getSuffix(String fileName) {
        if (!fileName.contains(".")) {
            return "";
        }
        String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
        suffix = suffix.toLowerCase();
        return suffix;
    }

    /**
     * 获取前缀名
     *
     * @author jitwxs
     * @since 2018/6/17 13:30
     */
    public static String getPrefix(String fileName) {
        if (!fileName.contains(".")) {
            return "";
        }
        String prefix = fileName.substring(0, fileName.lastIndexOf("."));
        return prefix;
    }

    /**
     * 获取文件修改时间
     *
     * @author jitwxs
     * @since 2018/6/17 17:16
     */
    public static Date getModifiedTime(File f) {
        long time = f.lastModified();
        return new Date(time);
    }

    /**
     * 调整图片大小
     *
     * @param srcImgPath  原图片路径
     * @param distImgPath 转换大小后图片路径
     * @param width       转换后图片宽度
     * @param height      转换后图片高度
     * @author jitwxs
     * @since 2018/6/17 21:54
     */
    public static void resizeImage(String srcImgPath, String distImgPath, int width, int height) throws IOException {
        File srcFile = new File(srcImgPath);
        Image srcImg = ImageIO.read(srcFile);
        BufferedImage buffImg = null;
        buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        buffImg.getGraphics().drawImage(
                srcImg.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0,
                0, null);

        ImageIO.write(buffImg, "JPEG", new File(distImgPath));

    }

    /**
     * 上传文件，如果是SpringBoot，配置如下：
     * # 上传单个文件最大允许
     * spring.servlet.multipart.max-file-size=10MB
     * # 每次请求最大允许
     * spring.servlet.multipart.max-request-size=100MB
     *
     * @return 自定义消息
     * @author jitwxs
     * @version 创建时间：2018年4月17日 下午4:05:26
     */
    public static String upload(HttpServletRequest request) throws Exception {
        StandardMultipartHttpServletRequest req = (StandardMultipartHttpServletRequest) request;

        // 遍历普通参数（即formData的fileName和fileSize）
        Enumeration<String> names = req.getParameterNames();
        while (names.hasMoreElements()) {
            String key = names.nextElement();
            String val = req.getParameter(key);
            System.out.println("FormField：k=" + key + "v=" + val);
        }

        // 遍历文件参数（即formData的file）
        Iterator<String> iterator = req.getFileNames();
        if (iterator == null){
            return "未选择文件";
        }
        String result = "";
        while (iterator.hasNext()) {
            MultipartFile file = req.getFile(iterator.next());
            String fileNames = file.getOriginalFilename();
            // 文件名
            fileNames = new String(fileNames.getBytes("UTF-8"));
            //int split = fileNames.lastIndexOf(".");
            // 文件前缀
            //String fileName = fileNames.substring(0, split);
            // 文件后缀
            //String fileType = fileNames.substring(split + 1, fileNames.length());
            // 文件大小
            //Long fileSize = file.getSize();
            // 文件内容
            byte[] content = file.getBytes();

            File file1 = new File("D:\\test\\"+fileNames);

            FileUtils.writeByteArrayToFile(file1, content);

            FileOutputStream fos = new FileOutputStream(file1);
            fos.write(content);
            fos.flush();
            result = "D:\\test\\"+fileNames;
            System.out.println("write success");
        }
        return result;
    }

    /**
     * 下载文件
     *
     * @author jitwxs
     * @version 创建时间：2018年4月17日 下午4:06:10
     */
    public void download(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String fileName = request.getParameter("fileName");
        // 文件路径
        String path = "D:\\" + fileName;
        // 得到用于返回给客户端的编码后的文件名
        String agent = request.getHeader("User-Agent");
        String fileNameEncode = solveFileNameEncode(agent, fileName);
        // 客户端判断下载文件类型
        response.setContentType(request.getSession().getServletContext().getMimeType(fileName));
        // 关闭客户端的默认解析
        response.setHeader("Content-Disposition", "attachment;filename=" + fileNameEncode);

        // 下载文件
        ServletOutputStream out = response.getOutputStream();
        InputStream in = new FileInputStream(path);
        int len;
        byte[] buf = new byte[1024];
        while ((len = in.read(buf)) > 0) {
            out.write(buf, 0, len);
        }
        in.close();
    }

    /**
     * 对文件名发送到客户端时进行编码
     *
     * @param agent
     * @param fileName
     * @author jitwxs
     * @version 创建时间：2018年4月17日 下午4:06:31
     */
    private String solveFileNameEncode(String agent, String fileName) {
        String res = "";
        try {
            if (agent.contains("MSIE")) {
                // IE浏览器
                res = URLEncoder.encode(fileName, "utf-8");
                res = res.replace("+", " ");
            } else if (agent.contains("Firefox")) {
                // 火狐浏览器
                BASE64Encoder base64Encoder = new BASE64Encoder();
                res = "=?utf-8?B?"
                        + base64Encoder.encode(fileName.getBytes("utf-8")) + "?=";
            } else {
                // 其它浏览器
                res = URLEncoder.encode(fileName, "utf-8");
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return res;
    }
}