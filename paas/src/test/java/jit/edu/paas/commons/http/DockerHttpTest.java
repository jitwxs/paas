package jit.edu.paas.commons.http;

import com.spotify.docker.client.messages.ImageSearchResult;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DockerHttpTest {
    @Test
    public void testImagesSearch() {
        List<ImageSearchResult> list = DockerHttp.searchImages("nginx", 10);

        list.forEach(System.out::println);
    }
}