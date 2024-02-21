package com.library.bookhub.security.handler.exception;

import org.springframework.http.HttpStatus;

import lombok.Getter;

@Getter
public class CustomPageException extends RuntimeException {
	// 상태 코드
		private HttpStatus httpStatus;
		
		public CustomPageException(String message, HttpStatus httpStatus) {
			super(message);
			this.httpStatus = httpStatus;
		}
}
