package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.ImmutableSet;
import com.spotify.docker.client.DockerClient;
import com.spotify.docker.client.messages.ImageInfo;
import com.spotify.docker.client.messages.ImageSearchResult;
import jit.edu.paas.commons.util.FileUtils;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.mapper.SysImageMapper;
import jit.edu.paas.service.SysImageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * <p>
 *  Image服务实现类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Service
@Slf4j
public class SysImageServiceImpl extends ServiceImpl<SysImageMapper, SysImage> implements SysImageService {
    @Autowired
    private SysImageMapper imageMapper;
    @Autowired
    private DockerClient dockerClient;

    @Override
    public Page<SysImage> listLocalPublicImage(String name, Page<SysImage> page) {
        return page.setRecords(imageMapper.listLocalPublicImage(page, name));
    }

    @Override
    public Page<SysImage> listLocalUserImage(String name, Page<SysImage> page) {
        return page.setRecords(imageMapper.listLocalUserImage(page, name));
    }

    @Override
    public Page<SysImage> listHubImage(String name, Page<SysImage> page) {
        try {
            List<ImageSearchResult> searchResults = dockerClient.searchImages(name);
            searchResults.forEach(System.out::println);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 文件上传
     * @author sya
     * @since 6.30
     */
    @Override
    public String uploadImages(HttpServletRequest request) {
        final SysImage upimage = new SysImage();
        Map<String,String > map = new HashMap<>();
        try {
            String result = FileUtils.upload(request);
            String length = result.substring(result.lastIndexOf(":")+1,result.length());
            if ("未选择文件".equals(request)){
                return result;
            }
            StandardMultipartHttpServletRequest req = (StandardMultipartHttpServletRequest) request;

            // 遍历普通参数（即formData的fileName和fileSize）
            Enumeration<String> names = req.getParameterNames();

            while (names.hasMoreElements()) {
                String key = names.nextElement();
                String val = req.getParameter(key);
                map.put(key,val);
            }

            try {
                upimage.setId(map.get("id"));
                upimage.setName(map.get("name"));
            }catch (Exception e){
                e.printStackTrace();
                return "未接收到必要参数id&name";
            }
            upimage.setTag(map.get("tag"));
            upimage.setSize(length);
            upimage.setType(Integer.parseInt(map.get("type")));
            upimage.setUserId(map.get("userid"));
            upimage.setHasOpen(Boolean.parseBoolean(map.get("has_open")));
            upimage.setCreateDate(new Date());
            upimage.setUpdateDate(new Date());
            imageMapper.insert(upimage);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public ImmutableSet<String> listExportPorts(String imageName) {
        try {
            ImageInfo info = dockerClient.inspectImage(imageName);
            return info.containerConfig().exposedPorts();
        } catch (Exception e) {
            log.error("获取镜像暴露端口错误，出错位置：{}，出错镜像名：{}，错误信息：{}",
                    "SysImageServiceImpl.listExportPorts()", imageName, e.getMessage());
            return null;
        }
    }
}
