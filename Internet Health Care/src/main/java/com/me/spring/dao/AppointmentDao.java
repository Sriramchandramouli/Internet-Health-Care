package com.me.spring.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.me.spring.pojo.Appointment;
import com.me.spring.pojo.FixAppointment;
import com.me.spring.pojo.Patient;

public class AppointmentDao extends DAO{
	
	public Appointment scheduleNewAppointent(String reason,String question1,String question2,float weight,float height,String question3,
			String question4,String question5,String question6,String question7,String question8,String question9,String question10,
			String question11,String question12,String question13,String injurydate,String insurancecompany,int claimnumber,
			String signature,String hospitalName, String appointmentDate,Patient patient) throws Exception {
		
		try {
            begin();
            Appointment appointment = new Appointment();
            appointment.setReason(reason);
            appointment.setQuestion1(question1);
            appointment.setQuestion2(question2);
            appointment.setWeight(weight);
            appointment.setHeight(height);
            appointment.setQuestion3(question3);
            appointment.setQuestion4(question4);
            appointment.setQuestion5(question5);
            appointment.setQuestion6(question6);
            appointment.setQuestion7(question7);
            appointment.setQuestion8(question8);
            appointment.setQuestion9(question9);
            appointment.setQuestion10(question10);
            appointment.setQuestion11(question11);
            appointment.setQuestion12(question12);
            appointment.setQuestion13(question13);
            appointment.setInjurydate(injurydate);
            appointment.setInsurancecompany(insurancecompany);
            appointment.setClaimnumber(claimnumber);
            appointment.setSignature(signature);
            appointment.setHospitalName(hospitalName);
            appointment.setAppointmentDate(appointmentDate);
            appointment.setStatus("sent");
            appointment.setPatient(patient);
            
            getSession().save(appointment);
            commit();
            return appointment;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get fill the form " + reason, e);
        }
		
		
	}
	
