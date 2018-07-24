package jit.edu.paas.commons.convert;

import com.baomidou.mybatisplus.plugins.Page;
import jit.edu.paas.commons.util.StringUtils;
import jit.edu.paas.domain.dto.UserServiceDTO;
import jit.edu.paas.domain.entity.UserService;
import jit.edu.paas.service.UserProjectService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

/**
 * UserService --> UserServiceDTO
 * @author hf
 * @since 2018/7/13 09:10
 */
@Component
public class UserServiceDTOConvert {
    @Autowired
    private UserProjectService projectService;

    @Value("${docker.swarm.manager.address}")
    private String serverIp;

    public UserServiceDTO convert(UserService userService) {
        if(userService == null) {
            return null;
        }

        UserServiceDTO dto = new UserServiceDTO();
        BeanUtils.copyProperties(userService, dto);

        String projectId = userService.getProjectId();
        if(StringUtils.isNotBlank(projectId)) {
            String projectName = projectService.getProjectName(projectId);
            dto.setProjectName(projectName);
        }

        dto.setIp(serverIp);

        return dto;
    }

    public List<UserServiceDTO> convert(List<UserService> userServices) {
        return userServices.stream().map(this::convert).collect(Collectors.toList());
    }

    public Page<UserServiceDTO> convert(Page<UserService> page) {
        List<UserService> userServices = page.getRecords();
        List<UserServiceDTO> userServiceDTOS = convert(userServices);

        Page<UserServiceDTO> page1 = new Page<>();
        BeanUtils.copyProperties(page, page1);
        page1.setRecords(userServiceDTOS);

        return page1;
    }
}