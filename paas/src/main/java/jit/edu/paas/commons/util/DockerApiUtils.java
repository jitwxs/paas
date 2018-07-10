package jit.edu.paas.commons.util;

import com.spotify.docker.client.messages.ImageSearchResult;
import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Map;

/**
 * Docker Remote API
 * https://docs.docker.com/engine/api/v1.32
 * @author jitwxs
 * @since 2018/7/5 14:23
 */
@Slf4j
public class DockerApiUtils {
    /**
     * 搜索Hub镜像
     * @author jitwxs
     * @since 2018/7/3 15:42
     */
    public static  List<ImageSearchResult> searchImages(String serverUrl, String term, Integer limit) {

        String url = serverUrl + "/images/search";
        String params = "term=" + term + "&limit=" + limit;

        try {
            Map<String, Object> map = HttpClientUtils.sendGetRequest(url, params, null);
            Integer code = (Integer) map.get("code");

            if(200 != code) {
                return null;
            }

            return JsonUtils.jsonToList((String)map.get("body"),ImageSearchResult.class);
        } catch (Exception e) {
            log.error("获取Docker Hub镜像失败，错误位置：{}，错误栈：{}",
                    "DockerApiUtils.searchImages()", HttpClientUtils.getStackTraceAsString(e));
            return null;
        }
    }
}
