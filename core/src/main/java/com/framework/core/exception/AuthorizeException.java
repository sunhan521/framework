package com.framework.core.exception;

/**
 * @author Han.Sun
 */
public class AuthorizeException extends BusinessException {
    private static final long serialVersionUID = 2422918455013900645L;

    public AuthorizeException(String message) {
        this(message, 401);
    }

    public AuthorizeException(String message, int status) {
        super(message, status);
    }

    public AuthorizeException(String message, Throwable cause, int status) {
        super(message, cause, status);
    }
}
