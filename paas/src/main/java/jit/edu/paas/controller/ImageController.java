package jit.edu.paas.controller;

import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.dto.SysImageDTO;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.enums.ImageTypeEnum;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.enums.RoleEnum;
import jit.edu.paas.domain.vo.ResultVO;
import jit.edu.paas.service.SysImageService;
import jit.edu.paas.service.SysLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;

/**
 * 镜像Controller
 *
 * @author jitwxs
 * @since 2018/6/28 14:27
 */
@RestController
@RequestMapping("/image")
public class ImageController {
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private SysImageService imageService;

    /**
     * 查找本地(服务器)镜像
     * 包含本地公共和本地用户镜像
     * @author jitwxs
     * @since 2018/7/3 15:46
     */
    @GetMapping("/list/local")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO searchLocalImage(@RequestAttribute String uid,  String name, Integer type,
                                     @RequestParam(defaultValue = "1") Integer current,
                                     @RequestParam(defaultValue = "10") Integer size) {
        // 判断参数
        if(type == null) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        Page<SysImageDTO> page = new Page<>(current, size, "create_date", false);

        String roleName = loginService.getRoleName(uid);

        if (type == ImageTypeEnum.LOCAL_PUBLIC_IMAGE.getCode()) {
            // 本地公共镜像
            return ResultVOUtils.success(imageService.listLocalPublicImage(name, page));
        } else if (type == ImageTypeEnum.LOCAL_USER_IMAGE.getCode()) {
            // 系统管理员查看所有本地用户镜像，普通用户只能查看公开的本地用户镜像和自己镜像
            if(RoleEnum.ROLE_USER.getMessage().equals(roleName)) {
                return ResultVOUtils.success(imageService.listLocalUserImage(name, true, uid, page));
            } else {
                return ResultVOUtils.success(imageService.listLocalUserImage(name, false, uid, page));
            }

        } else {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }
    }

    /**
     * 查找Docker Hub镜像
     * @param name 镜像名，必填
     * @param limit 显示条数，选填，默认25
     * 注：该接口不提供分页功能
     * @author jitwxs
     * @since 2018/7/3 15:46
     */
    @GetMapping("/list/hub")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO searchHubImage(String name, @RequestParam(required = false, defaultValue = "10") int limit) {
        return imageService.listHubImage(name, limit);
    }

    /**
     * 查看个人上传的所有镜像
     * @author jitwxs
     * @since 2018/7/12 14:24
     */
    @GetMapping("/self")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO selfImage(@RequestAttribute String uid,  Page<SysImage> page) {
        return ResultVOUtils.success(imageService.selfImage(uid, page));
    }

    /**
     * 查询镜像的详细信息
     * 注：只能查询本地镜像
     * @author hf
     * @since 2018/6/30 10:26
     */
    @GetMapping("/inspect/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO imageInspect(@RequestAttribute("uid") String uid, @PathVariable String id) {
        return imageService.inspectImage(id, uid);
    }

    /**
     * 本地镜像同步
     * 同步本地镜像和数据库信息
     * @author jitwxs
     * @since 2018/7/3 16:37
     */
    @GetMapping("/sync")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO syncLocalImage() {
        return imageService.sync();
    }

    /**
     * 删除镜像
     * 普通用户只能删除自己上传的镜像
     * @param id 镜像ID
     * @author hf
     * @since 2018/6/30 10:26
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO deleteImage(@RequestAttribute String uid, @PathVariable String id, HttpServletRequest request) {
        return imageService.removeImage(id, uid, request);
    }

    /**
     * 从DockHub拉取镜像到本地【WebSocket】
     * @author hf
     * @since 2018/6/30 10:26
     */
    @PostMapping("/pull")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO pullImage(@RequestAttribute String uid, String imageName, HttpServletRequest request) {
        ResultVO resultVO = imageService.pullImageCheck(imageName, uid);
        if(ResultEnum.OK.getCode() != resultVO.getCode()) {
            return resultVO;
        }

        imageService.pullImageTask(imageName, uid, request);
        return ResultVOUtils.success("开始拉取镜像");
    }


