package jit.edu.paas.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.spotify.docker.client.DockerClient;
import com.spotify.docker.client.messages.ImageSearchResult;
import jit.edu.paas.domain.entity.SysImage;
import jit.edu.paas.domain.enums.ImageTypeEnum;
import jit.edu.paas.mapper.SysImageMapper;
import jit.edu.paas.service.SysImageService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Service
@Slf4j
public class SysImageServiceImpl extends ServiceImpl<SysImageMapper, SysImage> implements SysImageService {
    @Autowired
    private SysImageMapper imageMapper;
    @Autowired
    private DockerClient dockerClient;

    @Override
    public Page<SysImage> listLocalPublicImage(String name, Page<SysImage> page) {
        return page.setRecords(imageMapper.listLocalPublicImage(page, name));
    }

    @Override
    public Page<SysImage> listLocalUserImage(String name, Page<SysImage> page) {
        return page.setRecords(imageMapper.listLocalUserImage(page, name));
    }

    @Override
    public Page<SysImage> listHubImage(String name, Page<SysImage> page) {
        try {
            List<ImageSearchResult> searchResults = dockerClient.searchImages(name);
            searchResults.forEach(System.out::println);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
