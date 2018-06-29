package jit.edu.paas.commons.http;

import com.spotify.docker.client.messages.ImageSearchResult;
import jit.edu.paas.commons.util.HttpClientUtils;
import jit.edu.paas.commons.util.JsonUtils;

import java.util.List;

/**
 * @author jitwxs
 * @since 2018/6/29 10:14
 */
public class DockerHttp {
    private static String serverUrl="http://192.168.30.171:2375";

//    @Value("${docker.server.url}")
//    public void setServerUrl(String url) {
//        serverUrl = url;
//    }

    /*  Image  Start */
    public static List<ImageSearchResult> searchImages(String term, Integer limit) {
        String url = serverUrl + "/images/search";
        String params = "term=" + term + "&limit=" + limit;

        String res = HttpClientUtils.sendGetRequest(url, params);
        List<ImageSearchResult> list = JsonUtils.jsonToList(res,ImageSearchResult.class);

        return list;
    }
    /*  Image  Start */
}
