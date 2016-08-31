package com.me.spring.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.spring.pojo.DoctorComplaint;
import com.me.spring.pojo.DrugsComplaint;
import com.me.spring.pojo.FixAppointment;

public class DoctorComplaintDao extends DAO{
	
	public DoctorComplaint addDoctorComplaint(String firstName,String lastName,String docNPI,String address,String city,String state,String dateAttended,String complaint,String otherProblem,String question1,String question2,String question3,String comments) throws Exception {
		
		try {
            begin();
            DoctorComplaint doctorComplaint = new DoctorComplaint();
            doctorComplaint.setFirstName(firstName);
            doctorComplaint.setLastName(lastName);
            doctorComplaint.setDoctorNPI(docNPI);
            doctorComplaint.setAddress(address);
            doctorComplaint.setCity(city);
            doctorComplaint.setState(state);
            doctorComplaint.setDateAttended(dateAttended);
            doctorComplaint.setComplaintReason(complaint);
            doctorComplaint.setOtherProblem(otherProblem);
            doctorComplaint.setQuestion1(question1);
            doctorComplaint.setQuestion2(question2);
            doctorComplaint.setQuestion3(question3);
            doctorComplaint.setComments(comments);
            getSession().save(doctorComplaint);
            commit();
            return doctorComplaint;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get complaint " + firstName, e);
        }
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<DoctorComplaint> getDoctorComplaintList(int doctorNPI) throws Exception {
		try {
            begin();
            ArrayList<DoctorComplaint> complaintList = new ArrayList<DoctorComplaint>();
            Query q = getSession().createQuery("from DoctorComplaint where doctorNPI = :doctorNPI");
            q.setInteger("doctorNPI", doctorNPI);
            complaintList = (ArrayList<DoctorComplaint>) q.list();
            commit();
            return complaintList;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get fill the Appointment " + doctorNPI, e);
        }	
	}
	
	public DoctorComplaint getComplaintSummary(int doctorNPI) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("from DoctorComplaint where doctorNPI = :doctorNPI");
            q.setInteger("doctorNPI", doctorNPI);
            DoctorComplaint doctorComplaint = (DoctorComplaint) q.uniqueResult();
            commit();
            return doctorComplaint;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get the Complaint " + doctorNPI, e);
        }
		
		
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<DoctorComplaint> getDoctorComplaintList() throws Exception {
		
		try {
            begin();
            ArrayList<DoctorComplaint> doctorcomplaintList = new ArrayList<DoctorComplaint>();
            Query q = getSession().createQuery("from DoctorComplaint");
            doctorcomplaintList = (ArrayList<DoctorComplaint>) q.list();
            commit();
            return doctorcomplaintList;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get the Complaint Lists");
        }	
		
	}
	
	public DoctorComplaint getdoctorDetail(int complaintId) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("from DoctorComplaint where complaintId = :complaintId");
            q.setInteger("complaintId", complaintId);
            DoctorComplaint DoctorComplaint = (DoctorComplaint) q.uniqueResult();
            commit();
            return DoctorComplaint;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get the Complaint " + complaintId, e);
        }
		
		
	}
	
	public void updateSeverity(int complaintId,String severityLevel) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("update DoctorComplaint set severityLevel = :severityLevel where complaintId = :complaintId");
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
	public List<DoctorComplaint> getDoctorComplaints(String id) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("from DoctorComplaint where firstName = :firstName");
            q.setParameter("firstName", id);
            List<DoctorComplaint> allDoctorComplaints  =  q.list();
            commit();
            return allDoctorComplaints;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get all complaints " + e.getMessage());
        }
	}

}
