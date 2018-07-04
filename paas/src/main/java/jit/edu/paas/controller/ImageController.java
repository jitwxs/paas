package jit.edu.paas.controller;

import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.enums.ImageTypeEnum;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVo;
import jit.edu.paas.service.SysImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

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
     * 查找本地(服务器)镜像
     * 包含本地公共和本地用户镜像
     * @author jitwxs
     * @since 2018/7/3 15:46
     */
    @PostMapping("/search/local")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo searchLocalImage(String name, Integer type, Page<SysImage> page) {
        // 判断参数
        if(StringUtils.isBlank(name) || type == null) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }

        if (type == ImageTypeEnum.LOCAL_PUBLIC_IMAGE.getCode()) {
            // 本地公共镜像
            return ResultVoUtils.success(imageService.listLocalPublicImage(name, page));
        } else if (type == ImageTypeEnum.LOCAL_USER_IMAGE.getCode()) {
            // 用户镜像
            return ResultVoUtils.success(imageService.listLocalUserImage(name, page));
        } else {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
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
    @PostMapping("/search/hub")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo searchHubImage(String name, @RequestParam(defaultValue = "25") Integer limit, Page<SysImage> page) {
        return imageService.listHubImage(name, limit, page);
    }

    /**
     * 查询镜像的详细信息
     * 注：只能查询本地镜像
     * @author hf
     * @since 2018/6/30 10:26
     */
    @GetMapping("/inspect/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo imageInspect(@RequestAttribute("uid") String uid, @PathVariable String id) {
        return imageService.inspectImage(id, uid);
    }

    /**
     * 同步镜像到数据库
     * @author jitwxs
     * @since 2018/7/3 16:37
     */
    @GetMapping("/sync")
    @PreAuthorize("hasRole('ROLE_SYSTEM')")
    public ResultVo syncLocalImage() {
        return imageService.syncLocalImage();
    }

    /**
     * 删除镜像
     * @param id 镜像ID
     * @author hf
     * @since 2018/6/30 10:26
     */
    @DeleteMapping("/delete/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo deleteImage(@RequestAttribute String uid, @PathVariable String id) {
        return imageService.removeImage(id, uid);
    }

    /**
     * 从DockHub拉取镜像到本地
     * @author hf
     * @since 2018/6/30 10:26
     */
    @PostMapping("/pull/hub")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo pullImage(String imageName) {
        if(StringUtils.isBlank(imageName)) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }
        return imageService.pullImageFromHub(imageName);
    }


    /**
     * push镜像到dockHub
     * 上传后的格式为 docker账户名 + name
     * 例如Jitwxs用户的rancher/agent --> Jitwxs/agent
     * @author hf
     * @since 2018/6/30 10:26
     */
    @PostMapping("/push/hub")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo pushImage(String imageId, String username, String password) {
        if(StringUtils.isBlank(imageId, username, password)) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
        }
        return imageService.pushImage(imageId, username, password);
    }

    /**
     * 导出镜像 返回访问链接，前端直接GET访问即可
     * @author hf
     * @since 2018/7/1 20:48
     */
    @GetMapping("/export/{id}")
    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
    public ResultVo exportImage(@RequestAttribute String uid, @PathVariable String id) {
        if(StringUtils.isBlank(id)) {
            return ResultVoUtils.error(ResultEnum.PARAM_ERROR);
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
    public ResultVo lookImage(@RequestAttribute String uid, @PathVariable String id) {
        return imageService.getHistory(id, uid);
    }

    /**
     * 将私有镜像公开
     * @author jitwxs
     * @since 2018/7/4 16:20
     */
    @GetMapping("/share")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVo shareImage(@RequestAttribute String uid, @PathVariable String id) {
        return imageService.changOpenImage(id, uid, true);
    }

    /**
     * 将私有镜像取消公开
     * @author jitwxs
     * @since 2018/7/4 16:20
     */
    @GetMapping("/disShare")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ResultVo disShareImage(@RequestAttribute String uid, @PathVariable String id) {
        return imageService.changOpenImage(id, uid, false);
    }

//    /**
//     * 导入镜像  后期待处理：上传的文件是否要删除
//     * @author hf
//     * @since 2018/7/1 20:48
//     */
//    @PostMapping("/import")
//    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
//    public ResultVo importImage(@RequestAttribute String uid, HttpServletRequest request) {
//        return imageService.importImage(uid, request);
//    }

//    /**
//     * 由dockerfile建立镜像 有错未解决 未成功
//     * 报错：HTTP/1.1 500 Internal Server Error {"message":"unexpected EOF"}
//     *  出错大概原因：运行new file()时未保留文件中的回车符和换行符。。。。
//     * 注：访问docker的/build接口时 文件必须为tar stream
//     * 命令行成功过的示例：curl -v -X POST -H "Content-Type:application/tar" --data-binary '@Dockerfile.tar.gz' http://localhost:2375/build?t=23sb23
//     * 如果是@file_name,则保留文件中的回车符和换行符，不做任何转换
//     * @author hf
//     * @since 2018/7/1 20:48
//     */
//    @PostMapping("/bulid")
//    @PreAuthorize("hasRole('ROLE_USER') or hasRole('ROLE_SYSTEM')")
//    public ResultVo buildImage(@RequestAttribute String uid, HttpServletRequest request) {
//        String fileName = imageService.uploadImages(httpRequest);
//        if(fileName != null) {
//            String result = imageService.importImage(uid, fileName);
//            if (result != null) {
//                return ResultVoUtils.success("build镜像成功，build的镜像名为:" + result);
//            }
//        }
//        return  ResultVoUtils.error(ResultEnum.IMPORT_ERROR);
//    }
}
