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
}
