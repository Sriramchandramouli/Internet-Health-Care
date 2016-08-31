package com.me.spring.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 
@Table(name="DRUG_DETAILS")
public class DrugDetails {
	
	@Column (nullable=false,name="Drug_Name")
	private String drugName;
	@Column (nullable=false,name="Drug_Id")
	private String drugId;
	@Column (nullable=false,name="Drug_Quantity")
	private int quantity;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int shipmentId;
	@Column (nullable=false,name="Drug_Type")
	private String drugType;
	@Column (nullable=false,name="Creation_Date")
	private String creationDate;
	@Column (nullable=false,name="Expiry_Date")
	private String expiryDate;
	@Column (nullable=false,name="Hospital_ID")
	private String hospitalId;
	@Column (nullable=false,name="Hospital_Name")
	private String hospitalName;
	@Column (name="Drug_Status")
	private String status;
	@Column (name="Drug_License_Number")
	private int licenseNumber;
	
	public int getLicenseNumber() {
		return licenseNumber;
	}
	public void setLicenseNumber(int licenseNumber) {
		this.licenseNumber = licenseNumber;
	}
	public String getDrugName() {
		return drugName;
	}
	public void setDrugName(String drugName) {
		this.drugName = drugName;
	}
	public String getDrugId() {
		return drugId;
	}
	public void setDrugId(String drugId) {
		this.drugId = drugId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getShipmentId() {
		return shipmentId;
	}
	public void setShipmentId(int shipmentId) {
		this.shipmentId = shipmentId;
	}
	public String getDrugType() {
		return drugType;
	}
	public void setDrugType(String drugType) {
		this.drugType = drugType;
	}
	public String getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getHospitalId() {
		return hospitalId;
	}
	public void setHospitalId(String hospitalId) {
		this.hospitalId = hospitalId;
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
