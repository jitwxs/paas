package jit.edu.paas.exception;

import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVo;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author jitwxs
 * @date 2018/4/25 16:43
 */
//@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(value = CustomException.class)
    @ResponseBody
    public ResultVo customException(CustomException e) {
        return ResultVoUtils.error(e.getCode(), e.getMessage());
    }

    @ExceptionHandler(value = Exception.class)
    @ResponseBody
    public ResultVo exception(Exception e) {
        return ResultVoUtils.error(ResultEnum.OTHER_ERROR.getCode(), e.getMessage());
    }
}
