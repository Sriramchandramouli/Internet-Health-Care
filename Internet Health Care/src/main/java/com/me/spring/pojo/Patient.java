package com.me.spring.pojo;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity 
@Table(name="PATIENTDETAILS")
public class Patient extends BusinessObject{
	
	@Column (nullable=false)
	private String firstname;
	@Column (nullable=false)
	private String lastname;
	private String nickname;
	@Column (nullable=false)
	private String birthdate;
	@Column (nullable=false)
	private String streetaddress;
	@Column (nullable=false)
	private String city;
	@Column (nullable=false)
	private String state;
	@Column (nullable=false)
	private String zipcode;
	@Column (nullable=false)
	private String gender;
	@Column (nullable=false)
	private String maritalstatus;
	@Id
	@Column (nullable=false)
	private String ssn;
	@Column (nullable=false)
	private String email;
	private int homephone;
	private int workphone;
	private int cellphone;
	@Column (nullable=false)
	private String preferredphone;
	@Column (nullable=false)
	private String race;
	@Column (nullable=false)
	private String ethnicity;
	@Column (nullable=false)
	private String preferredlanguage;
	@Column (name="name_relationship1")
	private String relation1;
	@Column (name="phonenumber")
	private int phone1;
	private String initial1;
	@Column (name="name_relationship2")
	private String relation2;
	@Column (name="phone_number")
	private int phone2;
	private String initial2;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_Id")
	private User user;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getStreetaddress() {
		return streetaddress;
	}
	public void setStreetaddress(String streetaddress) {
		this.streetaddress = streetaddress;
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
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMaritalstatus() {
		return maritalstatus;
	}
	public void setMaritalstatus(String maritalstatus) {
		this.maritalstatus = maritalstatus;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPreferredphone() {
		return preferredphone;
	}
	public void setPreferredphone(String preferredphone) {
		this.preferredphone = preferredphone;
	}
	public String getRace() {
		return race;
	}
	public void setRace(String race) {
		this.race = race;
	}
	public String getEthnicity() {
		return ethnicity;
	}
	public void setEthnicity(String ethnicity) {
		this.ethnicity = ethnicity;
	}
	public String getPreferredlanguage() {
		return preferredlanguage;
	}
	public void setPreferredlanguage(String preferredlanguage) {
		this.preferredlanguage = preferredlanguage;
	}
	public String getRelation1() {
		return relation1;
	}
	public void setRelation1(String relation1) {
		this.relation1 = relation1;
	}
	
	public String getInitial1() {
		return initial1;
	}
	public void setInitial1(String initial1) {
		this.initial1 = initial1;
	}
	public String getRelation2() {
		return relation2;
	}
	public void setRelation2(String relation2) {
		this.relation2 = relation2;
	}
	
	public String getInitial2() {
		return initial2;
	}
	public void setInitial2(String initial2) {
		this.initial2 = initial2;
	}
	public int getHomephone() {
		return homephone;
	}
	public void setHomephone(int homephone) {
		this.homephone = homephone;
	}
	public int getWorkphone() {
		return workphone;
	}
	public void setWorkphone(int workphone) {
		this.workphone = workphone;
	}
	public int getCellphone() {
		return cellphone;
	}
	public void setCellphone(int cellphone) {
		this.cellphone = cellphone;
	}
	public int getPhone1() {
		return phone1;
	}
	public void setPhone1(int phone1) {
		this.phone1 = phone1;
	}
	public int getPhone2() {
		return phone2;
	}
	public void setPhone2(int phone2) {
		this.phone2 = phone2;
	}
	
	
}
