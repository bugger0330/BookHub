package com.library.bookhub.security.handler;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.library.bookhub.security.handler.exception.CustomPageException;

@ControllerAdvice
public class MyPageExceptionHandler {
	
	@ExceptionHandler(CustomPageException.class)
	public ModelAndView handlerRuntimeException(CustomPageException e) {
		ModelAndView modelAndView = new ModelAndView("errorPage");
		modelAndView.addObject("statusCode", HttpStatus.NOT_FOUND.value());
		modelAndView.addObject("message",e.getMessage());
		
		return modelAndView;
	}
}
