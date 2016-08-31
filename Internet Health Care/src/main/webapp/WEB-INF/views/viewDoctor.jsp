<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Doctor</title>
<link type ="text/css" rel = "stylesheet" href ="css/bootstrap.css">
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	
	<style>
	h3 {
    font-size: 30px; color: blue;font-style: bold;
		}
	h2 {
    font-size: 20px; color: blue;
		}
	</style>
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
				<a href="patienthome.htm" class="navbar-brand">Patient Home</a>
			</div>
			
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="appointment.htm">Schedule an Appointment</a></li>
					<li>
					<a href="medicalhistory.htm">Check Medical History</a>
					</li>
					<li><a href="searchdoctor.htm">Search for Doctor</a></li>
					<li class="dropdown">
					<a href="#" class ="dropdown-toggle" data-toggle="dropdown">Report an Issue</a>
					<ul class ="dropdown-menu">
					<li><a href="drugscomplaint.htm">Complaints about Drugs</a></li>
					<li><a href="doctorcomplaint.htm">Complaints about Doctor</a></li>
					</ul>
					</li>
					<li><a href="changepassword.htm">Change Password</a></li>
					</ul>
				<ul class="nav navbar-nav navbar-right">
				<li><a href="editprofile.htm">Edit Profile</a></li>
                <li><a href="logout.htm">Logout</a></li>
                <li>Welcome ${patient.firstname}</li>
            </ul>
			</div>
			
			
		
		</div>
	
	</div> <br><br><br><br><br><br><br><br>
	<div class="container">   
		<div class="row ">
			<form method="get" action="appointment1.htm" id="loginform" class="form-horizontal">
			<div class="col-sm-3">
    			
  			</div>
  	<div class="col-sm-3">
    <img src="${pageContext.servletContext.contextPath}/resources/images/img1.jpg" class="img-rounded" alt="Cinque Terre" width="175" height="300"/> <br><br><br>
    <input type="submit" name ="submit" value = "Request an Appointment" id="btn-info" class="btn btn-info">
    <input type = "hidden" name ="doctorName" value="${doctor.npi}">
  </div>
  
  <div class="col-sm-3">
    	<h3>${doctor.firstName} ${doctor.lastName}</h3>
    	<h2>Medical Education: </h2>
    	${doctor.medicalEducation}
    	<h2>Clinical Interest: </h2>
    	${doctor.clinicalInterest1} <br>
    	${doctor.clinicalInterest2} <br>
    	${doctor.clinicalInterest3}
    	<h2>Gender: </h2>
    	${doctor.gender}
    	<h2>NPI: </h2> ${doctor.npi}
  </div>
  </form>
  </div>
  </div>
</body>
</html>