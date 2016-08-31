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
import com.me.spring.dao.DrugsComplaintDao;
import com.me.spring.dao.DrugsDao;
import com.me.spring.dao.PatientDao;
import com.me.spring.pojo.Appointment;
import com.me.spring.pojo.DoctorComplaint;
import com.me.spring.pojo.DrugsComplaint;
import com.me.spring.pojo.DrugsSalesDistribution;
import com.me.spring.pojo.FixAppointment;
import com.me.spring.pojo.Patient;
import com.me.spring.pojo.PatientRecord;
import com.me.spring.pojo.RequestPatient;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(DoctorController.class);
	
	@Autowired
	private PatientDao patientDetail;
	@Autowired
	private AppointmentDao appointmentDetail;
	@Autowired
	private DrugsComplaintDao drugsComplaintdao1;
	@Autowired
	private DoctorComplaintDao doctorComplaintdao1;
	@Autowired
	private DrugsDao drugsDao1;
	
	
	@RequestMapping(value = "/adminhome.htm", method = RequestMethod.GET)
	public String redirectAdminHome() {
		
		return "adminHome";
	}
	
	@RequestMapping(value = "/adminsearch.htm", method = RequestMethod.GET)
	public String redirectAdminSearch() {
		
		return "AdminSearch";
	}
	
	
	@RequestMapping(value = "/fixappointment.htm", method = RequestMethod.GET)
	public String fixAppointment(Model model,HttpServletRequest request) throws Exception {
			FixAppointment fixAppointment = new FixAppointment();
			//String ssn = "fgghj";
			String ssn = request.getParameter("ssn");
			Patient patient = patientDetail.getPatientDetails(ssn);
			System.out.println("Val of pat fn" + patient.getFirstname());
			//int id = 1 ;
			int id = Integer.parseInt(request.getParameter("appointmentId"));
			Appointment appointment = appointmentDetail.getAppointmenttDetails(id);
			System.out.println("Hopsname is" + appointment.getHospitalName());
			System.out.println("Hopsname is" + appointment.getClaimnumber());
			//model.addAttribute("patient",patient);
			//model.addAttribute("appointment",appointment);
			model.addAttribute("fixAppointment",fixAppointment);
			request.getSession().setAttribute("patient",patient);
			request.getSession().setAttribute("appointment",appointment);
			return "fixAppointment";
	}
	
	@RequestMapping(value = "/fixappointment.htm", method = RequestMethod.POST)
	public String confirmAppointment(Model model,HttpServletRequest request,
			@ModelAttribute("fixAppointment") FixAppointment fixAppointment) throws Exception {
		
			String doctorName = fixAppointment.getDoctorName();
			int doctorId = fixAppointment.getDoctornpi();
			String appointmentDate = fixAppointment.getDateRequested();
			Patient patient = (Patient) request.getSession().getAttribute("patient");
			Appointment appointment = (Appointment) request.getSession().getAttribute("appointment");
			
			System.out.println("Pat nme is" + patient.getFirstname());
			System.out.println("Hopsname is" + appointment.getHospitalName());
			System.out.println("Hopsname is" + appointment.getClaimnumber());
			FixAppointment updateAppointment = appointmentDetail.updateAppointment(doctorName,doctorId,appointmentDate,appointment,patient);
			return "adminHome";
	}
	
	@RequestMapping(value = "/managedrugcomplaint.htm", method = RequestMethod.GET)
	public String manageComplaints(Model model,HttpServletRequest request) throws Exception {
		
			ArrayList<DrugsComplaint> drugsComplaintList = drugsComplaintdao1.getDrugsComplaintList();
			ArrayList<DoctorComplaint> doctorComplaintList = doctorComplaintdao1.getDoctorComplaintList();
			System.out.println("doctorcomp" + doctorComplaintList);
			model.addAttribute("drugsComplaintList", drugsComplaintList);
			model.addAttribute("doctorComplaintList", doctorComplaintList);
			return "manageComplaint";
	}
	
	@RequestMapping(value = "/viewcompdetail.htm", method = RequestMethod.GET)
	public String viewDrugsComplaint(HttpServletRequest request,Model model) throws Exception {
		
		int complaintID = Integer.parseInt(request.getParameter("complaintID"));
		DrugsComplaint drugsComplaint = drugsComplaintdao1.getdrugDetail(complaintID);
		model.addAttribute("drugsComplaint", drugsComplaint);
		return "viewDrugIssue";
		
	}
	
	@RequestMapping(value = "/viewcompdetail1.htm", method = RequestMethod.GET)
	public String viewDoctorComplaint(HttpServletRequest request,Model model) throws Exception {
		
		int complaintID = Integer.parseInt(request.getParameter("complaintID"));
		DoctorComplaint doctorComplaint = doctorComplaintdao1.getdoctorDetail(complaintID);
		model.addAttribute("doctorComplaint", doctorComplaint);
		return "viewDoctorIssue";
		
	}
	
	@RequestMapping(value = "/entersev.htm", method = RequestMethod.GET)
	public String updateSeverityLevel(HttpServletRequest request,Model model) throws Exception {
		
		int complaintID = Integer.parseInt(request.getParameter("complaintID"));
		String type = request.getParameter("type");
		request.getSession().setAttribute("type", type);
		request.getSession().setAttribute("complaintID", complaintID);
		model.addAttribute("complaintID", complaintID);
		return "enterSevLevel";
		
	}
	
	@RequestMapping(value = "/entersev.htm", method = RequestMethod.POST)
	public String enterSeverityLevel(HttpServletRequest request,Model model) throws Exception {
		
		String sevlevel = request.getParameter("sevlevel");
		System.out.println("sev lev" + sevlevel);
		int complaintID = Integer.parseInt(request.getParameter("complaintID"));
		String type = (String) request.getSession().getAttribute("type");
		
		if (type.equalsIgnoreCase("drugs")){
			drugsComplaintdao1.updateSeverity(complaintID, sevlevel);
		} else if(type.equalsIgnoreCase("doctors")){
			doctorComplaintdao1.updateSeverity(complaintID, sevlevel);
		} 
			
			
		return "adminHome";
		
	}

	@RequestMapping(value = "/updaterecord.htm", method = RequestMethod.GET)
	public String redirectPatientRecord(HttpServletRequest request,Model model) throws Exception {
		//String ssn = "fgghj";
		String ssn = request.getParameter("ssn");
		Patient pat = patientDetail.getPatientDetails(ssn);
		// id = 1 ;
		int id = Integer.parseInt(request.getParameter("appointmentId"));
		Appointment apt = appointmentDetail.getAppointmenttDetails(id);
		FixAppointment fixappt = appointmentDetail.getFixAppointmenttDetails(apt.getAppoitmentid());
		model.addAttribute("pat",pat);
		request.getSession().setAttribute("pat", pat);
		model.addAttribute("apt", apt);
		request.getSession().setAttribute("apt", apt);
		model.addAttribute("fixappt", fixappt);
		request.getSession().setAttribute("fixappt", fixappt);
		return "updatePatientRecord";
		
	}
	
	@RequestMapping(value = "/updaterecord.htm", method = RequestMethod.POST)
	public String updatePatientRecord(HttpServletRequest request,Model model) throws Exception {
		
		String bloodpressure = request.getParameter("bp");
		String temp = request.getParameter("temp");
		String pulse = request.getParameter("pulse");
		String bmi = request.getParameter("bmi");
		String comments = request.getParameter("comments");
		String medication = request.getParameter("medication");
		String medication2 = request.getParameter("medication2");
		String charges = request.getParameter("charges");
		
		Patient p = (Patient) request.getSession().getAttribute("pat");
		Appointment a = (Appointment) request.getSession().getAttribute("apt");
		FixAppointment fa = (FixAppointment) request.getSession().getAttribute("fixappt");
		
		PatientRecord patientRecord = patientDetail.updatePatientRecord(bloodpressure, temp, pulse, bmi, comments,medication,
				medication2,charges,p,a,fa);
		String hospitalName = a.getHospitalName();
		System.out.println("hos name is" + hospitalName);
		int licenseNumber = drugsDao1.getDrugsLicenseNumber(hospitalName, medication);
		//int licenseNumber1 = drugsDao1.getDrugsLicenseNumber(hospitalName, medication2);
		System.out.println("licno is" + licenseNumber);
		int drugsQuantity = drugsDao1.getDrugsQuantity(licenseNumber);
		//int drugsQuatity1 = drugsDao1.getDrugsQuantity(licenseNumber1);
		int quantity = drugsQuantity-10;
		//int quantity1 = drugsQuatity1-10;
		drugsDao1.updateDrugQuantity(licenseNumber,quantity);
		//drugsDao1.updateDrugQuantity(licenseNumber,quantity1);
		
		String manufactuerName = drugsDao1.getDrugsComplaint(licenseNumber);
		DrugsSalesDistribution ds = drugsDao1.getSales(manufactuerName, hospitalName);
		
		if (ds!=null) {
			int qnt = 10;
			drugsDao1.updateQuantity(manufactuerName, licenseNumber,hospitalName,qnt);
		}
		else {
			
			int qnt = 10;
			DrugsSalesDistribution drugsSales = drugsDao1.createSales(manufactuerName, licenseNumber,hospitalName,qnt);
		} 
		
		return "adminHome";
		
	}
	@RequestMapping(value = "/replypatientdetails.htm", method = RequestMethod.GET)
	public String viewPatientRequestsForm(HttpServletRequest request,Model model) throws Exception {
		
		ArrayList<RequestPatient>viewPatientRequests = patientDetail.requestForPatientLists("pending");
		model.addAttribute("viewPatientRequests", viewPatientRequests);
		return "doctorRequestPatient";
		
	}
	
	@RequestMapping(value = "/replyrequests.htm", method = RequestMethod.GET)
	public String replyPatientRequest(HttpServletRequest request,Model model) throws Exception {
		int requestID = Integer.parseInt(request.getParameter("requestId"));
		patientDetail.replyPatientRequests("sent",requestID);
		return "adminHome";
		
	}
}
