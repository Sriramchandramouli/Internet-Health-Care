package com.me.spring.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 
@Table(name="DOCTOR_DETAILS")
public class Doctor {
	
	@Id
	@Column (nullable=false)
	private int npi;
	@Column (nullable=false)
	private String firstName;
	@Column (nullable=false)
	private String lastName;
	@Column (nullable=false)
	private String birthDate;
	@Column (nullable=false)
	private String streetAddress;
	@Column (nullable=false)
	private String city;
	@Column (nullable=false)
	private String state;
	@Column (nullable=false)
	private int zipCode;
	@Column (nullable=false)
	private String gender;
	@Column (nullable=false)
	private String email;
	@Column (nullable=false)
	private int homePhone;
	@Column (nullable=false)
	private int workPhone;
	@Column (nullable=false)
	private int cellPhone;
	@Column (nullable=false)
	private String speciality1;
	private String speciality2;
	private String speciality3;
	@Column (nullable=false)
	private String medicalEducation;
	@Column (nullable=false)
	private String clinicalInterest1;
	private String clinicalInterest2;
	private String clinicalInterest3;
	@Column (nullable=false)
	private String preferredLocation;
	@Column (nullable=false)
	private String imageLocation;
	@Column (nullable=false)
	private String hospitalName;
	@Column (nullable=false)
	private String hospitalCity;
	@Column (nullable=false)
	private String hospitalState;
	@Column (nullable=false)
	private String hospitalCountry;
	@Column (nullable=false,name="User_ID")
	private String userID;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public String getHospitalCity() {
		return hospitalCity;
	}
	public void setHospitalCity(String hospitalCity) {
		this.hospitalCity = hospitalCity;
	}
	public String getHospitalState() {
		return hospitalState;
	}
	public void setHospitalState(String hospitalState) {
		this.hospitalState = hospitalState;
	}
	public String getHospitalCountry() {
		return hospitalCountry;
	}
	public void setHospitalCountry(String hospitalCountry) {
		this.hospitalCountry = hospitalCountry;
	}
	public String getImageLocation() {
		return imageLocation;
	}
	public void setImageLocation(String imageLocation) {
		this.imageLocation = imageLocation;
	}
	public int getNpi() {
		return npi;
	}
	public void setNpi(int npi) {
		this.npi = npi;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getStreetAddress() {
		return streetAddress;
	}
	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getZipCode() {
		return zipCode;
	}
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getHomePhone() {
		return homePhone;
	}
	public void setHomePhone(int homePhone) {
		this.homePhone = homePhone;
	}
	public int getWorkPhone() {
		return workPhone;
	}
	public void setWorkPhone(int workPhone) {
		this.workPhone = workPhone;
	}
	public int getCellPhone() {
		return cellPhone;
	}
	public void setCellPhone(int cellPhone) {
		this.cellPhone = cellPhone;
	}
	
	public String getMedicalEducation() {
		return medicalEducation;
	}
	public void setMedicalEducation(String medicalEducation) {
		this.medicalEducation = medicalEducation;
	}
	
	public String getPreferredLocation() {
		return preferredLocation;
	}
	public void setPreferredLocation(String preferredLocation) {
		this.preferredLocation = preferredLocation;
	}
	public String getSpeciality1() {
		return speciality1;
	}
	public void setSpeciality1(String speciality1) {
		this.speciality1 = speciality1;
	}
	public String getSpeciality2() {
		return speciality2;
	}
	public void setSpeciality2(String speciality2) {
		this.speciality2 = speciality2;
	}
	public String getSpeciality3() {
		return speciality3;
	}
	public void setSpeciality3(String speciality3) {
		this.speciality3 = speciality3;
	}
	public String getClinicalInterest1() {
		return clinicalInterest1;
	}
	public void setClinicalInterest1(String clinicalInterest1) {
		this.clinicalInterest1 = clinicalInterest1;
	}
	public String getClinicalInterest2() {
		return clinicalInterest2;
	}
	public void setClinicalInterest2(String clinicalInterest2) {
		this.clinicalInterest2 = clinicalInterest2;
	}
	public String getClinicalInterest3() {
		return clinicalInterest3;
	}
	public void setClinicalInterest3(String clinicalInterest3) {
		this.clinicalInterest3 = clinicalInterest3;
	}
	
	
}
