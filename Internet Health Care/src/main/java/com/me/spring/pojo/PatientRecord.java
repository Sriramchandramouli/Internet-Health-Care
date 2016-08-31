package com.me.spring.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 
@Table(name="Patient_Records")
public class PatientRecord {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int recordId;
	@Column (nullable=false,name="Patient_Firstname")
	private String firstName;
	@Column (nullable=false,name="Patient_Lastname")
	private String lastName;
	@Column (nullable=false,name="Patient_SSN")
	private String ssn;
	@Column (nullable=false,name="Patient_Gender")
	private String gender;
	@Column (nullable=false,name="Patient_DateVisited")
	private String dataVisited;
	@Column (nullable=false,name="Reason_For_Visit")
	private String reason;
	@Column (nullable=false,name="Hospital_Name")
	private String hospitalName;
	@Column (nullable=false,name="Doctor_Attended")
	private String doctorName;
	@Column (nullable=false,name="Patient_BloodPressure")
	private String bloodPressure;
	@Column (nullable=false,name="Patient_Temperature")
	private String temperature;
	@Column (nullable=false,name="Patient_PulseRate")
	private String pulse;
	@Column (nullable=false,name="Patient_Weight")
	private float weight;
	@Column (nullable=false,name="Patient_Height")
	private float height;
	@Column (nullable=false,name="Patient_BMI")
	private String bmi;
	@Column (nullable=false,name="Insurance_Provider")
	private String insuranceCompany;
	private String comments;
	private String medication1;
	private String medication2;
	private String medication3;
	@Column (nullable=false,name="Total_Charges")
	private String netPay;
	private String streetAddress;
	private String city;
	private String state;
		
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
	public int getRecordId() {
		return recordId;
	}
	public void setRecordId(int recordId) {
		this.recordId = recordId;
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
	
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDataVisited() {
		return dataVisited;
	}
	public void setDataVisited(String dataVisited) {
		this.dataVisited = dataVisited;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getBloodPressure() {
		return bloodPressure;
	}
	public void setBloodPressure(String bloodPressure) {
		this.bloodPressure = bloodPressure;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public String getPulse() {
		return pulse;
	}
	public void setPulse(String pulse) {
		this.pulse = pulse;
	}
	
	public float getWeight() {
		return weight;
	}
	public void setWeight(float weight) {
		this.weight = weight;
	}
	public float getHeight() {
		return height;
	}
	public void setHeight(float height) {
		this.height = height;
	}
	public String getBmi() {
		return bmi;
	}
	public void setBmi(String bmi) {
		this.bmi = bmi;
	}
	public String getInsuranceCompany() {
		return insuranceCompany;
	}
	public void setInsuranceCompany(String insuranceCompany) {
		this.insuranceCompany = insuranceCompany;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getMedication1() {
		return medication1;
	}
	public void setMedication1(String medication1) {
		this.medication1 = medication1;
	}
	public String getMedication2() {
		return medication2;
	}
	public void setMedication2(String medication2) {
		this.medication2 = medication2;
	}
	public String getMedication3() {
		return medication3;
	}
	public void setMedication3(String medication3) {
		this.medication3 = medication3;
	}
	public String getNetPay() {
		return netPay;
	}
	public void setNetPay(String netPay) {
		this.netPay = netPay;
	}
	

}
