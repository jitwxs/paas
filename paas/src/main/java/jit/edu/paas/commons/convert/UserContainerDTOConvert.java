package jit.edu.paas.commons.convert;

import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.dto.UserContainerDTO;
import jit.edu.paas.domain.entity.UserContainer;
import jit.edu.paas.domain.enums.ContainerStatusEnum;
import jit.edu.paas.service.SysLoginService;
import jit.edu.paas.service.UserProjectService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

/**
 * UserContainer --> UserContainerDTO
 * @author jitwxs
 * @since 2018/7/9 22:32
 */
@Component
public class UserContainerDTOConvert {
    @Autowired
    private UserProjectService projectService;
    @Autowired
    private SysLoginService sysLoginService;
    @Value("${docker.server.address}")
    private String serverIp;

    public UserContainerDTO convert(UserContainer container) {
        if(container == null) {
            return null;
        }
        UserContainerDTO dto = new UserContainerDTO();
        BeanUtils.copyProperties(container, dto);

        String projectId = container.getProjectId();
        if(StringUtils.isNotBlank(projectId)) {
            String projectName = projectService.getProjectName(projectId);
            dto.setProjectName(projectName);
        }

        Integer status = container.getStatus();
        if(status != null) {
            dto.setStatusName(ContainerStatusEnum.getMessage(status));
        }

        String userId = projectService.getUserId(container.getProjectId());
        if(StringUtils.isNotBlank(projectId)) {
            String username= sysLoginService.getById(userId).getUsername();
            dto.setUsername(username);
        }

        if(StringUtils.isNotBlank(projectId)) {
            String projectName = projectService.getProjectName(projectId);
            dto.setProjectName(projectName);
        }

        dto.setIp(serverIp);

        return dto;
    }

    public List<UserContainerDTO> convert(List<UserContainer> containers) {
        return containers.stream().map(this::convert).collect(Collectors.toList());
    }

    public Page<UserContainerDTO> convert(Page<UserContainer> page) {
        List<UserContainer> containers = page.getRecords();
        List<UserContainerDTO> containerDTOS = convert(containers);

        Page<UserContainerDTO> page1 = new Page<>();
        BeanUtils.copyProperties(page, page1);
        page1.setRecords(containerDTOS);

        return page1;
    }
}