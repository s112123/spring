package com.spring.app.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ErrorHandler {
	
	//404 에러
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handler404() {
		return "exception.exception_404";
	}
	
	//기타 모든 에러
	@ExceptionHandler(Exception.class)
	public String handlerException() {
		return "exception.exception_common";
	}	
	
}
