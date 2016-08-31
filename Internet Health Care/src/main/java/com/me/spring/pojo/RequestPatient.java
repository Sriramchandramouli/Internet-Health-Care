package com.me.spring.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 
@Table(name="Request_Patient_Details")
public class RequestPatient {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column (nullable=false)
	private int requestId;
	@Column (nullable=false,name="Patient_SSN")
	private String ssn;
	@Column (name="Patient_Name")
	private String patientName;
	@Column (nullable=false,name="Request_Reason")
	private String reason;
	@Column (name="Doctor_Name")
	private String doctorName;
	@Column (name="Doctor_NPI")
	private int doctorNpi;
	@Column (nullable=false,name="Hospital_Name")
	private String hospitalName;
	private String status;
	
	public int getRequestId() {
		return requestId;
	}
	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	
	public int getDoctorNpi() {
		return doctorNpi;
	}
	public void setDoctorNpi(int doctorNpi) {
		this.doctorNpi = doctorNpi;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	

}
