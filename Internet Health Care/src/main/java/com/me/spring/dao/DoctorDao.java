package com.me.spring.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Restrictions;

import com.me.spring.pojo.Doctor;

public class DoctorDao extends DAO{
	
	@SuppressWarnings("unchecked")
	public List<Doctor> getSearchResult(String firstName, String lastName, String gender, String speciality1) {
		
		Criteria cr = getSession().createCriteria(Doctor.class);
		//Disjunction or = Restrictions.disjunction();
		Conjunction and = Restrictions.conjunction();
		
		if (firstName != null)
	        and.add(Restrictions.ilike("firstName", firstName+"%"));
	      if (lastName != null)
	        and.add(Restrictions.ilike("lastName", "%"+lastName));
	      if (gender != null)
	        and.add(Restrictions.ilike("gender", gender));
	      if (speciality1 != null)
	        and.add(Restrictions.ilike("speciality1", "%"+speciality1+"%"));

	      cr.add(and);

	      return (List<Doctor>) cr.list();      
		
	}
	
	public Doctor getDoctor(int npi) throws Exception {
		
		try {
				begin();
				Query q = getSession().createQuery("from Doctor where npi = :npi");
				q.setInteger("npi",npi);
				Doctor doctor = (Doctor) q.uniqueResult();
				
				commit();
				
				return doctor;
				
				} catch (HibernateException e) {
		            rollback();
		            throw new Exception("Could not get Doctor " + npi, e);
			}
	}
	
	public int getDoctorNPI(int userID) throws Exception {
		
		try {
				begin();
				Query q = getSession().createQuery("select npi from Doctor where userID = :userID");
				q.setInteger("userID",userID);
				int docNPI = (Integer) q.uniqueResult();
				
				commit();
				
				return docNPI;
				
				} catch (HibernateException e) {
		            rollback();
		            throw new Exception("Could not get User " + userID, e);
			}
	}
		
	@SuppressWarnings("unchecked")
	public List<Doctor> getAllDoctorNpi() throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("SELECT firstName from Doctor");
            List<Doctor> doctorNpiList  =  q.list();
            commit();
            return doctorNpiList;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get all NPIs " + e.getMessage());
        }
	}
	
	@SuppressWarnings("unchecked")
	public List<Doctor> getDoctorById(String id) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("from Doctor where firstName = :firstName");
            q.setParameter("firstName", id);
            List<Doctor> doctorNpiList  =  q.list();
            commit();
            return doctorNpiList;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get all NPIs " + e.getMessage());
        }
	}
}
