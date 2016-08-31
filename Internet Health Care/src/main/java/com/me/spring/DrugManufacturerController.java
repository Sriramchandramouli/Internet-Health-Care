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

import com.me.spring.dao.DrugsComplaintDao;
import com.me.spring.dao.DrugsDao;
import com.me.spring.pojo.DrugDetails;
import com.me.spring.pojo.DrugsComplaint;
import com.me.spring.pojo.DrugsSalesDistribution;


@Controller
public class DrugManufacturerController {
	
	private static final Logger logger = LoggerFactory.getLogger(DoctorController.class);
	
	@Autowired
	private DrugsDao drugsDao;
	
	@Autowired
	DrugsComplaintDao drugsComplaintDao1;
	
	
	@RequestMapping(value = "/drugmanufacturerhome.htm", method = RequestMethod.GET)
	public String redirectDrugManufacturerHome() {
		
		return "drugManufacturerHome";
		
	}
	
	@RequestMapping(value = "/managedrug.htm", method = RequestMethod.GET)
	public String manageDrugs(Model model) {
		
		DrugDetails drugDetails = new DrugDetails();
		model.addAttribute("drugDetail", drugDetails);
		return "manageDrugs";
		
	}
	
	@RequestMapping(value = "/managedrug.htm", method = RequestMethod.POST)
	public String manageNewDrugs(Model model,@ModelAttribute("drugDetail")DrugDetails drugDetails,
			HttpServletRequest request) throws Exception {
		
		String drugName = drugDetails.getDrugName();
		String drugId = drugDetails.getDrugId();
		int drugQuantity = drugDetails.getQuantity();
		String drugType = drugDetails.getDrugType();
		String creationDate = drugDetails.getCreationDate();
		String expiryDate = drugDetails.getExpiryDate();
		String hospitalId = drugDetails.getHospitalId();
		String hospitalName = drugDetails.getHospitalName();
		
		int licenseNumber = (Integer) request.getSession().getAttribute("licenseNumber");
		
		System.out.println("License number is" + licenseNumber);
		
		drugsDao.manageNewDrugs(drugName,drugId,drugQuantity,drugType,creationDate,expiryDate,hospitalId,hospitalName,licenseNumber);
		return "drugManufacturerHome";
		
	}
	
	@RequestMapping(value = "/searchdrugs.htm", method = RequestMethod.GET)
	public String searchDrugs() {
		return "searchDrugs";
		
	}
	
	@RequestMapping(value = "/searchdrugs.htm", method = RequestMethod.POST)
	public String searchDrugsResults(HttpServletRequest request,Model model) throws Exception {
		
		String drugName = request.getParameter("drugname");
		int licenseNumber = (Integer) request.getSession().getAttribute("licenseNumber");
		ArrayList<DrugDetails> drugList = drugsDao.getDrugLists(licenseNumber,drugName);
		model.addAttribute("drugList", drugList);
		return "searchDrugs";
		
	}
	
	@RequestMapping(value = "/viewdrugcomplaints.htm", method = RequestMethod.GET)
	public String viewPatientComplaints(HttpServletRequest request,Model model) throws Exception {
		
		int licenseNumber = (Integer) request.getSession().getAttribute("licenseNumber");
		String manufacturerName = drugsDao.getDrugsComplaint(licenseNumber);
		
		ArrayList<DrugsComplaint>complaintList = drugsComplaintDao1.getDrugsComplaint(manufacturerName);
		
		model.addAttribute("complaintList", complaintList);
		return "viewDrugsComplaints";
		
	}
	
	@RequestMapping(value = "/updatedrug.htm", method = RequestMethod.GET)
	public String updateDrugsRequestForm(HttpServletRequest request,Model model) throws Exception {
		
		int licenseNumber = (Integer) request.getSession().getAttribute("licenseNumber");
		
		ArrayList<DrugDetails>drugList = drugsDao.getDrugsList(licenseNumber);
		
		model.addAttribute("drugList", drugList);
		return "updateDrugs";
		
	}
	
	@RequestMapping(value = "/updatedrugdetail.htm", method = RequestMethod.GET)
	public String updateDrugDetailForm(HttpServletRequest request,Model model) throws Exception {
		
		int drugId = Integer.parseInt(request.getParameter("drugId"));

		model.addAttribute("drugId", drugId);
		return "updateDrugQuantity";
		
	}
	
	@RequestMapping(value = "/updatedrugdetail.htm", method = RequestMethod.POST)
	public String updateDrugDetail(HttpServletRequest request) throws Exception {
		
		int drugId = Integer.parseInt(request.getParameter("drugID"));
		int drugQuantity = Integer.parseInt(request.getParameter("drugquantity"));
		drugsDao.updateDrugDetail(drugId,drugQuantity);
		
		return "drugManufacturerHome";
		
	}
	
	@RequestMapping(value = "/deletedrug.htm", method = RequestMethod.GET)
	public String deleteDrug(HttpServletRequest request) throws Exception {
		
		int drugId = Integer.parseInt(request.getParameter("drugId"));
		drugsDao.deleteDrugDetail(drugId);
		return "drugManufacturerHome";
		
	}
	
	@RequestMapping(value = "/salesdistribution.htm", method = RequestMethod.GET)
	public String salesDistribution(HttpServletRequest request,Model model) throws Exception {
		
		int licenseNumber = (Integer) request.getSession().getAttribute("licenseNumber");
		System.out.println("Lic num is" + licenseNumber);
		ArrayList <DrugsSalesDistribution> drugsaleList = drugsDao.getDrugSales(licenseNumber);
		System.out.println("salelist" + drugsaleList);
		model.addAttribute("drugsaleList", drugsaleList);
		return "drugSales";
		
	}
 
}
