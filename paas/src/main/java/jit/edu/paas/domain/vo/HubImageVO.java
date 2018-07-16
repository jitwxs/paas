package jit.edu.paas.domain.vo;

import lombok.Data;

/**
 * @author jitwxs
 * @since 2018/7/15 16:42
 */
@Data
public class HubImageVO {
    /**
     * 名称
     */
    private String name;
    /**
     * 上传用户
     */
    private String username;
    /**
     * 所属仓库
     */
    private String repo;
    /**
     * 展示的名称
     */
    private String showName;

    public String getShowName() {
        // 取出前部用户ID
        if(this.name.contains("/")) {
            return this.name.substring(this.name.indexOf("/") + 1);
        } else {
            return this.name;
        }
    }
}
