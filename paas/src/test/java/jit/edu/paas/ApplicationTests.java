package jit.edu.paas;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import jit.edu.paas.domain.entity.SysLogin;
import jit.edu.paas.service.SysLoginService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class ApplicationTests {
    @Autowired
    private SysLoginService loginService;

    @Test
    public void contextLoads() {
        List<SysLogin> logins = loginService.selectList(new EntityWrapper<SysLogin>()
                .eq("username", "sys")
        );
        System.out.println(logins);
    }

}
