package com.me.spring;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.spring.dao.AppointmentDao;
import com.me.spring.dao.DoctorComplaintDao;
import com.me.spring.dao.DoctorDao;
import com.me.spring.dao.DrugsComplaintDao;
import com.me.spring.dao.PatientDao;
import com.me.spring.pojo.Doctor;
import com.me.spring.pojo.DoctorComplaint;
import com.me.spring.pojo.DrugsComplaint;
import com.me.spring.pojo.FixAppointment;
import com.me.spring.pojo.Patient;
import com.me.spring.pojo.PatientRecord;
import com.me.spring.pojo.RequestPatient;

@Controller
public class DoctorController {
	
	private static final Logger logger = LoggerFactory.getLogger(DoctorController.class);
	
	@Autowired
	private AppointmentDao appointmentDao1;
	
	@Autowired
	private DoctorComplaintDao doctorComplaintDao1;
	
	@Autowired
	private PatientDao patientRequest;
	
	@Autowired
	private DoctorDao doctorDao2;
	
	@Autowired
	private DrugsComplaintDao drugsComplainDao1;
	
	@RequestMapping(value = "/viewappointment.htm", method = RequestMethod.GET)
	public String homePage(Model model,HttpServletRequest request) throws Exception {
	
		int docNPI = (Integer) request.getSession().getAttribute("docNPI");
		System.out.println("Val of docNPI is " + docNPI);
		ArrayList<FixAppointment> pendingList = appointmentDao1.getAppointmentList(docNPI,"pending");
		ArrayList<FixAppointment> confirmedList = appointmentDao1.getAppointmentList(docNPI,"confirmed");
		model.addAttribute("appointmentList1", pendingList);
		model.addAttribute("appointmentList2", confirmedList);
		return "viewAppointment";
	}
	
	@RequestMapping(value = "/viewprofile.htm", method = RequestMethod.GET)
	public String viewPatientProfile(Model model,HttpServletRequest request) throws Exception {
		int appointmentID = Integer.parseInt(request.getParameter("appointmentID"));
		FixAppointment patientProfile = appointmentDao1.getPatientDetail(appointmentID);
		System.out.println(patientProfile.getPatientFirstname());
		request.getSession().setAttribute("patientProfile", patientProfile);
		model.addAttribute("patientProfile", patientProfile);
		return "viewPatientProfil";	
	}
	
	@RequestMapping(value = "/accept.htm", method = RequestMethod.GET)
	public String updateAppointment(Model model,HttpServletRequest request) throws Exception {
		int appointmentID = Integer.parseInt(request.getParameter("appointmentId"));
		appointmentDao1.updateAppointmentDetail(appointmentID);
		//FixAppointment patientProfile = appointmentDao1.getPatientDetail(appointmentID);
		
			int doctorNPI = (Integer) request.getSession().getAttribute("docNPI");
			System.out.println("Val of npi is " +doctorNPI);
			ArrayList<FixAppointment> pendingList = appointmentDao1.getAppointmentList(doctorNPI,"pending");
			ArrayList<FixAppointment> confirmedList = appointmentDao1.getAppointmentList(doctorNPI,"confirmed");
			model.addAttribute("appointmentList1", pendingList);
			model.addAttribute("appointmentList2", confirmedList);
			return "viewAppointment";
	}
	
	@RequestMapping(value = "/decline.htm", method = RequestMethod.GET)
	public String declineAppointment(Model model,HttpServletRequest request) throws Exception {
		int appointmentID = Integer.parseInt(request.getParameter("appointmentId"));
		appointmentDao1.declineAppointment(appointmentID);
		//FixAppointment patientProfile = appointmentDao1.getPatientDetail(appointmentID);
		
			int doctorNPI = (Integer) request.getSession().getAttribute("docNPI");
			System.out.println("Val of npi is " +doctorNPI);
			ArrayList<FixAppointment> pendingList = appointmentDao1.getAppointmentList(doctorNPI,"pending");
			ArrayList<FixAppointment> confirmedList = appointmentDao1.getAppointmentList(doctorNPI,"confirmed");
			model.addAttribute("appointmentList1", pendingList);
			model.addAttribute("appointmentList2", confirmedList);
			return "viewAppointment";
	}
	
