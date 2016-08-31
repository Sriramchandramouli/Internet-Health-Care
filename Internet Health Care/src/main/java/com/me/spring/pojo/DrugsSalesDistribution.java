package com.me.spring.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 
@Table(name="Drugs_Sales_Distribition")
public class DrugsSalesDistribution {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int salesId;
	private String drugManufacturerName;
	private String hospitalName;
	private int quantity;
	private int licenseNumber;
	
	
	public int getLicenseNumber() {
		return licenseNumber;
	}
	public void setLicenseNumber(int licenseNumber) {
		this.licenseNumber = licenseNumber;
	}
	public String getDrugManufacturerName() {
		return drugManufacturerName;
	}
	public void setDrugManufacturerName(String drugManufacturerName) {
		this.drugManufacturerName = drugManufacturerName;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


}
