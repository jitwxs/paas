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

    public static boolean isNumeric(String...args) {
        for(String s : args) {
            if(org.apache.commons.lang3.StringUtils.isNumeric(s)) {
                return true;
            }
        }
        return false;
    }

    public static boolean isNotNumeric(String... args) {
        return !isNumeric(args);
    }

    /**
     * 是否为数字或字母
     * @author jitwxs
     * @since 2018/7/14 19:48
     */
    public static  boolean isAlphaOrNumeric(String s) {
        String regex = "^[a-z0-9A-Z]+$";
        return s.matches(regex);
    }

    public static  boolean isNotAlphaOrNumeric(String s) {
        return !isAlphaOrNumeric(s);
    }
}