	@RequestMapping(value = "/complaint.htm", method = RequestMethod.GET)
	public String viewDoctorComplaint(Model model,HttpServletRequest request) throws Exception {
		int doctorNPI = (Integer) request.getSession().getAttribute("docNPI");
		System.out.println("Doc npi is" + doctorNPI);
		ArrayList<DoctorComplaint> doctorComplaintList = doctorComplaintDao1.getDoctorComplaintList(doctorNPI);
		model.addAttribute("doctorComplaintList", doctorComplaintList);
		System.out.println("Doc com list is" + doctorComplaintList);
		return "viewDoctorComplaint";
		
	}
	
	@RequestMapping(value = "/viewsummary.htm", method = RequestMethod.GET)
	public String viewComplaintSummary(Model model,HttpServletRequest request) throws Exception {
		int doctorNPI = Integer.parseInt(request.getParameter("doctorNPI"));
		DoctorComplaint complaintSummary = doctorComplaintDao1.getComplaintSummary(doctorNPI);
		model.addAttribute("complaintSummary", complaintSummary);
		return "doctorComplaintSummary";	
	}
	
	@RequestMapping(value = "/requestpatient.htm", method = RequestMethod.GET) 
	public String requestPatientDetailsForm(Model model,HttpServletRequest request){
		RequestPatient requestPatient = new RequestPatient();
		model.addAttribute("requestPatient", requestPatient);
		return "requestPatientDetails";
		
	}
	
	@RequestMapping(value = "/requestpatient.htm", method = RequestMethod.POST) 
	public String requestPatientDetails(Model model,HttpServletRequest request,
			@ModelAttribute("requestPatient") RequestPatient rp) throws Exception{
		
		int docNPI = (Integer) request.getSession().getAttribute("docNPI");
		Doctor doctor = doctorDao2.getDoctor(docNPI);
		RequestPatient requestPatient = patientRequest.requestForPatient(rp,doctor);
		
		return "doctorHome";
		
	}
	
	@RequestMapping(value = "/viewpatientdetails.htm", method = RequestMethod.GET) 
	public String viewPatientDetails(Model model,HttpServletRequest request) throws Exception{
		
		int docNPI = (Integer) request.getSession().getAttribute("docNPI");
		ArrayList<RequestPatient> requestedPatientList = patientRequest.getRequestedPatientLists(docNPI);
		model.addAttribute("requestedPatientList", requestedPatientList);
		return "viewRequestedPatient";
		
	}
	
	@RequestMapping(value = "/requestedPatientList.htm", method = RequestMethod.GET) 
	public String viewPatientList(Model model,HttpServletRequest request) throws Exception{
		
		String ssn = request.getParameter("ssn");
		PatientRecord reqpatientRecord = patientRequest.getRequestedPatientRecord(ssn);
		model.addAttribute("reqpatientRecord", reqpatientRecord);
		return "viewRequestedPatientProfil";
		
	}
	
	@RequestMapping(value = "/drugscomplaint1.htm", method = RequestMethod.GET)
	public String drugsComplaint() {
	
		return "drugsComplaint1";
	}
	
	@RequestMapping(value = "/drugscomplaint1.htm", method = RequestMethod.POST)
	public String storeComplaint(HttpServletRequest request) throws Exception {
	
		String drugName = request.getParameter("drugname");
		System.out.println("he val of dn is" + drugName);
		String manufacturerName = request.getParameter("manufacturername");
		System.out.println("The val of mn is " + manufacturerName);
		String drugType = request.getParameter("drugtype");
		System.out.println("he val of dt is" + drugType);
		String complaint = request.getParameter("complaint");
		System.out.println("he val of com is" + complaint);
		DrugsComplaint drugsComplaint = drugsComplainDao1.addComplaint(drugName, manufacturerName,drugType,complaint);
		return "doctorHome";
	}
}
