package com.me.spring.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.spring.pojo.DrugDetails;
import com.me.spring.pojo.DrugsComplaint;
import com.me.spring.pojo.FixAppointment;
import com.me.spring.pojo.User;

public class DrugsComplaintDao extends DAO{
	
	public DrugsComplaint addComplaint(String drugName, String manName,String drugType,String complaint)
            throws Exception {
        try {
            begin();
            DrugsComplaint drugsComplaint = new DrugsComplaint();
            drugsComplaint.setDrugName(drugName);
            drugsComplaint.setManufacturerName(manName);
            drugsComplaint.setDrugType(drugType);
            drugsComplaint.setEnterComplaint(complaint);
            getSession().save(drugsComplaint);
            commit();
            return drugsComplaint;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get complaint " + complaint, e);
        }
    }
	
	@SuppressWarnings("unchecked")
	public ArrayList<DrugsComplaint> getDrugsComplaint(String manufacturerName) throws Exception {
		
		try {
            begin();
            ArrayList<DrugsComplaint> complaintList = new ArrayList<DrugsComplaint>();
            Query q = getSession().createQuery("from DrugsComplaint where manufacturerName = :manufacturerName");
            q.setString("manufacturerName", manufacturerName);
            complaintList = (ArrayList<DrugsComplaint>) q.list();
            commit();
            return complaintList;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get the Complaint " + manufacturerName, e);
        }	
		
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<DrugsComplaint> getDrugsComplaintList() throws Exception {
		
		try {
            begin();
            ArrayList<DrugsComplaint> drugscomplaintList = new ArrayList<DrugsComplaint>();
            Query q = getSession().createQuery("from DrugsComplaint");
            drugscomplaintList = (ArrayList<DrugsComplaint>) q.list();
            System.out.println("Val of drugs comp" + drugscomplaintList);
            commit();
            return drugscomplaintList;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get the Complaint Lists");
        }	
		
	}
	
	public DrugsComplaint getdrugDetail(int complaintId) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("from DrugsComplaint where complaintId = :complaintId");
            q.setInteger("complaintId", complaintId);
            DrugsComplaint drugsComplaint = (DrugsComplaint) q.uniqueResult();
            commit();
            return drugsComplaint;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get fill the Patient " + complaintId, e);
        }
		
		
	}
	
	public void updateSeverity(int complaintId,String severityLevel) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("update DrugsComplaint set severityLevel = :severityLevel where complaintId = :complaintId");
            q.setInteger("complaintId", complaintId);
            q.setString("severityLevel", severityLevel);
            q.executeUpdate();
            commit();
            
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get the complaint " + complaintId, e);
        }
		
		
	}
	
	@SuppressWarnings("unchecked")
	public List<DrugsComplaint> getAllDrugs() {
        begin();
        Query q = getSession().createQuery("SELECT drugName from DrugsComplaint");
		List<DrugsComplaint> drugs = q.list();
		return drugs;
	}
	
	@SuppressWarnings("unchecked")
	public List<DrugsComplaint> getDrugComplaintId(String id) {
		begin();
		Query q = getSession().createQuery("from DrugsComplaint where manufacturerName = :manufacturerName");
		q.setParameter("manufacturerName", id);
		List<DrugsComplaint> drugs = q.list();
		return drugs;
	}
}
