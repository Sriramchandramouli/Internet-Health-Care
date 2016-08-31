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
@Table(name="DRUGS_COMPLAINT")
public class DrugsComplaint {
	
	@Id
	@Column (nullable=false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int complaintId;
	@Column (nullable=false)
	private String drugName;
	@Column (nullable=false)
	private String manufacturerName;
	@Column (nullable=false)
	private String drugType;
	@Column (nullable=false)
	private String enterComplaint;
	@Column (name="SEVERITY_LEVEL")
	private String severityLevel;
	@Column (name="Drug_Manufacturer_Comments")
	private String manufacturerComments;
	
	
	public String getManufacturerComments() {
		return manufacturerComments;
	}
	public void setManufacturerComments(String manufacturerComments) {
		this.manufacturerComments = manufacturerComments;
	}
	public String getDrugName() {
		return drugName;
	}
	public void setDrugName(String drugName) {
		this.drugName = drugName;
	}
	public String getManufacturerName() {
		return manufacturerName;
	}
	public void setManufacturerName(String manufacturerName) {
		this.manufacturerName = manufacturerName;
	}
	public String getDrugType() {
		return drugType;
	}
	public void setDrugType(String drugType) {
		this.drugType = drugType;
	}
	public String getEnterComplaint() {
		return enterComplaint;
	}
	public void setEnterComplaint(String enterComplaint) {
		this.enterComplaint = enterComplaint;
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
