package jit.edu.paas.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.google.common.collect.ImmutableSet;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.vo.ResultVo;

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
    SysImage getById(String id);

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
     * 获取Docker Hub镜像列表
     * @author jitwxs
     * @since 2018/6/28 16:15
     */
    ResultVo listHubImage(String name, Integer limit,  Page<SysImage> page);

    /**
     * 根据完整名获取镜像
     * @author jitwxs
     * @since 2018/7/4 11:24
     */
    SysImage getByFullName(String fullName);

    /**
     * 查询镜像详细信息
     * @author hf
     * @since 2018/6/28 16:15
     */
    ResultVo inspectImage(String id, String userId);

    /**
     * 同步本地镜像到数据库
     * @author jitwxs
     * @since 2018/7/3 16:38
     */
    ResultVo syncLocalImage();

    /**
     * 删除镜像
     * @author hf
     * @since 2018/6/28 16:15
     */
    ResultVo removeImage(String id, String userId);

    /**
     * 从DockerHub上拉取镜像
     * @author hf
     * @since 2018/6/28 16:15
     */
    ResultVo pullImageFromHub(String name);

    /**
     *  push镜像
     * @author hf
     * @since 2018/6/28 16:15
     */
    ResultVo pushImage(String id, String username, String password);

    /**
     *  导出镜像
     * @author hf
     * @since 2018/7/2 8:15
     */
    ResultVo exportImage(String id, String uid);

    /**
     *  查看History
     * @author hf
     * @since 2018/6/28 16:15
     */
    ResultVo getHistory(String id, String uid);

    /**
     * 公开/关闭私有镜像
     * 仅所有者本人操作
     * @author jitwxs
     * @since 2018/7/4 16:12
     */
    ResultVo changOpenImage(String id, String uid, boolean code);

    /**
     * 获取一个镜像的所有暴露接口
     * @author jitwxs
     * @since 2018/7/2 8:42
     */
    ImmutableSet<String> listExportPorts(String imageId);

    /**
     *  导入镜像
     * @author hf
     * @since 2018/7/2 8:15
     */
    ResultVo importImage(String uid,HttpServletRequest request);
    /**
     * 文件上传
     * @author sya
     * @since 6.30
     */
    String uploadImages(HttpServletRequest request);

    /**
     *  dockerfile建立镜像
     * @author hf
     * @since 2018/7/2 8:15
     */
    String buildImage(String imageName,String file);

    /**
     * 清理缓存
     * 根据ID或完整名清理
     * @author jitwxs
     * @since 2018/7/4 16:25
     */
    void cleanCache(String id, String fullName);

    /**
     * 是否有权限访问镜像
     * @author jitwxs
     * @since 2018/7/4 16:55
     */
    Boolean hasAuthImage(String userId, SysImage image);
}
