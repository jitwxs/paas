package jit.edu.paas.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 返回给前台的数据
 * @author jitwxs
 * @since 2018/6/6 0:03
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultVO {
    private Integer code;

    private String message;

    private Object data;
}
