package jit.edu.paas.domain.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 *  容器-网络关系表
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@NoArgsConstructor
@Data
public class ContainerNetwork implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId(type = IdType.UUID)
    private String id;
    /**
     * 容器Id
     */
    private String containerId;
    /**
     * 网络Id
     */
    private String networkId;
    /**
     * 创建时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createDate;

    public ContainerNetwork(String containerId,String networkId) {
        this.containerId = containerId;
        this.networkId = networkId;
    }
}