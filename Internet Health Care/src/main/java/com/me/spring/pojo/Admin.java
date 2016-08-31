package com.me.spring.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 
@Table(name="ADMIN")
public class Admin {
	
	@Id
	@Column (nullable=false,name="Admin_Id")
	private String adminId;
	@Column (nullable=false,name="First_Name")
	private String firstName;
	@Column (nullable=false,name="Last_Name")
	private String lastName;
	@Column (nullable=false,name="Admin_city")
	private String city;
	@Column (nullable=false,name="Admin_State")
	private String State;
	@Column (nullable=false,name="Admin_Country")
	private String country;
	@Column (nullable=false)
	private String userID;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
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
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	

}
