package waa.mum.edu.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import waa.mum.edu.domain.error.DomainError;

@ControllerAdvice
public class WebstoreControllerAdvice {

//	@Autowired
//	MessageSourceAccessor messageSourceAccessor;
//	
//	@ExceptionHandler(MethodArgumentNotValidException.class)
//	@ResponseStatus(value=HttpStatus.BAD_REQUEST, reason="Form values are not valid")
//	public List<DomainError> handleCartItemErrors(MethodArgumentNotValidException methodArgumentNotValidException) {
//		List<FieldError> fieldErrors = methodArgumentNotValidException.getBindingResult().getFieldErrors();
//		List<DomainError> domainErrors = new ArrayList<DomainError>();
//		
//		for(FieldError fieldError: fieldErrors) {
//			domainErrors.add(new DomainError(fieldError.getField(), messageSourceAccessor.getMessage(fieldError)));
//		}
//		
//		return domainErrors;
//	}
}
