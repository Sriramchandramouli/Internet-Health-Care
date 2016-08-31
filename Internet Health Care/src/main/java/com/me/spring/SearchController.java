package com.me.spring;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.me.spring.dao.AppointmentDao;
import com.me.spring.dao.DoctorComplaintDao;
import com.me.spring.dao.DoctorDao;
import com.me.spring.dao.DrugsComplaintDao;
import com.me.spring.dao.DrugsDao;
import com.me.spring.dao.DrugsSalesDistributionDao;
import com.me.spring.dao.PatientDao;
import com.me.spring.pojo.Appointment;
import com.me.spring.pojo.Doctor;
import com.me.spring.pojo.DoctorComplaint;
import com.me.spring.pojo.DrugManufacturer;
import com.me.spring.pojo.DrugsComplaint;
import com.me.spring.pojo.DrugsSalesDistribution;
import com.me.spring.pojo.Patient;

@Controller
public class SearchController {

	@Autowired
	PatientDao patientServiceDao;
	
	@Autowired
	AppointmentDao appointmentServiceDao;
	
	@Autowired
	DoctorDao doctorServiceDao;
	
	@Autowired
	DoctorComplaintDao doctorComplaintDao;
	
	@Autowired
	DrugsDao drugServiceDao;
	
	@Autowired
	DrugsSalesDistributionDao drugsSalesDistributionDao;
	
	@Autowired
	DrugsComplaintDao drugsComplaintServiceDao;
	
	@RequestMapping(value="/adminSearchResults.htm", method=RequestMethod.GET)
	public String adminSearchResults() throws Exception {
		
		return "AdminSearch";
	}
	
	@RequestMapping(value="/drugSalesResults.htm", method=RequestMethod.GET)
	public String drugSalesResults() throws Exception {
		
		return "drugSales";
	}
	
	@RequestMapping(value="/getAllPatients.htm", method=RequestMethod.GET)
	public @ResponseBody List<Patient> getAllPatientSsn() throws Exception {
		List<Patient> allPatientSsn = patientServiceDao.getAllPatientSsn();
		
		return allPatientSsn;
	}
	
	@RequestMapping(value="/getAllDoctors.htm", method=RequestMethod.GET)
	public @ResponseBody List<Doctor> getAllDoctorNpi() throws Exception {
		List<Doctor> allDoctorNpi = doctorServiceDao.getAllDoctorNpi();
		return allDoctorNpi;
	}
	
	@RequestMapping(value="/getAllDrugManufacturers.htm", method=RequestMethod.GET)
	public @ResponseBody List<DrugManufacturer> getAllDrugManufacturers() throws Exception {
		List<DrugManufacturer> allDrugManufacturers = drugServiceDao.getAllDrugManfacturers();
		return allDrugManufacturers;
	}
	
	@RequestMapping(value="/getAllDrugManufacturer.htm", method=RequestMethod.GET)
	public @ResponseBody List<DrugsSalesDistribution> getAllDrugManufacturer() throws Exception {
		List<DrugsSalesDistribution> allDrugManufacturers = drugsSalesDistributionDao.getAllDrugManfacturer();
		return allDrugManufacturers;
	}
	
	@RequestMapping(value="/getAllDrugs.htm", method=RequestMethod.GET)
	public @ResponseBody List<DrugsComplaint> getAllDrugs() throws Exception {
		List<DrugsComplaint> allDrugs = drugsComplaintServiceDao.getAllDrugs();
		return allDrugs;
	}
	
	@RequestMapping(value="/getPatientId.htm", method=RequestMethod.GET, headers="Accept=*/*")
	public @ResponseBody List<Patient> getPatientId(@RequestParam(value = "id", required = false) String id) throws Exception {
		List<Patient> p = patientServiceDao.getPatientById(id);
		System.out.println(p);
		return p;
	}
	
	@RequestMapping(value="/getPatientAppointments.htm", method=RequestMethod.GET, headers="Accept=*/*")
	public @ResponseBody List<Appointment> getPatientAppointments(@RequestParam(value = "id", required = false) String id) throws Exception {
		List<Appointment> appointmentList = appointmentServiceDao.getPatientAppointments(id);
		return appointmentList;
	}
	
	@RequestMapping(value="/getDoctorComplaints.htm", method=RequestMethod.GET, headers="Accept=*/*")
	public @ResponseBody List<DoctorComplaint> getDoctorComplaints(@RequestParam(value = "id", required = false) String id) throws Exception {
		//System.out.println(id);
		//System.out.println(getAllDoctorNpi());
		List<DoctorComplaint> allDoctorComplaints =  doctorComplaintDao.getDoctorComplaints(id);
		return allDoctorComplaints;
	}
	
	@RequestMapping(value="/getDoctorId.htm", method=RequestMethod.GET, headers="Accept=*/*")
	public @ResponseBody List<Doctor> getDoctorById(@RequestParam(value = "id", required = false) String id) throws Exception {
		//System.out.println(id);
		//System.out.println(getAllDoctorNpi());
		List<Doctor> allDoctorNpi =  doctorServiceDao.getDoctorById(id);
		System.out.println(allDoctorNpi);
		return allDoctorNpi;
	}
	
	@RequestMapping(value="/getDrugManufacturerId.htm", method=RequestMethod.GET)
	public @ResponseBody List<DrugManufacturer> getAllDrugManufacturers(@RequestParam(value = "id", required = false) String id) throws Exception {
		List<DrugManufacturer> allDrugManufacturers = drugServiceDao.getDrugManfacturerId(id);
		return allDrugManufacturers;
	}
	
	@RequestMapping(value="/getDrugComplaintId.htm", method=RequestMethod.GET)
	public @ResponseBody List<DrugsComplaint> getDrugComplaintId(@RequestParam(value = "id", required = false) String id) throws Exception {
		List<DrugsComplaint> allDrugManufacturers = drugsComplaintServiceDao.getDrugComplaintId(id);
		return allDrugManufacturers;
	}
	
	
	@RequestMapping(value="/getSales.htm", method=RequestMethod.GET, headers="Accept=*/*")
	public @ResponseBody List<DrugsSalesDistribution> getSales(@RequestParam(value = "id", required = false) String id) throws Exception {
		List<DrugsSalesDistribution> allDrugManufacturers = drugsSalesDistributionDao.getAllDrugManfacturer();
		return allDrugManufacturers;
	}
}
