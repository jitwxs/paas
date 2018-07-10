package jit.edu.paas.commons.util;

/**
 * @author jitwxs
 * @since 2018/7/8 18:27
 */
public class NumberUtils extends org.apache.commons.lang3.math.NumberUtils {
    /**
     * 保留两位小数
     * @author jitwxs
     * @since 2018/7/8 18:28
     */
    public static  double decimal2Bit(double d) {
        return (double) Math.round(d * 100) / 100;
    }

    /**
     * 保留三位小数
     * @author jitwxs
     * @since 2018/7/8 18:28
     */
    public static  double decimal3Bit(double d) {
        return (double) Math.round(d * 1000) / 1000;
    }
}
