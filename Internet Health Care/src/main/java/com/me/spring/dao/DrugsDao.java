package com.me.spring.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.spring.pojo.DoctorComplaint;
import com.me.spring.pojo.DrugDetails;
import com.me.spring.pojo.DrugManufacturer;
import com.me.spring.pojo.DrugsComplaint;
import com.me.spring.pojo.DrugsSalesDistribution;
import com.me.spring.pojo.FixAppointment;

public class DrugsDao extends DAO{
	
	public DrugDetails manageNewDrugs(String drugName,String drugId,int quantity,String drugType,
			String creationDate,String expiryDate,String hospitalId,String hospitalName,int licenseNumber) 
					throws Exception {
		try {
            begin();
            DrugDetails drugDetails = new DrugDetails();
            drugDetails.setDrugName(drugName);
            drugDetails.setDrugId(drugId);
            drugDetails.setQuantity(quantity);
            drugDetails.setDrugType(drugType);
            drugDetails.setCreationDate(creationDate);
            drugDetails.setExpiryDate(expiryDate);
            drugDetails.setHospitalId(hospitalId);
            drugDetails.setHospitalName(hospitalName);
            drugDetails.setStatus("active");
            drugDetails.setLicenseNumber(licenseNumber);
            
            getSession().save(drugDetails);
            commit();
            return drugDetails;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get fill the Drug " + drugName, e);
        }
	}
	
	public int getLienseNumber(int userId) throws Exception {
		
		try {
				begin();
				Query q = getSession().createQuery("select licenseNumber from DrugManufacturer where userId = :userId");
				q.setInteger("userId",userId);
				int licenseNumber = (Integer) q.uniqueResult();
				commit();
				return licenseNumber;
				
				} catch (HibernateException e) {
		            rollback();
		            throw new Exception("Could not get User " + userId, e);
			}
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<DrugDetails> getDrugLists(int licenseNumber,String drugName) throws Exception {
		try {
            begin();
            ArrayList<DrugDetails> drugList = new ArrayList<DrugDetails>();
            Query q = getSession().createQuery("from DrugDetails where licenseNumber = :licenseNumber and drugName = :drugName");
            q.setInteger("licenseNumber", licenseNumber);
            q.setString("drugName", drugName);
            drugList = (ArrayList<DrugDetails>) q.list();
            commit();
            return drugList;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get fill the Drug " + licenseNumber, e);
        }	
		
		
	}
	
	public String getDrugsComplaint(int licenseNumber) throws Exception {
		
		try {
				begin();
				Query q = getSession().createQuery("select manufacturerName from DrugManufacturer where licenseNumber = :licenseNumber");
				q.setInteger("licenseNumber",licenseNumber);
				String manufacturerName = (String) q.uniqueResult();
				commit();
				return manufacturerName;
				
				} catch (HibernateException e) {
		            rollback();
		            throw new Exception("Could not get Complaint " + licenseNumber, e);
			}
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<DrugDetails> getDrugsList(int licenseNumber) throws Exception {
		
		try {
            begin();
            ArrayList<DrugDetails> drugsList = new ArrayList<DrugDetails>();
            Query q = getSession().createQuery("from DrugDetails where licenseNumber = :licenseNumber");
            q.setInteger("licenseNumber",licenseNumber);
            drugsList = (ArrayList<DrugDetails>) q.list();
            commit();
            return drugsList;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get the Drug Lists");
        }	
		
	}
	
	public void updateDrugDetail(int shipmentId, int quantity) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("update DrugDetails set quantity = :quantity where shipmentId = :shipmentId");
            q.setInteger("shipmentId", shipmentId);
            q.setInteger("quantity", quantity);
            q.executeUpdate();
            commit();
            
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get the Drug " + shipmentId, e);
        }
		
		
	}
	
