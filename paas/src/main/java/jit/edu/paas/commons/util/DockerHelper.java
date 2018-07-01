package jit.edu.paas.commons.util;

import com.spotify.docker.client.DefaultDockerClient;
import com.spotify.docker.client.DockerClient;

/**
 * Docker操作类
 * @author jitwxs
 * @since 2018/7/1 14:17
 */
public class DockerHelper {
    /**
     * 协议
     */
    private static String protocol = "http://";
    /**
     * API版本
     */
    private static String apiVersion = "v1.32";

    public static void execute(String ip, String port, DockerAction dockerAction) throws Exception {
        DockerClient docker = DefaultDockerClient.builder().uri(protocol.concat(ip).concat(":" + port)).apiVersion(apiVersion).build();
        dockerAction.action(docker);
        docker.close();
    }

    public static <T> T query(String ip, String port, DockerQuery<T> dockerQuery) throws Exception {
        DockerClient docker = DefaultDockerClient.builder().uri(protocol.concat(ip).concat(":" + port)).apiVersion(apiVersion).build();
        T result = dockerQuery.action(docker);
        docker.close();
        return result;
    }

    public interface DockerAction {
        void action(DockerClient docker) throws Exception;
    }

    public interface DockerQuery<T> {
        T action(DockerClient docker) throws Exception;
    }
}
