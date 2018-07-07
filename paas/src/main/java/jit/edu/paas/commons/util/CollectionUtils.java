package jit.edu.paas.commons.util;

import java.util.List;

/**
 * @author jitwxs
 * @since 2018/6/27 14:40
 */
public class CollectionUtils {

    /**
     * 获取集合第一个元素
     * 如果不存在，返回null
     * @author jitwxs
     * @since 2018/6/27 14:44
     */
    public static <T> T getListFirst(List<T> list) {
        if(list == null || list.size() == 0) {
            return null;
        } else {
            return list.get(0);
        }
    }

    /**
     * 判断数组是否为空
     * @author jitwxs
     * @since 2018/7/7 15:00
     */
    public static boolean isArrayBlank(String[] strings) {
        if(strings == null || strings.length == 0) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean isNotArrayBlank(String[] strings) {
        return !isArrayBlank(strings);
    }
}
