package jit.edu.paas.service;


import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.entity.RepositoryImage;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.vo.HubImageVO;
import jit.edu.paas.domain.vo.ResultVO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 * 仓储镜像 服务类
 * </p>
 *
 * @author jitwxs
 * @since 2018-07-05
 */
public interface RepositoryImageService extends IService<RepositoryImage> {
    RepositoryImage getById(String id);

    /**
     * 获取所有镜像名列表
     * @author jitwxs
     * @since 2018/7/15 16:38
     */
    List<HubImageVO> listHubImageVO();

    List<RepositoryImage> listByName(String name);

    /**
     * 列出Hub上仓库
     * @author jitwxs
     * @since 2018/7/5 16:54
     */
    List<String> listRepositoryFromHub() throws Exception ;

    /**
     * 列出Hub上指定镜像的所有Tag
     * @author jitwxs
     * @since 2018/7/5 16:58
     */
    List<String> listTagsFromHub(String fullName) throws Exception ;

    /**
     * 同步Hub和数据库信息
     * @author jitwxs
     * @since 2018/7/5 16:58
     */
    ResultVO sync();

    /**
     * Push前校验
     * @author jitwxs
     * @since 2018/7/13 19:04
     */
    ResultVO pushCheck(String sysImageId, String userId);

    /**
     * 上传本地镜像到Hub中
     * （1）只有普通用户能上传
     * （2）镜像类型属于私有且属于该用户才能上传
     * @param sysImage 本地镜像对象
     * @author jitwxs
     * @since 2018/7/5 16:51
     */
    void pushTask(SysImage sysImage, String userId ,HttpServletRequest request);

    /**
     * Pull前校验
     * @author jitwxs
     * @since 2018/7/13 19:57
     */
    ResultVO pullCheck(String id);

    /**
     * 从Hub上拉取镜像到本地
     * @author jitwxs
     * @since 2018/7/13 19:58
     */
    void pullTask(RepositoryImage repositoryImage, String userId, HttpServletRequest request);

    /**
     * 从Hub上删除镜像
     * @author jitwxs
     * @since 2018/7/5 16:59
     */
    ResultVO deleteImage(String id, HttpServletRequest request);

    /**
     * 查询镜像的digest
     * @param name 镜像名
     * @param tag 镜像tag
     * @author jitwxs
     * @since 2018/7/5 22:36
     */
    String getDigest(String name, String tag) throws Exception ;

    /**
     * 清理缓存
     * 可根据name或id清理
     * @author jitwxs
     * @since 2018/7/6 9:22
     */
    void cleanCache(String id, String name);

    /**
     * 判断镜像是否存在
     * @author jitwxs
     * @since 2018/7/6 9:35
     */
    Boolean hasExist(String fullName);
}
