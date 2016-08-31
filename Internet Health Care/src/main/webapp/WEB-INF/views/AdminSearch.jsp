<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/adminSearch.css">
 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!--  <script src="${pageContext.servletContext.contextPath}/resources/js/adminSearch.js"></script>-->
<script src="https://raw.githubusercontent.com/mattboldt/typed.js/master/js/typed.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
<script src="http://twitter.github.io/typeahead.js/releases/latest/typeahead.bundle.js" ></script> 
<link href="${pageContext.servletContext.contextPath}/resources/css/adminNav.css" rel="stylesheet">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link rel="stylesheet" 
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" 
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" 
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script type="text/javascript" 
	src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script type="text/javascript" 
	src="//cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.9.3/typeahead.min.js"></script>
<style type="text/css">

.typeahead, .tt-query, .tt-hint {
	border: 2px solid #CCCCCC;
	border-radius: 8px;
	font-size: 24px;
	height: 30px;
	line-height: 30px;
	outline: medium none;
	padding: 8px 12px;
	width: 396px;
}
.typeahead {
	background-color: #FFFFFF;
}
.typeahead:focus {
	border: 2px solid #0097CF;
}
.tt-query {
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
}
.tt-hint {
	color: #999999;
}
.tt-dropdown-menu {
	background-color: #FFFFFF;
	border: 1px solid rgba(0, 0, 0, 0.2);
	border-radius: 8px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
	margin-top: 12px;
	padding: 8px 0;
	width: 422px;
	overflow: scroll;
}
.tt-suggestion {
	font-size: 24px;
	line-height: 24px;
	padding: 3px 20px;
}
.tt-suggestion.tt-is-under-cursor {
	background-color: #0097CF;
	color: #FFFFFF;
}
.tt-suggestion p {
	margin: 0;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$('#searchForm').submit(function(event){
					event.preventDefault();

					//var id = document.getElementById('keyword').value;
					sendData = {'id':keyword};
					if(category == "Patient") {
						$('#patientTable').slideDown("slow");
						$('#patientAppointmentTable').slideDown("slow");
						$('#doctorTable').slideUp("slow");
						$('#doctorComplaintTable').slideUp("slow");
						$('#drugManufacturerTable').slideUp("slow");
						$('#drugComplaintTable').slideUp("slow");
						$.ajax({
							type:'GET',
							dataType: "json",
							url: "getPatientId.htm",
							data: sendData,
							success:function(data){
								$.each(data, function(i,item) {
									patientTicketsBody = '';
									patientTicketsBody += '<tr><td>'
									+ item.ssn
									+'</td><td>'+item.firstname+'</td><td>'+item.lastname+'</td><td>'+item.gender+'</td><td>'+item.streetaddress+'</td>'
									+'<td>'+item.state+'</td><td>'+item.zipcode+'</td><td>'+item.birthdate+'</td><td>'+item.cellphone+'</td><td>'+item.maritalstatus+'</td>'
									+'</tr>';
									
								});
								$('#tableBody').empty();
								$('#tableBody').html(patientTicketsBody);
							},
							error:function(xhr){
							alert(xhr.status);
							}
						});
						$.ajax({
							type:'GET',
							dataType: "json",
							url: "getPatientAppointments.htm",
							data: sendData,
							success:function(data){
								$.each(data, function(i,item) {
									patientComplaintTicketsBody = '';
									patientComplaintTicketsBody += '<tr><td>'
									+ item.appoitmentid
									+'</td><td>'+item.claimnumber+'</td><td>'+item.doctorName+'</td><td>'+item.hospitalName+'</td><td>'+item.injurydate+'</td><td>'+item.insurancecompany+'</td>'
									+'<td>'+item.question10+", "+item.question11+", "+item.question12+'</td><td>'+item.question6+", "+item.question7+", "+item.question8+", "+item.question9+'</td>'
									+'<td>'+item.height+"/"+item.weight+'</td><td>'+item.reason+'</td>'
									+'<td><a href="fixappointment.htm?ssn='
											+ keyword
											+'&appointmentId='
											+ item.appoitmentid
											+'">Fix Appointment</a></td><td><a href="updaterecord.htm?ssn='
											+ keyword
											+'&appointmentId='
											+ item.appoitmentid
											+'">Update Medical Record</a></td></tr>';
									
								});
								$('#appointmentTableBody').empty();
								$('#appointmentTableBody').html(patientComplaintTicketsBody);
							},
							error:function(xhr){
							alert(xhr.status);
							}
						});
					} else if(category == "Doctor") {
						$('#patientTable').slideUp("slow");
						$('#doctorTable').slideDown("slow");
						$.ajax({
							type: 'GET',
							dataType: "json",
							headers: {
								'Content-Type': 'application/json'
							},
							url: 'getDoctorId.htm',
							data: sendData,
							success: function(data) {
								$.each(data, function(i,item) {
									doctorTicketsBody = '';
									doctorTicketsBody += '<tr><td>'
									+ item.npi
									+'</td><td>'+item.firstName+'</td><td>'+item.lastName+'</td><td>'+item.gender+'</td><td>'+item.hospitalName+'</td><td>'+item.hospitalState+'</td><td>'+item.clinicalInterest1
									+', '+item.clinicalInterest2+", "+item.clinicalInterest3+'</td><td>'+item.speciality1+", "+item.speciality2+", " + item.speciality3
									+'</td><td>'+item.state+'</td><td>'+item.zipCode+'</td><td>'+item.birthDate+'</td><td>'+item.cellPhone+'</td><td>'+item.medicalEducation+'</td>'
									+'</tr>';
									
								});
								$('#doctorTableBody').empty();
								$('#doctorTableBody').html(doctorTicketsBody);
							},
						    error: function(XMLHttpRequest, textStatus, errorThrown) { 
						        alert("Status: " + textStatus); alert("Error: " + errorThrown); 
						    }
						});
						
						$.ajax({
							type: 'GET',
							dataType: "json",
							headers: {
								'Content-Type': 'application/json'
							},
							url: 'getDoctorComplaints.htm',
							data: sendData,
							success: function(data) {
								$.each(data, function(i,item) {
									doctorComplaintTicketsBody = '';
									doctorComplaintTicketsBody += '<tr><td>'
									+ item.npi
									+'</td><td>'+item.firstName+'</td><td>'+item.lastName+'</td><td>'+item.address+'</td><td>'+item.city+'</td><td>'+item.state
									+'</td><td>'+item.complaintReason
									+'</td><td>'+item.dateAttended+'</td><td>'+item.otherProblem+'</td><td>'+item.question1+'</td><td>'+item.question2+'</td><td>'+item.question3+'</td>'
									+'<td>'+item.severityLevel+'</td><td><a href="entersev.htm?complaintID='
											+item.complaintId
											+'&type=doctors">Enter Severity Level</a></td></tr>';
									
								});
								$('#doctorComplaintTable').slideDown("slow");
								$('#doctorComplaintTableBody').empty();
								$('#doctorComplaintTableBody').html(doctorComplaintTicketsBody);
							},
						    error: function(XMLHttpRequest, textStatus, errorThrown) { 
						        alert("Status: " + textStatus); alert("Error: " + errorThrown); 
						    }
						});
					} else if(category == "DrugManufacturer") {
						$('#patientTable').slideUp("slow");
						$('#doctorTable').slideUp("slow");
						$('#drugManufacturerTable').slideDown("slow");
						$('#drugComplaintTable').slideDown("slow");
						$.ajax({
							type: 'GET',
							dataType: "json",
							headers: {
								'Content-Type': 'application/json'
							},
							url: 'getDrugManufacturerId.htm',
							data: sendData,
							success: function(data) {
								$.each(data, function(i,item) {
									dMTicketsBody = '';
									dMTicketsBody += '<tr><td>'
									+ item.licenseNumber
									+'</td><td>'+item.manufacturerName+'</td><td>'+item.streetAddress
									+'</td><td>'+item.city+'</td><td>'+item.state+'</td><td>'+item.zipCode+'</td><td>'+item.country+'</td><td>'+item.yearOfExp +'</td></tr>';
									
								});
								$('#drugManufacturerTableBody').empty();
								$('#drugManufacturerTableBody').html(dMTicketsBody);
							},
						    error: function(XMLHttpRequest, textStatus, errorThrown) { 
						        alert("Status: " + textStatus); alert("Error: " + errorThrown); 
						    }
						});
						
						$.ajax({
							type: 'GET',
							dataType: "json",
							headers: {
								'Content-Type': 'application/json'
							},
							url: 'getDrugComplaintId.htm',
							data: sendData,
							success: function(data) {
								$.each(data, function(i,item) {
									dCTicketsBody = '';
									dCTicketsBody += '<tr><td>'
									+ item.complaintId
									+'</td><td>'+item.drugName+'</td><td>'+item.drugType
									+'</td><td>'+item.enterComplaint+'</td><td>'+item.manufacturerName+'</td><td>'+item.severityLevel+'</td><td>'+item.comments+'</td><td>'
									+'<a href="entersev.htm?complaintID='
											+item.complaintId+'&type=drugs">Enter Severity Level</a></td></tr>';
									
								});
								$('#drugComplaintTableBody').empty();
								$('#drugComplaintTableBody').html(dCTicketsBody);
							},
						    error: function(XMLHttpRequest, textStatus, errorThrown) { 
						        alert("Status: " + textStatus); alert("Error: " + errorThrown); 
						    }
						});
					}
			}); 
	
	
	$(function() {
		$('#keyword').typeahead([{
			limit: 4,
			name: 'Patient',
			prefetch: 'getAllPatients.htm',
			header: '<h3 class="league-name">Patients</h3>'
		},
		{
			limit: 4,
			name: 'Doctor',
			prefetch: 'getAllDoctors.htm',
			header: '<h3 class="league-name">Doctors</h3>'
		},
		{
			limit: 4,
			name: 'DrugManufacturer',
			prefetch: 'getAllDrugManufacturers.htm',
			header: '<h3 class="league-name">Drug Manufacturers</h3>'
		}]).on('typeahead:selected typeahead:autocompleted',
				function(obj, datum, name){
					$('#keyword').typeahead('setQuery','');
					category = name;
					keyword = datum.value;
					document.location.href = 'adminSearchResults.htm?keyword='+datum.value+'&category='+category;
					//loadData();
		});
	});
	
	$('#keyword').keydown(function(event){
		if(event.keyCode == 13)
			event.preventDefault();
	});
	
	$(function() {
		var link = decodeURIComponent(window.location.href);
		if(link.indexOf("adminSearchResults.htm") > -1){
			var linkParts = link.split('?keyword=')[1];
			category = linkParts.split('&category=')[1];
			keyword = linkParts.split('&category=')[0];
			$('#searchForm').submit();
		}
	});
	
});
</script>
</head>
<body>

