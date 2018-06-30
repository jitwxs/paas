package jit.edu.paas.controller;

import jit.edu.paas.service.UserContainerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 容器Controller
 * @author jitwxs
 * @since 2018/6/28 14:27
 */
@RestController
@RequestMapping("/container")
public class ContainerController {
    @Autowired
    private UserContainerService containerService;


}
