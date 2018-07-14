package jit.edu.paas.commons.util;


import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVO;

/**
 * @author jitwxs
 * @since 2018/6/6 0:42
 */
public class ResultVOUtils {
    public static ResultVO success(Object data) {
        return new ResultVO(ResultEnum.OK.getCode(),ResultEnum.OK.getMessage(), data);
    }

    public static ResultVO successWithMsg(String message) {
        return success(message, null);
    }

    public static ResultVO success(String message, Object data) {
        return new ResultVO(ResultEnum.OK.getCode(), message, data);
    }

    public static ResultVO success() {
        return success(null);
    }

    public static ResultVO error(Integer code, String message) {
        ResultVO resultVO = new ResultVO();
        resultVO.setCode(code);
        resultVO.setMessage(message);
        return resultVO;
    }

    public static ResultVO error(ResultEnum resultEnum) {
        ResultVO resultVO = new ResultVO();
        resultVO.setCode(resultEnum.getCode());
        resultVO.setMessage(resultEnum.getMessage());
        return resultVO;
    }
}
