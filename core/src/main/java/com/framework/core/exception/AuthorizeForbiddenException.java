package com.framework.core.exception;

/**
 * @author Han.Sun
 */
public class AuthorizeForbiddenException extends BusinessException {
    private static final long serialVersionUID = 2422918455013900645L;

    public AuthorizeForbiddenException(String message) {
        this(message, 403);
    }

    public AuthorizeForbiddenException(String message, int status) {
        super(message, status);
    }

    public AuthorizeForbiddenException(String message, Throwable cause, int status) {
        super(message, cause, status);
    }
}
