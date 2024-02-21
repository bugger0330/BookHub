package com.library.bookhub.security.handler;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.library.bookhub.security.handler.exception.CustomRestfulException;

import lombok.extern.log4j.Log4j2;

@Log4j2
@RestControllerAdvice
public class MyResfulExceptionHandler {
		// 모든 예외 클래스 설정
		@ExceptionHandler(Exception.class)
		public void exception(Exception e) {
			log.info("--------------");
			log.error(e.getClass().getName());
			log.error(e.getMessage());
			log.info("--------------");
		}
		
		@ExceptionHandler(CustomRestfulException.class)
		public String basicException(CustomRestfulException e) {
			StringBuffer sb = new StringBuffer();
			sb.append("<script>");
			sb.append("alert('"+e.getMessage()+"');");
			sb.append("window.history.back();");
			sb.append("</script>");
			return sb.toString();
		}
		
}
