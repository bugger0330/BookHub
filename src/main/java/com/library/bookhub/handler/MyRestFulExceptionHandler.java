package com.library.bookhub.handler;

import com.library.bookhub.handler.exception.CustomRestFulException;
import com.library.bookhub.handler.exception.UnAuthorizedException;
import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Order(1)
@RestControllerAdvice
public class MyRestFulExceptionHandler {

    // 모든 예외 클래스 설정
    @ExceptionHandler(Exception.class)
    public void exception(Exception e) {
        System.out.println("--------------");
        System.out.println(e.getClass().getName());
        System.out.println(e.getMessage());
        System.out.println("--------------");
    }

    @ExceptionHandler(CustomRestFulException.class)
    public String basicException(CustomRestFulException e) {
        StringBuffer sb = new StringBuffer();
        sb.append("<script>");
        sb.append("alert('" + e.getMessage() + "');");
        sb.append("window.history.back();");
        sb.append("</script>");
        return sb.toString();
    }


    @ExceptionHandler(UnAuthorizedException.class)
    public String unAuthorizedException(UnAuthorizedException e) {
        StringBuffer sb = new StringBuffer();
        sb.append("<script>");
        sb.append("alert('" + e.getMessage() + "');");
        sb.append("location.href='/user/sign-in';");
        sb.append("</script>");
        return sb.toString();
    }
}
