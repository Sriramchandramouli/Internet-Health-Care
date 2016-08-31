package com.me.spring.validator;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.validation.BindingResult;

import com.me.spring.pojo.Patient;
import com.mysql.jdbc.StringUtils;

public class PatientValidator {
	
	static public void validatePatientForm(Patient patient, BindingResult result) throws Exception {
		
		if(patient.getFirstname() == null || StringUtils.isEmptyOrWhitespaceOnly(patient.getFirstname()) || !patient.getFirstname().matches("[a-zA-Z ]+")) {
			
			result.reject("101", "Please enter a valid first name");
		}
		
		if(patient.getLastname() == null || StringUtils.isEmptyOrWhitespaceOnly(patient.getLastname()) || !patient.getLastname().matches("[a-zA-Z ]+")) {
			
			result.reject("101", "Please enter a valid last name");
		}
		
		if(patient.getNickname() == null || StringUtils.isEmptyOrWhitespaceOnly(patient.getNickname()) || !patient.getNickname().matches("[a-zA-Z ]+")) {
			
			result.reject("101", "Please enter a valid nick name");
		}
		
		if(patient.getBirthdate() == null) {
			
			result.reject("101", "Please enter a valid birth date.");
		}
		
		if(patient.getBirthdate() != null) {
			try {
				DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
				formatter.setLenient(false);
				Date bDate = formatter.parse(patient.getBirthdate());
			}
			catch (Exception e) {
				result.reject("101", "Please enter a valid birth date.");
			}
		}
		
		if(patient.getStreetaddress() == null) {
			
			result.reject("101", "Please enter a valid street address");
		}
		
		if(patient.getCity() == null || StringUtils.isEmptyOrWhitespaceOnly(patient.getCity()) || !patient.getCity().matches("[a-zA-Z ]+")) {
			
			result.reject("101", "Please enter a valid city");
		}
		
		if(patient.getState() == null || StringUtils.isEmptyOrWhitespaceOnly(patient.getState()) || !patient.getState().matches("[a-zA-Z ]+")) {
			
			result.reject("101", "Please enter a valid state");
		}
		
		if(patient.getZipcode() == null || StringUtils.isEmptyOrWhitespaceOnly(patient.getZipcode()) || !patient.getZipcode().matches("[0-9]+")) {
			
			result.reject("101", "Please enter a valid zipcode");
		}
		
		if(patient.getGender() == null) {
			
			result.reject("101", "Please select a gender");
		}
		
		if(patient.getMaritalstatus() == null) {
			
			result.reject("101", "Please select a marital status");
		}
		
		if(patient.getSsn() == null || StringUtils.isEmptyOrWhitespaceOnly(patient.getSsn()) || !patient.getSsn().matches("[0-9]+")) {
			
			result.reject("101", "Please enter a valid SSN");
		}
		
		if(patient.getEmail() == null) {
			
			result.reject("101", "Please enter a valid email address");
		}
		
		if(patient.getEmail() != null) {
			
				String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
		        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
		        java.util.regex.Matcher m = p.matcher(patient.getEmail());
		        
		        if (!m.matches()) {
			
		        	result.reject("101", "Please enter a valid email address");
		        }
		}
		
		if(patient.getHomephone() == 0) {
			
			result.reject("101", "Please enter a valid home phone number");
		}
		
		if(patient.getWorkphone() == 0) {
			
			result.reject("101", "Please enter a valid work phone number");
		}

		if(patient.getCellphone() == 0) {
	
			result.reject("101", "Please enter a valid cell phone number");
		}
		
		if(patient.getPreferredphone() == null) {
			
			result.reject("101", "Please select your preferred phone number to contact you");

		}
		
		if(patient.getRace() == null) {
			
			result.reject("101", "Please select your race");

		}
		
		if(patient.getEthnicity() == null) {
			
			result.reject("101", "Please select your ethnicity");

		}
		
		if(patient.getPreferredlanguage() == null || StringUtils.isEmptyOrWhitespaceOnly(patient.getPreferredlanguage()) || !patient.getPreferredlanguage().matches("[a-zA-Z ]+")) {
			
			result.reject("101", "Please enter your preferred language");
		}
		
		if(patient.getRelation1() == null || StringUtils.isEmptyOrWhitespaceOnly(patient.getRelation1()) || !patient.getRelation1().matches("[a-zA-Z ]+")) {
			
			result.reject("101", "Please enter a valid name for the person you want us to communicate");
		}
		
		if(patient.getPhone1() == 0) {
			
			result.reject("101", "Please enter a valid phone number for your first contact");
		}
		
		if(patient.getRelation2() == null || StringUtils.isEmptyOrWhitespaceOnly(patient.getRelation2()) || !patient.getRelation2().matches("[a-zA-Z ]+")) {
			
			result.reject("101", "Please enter a valid name for the person you want us to communicate");
		}
		
		if(patient.getPhone2() == 0) {
			
			result.reject("101", "Please enter a valid phone number for your second contact");
		}
		
		if(patient.getInitial1() == null || StringUtils.isEmptyOrWhitespaceOnly(patient.getInitial1()) || !patient.getInitial1().matches("[a-zA-Z ]+")) {
			
			result.reject("101", "Please enter your valid initials");
		}
		
		if(patient.getInitial2() == null || StringUtils.isEmptyOrWhitespaceOnly(patient.getInitial2()) || !patient.getInitial2().matches("[a-zA-Z ]+")) {
			
			result.reject("101", "Please enter your valid initials");
		}
	}
}
