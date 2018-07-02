package jit.edu.paas.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.google.common.collect.ImmutableSet;
import jit.edu.paas.domain.entity.SysImage;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 *  镜像服务类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
public interface SysImageService extends IService<SysImage> {

    /**
     * 获取本地公共镜像
     * @author jitwxs
     * @since 2018/6/28 16:15
     */
    Page<SysImage> listLocalPublicImage(String name, Page<SysImage> page);

    /**
     * 获取本地用户镜像
     * @author jitwxs
     * @since 2018/6/28 16:15
     */
    Page<SysImage> listLocalUserImage(String name, Page<SysImage> page);

    /**
     * 获取Docker Hub镜像
     * @author jitwxs
     * @since 2018/6/28 16:15
     */
    Page<SysImage> listHubImage(String name, Page<SysImage> page);

    /**
     * 为用户导入本地的镜像
     * @author sya
     */
    String uploadImages(@RequestParam HttpServletRequest req);

    /**
     * 获取一个镜像的所有暴露接口
     * @author jitwxs
     * @since 2018/7/2 8:42
     */
    ImmutableSet<String> listExportPorts(String imageName);
}
