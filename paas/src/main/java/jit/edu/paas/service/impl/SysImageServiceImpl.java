package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableSet;
import com.spotify.docker.client.DockerClient;
import com.spotify.docker.client.exceptions.ConflictException;
import com.spotify.docker.client.exceptions.DockerRequestException;
import com.spotify.docker.client.exceptions.DockerTimeoutException;
import com.spotify.docker.client.exceptions.ImagePushFailedException;
import com.spotify.docker.client.messages.*;
import jit.edu.paas.commons.activemq.MQProducer;
import jit.edu.paas.commons.activemq.Task;
import jit.edu.paas.commons.util.*;
import jit.edu.paas.commons.util.jedis.JedisClient;
import jit.edu.paas.domain.dto.SysImageDTO;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.entity.SysLogin;
import jit.edu.paas.domain.enums.*;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.exception.CustomException;
import jit.edu.paas.mapper.SysImageMapper;
import jit.edu.paas.service.NoticeService;
import jit.edu.paas.service.SysImageService;
import jit.edu.paas.service.SysLogService;
import jit.edu.paas.service.SysLoginService;
import lombok.extern.slf4j.Slf4j;
import org.apache.activemq.command.ActiveMQQueue;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.jms.Destination;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.stream.Collectors;

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
    @Autowired
    private MQProducer mqProducer;
    @Autowired
    private SysLogService sysLogService;
    @Autowired
    private NoticeService noticeService;

    @Value("${docker.server.url}")
    private String serverUrl;

    @Value("${redis.local-image.key}")
    private String key;
    private final String ID_PREFIX = "ID:";
    private final String FULL_NAME_PREFIX = "FULL_NAME:";

    @Override
    public Page<SysImageDTO> listLocalPublicImage(String name, Page<SysImageDTO> page) {
        return page.setRecords(imageMapper.listLocalPublicImage(page, name));
    }

    @Override
    public Page<SysImageDTO> listLocalUserImage(String name, boolean filterOpen, String userId, Page<SysImageDTO> page) {
        List<SysImageDTO> images;
        if(filterOpen) {
            List<SysImage> imageList = imageMapper.selectList(new EntityWrapper<SysImage>()
                    .eq("type", 2)
                    .and().eq("user_id", userId).or().eq("has_open", true));
            images = sysImage2DTO(imageList);

        } else {
            images = imageMapper.listLocalUserImage(page, name);
        }

        return page.setRecords(images);
    }

    /**
     * 获取Docker Hub镜像列表
     * @author jitwxs
     * @since 2018/6/28 16:15
     */
    @Override
    public ResultVO listHubImage(String name, Integer limit) {
        if (StringUtils.isBlank(name)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        try {
            List<ImageSearchResult> results = dockerClient.searchImages(name);
            return ResultVOUtils.success(results);
        } catch (DockerRequestException requestException){
            return ResultVOUtils.error(
                    ResultEnum.SERVICE_CREATE_ERROR.getCode(),
                    HttpClientUtils.getErrorMessage(requestException.getMessage()));
        } catch (Exception e) {
            log.error("Docker搜索异常，错误位置：SysImageServiceImpl.listHubImage,出错信息：" + HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.DOCKER_EXCEPTION);
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
    public ResultVO inspectImage(String id, String userId) {
        // 1、校验参数
        if(StringUtils.isBlank(id)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        // 2、查询数据库
        SysImage image = getById(id);
        if(image == null) {
            return ResultVOUtils.error(ResultEnum.IMAGE_EXCEPTION);
        }
        // 3、判断是否有权限访问
        if(!hasAuthImage(userId, image)) {
            return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
        }

        // 4、查询信息
        try {
            String fullName = image.getFullName();

            return ResultVOUtils.success(dockerClient.inspectImage(fullName));
        } catch (DockerRequestException requestException){
            return ResultVOUtils.error(ResultEnum.DOCKER_EXCEPTION.getCode(),
                    HttpClientUtils.getErrorMessage(requestException.getMessage()));
        }catch (Exception e) {
            log.error("Docker查询详情异常，错误位置：{}，错误栈：{}",
                    "SysImageServiceImpl.inspectImage", HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.INSPECT_ERROR);
        }

    }

    /**
     * 同步本地镜像到数据库
     * @author jitwxs
     * @since 2018/7/3 16:38
     */
    @Transactional(rollbackFor = CustomException.class)
    @Override
    public ResultVO sync() {
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

            return ResultVOUtils.success(map);
        } catch (DockerTimeoutException te) {
            log.error("同步镜像超时，错误位置：{}","SysImageServiceImpl.sync");
            return ResultVOUtils.error(ResultEnum.DOCKER_TIMEOUT);
        }  catch (Exception e) {
            log.error("Docker同步镜像异常，错误位置：{},错误栈：{}",
                    "SysImageServiceImpl.sync", HttpClientUtils.getStackTraceAsString(e));

            return ResultVOUtils.error(ResultEnum.DOCKER_EXCEPTION);
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
    @Transactional(rollbackFor = CustomException.class)
    public ResultVO removeImage(String id, String userId, HttpServletRequest request) {
        String roleName = loginService.getRoleName(userId);
        SysImage sysImage = getById(id);
        if(sysImage == null) {
            return ResultVOUtils.error(ResultEnum.IMAGE_NOT_EXIST);
        }

        if(RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
            // 普通用户无法删除公有镜像
            if(ImageTypeEnum.LOCAL_PUBLIC_IMAGE.getCode() == sysImage.getType()) {
                return ResultVOUtils.error(ResultEnum.DELETE_IMAGE_PERMISSION_ERROR);
            }
            // 普通用户无法删除他人镜像
            if(!userId.equals(sysImage.getUserId())) {
                return ResultVOUtils.error(ResultEnum.DELETE_IMAGE_PERMISSION_ERROR);
            }
        }

        try {
            // 删除镜像
            dockerClient.removeImage(sysImage.getFullName());
            // 删除记录
            imageMapper.deleteById(sysImage);
            // 清除缓存
            cleanCache(sysImage.getId(), sysImage.getFullName());
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.DELETE_IMAGE);

            return ResultVOUtils.success();
        } catch (DockerRequestException requestException){
            String message = HttpClientUtils.getErrorMessage(requestException.getMessage());
            log.error("删除镜像异常，错误位置：{}，错误信息：{}",
                    "SysImageServiceImpl.removeImage", message);
            return ResultVOUtils.error(ResultEnum.DELETE_IMAGE_ERROR.getCode(), message);
        }catch (ConflictException e){
            return ResultVOUtils.error(ResultEnum.DELETE_IMAGE_BY_CONTAINER_ERROR);
        }catch (Exception e) {
            log.error("Docker删除镜像异常，错误位置：{},错误栈：{}"
                    ,"SysImageServiceImpl.removeImage",HttpClientUtils.getStackTraceAsString(e));
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.DELETE_IMAGE,e);

            return ResultVOUtils.error(ResultEnum.DELETE_IMAGE_BY_CONTAINER_ERROR);
        }
    }

    @Override
    public ResultVO pullImageCheck(String name, String userId) {
        if(StringUtils.isBlank(name)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }
        //若用户未输入版本号 则默认pull最新的版本
        if (!name.contains(":")) {
            name = name + ":latest";
        }

        // 判断本地是否有镜像
        try {
            if(dockerClient.listImages(DockerClient.ListImagesParam.byName(name)).size() > 0) {
                return ResultVOUtils.error(ResultEnum.PULL_ERROR_BY_EXIST);
            }
            // 如果本地没有，但数据库中有，说明本地与数据库数据不一致，执行同步方法
            if(getByFullName(name) != null) {
                sync();
            }
        } catch (Exception e) {
            log.error("查询本地镜像失败，错误位置：{}，镜像名：{}，错误栈：{}",
                    "SysImageServiceImpl.pullImageFromHub()", name, HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.DOCKER_EXCEPTION);
        }
        return ResultVOUtils.success();
    }

    @Async("taskExecutor")
    @Transactional(rollbackFor = CustomException.class)
    @Override
    public void pullImageTask(String name, String userId, HttpServletRequest request) {
        try {
            if(!name.contains(":")) {
                name = name + ":latest";
            }
            dockerClient.pull(name);
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.PULL_IMAGE_FROM_DOCKER_HUB);
        } catch (DockerTimeoutException timoutException){
            sendMQ(userId, null, ResultVOUtils.error(ResultEnum.DOCKER_TIMEOUT));
            // 发送通知
            List<String> receiverList = new ArrayList<>();
            receiverList.add(userId);
            noticeService.sendUserTask("拉取Docker Hub镜像","拉取镜像【"+name+"】失败，连接超时", 4, false, receiverList, null);
            return;
        }catch (Exception e) {
            log.error("Pull Docker Hub镜像失败，错误位置：{}，镜像名：{}，错误栈：{}"
                    , "SysImageServiceImpl.pullImageTask()", name, HttpClientUtils.getStackTraceAsString(e));
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.PULL_IMAGE_FROM_DOCKER_HUB, e);
            // 发送通知
            List<String> receiverList = new ArrayList<>();
            receiverList.add(userId);
            noticeService.sendUserTask("拉取Docker Hub镜像","拉取镜像【"+name+"】失败，Docker拉取异常", 4, false, receiverList, null);

            sendMQ(userId, null, ResultVOUtils.error(ResultEnum.PULL_ERROR));
            return;
        }

        // 保存信息
        try {
            List<Image> images = dockerClient.listImages(DockerClient.ListImagesParam.byName(name));
            if(images.size() <= 0) {
                sendMQ(userId, null, ResultVOUtils.error(ResultEnum.INSPECT_ERROR));
                // 发送通知
                List<String> receiverList = new ArrayList<>();
                receiverList.add(userId);
                noticeService.sendUserTask("拉取Docker Hub镜像", "拉取镜像【" + name + "】失败，查看拉取后镜像信息异常", 4, false, receiverList, null);
                return;
            }

            Image image = images.get(0);

            SysImage sysImage = imageToSysImage(image, image.repoTags().get(0));
            imageMapper.insert(sysImage);
            // 发送通知
            List<String> receiverList = new ArrayList<>();
            receiverList.add(userId);
            noticeService.sendUserTask("拉取Docker Hub镜像","拉取镜像【"+name+"】成功", 4, false, receiverList, null);

            sendMQ(userId, sysImage.getId(), ResultVOUtils.successWithMsg("镜像拉取成功"));
        } catch (Exception e) {
            log.error("获取镜像详情失败，错误位置：{}，镜像名：{}，错误栈：{}",
                    "SysImageServiceImpl.pullImageFromHub()", name, HttpClientUtils.getStackTraceAsString(e));
            // 发送通知
            List<String> receiverList = new ArrayList<>();
            receiverList.add(userId);
            noticeService.sendUserTask("拉取Docker Hub镜像", "拉取镜像【" + name + "】失败，Docker异常", 4, false, receiverList, null);
            sendMQ(userId, null, ResultVOUtils.error(ResultEnum.DOCKER_EXCEPTION));
        }
    }

    @Async("taskExecutor")
    @Transactional(rollbackFor = CustomException.class)
    @Override
    public void pushImageTask(String id, String username, String password, String userId, HttpServletRequest request) {
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
            log.error("Tag镜像异常，错误位置：{}，错误栈：{}",
                    "SysImageServiceImpl.pushImage", HttpClientUtils.getStackTraceAsString(e));
            // 发送通知
            List<String> receiverList = new ArrayList<>();
            receiverList.add(userId);
            noticeService.sendUserTask("推送Docker Hub镜像", "推送镜像【" + imageName + "】失败，Docker异常", 4, false, receiverList, null);
            sendMQ(userId, null, ResultVOUtils.error(ResultEnum.DOCKER_EXCEPTION));
        }

        try {
            // 上传镜像
            dockerClient.push(imageName, registryAuth);
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.PUSH_IMAGE_TO_DOCKER_HUB);
        } catch (ImagePushFailedException ipe) {
            sendMQ(userId, null, ResultVOUtils.error(ResultEnum.PUSH_ERROR));
            // 发送通知
            List<String> receiverList = new ArrayList<>();
            receiverList.add(userId);
            noticeService.sendUserTask("推送Docker Hub镜像", "推送镜像【" + imageName + "】失败，Docker推送异常", 4, false, receiverList, null);
            return;
        } catch (Exception e) {
            log.error("push镜像异常，错误位置：{}，错误栈：{}",
                    "SysImageServiceImpl.pushImage", HttpClientUtils.getStackTraceAsString(e));
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.PUSH_IMAGE_TO_DOCKER_HUB, e);
            // 发送通知
            List<String> receiverList = new ArrayList<>();
            receiverList.add(userId);
            noticeService.sendUserTask("推送Docker Hub镜像", "推送镜像【" + imageName + "】失败，其他错误", 4, false, receiverList, null);

            sendMQ(userId, null, ResultVOUtils.error(ResultEnum.OTHER_ERROR));
            return;
        }

        try {
            // 删除Tag的镜像
            dockerClient.removeImage(imageName);
        } catch (Exception e) {
            log.error("删除镜像异常，错误位置：{}，错误栈：{}",
                    "SysImageServiceImpl.pushImage", HttpClientUtils.getStackTraceAsString(e));
        }
        // 发送通知
        List<String> receiverList = new ArrayList<>();
        receiverList.add(userId);
        noticeService.sendUserTask("推送Docker Hub镜像", "推送镜像【" + imageName + "】成功", 4, false, receiverList, null);
        sendMQ(userId, null, ResultVOUtils.successWithMsg("镜像上传成功，名称为" + imageName));
    }

    /**
     * 导出镜像
     * @author hf
     * @since 2018/7/2 8:15
     */
    @Override
    public ResultVO exportImage(String id, String uid) {
        SysImage image = getById(id);
        if(image == null ) {
            return ResultVOUtils.error(ResultEnum.IMAGE_EXCEPTION);
        }
        if(!hasAuthImage(uid, image)) {
            return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
        }

        String url = serverUrl + "/images/" + image.getFullName() + "/get";
        return ResultVOUtils.success(url);
    }

    /**
     * 导入镜像任务
     * @author jitwxs
     * @since 2018/7/13 17:23
     */
    @Async("taskExecutor")
    @Transactional(rollbackFor = CustomException.class)
    @Override
    public void importImageTask(InputStream stream, String fullName, String uid, HttpServletRequest request) {
        // 导入镜像
        try {
            dockerClient.create(fullName,stream);
            // 获取镜像的信息
            List<Image> list = dockerClient.listImages(DockerClient.ListImagesParam.byName(fullName));
            Image image = CollectionUtils.getListFirst(list);

            SysImage sysImage = imageToSysImage(image, image.repoTags().get(0));
            // 插入数据
            imageMapper.insert(sysImage);
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.IMPORT_IMAGE);
            // 发送通知
            List<String> receiverList = new ArrayList<>();
            receiverList.add(uid);
            noticeService.sendUserTask("导入镜像", "导入镜像【" + fullName + "】成功", 4, false, receiverList, null);
            sendMQ(uid, null, ResultVOUtils.successWithMsg("镜像导入成功"));
        } catch (DockerRequestException requestException){
            log.error("导入镜像失败，错误位置：{}，错误原因：{}",
                    "SysImageServiceImpl.importImageTask()", requestException.getMessage());
            sendMQ(uid, null, ResultVOUtils.error(
                    ResultEnum.SERVICE_CREATE_ERROR.getCode(),HttpClientUtils.getErrorMessage(requestException.getMessage())));
        }catch (Exception e) {
            log.error("导入镜像失败，错误位置：{}，镜像名：{}，错误栈：{}",
                    "SysImageServiceImpl.importImageTask()", fullName, HttpClientUtils.getStackTraceAsString(e));
            // 写入日志
            sysLogService.saveLog(request, SysLogTypeEnum.IMPORT_IMAGE, e);

            // 发送通知
            List<String> receiverList = new ArrayList<>();
            receiverList.add(uid);
            noticeService.sendUserTask("导入镜像", "导入镜像【" + fullName + "】失败,Docker导入失败", 4, false, receiverList, null);

            sendMQ(uid, null, ResultVOUtils.error(ResultEnum.IMPORT_ERROR));
        } finally {
            if(stream != null) {
                try {
                    stream.close();
                } catch (IOException e) {

                }
            }
        }
    }

    /**
     * 查看History
     * @author hf
     * @since 2018/6/28 16:15
     */
    @Override
    public ResultVO getHistory(String id, String uid) {
        SysImage image = getById(id);
        if(image == null) {
            return ResultVOUtils.error(ResultEnum.IMAGE_EXCEPTION);
        }
        // 1、鉴权
        if(!hasAuthImage(uid, image)) {
            return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
        }

        try {
            List<ImageHistory> history = dockerClient.history(image.getFullName());
            return ResultVOUtils.success(history);
        } catch (Exception e) {
            log.error("查看镜像源码文件异常，错误位置：{}，错误栈：{}",
                    "SysImageServiceImpl.imageFile", HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.DOCKER_EXCEPTION);
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
            log.error("清理本地镜像缓存失败，错误位置：{}，错误栈：{}",
                    "SysImageServiceImpl.cleanCache()", HttpClientUtils.getStackTraceAsString(e));
        }
    }

    /**
     * 公开/关闭私有镜像
     * 仅所有者本人操作
     * @author jitwxs
     * @since 2018/7/4 16:12
     */
    @Override
    public ResultVO changOpenImage(String id, String uid, boolean code) {
        SysImage image = getById(id);
        if(image == null) {
            return ResultVOUtils.error(ResultEnum.IMAGE_EXCEPTION);
        }

        if(ImageTypeEnum.LOCAL_USER_IMAGE.getCode() != image.getType() || !uid.equals(image.getUserId())) {
            return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
        }

        // 修改状态
        if(image.getHasOpen() != code) {
            image.setHasOpen(code);
            imageMapper.updateById(image);
            // 清除缓存
            cleanCache(image.getId(), image.getFullName());
        }
        return ResultVOUtils.success();
    }

    @Override
    public ResultVO listExportPorts(String imageId, String userId) {
        SysImage sysImage = getById(imageId);
        if(sysImage == null) {
            return ResultVOUtils.error(ResultEnum.IMAGE_NOT_EXIST);
        }

        // 鉴权
        if(!hasAuthImage(userId,sysImage)) {
            return ResultVOUtils.error(ResultEnum.PERMISSION_ERROR);
        }

        // 获取端口号
        try {
            ImageInfo info = dockerClient.inspectImage(sysImage.getFullName());
            // 形如：["80/tcp"]
            ImmutableSet<String> exposedPorts = info.containerConfig().exposedPorts();

            Set<String> res = new HashSet<>();

            // 取出端口号信息
            if(exposedPorts != null && exposedPorts.size() > 0) {
                exposedPorts.forEach(s -> {
                    res.add(s.split("/")[0]);
                });
            }

            return ResultVOUtils.success(new ArrayList<>(res));
        } catch (DockerRequestException requestException){
            return ResultVOUtils.error(ResultEnum.DOCKER_EXCEPTION.getCode(), HttpClientUtils.getErrorMessage(requestException.getMessage()));
        }catch (Exception e) {
            log.error("获取镜像暴露端口错误，出错位置：{}，出错镜像ID：{}，错误栈：{}",
                    "SysImageServiceImpl.listExportPorts()", imageId, HttpClientUtils.getStackTraceAsString(e));
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

    @Override
    public Page<SysImage> selfImage(String userId, Page<SysImage> page) {
        List<SysImage> records = imageMapper.listSelfImage(userId, page);

        return page.setRecords(records);
    }

    @Override
    public ResultVO cleanImage() {
        List<SysImage> images =  imageMapper.selectList(new EntityWrapper<SysImage>().eq("name", "<none>"));
        int success = 0, error = 0;
        try {
            for(SysImage image : images) {
                dockerClient.removeImage(image.getImageId());
                success++;
            }
        } catch (Exception e) {
            log.error("清理镜像出现异常，异常位置：{}，异常栈：{}",
                    "SysImageServiceImpl.cleanImage()", e.getMessage());
            error++;
        }

        Map<String, Integer> map = new HashMap<>();
        map.put("success", success);
        map.put("error", error);
        return ResultVOUtils.success(map);
    }

    @Override
    public boolean saveImage(String fullName) {
        // 如果数据已存在，不再保存
        if(getByFullName(fullName) != null) {
            return true;
        }

        try {
            List<Image> list = dockerClient.listImages(DockerClient.ListImagesParam.byName(fullName));
            Image image = CollectionUtils.getListFirst(list);

            SysImage sysImage = imageToSysImage(image, image.repoTags().get(0));
            // 插入数据
            imageMapper.insert(sysImage);
            return true;
        } catch (Exception e) {
            log.error("保存镜像数据错误，错误位置：{}，错误栈：{}",
                    "SysImageServiceImpl.saveImage()", HttpClientUtils.getStackTraceAsString(e));
            return false;
        }
    }

    private List<SysImageDTO> sysImage2DTO(List<SysImage> list) {
        return list.stream().map(this::sysImage2DTO).collect(Collectors.toList());
    }

    private SysImageDTO sysImage2DTO(SysImage sysImage){
        SysImageDTO dto = new SysImageDTO();
        BeanUtils.copyProperties(sysImage, dto);

        SysLogin login = loginService.getById(sysImage.getId());
        if(login != null) {
            dto.setUsername(login.getUsername());
        }
        return dto;
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
            log.error("获取镜像信息错误，错误位置：{}，错误栈：{}",
                    "SysImageServiceImpl.imageToSysImage()", HttpClientUtils.getStackTraceAsString(e));
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

    /**
     * 发送系统镜像消息
     * @author jitwxs
     * @since 2018/7/9 18:34
     */
    private void sendMQ(String userId, String imageId, ResultVO resultVO) {
        Destination destination = new ActiveMQQueue("MQ_QUEUE_SYS_IMAGE");
        Task task = new Task();

        Map<String, Object> data = new HashMap<>(16);
        data.put("type", WebSocketTypeEnum.SYS_IMAGE.getCode());
        data.put("imageId", imageId);
        // 获取暴露端口
        ResultVO resultVO1 = listExportPorts(imageId, userId);
        if(ResultEnum.OK.getCode() == resultVO1.getCode()) {
            data.put("exportPort", resultVO1.getData());
        }

        resultVO.setData(data);

        Map<String,String> map = new HashMap<>(16);
        map.put("uid",userId);
        map.put("data", JsonUtils.objectToJson(resultVO));
        task.setData(map);

        mqProducer.send(destination, JsonUtils.objectToJson(task));
    }
}