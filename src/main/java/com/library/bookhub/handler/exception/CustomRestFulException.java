package com.library.bookhub.handler.exception;

import org.springframework.http.HttpStatus;

public class CustomRestFulException extends RuntimeException {

    private HttpStatus httpStatus;

    public CustomRestFulException(String message, HttpStatus httpStatus) {
        super(message);
        this.httpStatus = httpStatus;
    }
}
