package jit.edu.paas.exception;

import com.spotify.docker.client.exceptions.DockerTimeoutException;
import jit.edu.paas.commons.util.ResultVoUtils;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVo;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @author jitwxs
 * @date 2018/4/25 16:43
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(value = CustomException.class)
    public ResultVo customException(CustomException e) {
        return ResultVoUtils.error(e.getCode(), e.getMessage());
    }

    @ExceptionHandler(value = DockerTimeoutException.class)
    public ResultVo customException(DockerTimeoutException e) {
        return ResultVoUtils.error(ResultEnum.DOCKER_TIMEOUT);
    }

    @ExceptionHandler(value = Exception.class)
    public ResultVo exception(Exception e) {
        return ResultVoUtils.error(ResultEnum.OTHER_ERROR.getCode(), e.getMessage());
    }
}