	public void deleteDrugDetail(int shipmentId) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("delete from DrugDetails where shipmentId = :shipmentId");
            q.setInteger("shipmentId", shipmentId);
            q.executeUpdate();
            commit();
            
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get the Drug " + shipmentId, e);
        }
			
	}
	
	public int getDrugsLicenseNumber(String hospitalName, String drugName) throws Exception {
		
		try {
				begin();
				Query q = getSession().createQuery("select licenseNumber from DrugDetails where hospitalName = :hospitalName and drugName = :drugName");
				q.setString("hospitalName",hospitalName);
				q.setString("drugName",drugName);
				int licenseNumber = (Integer) q.uniqueResult();
				commit();
				return licenseNumber;
				
				} catch (HibernateException e) {
		            rollback();
		            throw new Exception("Could not get License Number " , e);
			}
	}
	
	
	public int getDrugsQuantity(int licenseNumber) throws Exception {
		
		try {
				begin();
				Query q = getSession().createQuery("select quantity from DrugDetails where licenseNumber = :licenseNumber");
				q.setInteger("licenseNumber",licenseNumber);
				int quantity = (Integer) q.uniqueResult();
				commit();
				return quantity;
				
				} catch (HibernateException e) {
		            rollback();
		            throw new Exception("Could not get License Number " , e);
			}
	}
	
	public void updateDrugQuantity(int licenseNumber,int quantity) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("update DrugDetails set quantity = :quantity where licenseNumber = :licenseNumber");
            q.setInteger("licenseNumber", licenseNumber);
            q.setInteger("quantity", quantity);
            q.executeUpdate();
            commit();
            
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get the Drug " + licenseNumber, e);
        }
		
		
	}
	
	public DrugsSalesDistribution getSales(String drugManufacturerName,String hospitalName) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("from DrugsSalesDistribution where drugManufacturerName = :drugManufacturerName and hospitalName = :hospitalName");
            q.setString("drugManufacturerName", drugManufacturerName);
            q.setString("hospitalName", hospitalName);
            DrugsSalesDistribution drugsSales = (DrugsSalesDistribution) q.uniqueResult();
            commit();
            return drugsSales;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get fill the Sales " + drugManufacturerName, e);
        }
		
	}
	
	public DrugsSalesDistribution createSales(String drugManufacturerName,int licenseNumber,String hospitalName,int quantity) throws Exception {
		try {
            begin();
            DrugsSalesDistribution drugsales = new DrugsSalesDistribution();
            drugsales.setDrugManufacturerName(drugManufacturerName);
            drugsales.setLicenseNumber(licenseNumber);
            drugsales.setHospitalName(hospitalName);
            drugsales.setQuantity(quantity);
            
            getSession().save(drugsales);
            commit();
            return drugsales;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get fill the Sales " + drugManufacturerName, e);
        }
		
	}
	
	public void updateQuantity(String drugManufacturerName,int licenseNumber,String hospitalName,int quantity) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("select quantity from DrugsSalesDistribution where drugManufacturerName = :drugManufacturerName and hospitalName = :hospitalName and licenseNumber =:licenseNumber");
            q.setString("drugManufacturerName", drugManufacturerName);
            q.setInteger("licenseNumber", licenseNumber);
            q.setString("hospitalName", hospitalName);
            //DrugsSalesDistribution drugsSales = (DrugsSalesDistribution) q.uniqueResult();
            int qnty = (Integer) q.uniqueResult();
            int totalQuantity = qnty + quantity;
            Query q1 = getSession().createQuery("update DrugsSalesDistribution set quantity = :totalQuantity where drugManufacturerName = :drugManufacturerName and hospitalName = :hospitalName and licenseNumber =:licenseNumber");
            q1.setString("drugManufacturerName", drugManufacturerName);
            q1.setInteger("licenseNumber", licenseNumber);
            q1.setString("hospitalName", hospitalName);
            q1.setInteger("totalQuantity", totalQuantity);
            q1.executeUpdate();
            commit();
            
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get fill the Sales " + drugManufacturerName, e);
        }
		
	}

	public List<DrugManufacturer> getAllDrugManfacturers() {
        begin();
        Query q = getSession().createQuery("SELECT manufacturerName from DrugManufacturer");
        @SuppressWarnings("unchecked")
		List<DrugManufacturer> drugManufacturers = q.list();
		return drugManufacturers;
}




@SuppressWarnings("unchecked")
public List<DrugManufacturer> getDrugManfacturerId(String id) {
    begin();
    Query q = getSession().createQuery("from DrugManufacturer where manufacturerName = :manufacturerName");
    q.setParameter("manufacturerName", id);
	List<DrugManufacturer> drugManufacturers = q.list();
	return drugManufacturers;
}

	@SuppressWarnings("unchecked")
	public ArrayList<DrugsSalesDistribution> getDrugSales(int licenseNumber) throws Exception {
	try {
        begin();
        ArrayList<DrugsSalesDistribution> drugSalesList = new ArrayList<DrugsSalesDistribution>();
        Query q = getSession().createQuery("from DrugsSalesDistribution where licenseNumber = :licenseNumber");
        q.setInteger("licenseNumber", licenseNumber);
        drugSalesList = (ArrayList<DrugsSalesDistribution>) q.list();
        commit();
        return drugSalesList;
    } catch (HibernateException e) {
        rollback();
        throw new Exception("Could not get the Sales " + licenseNumber, e);
    }
	
}

}
