package jit.edu.paas.exception;

import jit.edu.paas.domain.enums.ResultEnum;
import lombok.Data;

/**
 * @author jitwxs
 * @since 2018/6/6 9:56
 */
@Data
public class CustomException extends Exception {
    private Integer code;

    public CustomException(ResultEnum resultEnum) {
        super(resultEnum.getMessage());
        this.code = resultEnum.getCode();
    }

    public CustomException(Integer code , String info) {
        super(info);
        this.code = code;
    }
}