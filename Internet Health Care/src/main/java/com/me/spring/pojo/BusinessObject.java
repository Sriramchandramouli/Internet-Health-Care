package com.me.spring.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class BusinessObject implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	protected List<ValidationError> validationErrors = new ArrayList<ValidationError>();

	public List<ValidationError> getValidationErrors() {
		return validationErrors;
	}

	public void setValidationErrors(List<ValidationError> validationErrors) {
		this.validationErrors = validationErrors;
	}
	
	public void addValidationError(ValidationError validationError) {
		this.validationErrors.add(validationError);
	}
	
}