    /**
     * push镜像到DockHub【WebSocket】
     * 上传后的格式为 docker账户名 + name
     * 例如Jitwxs用户的rancher/agent --> Jitwxs/agent
     * @author hf
     * @since 2018/6/30 10:26
     */
    @PostMapping("/push")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO pushImage(@RequestAttribute String uid, String imageId, String username, String password, HttpServletRequest request) {
        if(StringUtils.isBlank(imageId, username, password)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }

        imageService.pushImageTask(imageId, username, password, uid, request);
        return ResultVOUtils.success("开始上传镜像");
    }

    /**
     * 导出镜像 返回访问链接，前端直接GET访问即可
     * @author hf
     * @since 2018/7/1 20:48
     */
    @GetMapping("/export/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO exportImage(@RequestAttribute String uid, @PathVariable String id) {
        if(StringUtils.isBlank(id)) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }
        return imageService.exportImage(id, uid);
    }

    /**
     * 查看镜像History
     * @author hf
     * @since 2018/7/1 20:48
     */
    @GetMapping("/history/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO lookImage(@RequestAttribute String uid, @PathVariable String id) {
        return imageService.getHistory(id, uid);
    }

    /**
     * 将私有镜像公开
     * @author jitwxs
     * @since 2018/7/4 16:20
     */
    @GetMapping("/share/{id}")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO shareImage(@RequestAttribute String uid, @PathVariable String id) {
        return imageService.changOpenImage(id, uid, true);
    }

    /**
     * 将私有镜像取消公开
     * @author jitwxs
     * @since 2018/7/4 16:20
     */
    @GetMapping("/disShare/{id}")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVO disShareImage(@RequestAttribute String uid, @PathVariable String id) {
        return imageService.changOpenImage(id, uid, false);
    }

    /**
     * 导入镜像【WebSocket】
     * @param file 镜像文件，只能为tar.gz文件
     * @param imageName 镜像名，不能包含大写字符
     * @param tag 镜像标签，默认为latest
     * @author jitwxs
     * @since 2018/7/25 13:41
     */
    @PostMapping("/import")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO importImage(String imageName, @RequestParam(defaultValue = "latest") String tag, MultipartFile file,
                                @RequestAttribute String uid, HttpServletRequest request) {
        // 校验参数
        if(StringUtils.isBlank(imageName) || file == null) {
            return ResultVOUtils.error(ResultEnum.PARAM_ERROR);
        }
        // 判断镜像名是否有大写字符
        for(int i=0; i<imageName.length(); i++) {
            if(Character.isUpperCase(imageName.charAt(i))){
                return ResultVOUtils.error(ResultEnum.IMAGE_NAME_CONTAIN_UPPER);
            }
        }
        // 判断文件后缀
        if(!file.getOriginalFilename().endsWith(".tar.gz")) {
            return ResultVOUtils.error(ResultEnum.IMAGE_UPLOAD_ERROR_BY_SUFFIX);
        }

        // 拼接完整名：repo/userId/imageName:tag
        String fullName = "local/" + uid + "/" + imageName + ":" + tag;
        // 判断镜像是否存在
        if(imageService.getByFullName(fullName) != null) {
            return ResultVOUtils.error(ResultEnum.IMPORT_ERROR_BY_NAME);
        }

        try {
            InputStream stream = file.getInputStream();
            imageService.importImageTask(stream, fullName, uid, request);
            return ResultVOUtils.success("开始导入镜像");
        } catch (IOException e) {
            return ResultVOUtils.error(ResultEnum.IMPORT_ERROR_BY_NAME);
        }
    }

    /**
     * 获取镜像所有暴露接口
     * @author jitwxs
     * @since 2018/7/7 15:50
     */
    @GetMapping("/{id}/exportPort")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVO listExportPort(@RequestAttribute String uid, @PathVariable String id) {
        return imageService.listExportPorts(id, uid);
    }

    @GetMapping("/clean")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVO cleanImage() {
        return imageService.cleanImage();
    }

}