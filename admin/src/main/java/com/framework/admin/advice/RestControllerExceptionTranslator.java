package com.framework.admin.advice;

import com.framework.core.exception.*;
import com.framework.core.message.ResponseMessage;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletResponse;

/**
 * @author Han.Sun
 */
@ControllerAdvice(annotations = {RestController.class, ResponseBody.class})
@Order(1)
public class RestControllerExceptionTranslator {

    @ExceptionHandler(ValidationException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    ResponseMessage handleException(ValidationException exception) {
        return ResponseMessage.error(exception.getMessage(), 400);
    }

    @ExceptionHandler(BusinessException.class)
    @ResponseBody
    ResponseMessage handleException(BusinessException exception, HttpServletResponse response) {
        response.setStatus(exception.getStatus());
        return ResponseMessage.error(exception.getMessage(), exception.getStatus());
    }

    @ExceptionHandler(AuthorizeException.class)
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    @ResponseBody
    ResponseMessage handleException(AuthorizeException exception) {
        return ResponseMessage.error(exception.getMessage(), exception.getStatus());
    }

    @ExceptionHandler(AuthorizeForbiddenException.class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    @ResponseBody
    ResponseMessage handleException(AuthorizeForbiddenException exception) {
        return ResponseMessage.error(exception.getMessage(), exception.getStatus());
    }

    @ExceptionHandler(NotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ResponseBody
    ResponseMessage handleException(NotFoundException exception) {
        return ResponseMessage.error(exception.getMessage(), 404);
    }

    @ExceptionHandler(BindException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ResponseBody
    ResponseMessage handleException(BindException exception) {
        return ResponseMessage.error(exception.getMessage(), 400);
    }

    @ExceptionHandler(Throwable.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    ResponseMessage handleException(Throwable exception) {

        // TODO: 06/03/2017 异步记录到数据库 
        return ResponseMessage.error("服务器异常，请联系管理员", 500);
    }

}