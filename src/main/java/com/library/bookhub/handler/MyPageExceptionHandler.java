package com.library.bookhub.handler;

import com.library.bookhub.handler.exception.CustomPageException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class MyPageExceptionHandler {
    // CustomPageException <-- 발생하면 이 함수를 동작시켜!
    @ExceptionHandler(CustomPageException.class)
    public ModelAndView handlerRuntimeException(CustomPageException e) {
        ModelAndView modelAndView = new ModelAndView("errorPage");
        modelAndView.addObject("statusCode", HttpStatus.NOT_FOUND.value());
        modelAndView.addObject("message", e.getMessage());

        return modelAndView; // 페이지 반환 + 데이터 내려줌
    }
}
