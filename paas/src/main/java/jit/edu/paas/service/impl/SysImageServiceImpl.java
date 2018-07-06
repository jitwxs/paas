package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import com.spotify.docker.client.DockerClient;
import com.spotify.docker.client.ProgressHandler;
import com.spotify.docker.client.exceptions.DockerException;
import com.spotify.docker.client.messages.*;
import jit.edu.paas.commons.util.*;
import jit.edu.paas.commons.util.jedis.JedisClient;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.enums.ImageTypeEnum;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.enums.RoleEnum;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.mapper.SysImageMapper;
import jit.edu.paas.service.SysImageService;
import jit.edu.paas.service.SysLoginService;
import lombok.Cleanup;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.InputStreamBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;

/**
 * <p>
 * Image服务实现类
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
    private SysLoginService loginService;
    @Autowired
    private DockerClient dockerClient;
    @Autowired
    private JedisClient jedisClient;

    @Value("${docker.server.url}")
    private String serverUrl;

    @Value("${redis.local-image.key}")
    private String key;
    private final String ID_PREFIX = "ID:";
    private final String FULL_NAME_PREFIX = "FULL_NAME:";

    @Override
    public Page<SysImage> listLocalPublicImage(String name, Page<SysImage> page) {
        return page.setRecords(imageMapper.listLocalPublicImage(page, name));
    }

    @Override
    public Page<SysImage> listLocalUserImage(String name, Page<SysImage> page) {
        return page.setRecords(imageMapper.listLocalUserImage(page, name));
    }

    /**
     * 获取Docker Hub镜像列表
     * @author jitwxs
     * @since 2018/6/28 16:15
     */
    @Override
    public ResultVo listHubImage(String name, Integer limit) {
        if (StringUtils.isBlank(name)) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }

        try {
            /*
            star_count	star数
            is_official	是否官方
            name 镜像名
            is_automated
            description	描述
            */
            List<ImageSearchResult> results = DockerApiUtils.searchImages(serverUrl, name, limit);
            return ResultVoUtils.success(results);
        } catch (Exception e) {
            log.error("Docker搜索异常，错误位置：SysImageServiceImpl.listHubImage,出错信息：" + e.getMessage());
            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    @Override
    public SysImage getById(String id) {
        String field = ID_PREFIX + id;

        try {
            String json = jedisClient.hget(key, field);
            if(StringUtils.isNotBlank(json)) {
                return JsonUtils.jsonToObject(json, SysImage.class);
            }
        } catch (Exception e) {
            log.error("缓存读取异常，异常位置：{}", "SysImageServiceImpl.getById()");
        }

        SysImage image = imageMapper.selectById(id);
        if(image == null) {
            return null;
        }

        try {
            String json = JsonUtils.objectToJson(image);
            jedisClient.hset(key, field, json);
        } catch (Exception e) {
            log.error("缓存存储异常，异常位置：{}", "SysImageServiceImpl.getById()");
        }

        return image;
    }

    @Override
    public SysImage getByFullName(String fullName) {
        String field = FULL_NAME_PREFIX + fullName;

        try {
            String json = jedisClient.hget(key, field);
            if(StringUtils.isNotBlank(json)) {
                return JsonUtils.jsonToObject(json, SysImage.class);
            }
        } catch (Exception e) {
            log.error("缓存读取异常，异常位置：{}", "SysImageServiceImpl.getByFullName()");
        }

        List<SysImage> images = imageMapper.selectList(new EntityWrapper<SysImage>().eq("full_name", fullName));
        SysImage image = CollectionUtils.getListFirst(images);
        if(image == null) {
            return null;
        }

        try {
            String json = JsonUtils.objectToJson(image);
            jedisClient.hset(key, field, json);
        } catch (Exception e) {
            log.error("缓存存储异常，异常位置：{}", "SysImageServiceImpl.getByFullName()");
        }

        return image;
    }

    /**
     * 查询镜像详细信息
     * @author hf
     * @since 2018/6/28 16:15
     */
    @Override
    public ResultVo inspectImage(String id, String userId) {
        // 1、校验参数
        if(StringUtils.isBlank(id)) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }

        // 2、查询数据库
        SysImage image = getById(id);
        if(image == null) {
            return ResultVoUtils.error(ResultEnum.IMAGE_EXCEPTION);
        }
        // 3、判断是否有权限访问
        if(!hasAuthImage(userId, image)) {
            return ResultVoUtils.error(ResultEnum.PERMISSION_ERROR);
        }

        // 4、查询信息
        try {
            String fullName = image.getFullName();
            return ResultVoUtils.success(dockerClient.inspectImage(fullName));
        } catch (Exception e) {
            log.error("Docker查询详情异常，错误位置：SysImageServiceImpl.inspectImage,出错信息{}",e.getMessage());
            return ResultVoUtils.error(ResultEnum.INSPECT_ERROR);
        }

    }

    /**
     * 同步本地镜像到数据库
     * @author jitwxs
     * @since 2018/7/3 16:38
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public ResultVo syncLocalImage() {
        try {
            // 1、获取数据库中所有镜像
            List<SysImage> dbImages = imageMapper.selectList(new EntityWrapper<>());
            // 2、获取本地所有镜像
            List<Image> tmps = dockerClient.listImages(DockerClient.ListImagesParam.digests());

            int deleteCount = 0,addCount = 0,errorCount=0;
            boolean[] dbFlag = new boolean[dbImages.size()];
            Arrays.fill(dbFlag,false);

            // 3、遍历本地镜像
            for(int i=0; i<tmps.size(); i++) {
                Image image = tmps.get(i);
                // 读取所有Tag
                ImmutableList<String> list = image.repoTags();
                if(list != null) {
                    for(String tag : list) {
                        // 判断tag是否存在
                        boolean flag = false;
                        for(int j=0; j<dbImages.size(); j++) {
                            // 跳过比较过的
                            if(dbFlag[j]) {
                                continue;
                            }
                            // 比较相等
                            if(tag.equals(dbImages.get(j).getFullName())) {
                                flag = true;
                                dbFlag[j] = true;
                                break;
                            }
                        }

                        // 如果本地不存在，添加到本地
                        if(!flag) {
                            SysImage sysImage = imageToSysImage(image, tag);
                            if(sysImage == null) {
                                errorCount++;
                            } else {
                                addCount++;
                                imageMapper.insert(sysImage);
                            }
                        }
                    }
                }
            }

            // 删除失效的数据
            for(int i=0; i<dbFlag.length;i++) {
                if(!dbFlag[i]) {
                    deleteCount++;
                    SysImage sysImage = dbImages.get(i);
                    imageMapper.deleteById(sysImage);
                    // 更新缓存
                    cleanCache(sysImage.getId(), sysImage.getFullName());
                }
            }

            // 准备结果
            Map<String, Integer> map = new HashMap<>(16);
            map.put("delete", deleteCount);
            map.put("add", addCount);
            map.put("error", errorCount);
            return ResultVoUtils.success(map);
        } catch (Exception e) {
            log.error("Docker同步镜像异常，错误位置：SysImageServiceImpl.syncLocalImage,出错信息{}",HttpClientUtils.getStackTraceAsString(e));
            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    /**
     * 删除镜像
     * （1）普通用户只能删除自己上传的镜像
     * （2）管理员可以删除任意镜像
     * （3）如果有任意容器正在使用，无法删除，请使用强制删除的方法
     * @author hf
     * @since 2018/6/28 16:15
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVo removeImage(String id, String userId) {
        String roleName = loginService.getRoleName(userId);
        SysImage sysImage = getById(id);
        if(sysImage == null) {
            return ResultVoUtils.error(ResultEnum.IMAGE_EXCEPTION);
        }

        if(RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            // 普通用户无法删除公有镜像
            if(ImageTypeEnum.LOCAL_PUBLIC_IMAGE.getCode() == sysImage.getType()) {
                return ResultVoUtils.error(ResultEnum.DELETE_IMAGE_PERMISSION_ERROR);
            }
            // 普通用户无法删除他人镜像
            if(!userId.equals(sysImage.getUserId())) {
                return ResultVoUtils.error(ResultEnum.DELETE_IMAGE_PERMISSION_ERROR);
            }
        }

        try {
            // 删除镜像
            dockerClient.removeImage(sysImage.getFullName());
            // 删除记录
            imageMapper.deleteById(sysImage);
            // 清除缓存
            cleanCache(sysImage.getId(), sysImage.getFullName());
            return ResultVoUtils.success();
        } catch (Exception e) {
            log.error("Docker删除镜像异常，错误位置：SysImageServiceImpl.removeImage,出错信息{}",HttpClientUtils.getStackTraceAsString(e));
            return ResultVoUtils.error(ResultEnum.DELETE_IMAGE_BY_CONTAINER_ERROR);
        }
    }

    /**
     * 拉取镜像
     *
     * @author hf
     * @since 2018/6/28 16:15
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVo pullImageFromHub(String name) {
        //若用户未输入版本号 则默认pull最新的版本
        if (!name.contains(":")) {
            name = name + ":latest";
        }

        // 判断本地是否有镜像
        try {
            if(dockerClient.listImages(DockerClient.ListImagesParam.byName(name)).size() > 0) {
                return ResultVoUtils.error(ResultEnum.PULL_ERROR_BY_EXIST);
            }
            // 如果本地没有，但数据库中有，说明本地与数据库数据不一致，执行同步方法
            if(getByFullName(name) != null) {
                syncLocalImage();
            }

        } catch (Exception e) {
            log.error("查询本地镜像失败，错误位置：{}，镜像名：{}，错误信息：{}",
                    "SysImageServiceImpl.pullImageFromHub()", name, HttpClientUtils.getStackTraceAsString(e));
            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }

        // pull 镜像
        try {
            dockerClient.pull(name);
        } catch (Exception e) {
            log.error("Pull Docker Hub镜像失败，错误位置：{}，镜像名：{}，错误信息：{}"
                    , "SysImageServiceImpl.pullImageFromHub()", name, HttpClientUtils.getStackTraceAsString(e));
            return ResultVoUtils.error(ResultEnum.PULL_ERROR);
        }

        // 保存信息
        try {
            List<Image> images = dockerClient.listImages(DockerClient.ListImagesParam.byName(name));
            if(images.size() ==0) {
                return ResultVoUtils.error(ResultEnum.INSPECT_ERROR);
            }
            Image image = images.get(0);

            SysImage sysImage = imageToSysImage(image, image.repoTags().get(0));
            imageMapper.insert(sysImage);

            return ResultVoUtils.success();
        } catch (Exception e) {
            log.error("获取镜像详情失败，错误位置：{}，镜像名：{}，错误信息：{}",
                    "SysImageServiceImpl.pullImageFromHub()", name, HttpClientUtils.getStackTraceAsString(e));
            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    /**
     * push镜像
     * @author hf
     * @since 2018/6/28 16:15
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public ResultVo pushImage(String id, String username, String password) {
        RegistryAuth registryAuth = RegistryAuth.builder()
                .username(username)
                .password(password)
                .build();

        SysImage image = getById(id);
        // 拼接上传到Hub上的名字
        String imageName = username + "/" + image.getName();

        try {
            // tag镜像
            dockerClient.tag(image.getFullName(), imageName);
        } catch (Exception e) {
            log.error("Tag镜像异常，错误位置：{}，出错信息：{}",
                    "SysImageServiceImpl.pushImage", HttpClientUtils.getStackTraceAsString(e));
            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }

        try {
            // 上传镜像
            dockerClient.push(imageName, registryAuth);
        } catch (Exception e) {
            log.error("push镜像异常，错误位置：SysImageServiceImpl.pushImage,出错信息：{}", HttpClientUtils.getStackTraceAsString(e));
            return ResultVoUtils.error(ResultEnum.PUSH_ERROR);
        }

        try {
            // 删除Tag的镜像
            dockerClient.removeImage(imageName);
        } catch (Exception e) {
            log.error("删除镜像异常，错误位置：{}，出错信息：{}",
                    "SysImageServiceImpl.pushImage", HttpClientUtils.getStackTraceAsString(e));
        }

        return ResultVoUtils.success(imageName);
    }

    /**
     * 导出镜像
     * @author hf
     * @since 2018/7/2 8:15
     */
    @Override
    public ResultVo exportImage(String id, String uid) {
        SysImage image = getById(id);
        if(image == null ) {
            return ResultVoUtils.error(ResultEnum.IMAGE_EXCEPTION);
        }
        if(!hasAuthImage(uid, image)) {
            return ResultVoUtils.error(ResultEnum.PERMISSION_ERROR);
        }

        String url = serverUrl + "/images/" + image.getFullName() + "/get";
        return ResultVoUtils.success(url);
    }

    /**
     * 导入镜像
     *
     * @author hf
     * @since 2018/7/2 8:15
     */
    @Override
    public ResultVo importImage(String uid, HttpServletRequest request) {
        StandardMultipartHttpServletRequest req = (StandardMultipartHttpServletRequest) request;

        // 遍历普通参数，取出镜像名和tag（默认latest）
        String imageName = "", tag = "latest";
        boolean flag = false;
        Enumeration<String> names = req.getParameterNames();
        while (names.hasMoreElements()) {
            String key = names.nextElement();
            String val = req.getParameter(key);
            if("name".equals(key)) {
                flag = true;
                imageName = val;
            }
            if("tag".equals(key)) {
                tag = val;
            }
        }
        // 遍历文件参数
        Iterator<String> iterator = req.getFileNames();
        if(!flag || !iterator.hasNext()) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }

        // 拼接完整名：repo/userId/imageName:tag
        String fullName = "local/" + uid + "/" + imageName + ":" + tag;
        // 判断镜像是否存在
        if(getByFullName(fullName) != null) {
            return ResultVoUtils.error(ResultEnum.IMPORT_ERROR_BY_NAME);
        }

        // 取出文件，只取一个
        MultipartFile file = req.getFile(iterator.next());

        // 导入镜像
        try(InputStream inputStream = file.getInputStream()) {
            dockerClient.create(fullName,inputStream);
            // 获取镜像的信息
            List<Image> list = dockerClient.listImages(DockerClient.ListImagesParam.byName(fullName));
            Image image = CollectionUtils.getListFirst(list);

            SysImage sysImage = imageToSysImage(image, image.repoTags().get(0));
            // 插入数据
            imageMapper.insert(sysImage);

            return ResultVoUtils.success();
        } catch (Exception e) {
            log.error("导入镜像失败，错误位置：{}，镜像名：{}，错误信息：{}",
                    "SysImageServiceImpl.pullImageFromHub()", fullName, HttpClientUtils.getStackTraceAsString(e));
            return ResultVoUtils.error(ResultEnum.IMPORT_ERROR);
        }
    }

    /**
     * 查看History
     * @author hf
     * @since 2018/6/28 16:15
     */
    @Override
    public ResultVo getHistory(String id, String uid) {
        SysImage image = getById(id);
        if(image == null) {
            return ResultVoUtils.error(ResultEnum.IMAGE_EXCEPTION);
        }
        // 1、鉴权
        if(!hasAuthImage(uid, image)) {
            return ResultVoUtils.error(ResultEnum.PERMISSION_ERROR);
        }

        try {
            List<ImageHistory> history = dockerClient.history(image.getFullName());
            return ResultVoUtils.success(history);
        } catch (Exception e) {
            log.error("查看镜像源码文件异常，错误位置：SysImageServiceImpl.imageFile,出错信息：" + e.getMessage());
            return ResultVoUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
    }

    /**
     * Dockerfile建立镜像
     * @author jitwxs
     * @since 2018/7/6 17:16
     */
    @Override
    public ResultVo buildImage(String userId, HttpServletRequest request) {
        StandardMultipartHttpServletRequest req = (StandardMultipartHttpServletRequest) request;

        // 1、遍历普通参数，取出镜像名和tag（默认latest）
        String imageName = "", tag = "latest";
        boolean flag = false;
        Enumeration<String> names = req.getParameterNames();
        while (names.hasMoreElements()) {
            String key = names.nextElement();
            String val = req.getParameter(key);
            if("name".equals(key)) {
                flag = true;
                imageName = val;
            }
            if("tag".equals(key)) {
                tag = val;
            }
        }
        // 2、遍历文件参数
        Iterator<String> iterator = req.getFileNames();
        if(!flag || !iterator.hasNext()) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }

        // 取出文件，只取一个
        MultipartFile file = req.getFile(iterator.next());
        // 判断后缀名是否是tar.gz文件
        String fileName = file.getOriginalFilename();
        if(!fileName.endsWith(".tar.gz")) {
            return ResultVoUtils.error(ResultEnum.BUILD_ERROR_BY_SUFFIX);
        }

        // 3、拼接完整名：repo/userId/imageName:tag
        String fullName = "local/" + userId + "/" + imageName + ":" + tag;
        // 判断镜像是否存在
        if(getByFullName(fullName) != null) {
            return ResultVoUtils.error(ResultEnum.IMPORT_ERROR_BY_NAME);
        }

        // 4、构建Image
        try {
            @Cleanup CloseableHttpClient httpclient = HttpClients.createDefault();
            // 请求url
            String uri = serverUrl + "/build?t=" + fullName;
            HttpPost httpPost = new HttpPost(uri);
            RequestConfig requestConfig = RequestConfig.custom().setConnectTimeout(200000).setSocketTimeout(200000).build();
            httpPost.setConfig(requestConfig);
            // 设置请求头
            httpPost.setHeader(HTTP.CONTENT_TYPE, "application/x-tar");
            // 将dockerFile放入请求中
            InputStreamBody body = new InputStreamBody(file.getInputStream(), fullName);
            HttpEntity reqEntity = MultipartEntityBuilder.create().addPart("file", body).build();
            httpPost.setEntity(reqEntity);

            // 执行请求
            @Cleanup CloseableHttpResponse response = httpclient.execute(httpPost);
            // 判断返回码
            int code = response.getStatusLine().getStatusCode();
            if(code != 200) {
                // 获取响应体
                String respContent = "";
                HttpEntity entity = response.getEntity();
                if (null != entity) {
                    Charset respCharset = ContentType.getOrDefault(entity).getCharset();
                    respContent = EntityUtils.toString(entity, respCharset);
                    EntityUtils.consume(entity);
                }
                log.error("build镜像错误，错误位置：{}，错误码：{}，响应体：{}",
                       "SysImageServiceImpl.buildImage()",code, respContent);
                return ResultVoUtils.error(ResultEnum.NETWORK_ERROR);
            }

            return ResultVoUtils.success();
        } catch (Exception e) {
            return ResultVoUtils.error(ResultEnum.BUILD_ERROR);
        }
    }

    /**
     * 清理缓存
     * @author jitwxs
     * @since 2018/7/4 16:33
     */
    @Override
    public void cleanCache(String id, String fullName) {
        try {
            if (StringUtils.isNotBlank(id)) {
                jedisClient.hdel(key, ID_PREFIX + id);
            }
            if (StringUtils.isNotBlank(fullName)) {
                jedisClient.hdel(key, FULL_NAME_PREFIX + fullName);
            }
        } catch (Exception e) {
            log.error("清理本地镜像缓存失败，错误位置：{}", "SysImageServiceImpl.cleanCache()");
        }
    }

    /**
     * 公开/关闭私有镜像
     * 仅所有者本人操作
     * @author jitwxs
     * @since 2018/7/4 16:12
     */
    @Override
    public ResultVo changOpenImage(String id, String uid, boolean code) {
        SysImage image = getById(id);
        if(image == null) {
            return ResultVoUtils.error(ResultEnum.IMAGE_EXCEPTION);
        }

        if(ImageTypeEnum.LOCAL_USER_IMAGE.getCode() != image.getType() || !uid.equals(image.getUserId())) {
            return ResultVoUtils.error(ResultEnum.PERMISSION_ERROR);
        }

        // 修改状态
        if(image.getHasOpen() != code) {
            image.setHasOpen(code);
            imageMapper.updateById(image);
            // 清除缓存
            cleanCache(image.getId(), image.getFullName());
        }
        return ResultVoUtils.success();
    }

    @Override
    public ImmutableSet<String> listExportPorts(String imageId) {
        try {
            SysImage image = getById(imageId);
            ImageInfo info = dockerClient.inspectImage(image.getFullName());
            return info.containerConfig().exposedPorts();
        } catch (Exception e) {
            log.error("获取镜像暴露端口错误，出错位置：{}，出错镜像ID：{}，错误信息：{}",
                    "SysImageServiceImpl.listExportPorts()", imageId, e.getMessage());
            return null;
        }
    }

    /**
     * 判断是否有权限查看镜像
     * @author jitwxs
     * @since 2018/7/3 16:23
     */
    @Override
    public Boolean hasAuthImage(String userId, SysImage image) {
        // 1、如果镜像是公有镜像 --> true
        if(ImageTypeEnum.LOCAL_PUBLIC_IMAGE.getCode() == image.getType()) {
            return true;
        }
        // 2、如果镜像是用户镜像
        if(ImageTypeEnum.LOCAL_USER_IMAGE.getCode() == image.getType()) {
            // 2.1、如果公开
            if(image.getHasOpen()) {
                return true;
            }
            // 2.2、如果用户角色为USER，且不是自己的 --> false
            String roleName = loginService.getRoleName(userId);
            if(RoleEnum.ROLE_USER.getMessage().equals(roleName) && !userId.equals(image.getUserId())) {
                return false;
            } else {
                return true;
            }
        }
        return false;
    }

    /**
     * 拆分repoTage
     * 包含：fullName、tag、repo、type、name
     *      当type = LOCAL_USER_IMAGE时，包含userId
     * @author jitwxs
     * @since 2018/7/4 8:33
     */
    private Map<String, Object> splitRepoTag(String repoTag) {
        Map<String, Object> map = new HashMap<>(16);
        boolean flag = true;
        //设置tag
        int tagIndex = repoTag.lastIndexOf(":");
        String tag = repoTag.substring(tagIndex+1);

        map.put("fullName", repoTag);
        map.put("tag", tag);

        String tagHead = repoTag.substring(0, tagIndex);
        String[] names = tagHead.split("/");

        if(names.length == 1) {
            // 如果包含1个部分，代表来自官方的Image，例如nginx
            map.put("repo", "library");
            map.put("name", names[0]);
            map.put("type", ImageTypeEnum.LOCAL_PUBLIC_IMAGE.getCode());
        } else if(names.length == 2) {
            // 如果包含2个部分，代表来自指定的Image，例如：portainer/portainer
            map.put("repo", names[0]);
            map.put("name", names[1]);
            map.put("type", ImageTypeEnum.LOCAL_PUBLIC_IMAGE.getCode());
        } else if(names.length == 3) {
            // 如果包含3个部分，代表来自用户上传的Image，例如：local/jitwxs/hello-world
            map.put("repo", names[0]);
            map.put("type", ImageTypeEnum.LOCAL_USER_IMAGE.getCode());
            map.put("userId", names[1]);
            map.put("name", names[2]);
        } else {
            // 其他情况异常，形如：local/jitwxs/portainer/portainer:latest
            flag = false;
        }

        // 状态
        map.put("status", flag);

        return map;
    }

    /**
     * 拆分ImageId，去掉头部，如：
     * sha256:e38bc07ac18ee64e6d59cf2eafcdddf9cec2364dfe129fe0af75f1b0194e0c96
     * -> e38bc07ac18ee64e6d59cf2eafcdddf9cec2364dfe129fe0af75f1b0194e0c96
     * @author jitwxs
     * @since 2018/7/4 9:44
     */
    private String splitImageId(String imageId) {
        String[] splits = imageId.split(":");
        if(splits.length == 1) {
            return imageId;
        }

        return splits[1];
    }

    /**
     * dockerClient.Image --> entity.SysImage
     * 注：hasOpen、createDate、updateDate属性无法计算出，使用默认值
     * @author jitwxs
     * @since 2018/7/3 16:53
     */
    private SysImage imageToSysImage(Image image, String repoTag) {
        SysImage sysImage = new SysImage();
        // 设置ImageId
        sysImage.setImageId(splitImageId(image.id()));

        // 获取repoTag
        Map<String, Object> map = splitRepoTag(repoTag);

        // 判断状态
        if(!(Boolean)map.get("status")) {
            log.error("解析repoTag出现异常，错误目标为：{}", map.get("fullName"));
            return null;
        }

        // 设置完整名
        sysImage.setFullName((String)map.get("fullName"));
        // 设置Tag
        sysImage.setTag((String)map.get("tag"));
        // 设置Repo
        sysImage.setRepo((String)map.get("repo"));
        // 设置name
        sysImage.setName((String)map.get("name"));
        // 设置type
        Integer type = (Integer)map.get("type");
        sysImage.setType(type);
        // 如果type为LOCAL_USER_IMAGE时
        if (ImageTypeEnum.LOCAL_USER_IMAGE.getCode() == type) {
            // 设置userId
            sysImage.setUserId((String)map.get("userId"));
            // 用户镜像默认不分享
            sysImage.setHasOpen(false);
        }

        // 设置CMD
        try {
            ImageInfo info = dockerClient.inspectImage(repoTag);
            sysImage.setCmd(JsonUtils.objectToJson(info.containerConfig().cmd()));
        } catch (Exception e) {
            log.error("获取镜像信息错误，错误位置：{}" + "SysImageServiceImpl.imageToSysImage()");
        }

        // 设置大小
        sysImage.setSize(image.size());
        // 设置虚拟大小
        sysImage.setVirtualSize(image.virtualSize());
        // 设置Label
        sysImage.setLabels(JsonUtils.mapToJson(image.labels()));
        // 设置父节点
        sysImage.setParentId(image.parentId());
        sysImage.setCreateDate(new Date());

        return sysImage;
    }
}
