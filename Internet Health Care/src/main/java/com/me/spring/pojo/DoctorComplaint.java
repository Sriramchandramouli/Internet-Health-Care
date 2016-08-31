package com.me.spring.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity 
@Table(name="DOCTOR_COMPLAINT")
public class DoctorComplaint {
	
	@Id
	@Column (nullable=false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int complaintId;
	@Column (name="DOCTOR_FIRST_NAME",nullable=false)
	private String firstName;
	@Column (name="DOCTOR_LAST_NAME",nullable=false)
	private String lastName;
	@Column (name="DOCTOR_NPI",nullable=false)
	private String doctorNPI;
	@Column (name="DOCTOR_ADDRESS",nullable=false)
	private String address;
	@Column (name="DOCTOR_CITY",nullable=false)
	private String city;
	@Column (name="DOCTOR_STATE",nullable=false)
	private String state;
	@Column (name="DATE_ATTENDED",nullable=false)
	private String dateAttended;
	@Column (name="COMPLAINT_REASON",nullable=false)
	private String complaintReason;
	@Column (name="OTHER_PROBLEM")
	private String otherProblem;
	@Column (name="DID_YOU_CONTACT_PRACTITIONER",nullable=false)
	private String question1;
	@Column (name="READY_TO_TESTIFY",nullable=false)
	private String question2;
	@Column (name="UNDER_PHYSICIANCARE",nullable=false)
	private String question3;
	private String comments;
	@Column (name="SEVERITY_LEVEL")
	private String severityLevel;
	
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getDoctorNPI() {
		return doctorNPI;
	}
	public void setDoctorNPI(String doctorNPI) {
		this.doctorNPI = doctorNPI;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getDateAttended() {
		return dateAttended;
	}
	public void setDateAttended(String dateAttended) {
		this.dateAttended = dateAttended;
	}
	public String getComplaintReason() {
		return complaintReason;
	}
	public void setComplaintReason(String complaintReason) {
		this.complaintReason = complaintReason;
	}
	public String getOtherProblem() {
		return otherProblem;
	}
	public void setOtherProblem(String otherProblem) {
		this.otherProblem = otherProblem;
	}
	public String getQuestion1() {
		return question1;
	}
	public void setQuestion1(String question1) {
		this.question1 = question1;
	}
	public String getQuestion2() {
		return question2;
	}
	public void setQuestion2(String question2) {
		this.question2 = question2;
	}
	public String getQuestion3() {
		return question3;
	}
	public void setQuestion3(String question3) {
		this.question3 = question3;
	}
	
	public int getComplaintId() {
		return complaintId;
	}
	public void setComplaintId(int complaintId) {
		this.complaintId = complaintId;
	}
	public String getSeverityLevel() {
		return severityLevel;
	}
	public void setSeverityLevel(String severityLevel) {
		this.severityLevel = severityLevel;
	}

}
