package jit.edu.paas.controller;

import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.enums.ImageTypeEnum;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.service.SysImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.NotNull;

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
    private SysImageService imageService;

    /**
     * 获取镜像列表
     *
     * @author jitwxs
     * @since 2018/6/28 14:43
     */
    @PostMapping("/list")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo listImagesByType(String name, @NotNull Integer type, Page<SysImage> page) {
        Page<SysImage> images;

        if (type == ImageTypeEnum.LOCAL_PUBLIC_IMAGE.getCode()) {
            images = imageService.listLocalPublicImage(name, page);
        } else if (type == ImageTypeEnum.LOCAL_USER_IMAGE.getCode()) {
            images = imageService.listLocalUserImage(name, page);
        } else if (type == ImageTypeEnum.CLOUD_HUB_IMAGE.getCode()) {
            images = imageService.listHubImage(name, page);
        } else {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }

        return ResultVoUtils.success(images);
    }

    /**
     * 上传镜像
     *
     * @author sya
     */
    @PostMapping("/imageupload")
    public ResultVo imageUpLoad(HttpServletRequest hs) {
        String message = imageService.uploadImages(hs);
        return ResultVoUtils.success();
    }
}
