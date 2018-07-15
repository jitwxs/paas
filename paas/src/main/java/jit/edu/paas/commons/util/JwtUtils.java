package jit.edu.paas.commons.util;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Map;

/**
 * JWT工具类
 * @author jitwxs
 * @since 2018/5/2 18:49
 */
public class JwtUtils {
    // 签名密钥（高度保密）
    private static final String SECRET = "qYYjXt7s1C*nEC%9RCwQGFA$YwPr$Jrj";
    // 签名算法
    private static final SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS512;
    // token前缀
    private static final String TOKEN_PREFIX = "Bearer ";

    private Logger log = LoggerFactory.getLogger(JwtUtils.class);

    /**
     * 生成JWT token
     * @param map 传入数据
     * @param maxAge 有效期（单位：ms）
     * @author jitwxs
     * @since 2018/5/3 23:19
     */
    public static String sign(Map<String,Object> map, long maxAge) {
        return sign(map, null, null, SECRET, maxAge);
    }

    public static String sign(Map<String,Object> map, String secret, long maxAge) {
        return sign(map, null, null, secret, maxAge);
    }



    /**
     * 生成JWT token
     * @param map 传入数据
     * @param issuer 签发者
     * @param subject 面向用户
     * @param maxAge 有效期（单位：ms）
     * @author jitwxs
     * @since 2018/5/3 23:19
     */
    public static String sign(Map<String,Object> map, String issuer, String subject, String secret, long maxAge) {
        Date now  = new Date(System.currentTimeMillis());
        String jwt = Jwts.builder()
                .setClaims(map) // 设置自定义数据
                .setIssuedAt(now) // 设置签发时间
                .setExpiration(new Date(now.getTime() + maxAge)) // 设置过期时间
                .setIssuer(issuer) // 设置签发者
                .setSubject(subject) // 设置面向用户
                .signWith(signatureAlgorithm, secret)
                .compact();
        return TOKEN_PREFIX + jwt;
    }

    /**
     * 验证JWT token并返回数据。当验证失败时，返回NULL
     * @author jitwxs
     * @since 2018/5/3 23:20
     */
    public static Map unSign(String token) {
        try {
            return Jwts.parser()
                    .setSigningKey(SECRET)
                    .parseClaimsJws(token.replace(TOKEN_PREFIX,""))
                    .getBody();
        } catch (Exception e) {
//            System.out.println("Token验证失败");
            return null;
        }
    }

    public static Map unSign(String token, String secret) {
        try {
            return Jwts.parser()
                    .setSigningKey(secret)
                    .parseClaimsJws(token.replace(TOKEN_PREFIX,""))
                    .getBody();
        } catch (Exception e) {
//            System.out.println("Token验证失败");
            return null;
        }
    }

    /**
     * 根据key生成Secret
     * @author jitwxs
     * @since 2018/6/27 16:44
     */
    public static String genSecret(String... keys) {
        String salt = "e@#sjh31lg$sa";
        try {
            // 生成一个MD5加密计算摘要
            MessageDigest md = MessageDigest.getInstance("MD5");

            StringBuilder sb = new StringBuilder(salt);
            for (String key : keys) {
                sb.append(key);
                md.update(sb.toString().getBytes());
                String tmp = new BigInteger(1, md.digest()).toString(16);
                sb = new StringBuilder(tmp);
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return SECRET;
    }

    public static void main(String[] args) {
//        Map<String,Object> map = new HashMap<>(16);
//        map.put("userName","admin");
//        map.put("userId","001");
//
//        String token = JwtUtils.sign(map, 3600_000);
////        String token = JwtUtils.sign(map, "jitwxs","普通用户",3600_000);
//        System.out.println(JwtUtils.unSign(token));
//        System.out.println(genSecret("1", "56d32b6f7d6bdd144892da2bffa784fdca12612afa15cdd6ace69362"));
//        433e776ec9464eca7ba73e135a3fc1da
    }
}

