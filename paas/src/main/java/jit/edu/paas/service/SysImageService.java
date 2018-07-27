package jit.edu.paas.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.dto.SysImageDTO;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.vo.ResultVO;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;

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
    Page<SysImageDTO> listLocalPublicImage(String name, Page<SysImageDTO> page);

    /**
     * 获取本地用户镜像
     * @param filterOpen 是否只显示公开镜像
     * @author jitwxs
     * @since 2018/6/28 16:15
     */
    Page<SysImageDTO> listLocalUserImage(String name, boolean filterOpen, String userId, Page<SysImageDTO> page);

    /**
     * 获取Docker Hub镜像列表
     * @author jitwxs
     * @since 2018/6/28 16:15
     */
    ResultVO listHubImage(String name, Integer limit);

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
    ResultVO inspectImage(String id, String userId);

    /**
     * 同步本地镜像到数据库
     * @author jitwxs
     * @since 2018/7/3 16:38
     */
    ResultVO sync();

    /**
     * 删除镜像
     * @author hf
     * @since 2018/6/28 16:15
     */
    ResultVO removeImage(String id, String userId, HttpServletRequest request);


    ResultVO pullImageCheck(String name, String userId);
    /**
     * 从DockerHub上拉取镜像任务
     * @author jitwxs
     * @since 2018/7/13 16:26
     */
    void pullImageTask(String name, String userId, HttpServletRequest request);

    /**
     * 上传镜像到DockerHub任务
     * @author jitwxs
     * @since 2018/7/13 16:25
     */
    void pushImageTask(String id, String username, String password, String userId, HttpServletRequest request);

    /**
     *  导出镜像
     * @author hf
     * @since 2018/7/2 8:15
     */
    ResultVO exportImage(String id, String uid);

    /**
     *  查看History
     * @author hf
     * @since 2018/6/28 16:15
     */
    ResultVO getHistory(String id, String uid);

    /**
     * 公开/关闭私有镜像
     * 仅所有者本人操作
     * @author jitwxs
     * @since 2018/7/4 16:12
     */
    ResultVO changOpenImage(String id, String uid, boolean code);

    /**
     * 获取一个镜像的所有暴露接口
     * @author jitwxs
     * @since 2018/7/2 8:42
     */
    ResultVO listExportPorts(String imageId, String userId);

    /**
     * 导入镜像
     * @param stream 文件流对象
     * @param fullName 镜像完整名
     * @author jitwxs
     * @since 2018/7/13 17:22
     */
    void importImageTask(InputStream stream, String fullName, String uid, HttpServletRequest request);

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

    /**
     * 获取当前用户的所有镜像
     * @author jitwxs
     * @since 2018/7/12 14:34
     */
    Page<SysImage> selfImage(String userId, Page<SysImage> page);

    /**
     * 清理无效镜像
     */
    ResultVO cleanImage();

    /**
     * 根据完整名保存数据
     * @author jitwxs
     * @since 2018/7/26 20:27
     */
    boolean saveImage(String fullName);
}