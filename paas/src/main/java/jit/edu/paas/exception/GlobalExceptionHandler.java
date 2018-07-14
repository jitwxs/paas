package jit.edu.paas.exception;

import com.spotify.docker.client.exceptions.DockerTimeoutException;
import jit.edu.paas.commons.util.ResultVOUtils;
import jit.edu.paas.domain.enums.ResultEnum;
import jit.edu.paas.domain.vo.ResultVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @author jitwxs
 * @date 2018/4/25 16:43
 */
@RestControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(value = CustomException.class)
    public ResultVO customException(CustomException e) {
//        log.error("其他错误，错误栈：{}", HttpClientUtils.getStackTraceAsString(e));
        return ResultVOUtils.error(e.getCode(), e.getMessage());
    }

    @ExceptionHandler(value = DockerTimeoutException.class)
    public ResultVO customException(DockerTimeoutException e) {
        return ResultVOUtils.error(ResultEnum.DOCKER_TIMEOUT);
    }

    @ExceptionHandler(value = Exception.class)
    public ResultVO exception(Exception e) {
//        log.error("其他错误，错误栈：{}", HttpClientUtils.getStackTraceAsString(e));
        return ResultVOUtils.error(ResultEnum.OTHER_ERROR.getCode(), e.getMessage());
    }
}