package com.framework.core.exception;

/**
 * @author Han.Sun
 */
public class BusinessException extends RuntimeException {
    private static final long serialVersionUID = -695542791928644578L;
    private int status = 400;

    public BusinessException(String message) {
        this(message, 400);
    }

    public BusinessException(String message, int status) {
        super(message);
        this.status = status;
    }

    public BusinessException(String message, Throwable cause, int status) {
        super(message, cause);
        this.status = status;
    }

    public int getStatus() {
        return status;
    }
}
