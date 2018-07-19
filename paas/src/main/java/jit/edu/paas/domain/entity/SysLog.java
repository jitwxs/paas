package jit.edu.paas.domain.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;
import jit.edu.paas.commons.util.HttpClientUtils;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

/**
 * <p>
 *  系统日志
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Data
public class SysLog implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.UUID)
    private String id;
    /**
     * 操作用户ID
     */
    private String userId;
    /**
     * 日志类型
     */
    private Integer type;
    /**
     * 日志描述
     * @author jitwxs
     * @since 2018/7/6 21:08
     */
    private String description;
    /**
     * 请求Url
     */
    private String action;
    /**
     * 请求方式
     */
    private String method;
    /**
     * 访问IP
     */
    private String ip;
    /**
     * 用户代理
     */
    private String userAgent;
    /**
     * 请求参数
     */
    private String param;
    /**
     * 异常
     */
    private String exception;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createDate;

    @SuppressWarnings({ "unchecked", "rawtypes" })
    public void setParam(Map paramMap){
        if (paramMap == null){
            return;
        }
        StringBuilder params = new StringBuilder();
        for (Map.Entry<String, String[]> param : ((Map<String, String[]>)paramMap).entrySet()){
            params.append(("".equals(params.toString()) ? "" : "&") + param.getKey() + "=");
            String paramValue = (param.getValue() != null && param.getValue().length > 0 ? param.getValue()[0] : "");
            // 忽略密码参数
            params.append(HttpClientUtils.abbr(StringUtils.endsWithIgnoreCase(param.getKey(), "password") ? "" : paramValue, 100));
        }
        this.param = params.toString();
    }
}
