package com.me.spring.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 
@Table(name="DRUG_MANUFACTURER_DETAILS")
public class DrugManufacturer {
	
	@Column (nullable=false,name="Manufacturer_Name")
	private String manufacturerName;
	@Id
	@Column (nullable=false,name="License_Number")
	private int licenseNumber;
	@Column (nullable=false,name="Manufacturer_Street_Address")
	private String  streetAddress;
	@Column (nullable=false,name="Manufacturer_City")
	private String city;
	@Column (nullable=false,name="Manufacturer_State")
	private String state;
	@Column (nullable=false,name="Manufacturer_Country")
	private String country;
	@Column (nullable=false,name="Manufacturer_Zipcode")
	private int zipCode;
	@Column (nullable=false,name="Manufacturer_Years_Of_Experience")
	private int yearOfExp;
	@Column (nullable=false,name="User_ID")
	private String userId;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getManufacturerName() {
		return manufacturerName;
	}
	public void setManufacturerName(String manufacturerName) {
		this.manufacturerName = manufacturerName;
	}
	public int getLicenseNumber() {
		return licenseNumber;
	}
	public void setLicenseNumber(int licenseNumber) {
		this.licenseNumber = licenseNumber;
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
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public int getZipCode() {
		return zipCode;
	}
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}
	public int getYearOfExp() {
		return yearOfExp;
	}
	public void setYearOfExp(int yearOfExp) {
		this.yearOfExp = yearOfExp;
	}
	
}
