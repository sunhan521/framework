package com.framework.core.exception;


import com.framework.core.message.ResponseMessage;

public interface ExceptionHandler {

   <T extends Throwable> boolean support(Class<T> e);

    ResponseMessage handle(Throwable e);
}