package com.me.spring.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.me.spring.pojo.User;

public class UserValidator1 implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		User user = (User)target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "error.invalid.email", "Your Email Is Incorrenct");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "error.invalid.username", "Your Name Is Incorrenct");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "error.invalid.password", "Your password Is Incorrenct");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "role", "error.invalid.role", "Your role Is Incorrenct");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gender", "error.invalid.gender", "Your gender Is Incorrenct");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "age", "error.invalid.age", "Your age Is Incorrenct");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "gender", "error.invalid.secretquestion", "Your Answer Is Incorrenct");
	}

}
