package jit.edu.paas.controller;

import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.socket.FileTransferClient;
import jit.edu.paas.commons.util.HttpClientUtils;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.entity.SysVolume;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.enums.VolumeTypeEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.domain.vo.SysVolumeVO;
import jit.edu.paas.service.SysVolumeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

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
     * 上传文件到数据卷
     * @param request 包含ID（数据卷ID）、File对象（文件）
     * @author jitwxs
     * @since 2018/7/11 14:21
     */
    @PostMapping("/upload")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO uploadToVolumes(@RequestAttribute String uid, HttpServletRequest request) {
        StandardMultipartHttpServletRequest req;
        try {
            req = (StandardMultipartHttpServletRequest) request;
        } catch (Exception e) {
            return ResultVOUtils.error(ResultEnum.IMPORT_ERROR);
        }

        // 1、校验参数
        String id = null;
        Iterator<String> iterator = req.getFileNames();
        Enumeration<String> names = req.getParameterNames();

        while (names.hasMoreElements()) {
            String key = names.nextElement();
            if("id".equals(key)) {
                id = req.getParameter(key);
                break;
            }
        }
        if(StringUtils.isEmpty(id) || !iterator.hasNext()) {
            ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        // 2、鉴权
        SysVolume volume = sysVolumeService.getById(id);
        ResultVO resultVO = sysVolumeService.checkPermission(uid, volume);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }

        // 3、上传
        int successCount = 0, errorCount = 0,times = 0;
        try {
            FileTransferClient transferClient = new FileTransferClient();
            while (iterator.hasNext()) {
                MultipartFile file = req.getFile(iterator.next());
                int i = transferClient.sendFile(volume.getSource(), file);
                if(i != -1) {
                    successCount++;
                    times += i;
                } else {
                    errorCount++;
                }
            }
        } catch (IOException e) {
            log.error("上传数据卷出现错误，错误位置：{}，错误栈：{}",
                    "SysVolumeServiceImpl.uploadToVolumes()", HttpClientUtils.getStackTraceAsString(e));
            return ResultVOUtils.error(ResultEnum.VOLUME_UPLOAD_ERROR);
        }

        Map<String, Integer> map = new HashMap<>(16);
        map.put("success", successCount);
        map.put("error", errorCount);
        map.put("times", times);
        return ResultVOUtils.success(map);
    }
}


