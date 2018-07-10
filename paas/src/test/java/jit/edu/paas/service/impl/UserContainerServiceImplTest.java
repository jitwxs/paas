package jit.edu.paas.service.impl;

import com.spotify.docker.client.DockerClient;
import jit.edu.paas.service.UserContainerService;
import lombok.extern.slf4j.Slf4j;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
@Slf4j

public class UserContainerServiceImplTest {
    @Autowired
    private UserContainerService userContainerService;
    @Autowired
    private DockerClient dockerClient;
//    @Test
//    public void startContainer() {
//        try {
//            dockerClient.startContainer("b44c0b7f849a237b0f825230aacaed9be347e904d299ad1753dc2a712c9da227");
//            List<UserContainer> list = userContainerMapper.selectList(new EntityWrapper<UserContainer>().eq("id","091639278b14be95c81680d9a4361e1fcbded3af1c83fb5f29e4a0056d2cea44"));
//            UserContainer uc = CollectionUtils.getListFirst(list);
//            uc.setStatus("1");
//            userContainerMapper.updateById(uc);
//        } catch (DockerException e) {
//            e.printStackTrace();
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//            log.error("运行失败，检查参数是否正确");
//        }
//    }
//
//    @Test
//    public void getContainerListByUser() {
//        Page<UserContainer> page = new Page<>();
//        Page<UserContainer> userContainer = new Page<>();
//        List<UserContainer> userlist= userContainerMapper.listContainerById("4151361367131");
//        System.out.println("..."+userlist);
//        System.out.println("..."+page.setRecords(userlist));
//    }
//
//    @Test
//    public void stopContainer() {
//        try {
//            dockerClient.stopContainer("9bdfd7e51f22d20080498750629329f98d64b6e461f55a7d27aa9fe855c53689",5);
//            List<UserContainer> list = userContainerMapper.selectList(new EntityWrapper<UserContainer>().eq("id","9bdfd7e51f22d20080498750629329f98d64b6e461f55a7d27aa9fe855c53689"));
//            UserContainer uc = CollectionUtils.getListFirst(list);
//            uc.setStatus("0");
//            userContainerMapper.updateById(uc);
//        } catch (DockerException e) {
//            e.printStackTrace();
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//            log.error("运行失败，检查参数是否正确");
//        }
//    }
//
//    @Test
//    public void killContainer() {
//        try {
//            dockerClient.killContainer("091639278b14be95c81680d9a4361e1fcbded3af1c83fb5f29e4a0056d2cea44");
//            List<UserContainer> list = userContainerMapper.selectList(new EntityWrapper<UserContainer>().eq("id","091639278b14be95c81680d9a4361e1fcbded3af1c83fb5f29e4a0056d2cea44"));
//            UserContainer uc = CollectionUtils.getListFirst(list);
//            uc.setStatus("0");
//            userContainerMapper.updateById(uc);
//        } catch (DockerException e) {
//            e.printStackTrace();
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//            log.error("运行失败，检查参数是否正确");
//        }
//    }
//
//    @Test
//    public void removeContainer() {
//        try {
//            dockerClient.removeContainer("979dba5a47ca19c95f6a6ea5defc019257e3d093684d9f6801d51d9780ca4cd4");
//            userContainerMapper.deleteById("979dba5a47ca19c95f6a6ea5defc019257e3d093684d9f6801d51d9780ca4cd4");
//        } catch (DockerException e) {
//            e.printStackTrace();
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//            log.error("运行失败，检查参数是否正确");
//        }
//    }
//
//    @Test
//    public void pauseContainer() {
//        try {
//            dockerClient.pauseContainer("091639278b14be95c81680d9a4361e1fcbded3af1c83fb5f29e4a0056d2cea44");
//            List<UserContainer> list = userContainerMapper.selectList(new EntityWrapper<UserContainer>().eq("id","091639278b14be95c81680d9a4361e1fcbded3af1c83fb5f29e4a0056d2cea44"));
//            UserContainer uc = CollectionUtils.getListFirst(list);
//            uc.setStatus("2");
//            userContainerMapper.updateById(uc);
//        } catch (DockerException e) {
//            e.printStackTrace();
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//            log.error("运行失败，检查参数是否正确");
//        }
//    }
//
//    @Test
//    public void unpauseContainer() {
//        try {
//            dockerClient.unpauseContainer("091639278b14be95c81680d9a4361e1fcbded3af1c83fb5f29e4a0056d2cea44");
//            List<UserContainer> list = userContainerMapper.selectList(new EntityWrapper<UserContainer>().eq("id","091639278b14be95c81680d9a4361e1fcbded3af1c83fb5f29e4a0056d2cea44"));
//            UserContainer uc = CollectionUtils.getListFirst(list);
//            uc.setStatus("1");
//            userContainerMapper.updateById(uc);
//        } catch (DockerException e) {
//            e.printStackTrace();
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//            log.error("运行失败，检查参数是否正确");
//        }
//    }
//
//    @Test
//    public void getTopResult() {
//        try {
//            System.out.println("..."+dockerClient.topContainer("a6c963cab58f4d795dfbe93f6f587c7c58bb258e1fac8bbc1d69c1f80268abc2","-aux"));
//        } catch (DockerException e) {
//            e.printStackTrace();
//            log.error("运行失败，容器未在运行");
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//            log.error("运行失败，检查参数是否正确");
//        }
//    }

}