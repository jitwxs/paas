package jit.edu.paas.commons.activemq;

import jit.edu.paas.commons.util.JsonUtils;
import jit.edu.paas.domain.entity.SysLogin;
import jit.edu.paas.service.SysLoginService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.annotation.JmsListener;

import java.util.Map;

/**
 * 邮箱注册消费者
 * @author jitwxs
 * @since 2018/6/29 17:14
 */
@Slf4j
public class RegisterConsumer {
    @Autowired
    private SysLoginService loginService;

    @JmsListener(destination = "MQ_QUEUE_REGISTER")
    public void receiveQueue(String text) {
        if(StringUtils.isNotBlank(text)){
            Task task = JsonUtils.jsonToObject(text, Task.class);

            Map<String, Object> map = task.getData();
            String email = (String) map.get("email");
            log.info("验证未激活邮箱，目标邮箱：{}", email);

            SysLogin login = loginService.getByEmail(email);
            if(login != null && login.getHasFreeze()) {
                loginService.deleteById(login);
            }
        }
    }
}
