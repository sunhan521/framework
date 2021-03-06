package com.framework.core.exception;


import com.framework.core.validator.ValidateResults;

/**
 * @author Han.Sun
 */
public class ValidationException extends BusinessException {
    private ValidateResults results;

    public ValidationException(String message) {
        super(message, 400);
    }

    public ValidationException(ValidateResults results) {
        super(results.toString(), 400);
        this.results = results;
    }

    public ValidateResults getResults() {
        return results;
    }
}
