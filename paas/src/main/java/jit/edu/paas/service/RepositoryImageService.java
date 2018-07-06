package jit.edu.paas.service;


import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import jit.edu.paas.domain.entity.RepositoryImage;
import jit.edu.paas.domain.vo.ResultVo;

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

    List<RepositoryImage> listByName(String name);

    /**
     * 获取数据库镜像列表
     * 返回的是name的列表
     * @author jitwxs
     * @since 2018/7/5 21:04
     */
    Page<RepositoryImage> listRepositoryFromDb(Page<RepositoryImage> page);

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
    ResultVo sync();

    /**
     * 上传本地镜像到Hub中
     * （1）只有普通用户能上传
     * （2）镜像类型属于私有且属于该用户才能上传
     * @param sysImageId 本地镜像ID
     * @author jitwxs
     * @since 2018/7/5 16:51
     */
    ResultVo pushToHub(String sysImageId, String userId);

    /**
     * 从Hub上拉取镜像到本地
     * @param id 镜像ID
     * @author jitwxs
     * @since 2018/7/5 16:53
     */
    ResultVo pullFromHub(String id);

    /**
     * 从Hub上删除镜像
     * @author jitwxs
     * @since 2018/7/5 16:59
     */
    ResultVo deleteFromHub(String id);

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
