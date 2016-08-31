package com.me.spring.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 
@Table(name="FIX_APPOINTMENT")
public class FixAppointment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column (nullable=false,name="Patient_AppointmentId")
	private int appoitmentid;
	@Column (nullable=false,name="Initial_AppointmentID")
	private int patientInitialAppointment;
	@Column (nullable=false,name="Patient_Firstname")
	private String patientFirstname;
	@Column (nullable=false,name="Patient_Lastname")
	private String patientLastname;
	@Column (nullable=false,name="Patient_Birthdate")
	private String patientBirthdate;
	@Column (nullable=false,name="Patient_Streetaddress")
	private String patientStreetaddress;
	@Column (nullable=false,name="Patient_City")
	private String patientCity;
	@Column (nullable=false,name="Patient_State")
	private String patientState;
	@Column (nullable=false,name="Patient_Zipcode")
	private String patientZipcode;
	@Column (nullable=false,name="Patient_Gender")
	private String patientGender;
	@Column (nullable=false,name="Patient_Email")
	private String patientEmail;
	@Column (nullable=false,name="Patient_Phone")
	private String patientPhone;
	@Column (nullable=false,name="Reason_For_Visit")
	private String reason;
	@Column (nullable=false,name="Are_You_In_Goodhealth")
	private String question1;
	@Column (nullable=false,name="Any_Changes_In_Health")
	private String question2;
	@Column (nullable=false,name="Patient_Weight")
	private float weight;
	@Column (nullable=false,name="Patient_Height")
	private float height;
	@Column (nullable=false,name="Under_Any_Care_Of_Physician")
	private String question3;
	@Column (nullable=false,name="Any_Illness_Or_Hospitalized")
	private String question4;
	@Column (nullable=false,name="Anything_Tobe_Toldto_Doctor")
	private String question5;
	@Column (nullable=false,name="Have_Any_Disease1")
	private String question6;
	@Column (nullable=false,name="Have_Any_Disease2")
	private String question7;
	@Column (nullable=false,name="Family_Has_Disease")
	private String question8;
	@Column (nullable=false,name="Taking_Any_Drugs")
	private String question9;
	@Column (nullable=false,name="Related_To_Accident")
	private String question10;
	@Column (nullable=false,name="Related_To_Automobie")
	private String question11;
	@Column (nullable=false,name="Related_To_Work")
	private String question12;
	@Column (nullable=false,name="Any_Other_Issue")
	private String question13;
	@Column (nullable=false,name="Date_Of_Injury")
	private String injurydate;
	@Column (name="Insurance_Company")
	private String insurancecompany;
	@Column (name="Claim_Number")
	private int claimnumber;
	@Column (nullable=false,name="Patient_Signature")
	private String signature;
	@Column (nullable=false,name="Hospital_Name")
	private String hospitalName;
	@Column (name="Doctor_Name")
	private String doctorName;
	@Column (name="Doctor_NPI")
	private int doctornpi;
	private String status;
	@Column (name="Date_Of_Visit")
	private String dateRequested;
	@Column (nullable=false,name="ssn")
	private String ssn;
	
	
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String getDateRequested() {
		return dateRequested;
	}
	public void setDateRequested(String dateRequested) {
		this.dateRequested = dateRequested;
	}
	public int getAppoitmentid() {
		return appoitmentid;
	}
	public void setAppoitmentid(int appoitmentid) {
		this.appoitmentid = appoitmentid;
	}
	public String getPatientFirstname() {
		return patientFirstname;
	}
	public void setPatientFirstname(String patientFirstname) {
		this.patientFirstname = patientFirstname;
	}
	public String getPatientLastname() {
		return patientLastname;
	}
	public void setPatientLastname(String patientLastname) {
		this.patientLastname = patientLastname;
	}
	public String getPatientBirthdate() {
		return patientBirthdate;
	}
	public void setPatientBirthdate(String patientBirthdate) {
		this.patientBirthdate = patientBirthdate;
	}
	public String getPatientStreetaddress() {
		return patientStreetaddress;
	}
	public void setPatientStreetaddress(String patientStreetaddress) {
		this.patientStreetaddress = patientStreetaddress;
	}
	public String getPatientCity() {
		return patientCity;
	}
	public void setPatientCity(String patientCity) {
		this.patientCity = patientCity;
	}
	public String getPatientState() {
		return patientState;
	}
	public void setPatientState(String patientState) {
		this.patientState = patientState;
	}
	public String getPatientZipcode() {
		return patientZipcode;
	}
	public void setPatientZipcode(String patientZipcode) {
		this.patientZipcode = patientZipcode;
	}
	public String getPatientGender() {
		return patientGender;
	}
	public void setPatientGender(String patientGender) {
		this.patientGender = patientGender;
	}
	public String getPatientEmail() {
		return patientEmail;
	}
	public void setPatientEmail(String patientEmail) {
		this.patientEmail = patientEmail;
	}
	public String getPatientPhone() {
		return patientPhone;
	}
	public void setPatientPhone(String patientPhone) {
		this.patientPhone = patientPhone;
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
	
	public int getDoctornpi() {
		return doctornpi;
	}
	public void setDoctornpi(int doctornpi) {
		this.doctornpi = doctornpi;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getPatientInitialAppointment() {
		return patientInitialAppointment;
	}
	public void setPatientInitialAppointment(int patientInitialAppointment) {
		this.patientInitialAppointment = patientInitialAppointment;
	}
	
	

}
