package jit.edu.paas.commons.util;

/**
 * 字符串工具类
 * @author jitwxs
 * @since 2018/6/29 16:45
 */
public class StringUtils extends org.apache.commons.lang3.StringUtils {

    /**
     * 判断参数是否为空
     * @author jitwxs
     * @since 2018/6/29 16:46
     */
    public static boolean isBlank(String... args) {
        for(String s : args) {
            if(org.apache.commons.lang3.StringUtils.isBlank(s)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isNotBlank(String... args) {
        return !isBlank(args);
    }
}
