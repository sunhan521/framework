package com.framework.core.exception;

/**
 * @author Han.Sun
 */
public class NotFoundException extends BusinessException {
    public NotFoundException(String message) {
        super(message, 404);
    }
}
