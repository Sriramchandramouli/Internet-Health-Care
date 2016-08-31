package com.me.spring.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.spring.pojo.Appointment;
import com.me.spring.pojo.Doctor;
import com.me.spring.pojo.DrugsComplaint;
import com.me.spring.pojo.FixAppointment;
import com.me.spring.pojo.Patient;
import com.me.spring.pojo.PatientRecord;
import com.me.spring.pojo.RequestPatient;
import com.me.spring.pojo.User;

public class PatientDao extends DAO{
	
	public Patient createNewPatient(Patient p, User patientUser) throws Exception {
		
		try {
            begin();
            Patient patient = new Patient();
            patient.setFirstname(p.getFirstname());
            patient.setLastname(p.getLastname());
            patient.setNickname(p.getNickname());
            patient.setBirthdate(p.getBirthdate());
            patient.setStreetaddress(p.getStreetaddress());
            patient.setCity(p.getCity());
            patient.setState(p.getState());
            patient.setZipcode(p.getZipcode());
            patient.setGender(p.getGender());
            patient.setMaritalstatus(p.getMaritalstatus());
            patient.setSsn(p.getSsn());
            patient.setEmail(p.getEmail());
            patient.setHomephone(p.getHomephone());
            patient.setWorkphone(p.getWorkphone());
            patient.setCellphone(p.getCellphone());
            patient.setPreferredphone(p.getPreferredphone());
            patient.setRace(p.getRace());
            patient.setEthnicity(p.getEthnicity());
            patient.setPreferredlanguage(p.getPreferredlanguage());
            patient.setRelation1(p.getRelation1());
            patient.setPhone1(p.getPhone1());
            patient.setInitial1(p.getInitial1());
            patient.setRelation2(p.getRelation2());
            patient.setPhone2(p.getPhone2());
            patient.setInitial2(p.getInitial2());
            patient.setUser(patientUser);
            
            getSession().save(patient);
            commit();
            return patient;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get Patient " + p.getFirstname(), e);
        }
		
		
	}
	
