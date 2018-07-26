package jit.edu.paas.controller;

import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.activemq.MQProducer;
import jit.edu.paas.commons.activemq.Task;
import jit.edu.paas.commons.socket.FileTransferClient;
import jit.edu.paas.commons.util.HttpClientUtils;
import jit.edu.paas.commons.util.JsonUtils;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.entity.SysVolume;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.enums.VolumeTypeEnum;
import jit.edu.paas.domain.enums.WebSocketTypeEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.domain.vo.SysVolumeVO;
import jit.edu.paas.exception.CustomException;
import jit.edu.paas.service.SysVolumeService;
import lombok.extern.slf4j.Slf4j;
import org.apache.activemq.command.ActiveMQQueue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest;

import javax.jms.Destination;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.ConnectException;
import java.util.*;

/**
 * 数据卷Controller
 * @author jitwxs
 * @since 2018/7/4 17:05
 */
@Slf4j
@RestController
@RequestMapping("/volumes")
public class VolumesController {
    @Autowired
    private SysVolumeService sysVolumeService;
    @Autowired
    private MQProducer mqProducer;

    @Value("${file.socket.port}")
    private Integer socketPort;
    @Value("${docker.server.address}")
    private String dockerServerAddress;
    @Value("${docker.swarm.manager.address}")
    private String dockerSwarmAddress;


    /**
     * 列出某一容器/服务所有数据卷
     * @author jitwxs
     * @since 2018/7/4 17:32
     */
    @GetMapping("/list/obj")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO listByObjId(Page<SysVolumeVO> page, @RequestAttribute String uid, String objId) {
        if(StringUtils.isBlank(objId)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }
        return sysVolumeService.listByObjId(page, objId, uid);
    }

    /**
     * 获取数据卷详情
     * @author jitwxs
     * @since 2018/7/4 17:32
     */
    @GetMapping("/inspect/id/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO inspectVolumesById(@RequestAttribute String uid, @PathVariable String id){
        return sysVolumeService.inspectVolumes(id, uid);
    }

    /**
     * 获取数据卷详情
     * @author jitwxs
     * @since 2018/7/4 17:32
     */
    @GetMapping("/inspect/name/{name}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO inspectVolumesByName(@RequestAttribute String uid, @PathVariable String name) {
        SysVolume sysVolume = sysVolumeService.getByName(name);
        if(sysVolume == null) {
            return ResultVOUtils.error(ResultEnum.VOLUME_NOT_SUPPORT_VIEW);
        }
        return sysVolumeService.inspectVolumes(sysVolume.getId(), uid);
    }

    /**
     * 获取本地所有数据卷
     * @author jitwxs
     * @since 2018/7/5 13:02
     */
    @GetMapping("/list/{type}")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO listFromLocal(@PathVariable Integer type) {
        VolumeTypeEnum enums = VolumeTypeEnum.getEnum(type);
        if(enums == null) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        return sysVolumeService.listFromLocal(enums);
    }

    /**
     * 清理数据卷
     * @author jitwxs
     * @since 2018/7/4 17:36
     */
    @DeleteMapping("/clean/{type}")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO cleanVolumes(@PathVariable Integer type) {
        VolumeTypeEnum enums = VolumeTypeEnum.getEnum(type);
        if(enums == null) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        return sysVolumeService.cleanVolumes(enums);
    }

    /**
     * 上传文件到数据卷【WebSocket】
     * @param id 数据卷ID
     * @param file 文件
     * @author jitwxs
     * @since 2018/7/11 14:21
     */
    @PostMapping("/upload")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO uploadToVolumes(@RequestAttribute String uid,
                                    String id, MultipartFile file) {
        // 1、校验参数
        if (StringUtils.isBlank(id) || file == null) {
            ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        // 2、鉴权
        SysVolume volume = sysVolumeService.getById(id);
        ResultVO resultVO = sysVolumeService.checkPermission(uid, volume);
        if (ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }

        try {
            // 初始化上传参数
            FileTransferClient transferClient;
            if (volume.getType() == VolumeTypeEnum.CONTAINER.getCode()) {
                transferClient = new FileTransferClient(dockerServerAddress, socketPort);
            } else if (volume.getType() == VolumeTypeEnum.SERVICE.getCode()) {
                transferClient = new FileTransferClient(dockerSwarmAddress, socketPort);
            } else {
                return ResultVOUtils.error(ResultEnum.OTHER_ERROR.getCode(), "数据卷类型错误");
            }

            // 上传
            uploadVolumeTask(file, volume, transferClient, uid);
            return ResultVOUtils.success("开始上传文件");
        } catch (ConnectException connectException){
            log.error("Socket连接建立失败，错误位置：{}","VolumesController.uploadToVolumes()");
            return ResultVOUtils.error(ResultEnum.CONNECTION_REFUSED);
        }catch (IOException e) {
            log.error("创建FileTransferClient错误，错误位置：{}，错误栈：{}",
                    "VolumesController.uploadToVolumes()", HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.VOLUME_UPLOAD_ERROR);
        }
    }

    private void uploadVolumeTask(MultipartFile file, SysVolume volume, FileTransferClient transferClient, String userId) {
        int successCount = 0, errorCount = 0,times = 0;
        try {
            int i = transferClient.sendFile(volume.getSource(), file);
            if(i == -1) {
                throw new CustomException(ResultEnum.UPLOAD_ERROR);
            }
            transferClient.closeClient();
        } catch (Exception e) {
            log.error("上传数据卷出现错误，错误位置：{}，错误栈：{}",
                    "VolumesController.uploadToVolumes()", HttpClientUtils.getStackTraceAsString(e));
            sendMQ(userId, volume.getId(), ResultVOUtils.error(ResultEnum.VOLUME_UPLOAD_ERROR));
        }

        Map<String, Integer> map = new HashMap<>(16);
        map.put("success", successCount);
        map.put("error", errorCount);
        map.put("times", times);
        sendMQ(userId, volume.getId(), ResultVOUtils.success("文件上传成功", map));
    }

    /**
     * 发送数据卷消息
     * @author jitwxs
     * @since 2018/7/9 18:34
     */
    private void sendMQ(String userId, String volumeId, ResultVO resultVO) {
        Destination destination = new ActiveMQQueue("MQ_QUEUE_VOLUME");
        Task task = new Task();

        Map<String, Object> data = new HashMap<>(16);
        data.put("type", WebSocketTypeEnum.VOLUME.getCode());
        data.put("volumeId", volumeId);
        resultVO.setData(data);

        Map<String,String> map = new HashMap<>(16);
        map.put("uid",userId);
        map.put("data", JsonUtils.objectToJson(resultVO));
        task.setData(map);

        mqProducer.send(destination, JsonUtils.objectToJson(task));
    }
}


