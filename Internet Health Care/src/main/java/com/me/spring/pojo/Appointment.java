package com.me.spring.pojo;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity 
@Table(name="APPOINTMENT_DETAILS")
public class Appointment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column (nullable=false)
	private int appoitmentid;
	@Column (nullable=false,name="reason_for_visit")
	private String reason;
	@Column (nullable=false,name="are_you_in_goodhealth")
	private String question1;
	@Column (nullable=false,name="any_changes_in_health")
	private String question2;
	@Column (nullable=false)
	private float weight;
	@Column (nullable=false)
	private float height;
	@Column (nullable=false,name="under_any_care_of_physician")
	private String question3;
	@Column (nullable=false,name="any_illness_or_hospitalized")
	private String question4;
	@Column (nullable=false,name="anything_tobe_toldto_doctor")
	private String question5;
	@Column (nullable=false,name="have_any_disease1")
	private String question6;
	@Column (nullable=false,name="have_any_disease2")
	private String question7;
	@Column (nullable=false,name="family_has_disease")
	private String question8;
	@Column (nullable=false,name="taking_any_drugs")
	private String question9;
	@Column (nullable=false,name="related_to_accident")
	private String question10;
	@Column (nullable=false,name="related_to_automobie")
	private String question11;
	@Column (nullable=false,name="related_to_work")
	private String question12;
	@Column (nullable=false,name="any_other_issue")
	private String question13;
	@Column (nullable=false,name="date_of_injury")
	private String injurydate;
	private String insurancecompany;
	private int claimnumber;
	@Column (nullable=false,name="signature")
	private String signature;
	@Column (nullable=false,name="hospital_name")
	private String hospitalName;
	@Column (name="doctor_name")
	private String doctorName;
	@Column (name="appointment_date")
	private String appointmentDate;
	private String status;
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ssn",nullable=false)
	private Patient patient;
	
	
	public String getAppointmentDate() {
		return appointmentDate;
	}
	public void setAppointmentDate(String appointmentDate) {
		this.appointmentDate = appointmentDate;
	}
	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	public int getAppoitmentid() {
		return appoitmentid;
	}
	public void setAppoitmentid(int appoitmentid) {
		this.appoitmentid = appoitmentid;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
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
	public String getQuestion3() {
		return question3;
	}
	public void setQuestion3(String question3) {
		this.question3 = question3;
	}
	public String getQuestion4() {
		return question4;
	}
	public void setQuestion4(String question4) {
		this.question4 = question4;
	}
	public String getQuestion5() {
		return question5;
	}
	public void setQuestion5(String question5) {
		this.question5 = question5;
	}
	public String getQuestion6() {
		return question6;
	}
	public void setQuestion6(String question6) {
		this.question6 = question6;
	}
	public String getQuestion7() {
		return question7;
	}
	public void setQuestion7(String question7) {
		this.question7 = question7;
	}
	public String getQuestion8() {
		return question8;
	}
	public void setQuestion8(String question8) {
		this.question8 = question8;
	}
	public String getQuestion9() {
		return question9;
	}
	public void setQuestion9(String question9) {
		this.question9 = question9;
	}
	public String getQuestion10() {
		return question10;
	}
	public void setQuestion10(String question10) {
		this.question10 = question10;
	}
	public String getQuestion11() {
		return question11;
	}
	public void setQuestion11(String question11) {
		this.question11 = question11;
	}
	public String getQuestion12() {
		return question12;
	}
	public void setQuestion12(String question12) {
		this.question12 = question12;
	}
	public String getQuestion13() {
		return question13;
	}
	public void setQuestion13(String question13) {
		this.question13 = question13;
	}
	public String getInjurydate() {
		return injurydate;
	}
	public void setInjurydate(String injurydate) {
		this.injurydate = injurydate;
	}
	public String getInsurancecompany() {
		return insurancecompany;
	}
	public void setInsurancecompany(String insurancecompany) {
		this.insurancecompany = insurancecompany;
	}
	public int getClaimnumber() {
		return claimnumber;
	}
	public void setClaimnumber(int claimnumber) {
		this.claimnumber = claimnumber;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}

}
