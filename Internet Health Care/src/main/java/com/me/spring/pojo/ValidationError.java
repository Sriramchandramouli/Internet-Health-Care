package com.me.spring.pojo;

import java.io.Serializable;

public class ValidationError implements Serializable {
	
	private static final long serialVersionUID = 7291592184129161916L;
	private String errorMessage;
	
	public ValidationError() {
		super();
	}
	
	public ValidationError(String errorMessage) {
		
		super();
		this.errorMessage = errorMessage;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
}

