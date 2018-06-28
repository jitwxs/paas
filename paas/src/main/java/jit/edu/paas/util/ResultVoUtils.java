package jit.edu.paas.util;


import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVo;

/**
 * @author jitwxs
 * @since 2018/6/6 0:42
 */
public class ResultVoUtils {
    public static ResultVo success(Object data) {
        return new ResultVo(0,"成功", data);
    }

    public static ResultVo success() {
        return new ResultVo(0,"成功", null);
    }

    public static ResultVo error(Integer code, String message) {
        ResultVo resultVo = new ResultVo();
        resultVo.setCode(code);
        resultVo.setMessage(message);
        return resultVo;
    }

    public static ResultVo error(ResultEnum resultEnum) {
        ResultVo resultVo = new ResultVo();
        resultVo.setCode(resultEnum.getCode());
        resultVo.setMessage(resultEnum.getMessage());
        return resultVo;
    }
}