	public Appointment scheduleNewAppointent1(String reason,String question1,String question2,float weight,float height,String question3,
			String question4,String question5,String question6,String question7,String question8,String question9,String question10,
			String question11,String question12,String question13,String injurydate,String insurancecompany,int claimnumber,
			String signature,String hospitalName, String appointmentDate,String doctorName,Patient patient) throws Exception {
		
		try {
            begin();
            Appointment appointment = new Appointment();
            appointment.setReason(reason);
            appointment.setQuestion1(question1);
            appointment.setQuestion2(question2);
            appointment.setWeight(weight);
            appointment.setHeight(height);
            appointment.setQuestion3(question3);
            appointment.setQuestion4(question4);
            appointment.setQuestion5(question5);
            appointment.setQuestion6(question6);
            appointment.setQuestion7(question7);
            appointment.setQuestion8(question8);
            appointment.setQuestion9(question9);
            appointment.setQuestion10(question10);
            appointment.setQuestion11(question11);
            appointment.setQuestion12(question12);
            appointment.setQuestion13(question13);
            appointment.setInjurydate(injurydate);
            appointment.setInsurancecompany(insurancecompany);
            appointment.setClaimnumber(claimnumber);
            appointment.setSignature(signature);
            appointment.setHospitalName(hospitalName);
            appointment.setAppointmentDate(appointmentDate);
            appointment.setStatus("sent");
            appointment.setDoctorName(doctorName);
            appointment.setPatient(patient);
            
            getSession().save(appointment);
            commit();
            return appointment;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get fill the form " + reason, e);
        }
		
		
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<FixAppointment> getAppointmentList(int doctornpi,String status) throws Exception {
		try {
            begin();
            ArrayList<FixAppointment> appointmentList = new ArrayList<FixAppointment>();
            Query q = getSession().createQuery("from FixAppointment where doctornpi = :doctornpi and status = :status");
            q.setInteger("doctornpi", doctornpi);
            q.setString("status", status);
            appointmentList = (ArrayList<FixAppointment>) q.list();
            commit();
            return appointmentList;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get fill the Appointment " + doctornpi, e);
        }
		
		
	}
	
	public FixAppointment getPatientDetail(int appoitmentid) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("from FixAppointment where appoitmentid = :appoitmentid");
            q.setInteger("appoitmentid", appoitmentid);
            FixAppointment fixAppointment = (FixAppointment) q.uniqueResult();
            commit();
            return fixAppointment;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get fill the Patient " + appoitmentid, e);
        }
		
		
	}
	
	public void updateAppointmentDetail(int appoitmentid) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("update FixAppointment set status = :confirmed where appoitmentid = :appoitmentid");
            q.setInteger("appoitmentid", appoitmentid);
            q.setString("confirmed", "confirmed");
            q.executeUpdate();
            commit();
            
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get fill the Patient " + appoitmentid, e);
        }
		
		
	}
	
	public void declineAppointment(int appoitmentid) throws Exception {
		try {
            begin();
            Query q = getSession().createQuery("update FixAppointment set status = :waiting, doctorName = :parm, doctornpi = :parm1  where appoitmentid = :appoitmentid");
            q.setInteger("appoitmentid", appoitmentid);
            q.setString("waiting", "waiting");
            q.setString("parm", null);
            q.setInteger("parm1", 0);
            q.executeUpdate();
            commit();
            
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get fill the Patient " + appoitmentid, e);
        }
		
		
	}
	
	public Appointment getAppointmenttDetails(int appoitmentid) throws Exception {
		
		try {
			begin();
			Query q = getSession().createQuery("from Appointment where appoitmentid = :appoitmentid");
			q.setInteger("appoitmentid", appoitmentid);
			Appointment appointment = (Appointment) q.uniqueResult();
			commit();
			return appointment;
			
			} catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not get Appointment ");
		}
}
	public FixAppointment updateAppointment(String doctorName, int doctornpi, String dateRequested, 
			Appointment appointment,Patient patient) throws Exception {
		
		try {
			begin();
			FixAppointment fixAppointment = new FixAppointment();
			fixAppointment.setPatientInitialAppointment(appointment.getAppoitmentid());
			fixAppointment.setPatientFirstname(patient.getFirstname());
			fixAppointment.setPatientLastname(patient.getLastname());
			fixAppointment.setPatientBirthdate(patient.getBirthdate());
			fixAppointment.setPatientStreetaddress(patient.getStreetaddress());
			fixAppointment.setPatientCity(patient.getCity());
			fixAppointment.setPatientState(patient.getState());
			fixAppointment.setPatientZipcode(patient.getZipcode());
			fixAppointment.setPatientGender(patient.getGender());
			fixAppointment.setPatientEmail(patient.getEmail());
			fixAppointment.setPatientPhone(patient.getPreferredphone());
			fixAppointment.setReason(appointment.getReason());
			fixAppointment.setQuestion1(appointment.getQuestion1());
			fixAppointment.setQuestion2(appointment.getQuestion2());
			fixAppointment.setWeight(appointment.getWeight());
			fixAppointment.setHeight(appointment.getHeight());
			fixAppointment.setQuestion3(appointment.getQuestion3());
			fixAppointment.setQuestion4(appointment.getQuestion4());
			fixAppointment.setQuestion5(appointment.getQuestion5());
			fixAppointment.setQuestion6(appointment.getQuestion6());
			fixAppointment.setQuestion7(appointment.getQuestion7());
			fixAppointment.setQuestion8(appointment.getQuestion8());
			fixAppointment.setQuestion9(appointment.getQuestion9());
			fixAppointment.setQuestion10(appointment.getQuestion10());
			fixAppointment.setQuestion11(appointment.getQuestion11());
			fixAppointment.setQuestion12(appointment.getQuestion12());
			fixAppointment.setQuestion13(appointment.getQuestion13());
			fixAppointment.setInjurydate(appointment.getInjurydate());
			fixAppointment.setInsurancecompany(appointment.getInsurancecompany());
			fixAppointment.setClaimnumber(appointment.getClaimnumber());
			fixAppointment.setSignature(appointment.getSignature());
			System.out.println("hosp name is" +  appointment.getHospitalName());
			fixAppointment.setHospitalName(appointment.getHospitalName());
			fixAppointment.setDoctorName(doctorName);
			fixAppointment.setDoctornpi(doctornpi);
			fixAppointment.setStatus("pending");
			fixAppointment.setDateRequested(dateRequested);
			fixAppointment.setSsn(patient.getSsn());
			
			getSession().save(fixAppointment);
			commit();
			return fixAppointment;
			
			} catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not get Appointment ");
		}
}
	
	public FixAppointment getFixAppointmenttDetails(int patientInitialAppointment) throws Exception {
		
		try {
			begin();
			Query q = getSession().createQuery("from FixAppointment where patientInitialAppointment = :patientInitialAppointment");
			q.setInteger("patientInitialAppointment", patientInitialAppointment);
			FixAppointment fixappointment = (FixAppointment) q.uniqueResult();
			commit();
			return fixappointment;
			
			} catch (HibernateException e) {
	            rollback();
	            throw new Exception("Could not get Appointment ");
		}
	}
		
	@SuppressWarnings("unchecked")
	public List<Appointment> getPatientAppointments(String ssn) throws Exception {
		try {
            begin();
            
            Query q = getSession().createQuery("from Appointment where ssn = :ssn");
            q.setParameter("ssn", ssn);
            List<Appointment> appointmentList =  q.list();
            commit();
            return appointmentList;
        } catch (HibernateException e) {
            rollback();
            throw new Exception("Could not get patient " + e.getMessage());
        }
		
		
	}

}