<div class="navbar navbar-custom navbar-fixed-top">
		<div class="container">
			<div class= "navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a href="adminhome.htm" class="navbar-brand">Admin Home</a>
			</div>
			
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
				<li><a href="adminsearch.htm">Admin Search</a></li>

					<li><a href="replypatientdetails.htm">Patient Details Requests</a></li>
					
					</ul>
				<ul class="nav navbar-nav navbar-right">
                <li><a href="logout.htm">Logout</a></li>
                <li>Welcome ${patient.firstname}</li>
            </ul>
			</div>
			
			
		
		</div>
	
	</div><br><br><br><br>
	<div class="collapse navbar-collapse" id="navbarCollapse" >
		<div class="pull-right">
			<form name="searchForm" id="searchForm" class="navbar-form" >
				<div id="formGroup" class="form-group"  >
					<div class="input-group">
						<input id="keyword" name="keyword" type="text" class="typeahead" placeholder="Search"/>
						<span  class="input-group-addon glyphicon glyphicon-search" ></span>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="middle">
		<div class="col-md-12" id="patientTable" style="display:none;">
			<table class="table table-striped">
		        <thead>
		            <tr>
		                <th>SSN</th>
		                <th>First Name</th>
		                <th>Last Name</th>
		                <th>Gender</th>
		                <th>Address</th>
		                <th>State</th>
		                <th>Zipcode</th>
		                <th>Birth Date</th>
		                <th>Cell Phone</th>
		                <th>Martial Status</th>
		            </tr>
		        </thead>
		        <tbody id="tableBody">
		        </tbody>
	        </table>
        </div>
        <div class="col-md-12" id="patientAppointmentTable" style="display:none;">
			<table class="table table-striped">
		        <thead>
		            <tr>
		                <th>Appointment Id</th>
		                <th>Claim Number</th>
		                <th>Doctor Name</th>
		                <th>Hospital Name </th>
		                <th>Date of Injury</th>
		                <th>Insurance Company</th>
		                <th>Related to Accident, auto or work</th>
		                <th>Disease History</th>
		                <th>Height/ Weight</th>
		                <th>Reason for visit</th>
		                <th>Fix Appointment</th>
		                <th>Update Record</th>
		            </tr>
		        </thead>
		        <tbody id="appointmentTableBody">
		        </tbody>
	        </table>
        </div>
        <div class="col-md-12" id="doctorTable" style="display:none;">
			<table class="table table-striped">
		        <thead>
		            <tr>
		                <th>NPI</th>
		                <th>First Name</th>
		                <th>Last Name</th>
		                <th>Gender</th>
		                <th>Hospital Name</th>
		                <th>Hospital State</th>
		                <th>Clinical Interest</th>
		                <th>Speciality</th>
		                <th>State</th>
		                <th>Zipcode</th>
		                <th>Birth Date</th>
		                <th>Cell Phone</th>
		                <th>Medical Education</th>
		            </tr>
		        </thead>
		        <tbody id="doctorTableBody">
		        </tbody>
	        </table>
        </div>
        <div class="col-md-12" id="doctorComplaintTable" style="display:none;">
			<table class="table table-striped">
		        <thead>
		            <tr>
		                <th>NPI</th>
		                <th>First Name</th>
		                <th>Last Name</th>
		                <th>Address</th>
		                <th>City</th>
		                <th>State</th>
		                <th>Complaint Reason</th>
		                <th>Date Attended</th>
		                <th>Other Problem</th>
		                <th>Did You contact practitioner</th>
		                <th>Ready to Testify</th>
		                <th>Under Physiciancare</th>
		                <th>Severity level</th>
		                <th>Enter Severity Level</th>
		            </tr>
		        </thead>
		        <tbody id="doctorComplaintTableBody">
		        </tbody>
	        </table>
        </div>
        <div class="col-md-12" id="drugManufacturerTable" style="display:none;">
			<table class="table table-striped">
		        <thead>
		            <tr>
		                <th>License Number</th>
		                <th>Manufacturer Name</th>
		                <th>Manufacturer Address</th>
		                <th>Manufacturer City</th>
		                <th>Manufacturer State</th>
		                <th>Manufacturer Zipcode</th>
		                <th>Manufacturer Country</th>
		                <th>Manufacturer Exp.(Yrs)</th>
		            </tr>
		        </thead>
		        <tbody id="drugManufacturerTableBody">
		        </tbody>
	        </table>
        </div>
        <div class="col-md-12" id="drugComplaintTable" style="display:none;">
			<table class="table table-striped">
		        <thead>
		            <tr>
		                <th>Complaint Number</th>
		                <th>Drug Name</th>
		                <th>Drug Type</th>
		                <th>Complaint</th>
		                <th>Manufacturer Name</th>
		                <th>Severity Level</th>
		                <th>Manufacturer Comment</th>
		                <th>View Profile</th>
		            </tr>
		        </thead>
		        <tbody id="drugComplaintTableBody">
		        </tbody>
	        </table>
        </div>
	</div>
</body>
</html>