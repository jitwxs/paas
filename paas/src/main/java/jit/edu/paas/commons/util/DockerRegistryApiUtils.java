package jit.edu.paas.commons.util;

import org.apache.http.Header;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Docker Registry API V2
 * https://docs.docker.com/registry/spec/api/
 * @author jitwxs
 * @since 2018/7/5 14:24
 */
public class DockerRegistryApiUtils {
    private static int HTTP_OK = 200;
    private static String HTTP_PREFIX = "http://";
    /**
     * 列出镜像库
     * @author jitwxs
     * @since 2018/7/5 14:27
     */
    public static List<String> listRepositories(String registryUrl) throws Exception {
        String url = getUrl(registryUrl, HTTP_PREFIX) + "/v2/_catalog";

        Map<String, Object> map = HttpClientUtils.sendGetRequest(url, null, null);
        Integer code = (Integer)map.get("code");
        if(HTTP_OK != code) {
            throw new Exception("获取数据失败");
        } else {
            // {"repositories":["hello-world"]}
            Map<String, Object> datas = JsonUtils.jsonToMap((String)map.get("body"));
            return (List<String>) datas.get("repositories");
        }
    }

    /**
     * 列出镜像所有tag
     * @author jitwxs
     * @since 2018/7/5 22:45
     */
    public static List<String> listTags(String registryUrl, String name) throws Exception {
        String url = getUrl(registryUrl, HTTP_PREFIX) + "/v2/" + name + "/tags/list";

        Map<String, Object> map = HttpClientUtils.sendGetRequest(url, null, null);
        Integer code = (Integer)map.get("code");
        if(HTTP_OK != code) {
            throw new Exception("获取数据失败");
        } else {
            // {"name":"hello-world","tags":["latest"]}
            Map<String, Object> datas = JsonUtils.jsonToMap((String)map.get("body"));
            return (List<String>) datas.get("tags");
        }
    }

    /**
     * 获取镜像的Digest值
     * @author jitwxs
     * @since 2018/7/5 22:45
     */
    public static String getDigest(String registryUrl, String name, String tag) throws Exception {
        /*
         curl --header "Accept: application/vnd.docker.distribution.manifest.v2+json" -I -X HEAD 192.168.100.183:5000/v2/hello-world/manifests/latest
         */
        // 设置请求头
        Map<String, String> headerMap = new HashMap<>(16);
        headerMap.put("Accept", "application/vnd.docker.distribution.manifest.v2+json");
        // 设置请求Url
        String url = getUrl(registryUrl, HTTP_PREFIX) + "/v2/" + name + "/manifests/" + tag;

        Map<String, Object> map = HttpClientUtils.sendGetRequest(url, null, headerMap);
        Integer code = (Integer)map.get("code");
        if(HTTP_OK != code) {
            throw new Exception("获取数据失败");
        } else {
            // 取出响应头
            Header[] headers = (Header[]) map.get("headers");
            if(headers != null && headers.length > 0) {
                List<Header> res = Arrays.asList(headers).stream().filter(s -> "Docker-Content-Digest".equals(s.getName())).collect(Collectors.toList());
                if(res.size() > 0) {
                    return res.get(0).getValue();
                }
            }
        }
        return null;
    }

    /**
     * 删除镜像
     * 成功: HTTP 202
     * @author jitwxs
     * @since 2018/7/5 23:44
     */
    public static void deleteImage(String registryUrl, String name, String digest) throws Exception {
        String url = getUrl(registryUrl, HTTP_PREFIX) + "/v2/" + name + "/manifests/" + digest;

        Map<String, Object> map = HttpClientUtils.sendDeleteRequest(url, null, null);
        Integer code = (Integer)map.get("code");

        if(202 != code) {
            throw new Exception("删除镜像失败，响应体：" + map.get("body"));
        }
    }


    private static String getUrl(String url, String prefix) {
        if(!url.contains("http://") && !url.contains("https://")) {
            return prefix + url;
        }
        return url;
    }
}