	public String getPatientFirstName(int user_Id) throws Exception {
		
		try {
			begin();
			Query q = getSession().createQuery("select firstname from Patient where user_Id = :user_Id");
			q.setInteger("user_Id",user_Id);
			String firstName = (String) q.uniqueResult();
			
			commit();
			
			return firstName;
			
			} catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not get User " + user_Id, e);
		}
}
	
	public Patient getPatient(int user_Id) throws Exception {
		
		try {
			begin();
			Query q = getSession().createQuery("from Patient where user_Id = :user_Id");
			q.setInteger("user_Id",user_Id);
			Patient patient = (Patient) q.uniqueResult();
			
			commit();
			
			return patient;
			
			} catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not get Patient " + user_Id, e);
		}
}
	
	public Patient getPatientDetails(String ssn) throws Exception {
		
		try {
			begin();
			Query q = getSession().createQuery("from Patient where ssn = :ssn");
			q.setString("ssn", ssn);
			Patient patient = (Patient) q.uniqueResult();
			commit();
			return patient;
			
			} catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not get Patient ");
		}
}
	
	
	public PatientRecord updatePatientRecord(String bloodPressure, String temp, String pulse, String bmi, String comments, String medication, 
			String medication2,String charges,Patient patient,Appointment appointment,
			FixAppointment fa) throws Exception {
		
		try {
			begin();
			PatientRecord patientRecord = new PatientRecord();
			
			patientRecord.setFirstName(patient.getFirstname());
			patientRecord.setLastName(patient.getLastname());
			patientRecord.setSsn(patient.getSsn());
			patientRecord.setGender(patient.getGender());
			patientRecord.setDataVisited(fa.getDateRequested());
			patientRecord.setReason(appointment.getReason());
			patientRecord.setHospitalName(fa.getHospitalName());
			patientRecord.setDoctorName(fa.getDoctorName());
			patientRecord.setBloodPressure(bloodPressure);
			patientRecord.setTemperature(temp);
			patientRecord.setPulse(pulse);
			patientRecord.setWeight(appointment.getWeight());
			patientRecord.setHeight(appointment.getHeight());
			patientRecord.setBmi(bmi);
			patientRecord.setInsuranceCompany(appointment.getInsurancecompany());
			patientRecord.setComments(comments);
			patientRecord.setMedication1(medication);
			patientRecord.setMedication2(medication2);
			patientRecord.setNetPay(charges);
			patientRecord.setStreetAddress(patient.getStreetaddress());
			patientRecord.setCity(patient.getCity());
			patientRecord.setState(patient.getState());
			getSession().save(patientRecord);
			commit();
			return patientRecord;
			
			} catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not get Patient Record ");
		}
}
	
		public RequestPatient requestForPatient(RequestPatient rp,Doctor doctor) throws Exception {
		
		try {
            begin();
            
            RequestPatient requestPatient = new RequestPatient();
            requestPatient.setSsn(rp.getSsn());
            requestPatient.setPatientName(rp.getPatientName());
            requestPatient.setReason(rp.getReason());
            requestPatient.setDoctorName(doctor.getFirstName());
            requestPatient.setDoctorNpi(doctor.getNpi());
            requestPatient.setHospitalName(doctor.getHospitalName());
            requestPatient.setStatus("pending");
            
            getSession().save(requestPatient);
            commit();
            return requestPatient;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get Patient " +  e);
        }
		
		
	}
		
		@SuppressWarnings("unchecked")
		public ArrayList<RequestPatient> requestForPatientLists(String status) throws Exception {
			
			try {
	            begin();
	            ArrayList<RequestPatient> requestPatientLists = new ArrayList<RequestPatient>();
	            Query q = getSession().createQuery("from RequestPatient where status = :status");
	            q.setString("status", status);
	            requestPatientLists = (ArrayList<RequestPatient>) q.list();
	            commit();
	            return requestPatientLists;
	        } catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not get the Request Lists ", e);
	        }	
		}

		public void replyPatientRequests(String status,int requestId) throws Exception {
			
			try {
	            begin();
	            Query q = getSession().createQuery("update RequestPatient set status = :status where requestId = :requestId");
	            q.setInteger("requestId", requestId);
	            q.setString("status", status);
	            q.executeUpdate();
	            commit();
	            
	        } catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not get fill the Patient " + requestId, e);
	        }
			
		}
		
		@SuppressWarnings("unchecked")
		public ArrayList<RequestPatient> getRequestedPatientLists(int doctorNpi) throws Exception {
			
			try {
	            begin();
	            ArrayList<RequestPatient> requestedPatientLists = new ArrayList<RequestPatient>();
	            Query q = getSession().createQuery("from RequestPatient where doctorNpi = :doctorNpi");
	            q.setInteger("doctorNpi", doctorNpi);
	            requestedPatientLists = (ArrayList<RequestPatient>) q.list();
	            commit();
	            return requestedPatientLists;
	        } catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not get the Request Lists ", e);
	        }	
		}
		
		public PatientRecord getRequestedPatientRecord(String ssn) throws Exception {
			
			try {
				begin();
				Query q = getSession().createQuery("from PatientRecord where ssn = :ssn");
				q.setString("ssn",ssn);
				PatientRecord patientRecord = (PatientRecord) q.uniqueResult();
				commit();
				return patientRecord;
				
				} catch (HibernateException e) {
		            rollback();
		            throw new Exception("Could not get Patient Record" + ssn, e);
			}
		}
		
		@SuppressWarnings("unchecked")
		public ArrayList<PatientRecord> getPatientMedicalList(String ssn) throws Exception {
			
			try {
	            begin();
	            ArrayList<PatientRecord> patientMedicalList = new ArrayList<PatientRecord>();
	            Query q = getSession().createQuery("from PatientRecord where ssn = :ssn");
	            q.setString("ssn", ssn);
	            patientMedicalList = (ArrayList<PatientRecord>) q.list();
	            commit();
	            return patientMedicalList;
	        } catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not get the Request Lists ", e);
	        }	
		}

		public void updatePatient(String firstname, String lastname,String nickname, String birthdate, 
				String streetaddress,String city,String state,String zipcode,String gender,String maritalstatus, 
				String ssn,String email,int homephone,int workphone,int cellphone,String preferredphone, String race,
				String ethnicity,String preferredlanguage,String relation1,int phone1,String initial1,String relation2,
				int phone2,String initial2) throws Exception {
			try {
	            begin();
	            Query q = getSession().createQuery("update Patient set firstname = :firstname, lastname = :lastname, nickname = :nickname,"
	            		+ "birthdate = :birthdate,streetaddress = :streetaddress,city = :city,state = :state,zipcode = :zipcode,gender = :gender,maritalstatus = :maritalstatus,ssn = :ssn,  "
	            		+ "email = :email,homephone = :homephone,workphone = :workphone,cellphone = :cellphone,preferredphone = :preferredphone,race = :race,ethnicity = :ethnicity,preferredlanguage = :preferredlanguage,relation1 = :relation1,phone1 = :phone1,initial1 = :initial1,"
	            		+ "where appoitmentid = :appoitmentid");
	            
	            q.setString("waiting", "waiting");
	           
	            q.executeUpdate();
	            commit();
	            
	        } catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not get the Patient Form" + firstname, e);
	        }
			
		}
		
		

		@SuppressWarnings("unchecked")
		public List<Patient> getAllPatientSsn() throws Exception {
			try {
	            begin();
	            
	            Query q = getSession().createQuery("SELECT ssn from Patient");
	            List<Patient> patientSsnList =  q.list();
	            commit();
	            return patientSsnList;
	        } catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not get all SSN " + e.getMessage());
	        }
			
			
		}
		
		@SuppressWarnings("unchecked")
		public List<Patient> getPatientById(String ssn) throws Exception {
			try {
	            begin();
	            
	            Query q = getSession().createQuery("from Patient where ssn = :ssn");
	            q.setParameter("ssn", ssn);
	            List<Patient> patientSsnList =  q.list();
	            commit();
	            return patientSsnList;
	        } catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not get patient " + e.getMessage());
	        }
			
			
		}
		
		public Patient queryPatientBySSN(String ssn)
	            throws Exception {
	        try {
	            begin();
	            Query q = getSession().createQuery("from Patient where ssn = :ssn");
	            q.setString("ssn", ssn);
	            
	            Patient patient = (Patient) q.uniqueResult();
	            commit();
	            return patient;
	        } catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not get Patient " + ssn, e);
	        }
	    }
}
