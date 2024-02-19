package com.library.bookhub.handler.exception;

import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter
public class CustomPageException extends RuntimeException {

    // 상태코드
    private HttpStatus httpStatus;

    public CustomPageException(String message, HttpStatus httpStatus){
        super(message);
        this.httpStatus = httpStatus;
    }
}
