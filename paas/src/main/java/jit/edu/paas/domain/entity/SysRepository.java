package jit.edu.paas.domain.entity;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author jitwxs
 * @since 2018-06-27
 */
@Data
@NoArgsConstructor
public class SysRepository implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 仓储类型【1：Docker容器；2：Docker Hub】
     */
    private Integer type;
    /**
     * 仓储地址
     */
    private String address;

    public SysRepository(Integer type, String address) {
        this.type = type;
        this.address = address;
    }
}
