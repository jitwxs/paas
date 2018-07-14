package jit.edu.paas.config;

import com.spotify.docker.client.DefaultDockerClient;
import com.spotify.docker.client.DockerClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.net.URI;

/**
 * @author jitwxs
 * @since 2018/6/28 14:29
 */
@Configuration
public class DockerSwarmConfig {
    @Value("${docker.swarm.manager.url}")
    private String serverUrl;

    @Bean(name = "dockerSwarmClient")
    DockerClient dockerClient() {
        return DefaultDockerClient.builder()
                .uri(URI.create(serverUrl))
//                        .dockerCertificates(new DockerCertificates(Paths.get("D:/")))
                .build();
    }
}
