package com.me.spring;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.Null;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.me.spring.dao.AppointmentDao;
import com.me.spring.dao.DoctorComplaintDao;
import com.me.spring.dao.DoctorDao;
import com.me.spring.dao.DrugsComplaintDao;
import com.me.spring.dao.DrugsDao;
import com.me.spring.dao.PatientDao;
import com.me.spring.dao.UserDao;
import com.me.spring.pojo.Appointment;
import com.me.spring.pojo.Doctor;
import com.me.spring.pojo.DoctorComplaint;
import com.me.spring.pojo.DrugsComplaint;
import com.me.spring.pojo.Patient;
import com.me.spring.pojo.PatientRecord;
import com.me.spring.pojo.RequestPatient;
import com.me.spring.pojo.User;
import com.me.spring.pojo.ValidationError;
import com.me.spring.validator.PatientValidator;
import com.me.spring.validator.UserValidator;
import com.me.spring.validator.UserValidator1;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/*
	 * Specify this useValidate will be injected
	 */
	
	@Autowired
	@Qualifier("userValidator")
	private Validator validator;
	
	/*@Autowired
	@Qualifier("userValidator1")
	private Validator validator1;*/
	
	UserValidator userValidator;
	
	UserValidator1 userValidator1;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private AppointmentDao appointmentDao;
	
	@Autowired
	private DrugsComplaintDao drugsComplaintDao;
	
	@Autowired
	private DoctorComplaintDao doctorComplaintDao;
	
	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private DrugsDao drugsDao1;
	
	/*
	 * This is to initialize webDataBinder,set its
	 * validator as we specify.
	 */
	@InitBinder("user")
	private void initBinder (WebDataBinder binder){
		binder.setValidator(validator);
	}
	
	/*@InitBinder("newUser")
	private void initBinder1 (WebDataBinder binder){
		binder.setValidator(validator1);
	}*/
	

	
	@Autowired
	public HomeController(UserValidator1 userValidator1) {
		// TODO Auto-generated constructor stub
		this.userValidator1 = userValidator1;
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Model model) {
	
		return "home";
	}
	
	@RequestMapping(value = "/hospitals.htm", method = RequestMethod.GET)
	public String returnHospitals() {
		
		return "hospitals";
	}
	
	@RequestMapping(value = "/policies.htm", method = RequestMethod.GET)
	public String returnPolicies() {
		
		return "policies";
	}
	
	@RequestMapping(value = "/aboutus.htm", method = RequestMethod.GET)
	public String returnAboutUs() {
		
		return "aboutus";
	}
	
	@RequestMapping(value = "/service.htm", method = RequestMethod.GET)
	public String returnService() {
		
		return "hospitalservice";
	}
	
	@RequestMapping(value = "/healthcare.htm", method = RequestMethod.GET)
	public String returnHospitalHome() {
		
		return "home";
	}
	
	@RequestMapping(value = "/login.htm", method = RequestMethod.GET)
	public String initUserLoginForm(Model model,HttpServletRequest request) {
		User user = new User();
		Cookie[] cookies = request.getCookies();		
		if( cookies != null && cookies.length == 2){
			try {
				User u = userDao.queryUserByNameAndPassword(
						cookies[0].getValue(), cookies[1].getValue());
				if (u != null) {
					model.addAttribute("user", u);
					HttpSession session = request.getSession(true);
					session.setAttribute("userName", u.getUsername());
					session.setAttribute("user", u);
					if (u.getRole().equalsIgnoreCase("patient")) {
						int userId = u.getUserid();
						String patientName = patientDao.getPatientFirstName(userId);
						Patient patient = patientDao.getPatient(userId);
						
						request.getSession().setAttribute("patientName", patientName);
						request.getSession().setAttribute("patient", patient);
						return "patienthome";		
					} else if (u.getRole().equalsIgnoreCase("doctor")) {
						int userID = u.getUserid();
						int docNPI = doctorDao.getDoctorNPI(userID);
						request.getSession().setAttribute("docNPI", docNPI);
						return "doctorHome";
					} else if(u.getRole().equalsIgnoreCase("drugmanufacturer")) {
						int userID = u.getUserid();
						int licenseNumber = drugsDao1.getLienseNumber(userID);
						request.getSession().setAttribute("licenseNumber", licenseNumber);
						return "drugManufacturerHome";
					} else if(u.getRole().equalsIgnoreCase("admin")) {
						return "adminHome";
					}
					//return "userHomePage";
				} else {
					model.addAttribute("user", user);
					return "home";
				}
			} catch (Exception e) {

			}
			
		}		
		User u = (User) request.getSession().getAttribute("user");
		if (u!=null) {
		if (u.getRole().equalsIgnoreCase("patient")) {
			return "patienthome";
		} else if (u.getRole().equalsIgnoreCase("doctor")) {
			return "doctorHome";
		}else if (u.getRole().equalsIgnoreCase("admin")) {
			return "adminHome";
		}else if (u.getRole().equalsIgnoreCase("drugmanufacturer")) {
			return "drugManufacturerHome";
		}
		}
		model.addAttribute("user", user);
		System.out.println("user1 is" + user);
		
		return "login";
	}
	
	@RequestMapping(value = "/login.htm", method = RequestMethod.POST)
	public String submitForm(Model model, @Validated User user, BindingResult result, HttpServletRequest request,
			HttpServletResponse response) {
		String remember = (request.getParameter("Remember") != null ? "Remember" : "No");
		model.addAttribute("user",user);
		System.out.println("user2 is" + user);
			if (result.hasErrors()){
			
				return "login";
			}else{
				try {
					System.out.println("here1");
					User u = userDao.queryUserByNameAndPassword(user.getUsername(), user.getPassword());
					System.out.println(u.getUsername());
					if (u != null){
						String uname = request.getParameter("remember");
						System.out.println("Val of user is" + u.getUsername());
					//model.addAttribute("user", u);
					request.getSession().setAttribute("user", u);
					if (remember != null && remember.equalsIgnoreCase("Remember")) {
						Cookie userName = new Cookie("userName", user.getUsername());
						userName.setMaxAge(600);
						response.addCookie(userName);
						Cookie userPassword = new Cookie("userPassword", user.getPassword());
						userPassword.setMaxAge(600);
						response.addCookie(userPassword);						
					}
					if (u.getRole().equalsIgnoreCase("patient")) {
						int userId = u.getUserid();
						String patientName = patientDao.getPatientFirstName(userId);
						Patient patient = patientDao.getPatient(userId);
						if (patient!=null) {
						System.out.println("Pat n log in" + patient.getSsn());
						request.getSession().setAttribute("patientName", patientName);
						request.getSession().setAttribute("patient", patient);
						return "patienthome";
						} else {
							Patient p = new Patient();
							model.addAttribute("patient",p);
							return "patientform";
						}
					} else if (u.getRole().equalsIgnoreCase("doctor")) {
						int userID = u.getUserid();
						int docNPI = doctorDao.getDoctorNPI(userID);
						System.out.println("Doc npi in login" + docNPI);
						request.getSession().setAttribute("docNPI", docNPI);
						return "doctorHome";
					} else if(u.getRole().equalsIgnoreCase("drugmanufacturer")) {
						int userID = u.getUserid();
						int licenseNumber = drugsDao1.getLienseNumber(userID);
						request.getSession().setAttribute("licenseNumber", licenseNumber);
						return "drugManufacturerHome";
					} else if(u.getRole().equalsIgnoreCase("admin")) {
						return "adminHome";
					}
					}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return "login";
	}
	
	@RequestMapping(value = "/signup.htm", method = RequestMethod.GET)
	public String navigateToSignUp(Model model) {
		User newUser = new User();
		
		model.addAttribute("newUser", newUser);
		return "signup";
	}
	
	@RequestMapping(value = "/signup.htm", method = RequestMethod.POST)
	public String signUpForm(HttpServletRequest request,@ModelAttribute("newUser") User u,
			@Validated User user, BindingResult result,Model model) throws Exception {
		
		userValidator1.validate(u, result);
		
		if (result.hasErrors()){
			return "signup";
		}
		
		
		//String email = request.getParameter("email");
		String email = u.getEmail();
		System.out.println("Val of email is" + email);
		String uname = u.getUsername();
		//String uname = request.getParameter("username1");
		System.out.println("Val of unme is" + uname);
		String passwd = u.getPassword();
		//String passwd = request.getParameter("passwd");
		System.out.println("Val of pwd is" + passwd);
		String role = u.getRole();
		//String role = request.getParameter("role");
		System.out.println("Val of role is" + role);
		//String gender = request.getParameter("gender");
		String gender = u.getGender();
		System.out.println("Val of gend is" + gender);
		int age = u.getAge();
		//int age = Integer.parseInt(request.getParameter("age"));
		System.out.println("Val of age is" + age);
		String question = u.getSecretquestion();
	//	String question = request.getParameter("question");
		System.out.println("The val of qn s" + question);
	//	String answer = request.getParameter("answer");
		String answer = u.getAnswer();
		System.out.println("Val of ans is" + answer);
		
		//User usr = (User) request.getSession().getAttribute("user");
	    User usr = userDao.queryUserByNameAndEmail(uname, email);
		System.out.println("The val of usr is" + usr);
		if(usr != null) {
			request.setAttribute("error1", "User Name or Password already exist");
			return "signup";
		}
		
	//	List<User> userList = userDao.getSearchResult(uname,email);
		//	List doctors = docList;
		//	for (Iterator iterator = (Iterator) docList.iterator(); iterator.hasNext();) {
		//		for (Iterator<User> it = userList.iterator();it.hasNext();) {
		//		User user = (User) it.next();
				
		//		if (user.getUsername().equalsIgnoreCase(uname) || (user.getEmail().equals(email)))
		//		System.out.print("First Name: " + user.getUsername()); 
		//		System.out.println("Interest is " + user.getEmail());
		//		return "login";
		//	}
		
		
		User patientUser = userDao.createNewUser(uname,passwd,gender,role,email,age,question,answer);
		
		if (patientUser!=null) {
		if (role.equalsIgnoreCase("Patient")) {
			request.getSession().setAttribute("patientUser", patientUser);
			Patient patient = new Patient();
			model.addAttribute("patient",patient);
			return "patientform";
		} else if(role.equalsIgnoreCase("Doctor")) {
			
			return "patienthome";
			
		}
		
		}
		return "login";
				
	}
	
	@RequestMapping(value = "/patientform.htm", method = RequestMethod.POST)
	public String patientForm(Model model,HttpServletRequest request,
			@ModelAttribute("patient") Patient p,BindingResult result) throws Exception {
		
		PatientValidator.validatePatientForm(p, result);
		
		if(result.hasErrors()) {
			
			List<ObjectError> errors = result.getAllErrors();
			/*p.setValidationErrors(errors.get(0).getDefaultMessage());*/
			setFieldErrorsToPatient(p, errors);
			
			model.addAttribute("patient", p);
			model.addAttribute("errors", p.getValidationErrors());
			return "patientform";
		}
		
		
		Patient pat = patientDao.queryPatientBySSN(p.getSsn());
		System.out.println("Patient is" + pat);
		if (!(pat!=null)) {
			System.out.println("pathere");
		User patientUser = (User) request.getSession().getAttribute("patientUser");
		Patient patient = patientDao.createNewPatient(p,patientUser);
		
		if (patient!=null) {
		//	request.getSession().setAttribute("patient", patient);
			model.addAttribute("patient",patient);
			request.getSession().setAttribute("patient", patient);
			return "patienthome";
		}
		} else {
			System.out.println("pathere1");
			return "patientform";
		}
		return "patienthome";
		
	}
	
	private void setFieldErrorsToPatient(Patient p, List<ObjectError> errors) {
		
		for(ObjectError error : errors) {
			
			String errorMessage = error.getDefaultMessage();
			ValidationError validationError = new ValidationError(errorMessage);
			p.addValidationError(validationError);
		}
	}
	
	@RequestMapping(value = "/appointment.htm", method = RequestMethod.GET)
	public String scheduleAppointment() {
	
		return "appointment";
	}
	
	
	@RequestMapping(value = "/appointment1.htm", method = RequestMethod.GET)
	public String scheduleAppointment(HttpServletRequest request) throws Exception {
		int npi = Integer.parseInt(request.getParameter("doctorName"));
		Doctor doctor = doctorDao.getDoctor(npi);
		String docFirstName = doctor.getFirstName();
		System.out.println("val of doc is" + docFirstName);
		request.getSession().setAttribute("docFirstName", docFirstName);
		request.setAttribute("docFirstName", docFirstName);
		//model.addAttribute("docFirstName", docFirstName);
		return "appointment1";
	}
	
	
	@RequestMapping(value = "/appointment.html", method = RequestMethod.POST)
	public String appointmentForm(HttpServletRequest request) throws Exception {
	
		String reason = request.getParameter("reason");
		//String reason = app.getReason();
		System.out.println("Val of req is" + reason);
		String question1 = request.getParameter("health");
		//String question1 = app.getQuestion1();
		System.out.println("Val of q1 is" + question1);
		//String question2 = app.getQuestion2();
		String question2 = request.getParameter("healthchange");
		System.out.println("Val of q2 is" + question2);
		float weight = Float.parseFloat(request.getParameter("weight"));
		//float weight = app.getWeight();
		System.out.println("Val of weight is" + weight);
		float height = Float.parseFloat(request.getParameter("height"));
		//float height = app.getHeight();
		System.out.println("Val of height is" + height);
		String question3 = request.getParameter("care");
		//String question3 = app.getQuestion3();
		System.out.println("Val of q3 is" + question3);
		String question4 = request.getParameter("treatmenthistory");
		//String question4 = app.getQuestion4();
		System.out.println("Val of q4 is" + question4);
		String question5 = request.getParameter("concern");
		//String question5 = app.getQuestion5();
		System.out.println("Val of q5 is" + question5);
		//String q6;
		StringBuilder sb1 = new StringBuilder();
		String[] question6 = request.getParameterValues("disease");
		for (int d1=0;d1<question6.length;d1++) {
			//q6 += d1+"-";
			sb1.append(question6[d1]);
			if(!(d1+1==question6.length)) {
			sb1.append("-");
			}
		}
		System.out.println("Val of sb1 is" + sb1);
		StringBuilder sb2 = new StringBuilder();
		String[] question7 = request.getParameterValues("disease1");
		for (int d2=0;d2<question7.length;d2++) {
			sb2.append(question7[d2]);
			if(!(d2+1==question7.length)) {
			sb2.append("-");
		}
		}
		System.out.println("Val of sb2 is" + sb2);
		StringBuilder sb3 = new StringBuilder();
		String[] question8 = request.getParameterValues("disease2");
		for (int d3=0;d3<question8.length;d3++) {
			sb3.append(question8[d3]);
			if(!(d3+1==question8.length)) {
			sb3.append("-");
		}
		}
		System.out.println("Val of sb3 is" + sb3);
		StringBuilder sb4 = new StringBuilder();
		String[] question9 = request.getParameterValues("disease3");
		for (int d4=0;d4<question9.length;d4++) {
			sb4.append(question9[d4]);
			if(!(d4+1==question9.length)) {
			sb4.append("-");
		}
		}
		System.out.println("Val of sb4 is" + sb4);
		String question10 = request.getParameter("accident");
		//String question10 = app.getQuestion10();
		System.out.println("Val of q10 is" + question10);
		String question11 = request.getParameter("automobile");
		//String question11 = app.getQuestion11();
		System.out.println("Val of q11 is" + question11);
		String question12 = request.getParameter("workrelated");
		//String question12 = app.getQuestion12();
		System.out.println("Val of q12 is" + question12);
		String question13 = request.getParameter("other");
		//String question13 = app.getQuestion13();
		System.out.println("Val of q13 is" + question13);
		String injuryDate = request.getParameter("injury");
		//String injuryDate = app.getInjurydate();
		System.out.println("Inj date" + injuryDate);
		System.out.println("Val of inj is" + injuryDate);
		String insuranceCompany = request.getParameter("insurancecompany");
		//String insuranceCompany = app.getInsurancecompany();
		System.out.println("Val of com is" + insuranceCompany);
		int claimNumber = Integer.parseInt(request.getParameter("claimnumber"));
		//int claimNumber = app.getClaimnumber();
		System.out.println("Val of claim is" + claimNumber);
		String signature = request.getParameter("signature");
		//String signature = app.getSignature();
		System.out.println("Val of sig is" + signature);
		String hospitalName = request.getParameter("hospitalname");
		//String hospitalName = app.getHospitalName();
		String appointmentDate = request.getParameter("appointmentdate");
		
		String doctorName = request.getParameter("doctorname");
		Patient patientssn = (Patient) request.getSession().getAttribute("patient");
		System.out.println("Val of ssn in app is " + patientssn.getSsn());
		
	
			Appointment appointment = appointmentDao.scheduleNewAppointent(reason,question1,question2,weight,height,question3,question4,question5,sb1.toString(),sb2.toString(),sb3.toString(),sb4.toString(),question10,question11,question12,question13,injuryDate,insuranceCompany,claimNumber,signature,hospitalName,appointmentDate,patientssn);
			if (appointment!=null) {
				return "patienthome";
			}
		return "patienthome";
	}
	
	
	@RequestMapping(value = "/appointment1.html", method = RequestMethod.POST)
	public String appointmentForm1(HttpServletRequest request) throws Exception {
	
		String reason = request.getParameter("reason");
		String question1 = request.getParameter("health");
		String question2 = request.getParameter("healthchange");
		float weight = Float.parseFloat(request.getParameter("weight"));
		float height = Float.parseFloat(request.getParameter("height"));
		String question3 = request.getParameter("care");
		String question4 = request.getParameter("treatmenthistory");
		String question5 = request.getParameter("concern");
		StringBuilder sb1 = new StringBuilder();
		String[] question6 = request.getParameterValues("disease");
		for (int d1=0;d1<question6.length;d1++) {
			//q6 += d1+"-";
			sb1.append(question6[d1]);
			if(!(d1+1==question6.length)) {
			sb1.append("-");
			}
		}
		StringBuilder sb2 = new StringBuilder();
		String[] question7 = request.getParameterValues("disease1");
		for (int d2=0;d2<question7.length;d2++) {
			sb2.append(question7[d2]);
			if(!(d2+1==question7.length)) {
			sb2.append("-");
		}
		}
		
		StringBuilder sb3 = new StringBuilder();
		String[] question8 = request.getParameterValues("disease2");
		for (int d3=0;d3<question8.length;d3++) {
			sb3.append(question8[d3]);
			if(!(d3+1==question8.length)) {
			sb3.append("-");
		}
		}
		
		StringBuilder sb4 = new StringBuilder();
		String[] question9 = request.getParameterValues("disease3");
		for (int d4=0;d4<question9.length;d4++) {
			sb4.append(question9[d4]);
			if(!(d4+1==question9.length)) {
			sb4.append("-");
		}
		}
		
		String question10 = request.getParameter("accident");
		String question11 = request.getParameter("automobile");
		String question12 = request.getParameter("workrelated");
		String question13 = request.getParameter("other");
		String injuryDate = request.getParameter("injury");
		String insuranceCompany = request.getParameter("insurancecompany");
		int claimNumber = Integer.parseInt(request.getParameter("claimnumber"));
		String signature = request.getParameter("signature");
		String hospitalName = request.getParameter("hospitalname");
		
		String appointmentDate = request.getParameter("appointmentdate");
		
		String doctorName = request.getParameter("doctorname");
		Patient patientssn = (Patient) request.getSession().getAttribute("patient");
		System.out.println("Val of pat is" + patientssn);
			Appointment appointment = appointmentDao.scheduleNewAppointent1(reason,question1,question2,weight,height,question3,question4,question5,sb1.toString(),sb2.toString(),sb3.toString(),sb4.toString(),question10,question11,question12,question13,injuryDate,insuranceCompany,claimNumber,signature,hospitalName,appointmentDate,doctorName,patientssn);
			if (appointment!=null) {
				return "patienthome";
			}
		return "patienthome";
	}
	
	
	
	
	
	@RequestMapping(value = "/searchdoctor.htm", method = RequestMethod.GET)
	public String searchDoctor() {
	
		return "searchDoctor";
	}
	
	@RequestMapping(value = "/searchdoctor.htm", method = RequestMethod.POST)
	public String searchDoctorByKeyword(HttpServletRequest request) {
	
		String lastname = request.getParameter("lastname");
		String firstname = request.getParameter("firstname");
		String gender = request.getParameter("gender");
		String speciality = request.getParameter("speciality");
		//String keyword = request.getParameter("keyword");
		
		List<Doctor> docList = doctorDao.getSearchResult(lastname,firstname,gender,speciality);
		//	List doctors = docList;
		//	for (Iterator iterator = (Iterator) docList.iterator(); iterator.hasNext();) {
				for (Iterator<Doctor> it = docList.iterator();it.hasNext();) {
				Doctor doctor = (Doctor) it.next();
				
				System.out.print("First Name: " + doctor.getFirstName()); 
				System.out.println("Interest is " + doctor.getClinicalInterest1());
			}
				
			request.setAttribute("doctorList", docList);
	//	for (int i=0;i<docList.size();i++) {
	//	System.out.println("The val of list is " + docList.get(i));
	//	}
		return "searchDoctorResults";
	}
	
	@RequestMapping(value = "/patienthome.htm", method = RequestMethod.GET)
	public String returnPatientHome() {
		return "patienthome";
	}
	
	@RequestMapping(value = "/searchdoctor1.htm", method = RequestMethod.GET)
	public String searchParticularDoctor(HttpServletRequest request) throws Exception {
		
		int npi = Integer.parseInt(request.getParameter("npi"));
		System.out.println("The val of npi is" + npi);
		Doctor doctor = doctorDao.getDoctor(npi);
		request.setAttribute("doctor", doctor);
		return "viewDoctor";
	}
	
	@RequestMapping(value = "/drugscomplaint.htm", method = RequestMethod.GET)
	public String drugsComplaint() {
	
		return "drugsComplaint";
	}
	
	@RequestMapping(value = "/drugscomplaint.htm", method = RequestMethod.POST)
	public String storeComplaint(HttpServletRequest request) throws Exception {
	
		String drugName = request.getParameter("drugname");
		System.out.println("he val of dn is" + drugName);
		String manufacturerName = request.getParameter("manufacturername");
		System.out.println("The val of mn is " + manufacturerName);
		String drugType = request.getParameter("drugtype");
		System.out.println("he val of dt is" + drugType);
		String complaint = request.getParameter("complaint");
		System.out.println("he val of com is" + complaint);
		String ssn = (String) request.getSession().getAttribute("ssn");
		DrugsComplaint drugsComplaint = drugsComplaintDao.addComplaint(drugName, manufacturerName,drugType,complaint);
		return "patienthome";
	}
	
	@RequestMapping(value = "/doctorcomplaint.htm", method = RequestMethod.GET)
	public String doctorComplaint() {
	
		return "doctorComplaint";
	}
	
	@RequestMapping(value = "/doctorcomplaint.htm", method = RequestMethod.POST)
	public String storeDoctorComplaint(HttpServletRequest request) throws Exception {
	
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		String docNPI = request.getParameter("docnpi");
		String address = request.getParameter("doctoraddress");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String dateAttended = request.getParameter("dateattended");
		
		StringBuilder c1 = new StringBuilder();
		String[] complaint = request.getParameterValues("complaint");
		for (int d1=0;d1<complaint.length;d1++) {
			//q6 += d1+"-";
			c1.append(complaint[d1]);
			if(!(d1+1==complaint.length)) {
			c1.append("-");
			}
		}
		
		String otherProblem = request.getParameter("otherproblem");
		String question1 = request.getParameter("contactpractioner");
		String question2 = request.getParameter("formalhearing");
		String question3 = request.getParameter("care");
		String comments = request.getParameter("comments");
		
		DoctorComplaint doctorComplaint = doctorComplaintDao.addDoctorComplaint(firstName,lastName,docNPI,address,city,state,dateAttended,c1.toString(),otherProblem,question1,question2,question3,comments);
		return "patienthome";
	}
	
	@RequestMapping(value = "/editprofile.htm", method = RequestMethod.GET)
	public String editProfile(HttpServletRequest request,Model model) {
		
		Patient patient = (Patient) request.getSession().getAttribute("patient");
		model.addAttribute("pat", patient);
		request.getSession().setAttribute("pat", patient);
		return "editPatient";
	}
	
	@RequestMapping(value = "/editprofile.htm", method = RequestMethod.POST)
	public String saveEditProfile(HttpServletRequest request,Model model) throws Exception {
		
				String firstname = request.getParameter("firstname");
				String lastname = request.getParameter("lastname");
				String nickname = request.getParameter("nikname");
				String birthdate = request.getParameter("birthdate");
				String streetaddress = request.getParameter("streetaddress");
				String city = request.getParameter("city");
				String state = request.getParameter("state");
				String zipcode = request.getParameter("zipcode");
				String gender = request.getParameter("gender");
				String maritalstatus = request.getParameter("maritalstatus");
				String ssn = request.getParameter("ssn");
				String email = request.getParameter("email");
				int homephone = Integer.parseInt(request.getParameter("homephone"));
				int workphone = Integer.parseInt(request.getParameter("workphone"));
				int cellphone = Integer.parseInt(request.getParameter("cellphone"));
				String preferredcontact = request.getParameter("preferredcontact");
				String race = request.getParameter("race");
				String ethnicity = request.getParameter("ethnicity");
				String preferredlanguage = request.getParameter("preferredlanguage");
				String relation = request.getParameter("relation");
				int phonenumber = Integer.parseInt(request.getParameter("phonenumber"));
				String initial = request.getParameter("initial");
				String relation1 = request.getParameter("relation1");
				int phonenumber1 = Integer.parseInt(request.getParameter("phonenumber1"));
				String initial1 = request.getParameter("initial1");
				
				patientDao.updatePatient(firstname,lastname,nickname,birthdate,streetaddress,city,state,zipcode,
				gender,maritalstatus,ssn,email,homephone,workphone,cellphone,preferredcontact,race,ethnicity,
				preferredlanguage,relation,phonenumber,initial,relation1,phonenumber1,initial1);
		
		
		
				Patient patient = (Patient) request.getSession().getAttribute("patient");
				model.addAttribute("pat", patient);
				request.getSession().setAttribute("pat", patient);
				return "editPatient";
	}
	
	@RequestMapping(value = "/medicalhistory.htm", method = RequestMethod.GET)
	public String getMedicalRecordForm(HttpServletRequest request,Model model) throws Exception {
		
		Patient patient = (Patient) request.getSession().getAttribute("patient");
		ArrayList<PatientRecord> patientMedicalList = patientDao.getPatientMedicalList(patient.getSsn());
		model.addAttribute("patientMedicalList", patientMedicalList);
		return "medicalHistoryList";
		
	}
	
	@RequestMapping(value = "/completehistory.htm", method = RequestMethod.GET)
	public String getCompleteMedicalRecord(HttpServletRequest request,Model model) throws Exception {
		
		String ssn = request.getParameter("ssn");
		PatientRecord reqpatientRecord = patientDao.getRequestedPatientRecord(ssn);
		model.addAttribute("reqpatientRecord", reqpatientRecord);
		return "viewMedicalRecord";
		
	}
	
	@RequestMapping(value = "/changepassword.htm", method = RequestMethod.GET)
	public String changePasswordForm(HttpServletRequest request) {
		//Patient patient = (Patient) request.getSession().getAttribute("patient");
		return "changePassword";
	}
	
	@RequestMapping(value = "/changepassword.htm", method = RequestMethod.POST)
	public String changePassword(HttpServletRequest request) throws Exception {
		String oldPassword = request.getParameter("oldpass");
		String newPassword = request.getParameter("newpass");
		String confirmPassword = request.getParameter("confpass");
		if (oldPassword.equals(null) || newPassword.equals(null) || confirmPassword.equals(null)|| 
				oldPassword.equals(newPassword) || (!(confirmPassword.equals(newPassword)))) {
			request.setAttribute("error1", "Invalid Password");
			return "changePassword";
	//		return "error";
		} else {
		Patient patient = (Patient) request.getSession().getAttribute("patient");
		userDao.changePassword(oldPassword, newPassword, patient.getUser().getUserid());
		return "patienthome";
		}
	}
	
	@RequestMapping(value = "/forgotpassword.htm", method = RequestMethod.GET)
	public String forgotPasswordForm(HttpServletRequest request) {
		//Patient patient = (Patient) request.getSession().getAttribute("patient");
		return "forgotPassword";
	}
	
	@RequestMapping(value = "/forgotpassword.htm", method = RequestMethod.POST)
	public String forgotPassword(HttpServletRequest request) throws Exception {
		//Patient patient = (Patient) request.getSession().getAttribute("patient");
		String answer = request.getParameter("answer");
		String newPassword = request.getParameter("newpass");
		String confirmPassword = request.getParameter("confpass");
		String username = request.getParameter("username");
		String getAnswer = userDao.getAnswer(username);
		if(answer.equals(getAnswer) || (confirmPassword.equals(newPassword))) {
			userDao.changePassword1(newPassword, answer, username);
			request.setAttribute("error1", "Invalid Password");
			return "home";
		}
		return "login"; 
	}
	
	@RequestMapping(value="/logout.htm", method=RequestMethod.GET)
	public String logout(HttpServletRequest request,
            HttpServletResponse response,Model model) throws Exception {
		request.getSession().invalidate();
		User user = new User();
		model.addAttribute("user", user);
		return "redirect:/";
		//return "login";
	} 
	
}
