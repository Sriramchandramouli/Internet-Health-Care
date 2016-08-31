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
<title>View Appointment</title>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/doctorNav.css" rel="stylesheet">
	
	<style>
	hr {
  		-moz-border-bottom-colors: none;
  		-moz-border-image: none;
  		-moz-border-left-colors: none;
  		-moz-border-right-colors: none;
  		-moz-border-top-colors: none;
  		 border-color: #EEEEEE -moz-use-text-color #FFFFFF;
  		 border-style: solid none;
  		 border-width: 1px 0;
 		 margin: 18px 0;
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
				<a href="#" class="navbar-brand">Doctor Home</a>
			</div>
			
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="viewappointment.htm">View all Appointments</a></li>
					<li><a href="drugscomplaint1.htm">Report an Issue about Drugs</a></li>
					<li class="dropdown">
					<a href="#" class ="dropdown-toggle" data-toggle="dropdown">Patient Details</a>
					<ul class ="dropdown-menu">
					<li><a href="requestpatient.htm">Request Patient Details</a></li>
					<li><a href="viewpatientdetails.htm">View Patient Details</a></li>
					</ul>
					</li>
					<li><a href="complaint.htm">View Complaints</a></li>
					</ul>
				<ul class="nav navbar-nav navbar-right">
	
                <li><a href="logout.htm">Logout</a></li>
            </ul>
			</div>
		
		</div>
	
	</div> <br><br><br><br><br><br><br><br>
		<div class="container">
		<div class="col-md-8">
			<form:form method = "POST" action="message.htm">
				<h3>Current Pending Requests</h3>
				<table class="table table-striped table-bordered table-condensed">
    				<thead>
        				<tr>
            				<th>Patient FirstName</th>
            				<th>Patient LastName</th>
            				<th>Doctor Name</th>
            				<th>Hospital Name</th>
            				<th>Date of Visit</th>
            				<th>View Patient Profile</th>
            				<th>Accept or Decline</th>
        				</tr>
    				</thead>
    			<c:forEach var="appointmentdet" items="${requestScope.appointmentList1}">	
    				<tbody>
        				<tr>
            				<td>${appointmentdet.patientFirstname}</td>
            				<td>${appointmentdet.patientLastname}</td>
            				<td>${appointmentdet.doctorName}</td>
            				<td>${appointmentdet.hospitalName}</td>
            				<td>${appointmentdet.dateRequested}</td>
            				<td width="125"><a href="viewprofile.htm?appointmentID=${appointmentdet.appoitmentid}">ViewProfile</a></td>
        					<td width="125"><a href="accept.htm?appointmentId=${appointmentdet.appoitmentid}">Accept</a> or
        					<a href="decline.htm?appointmentId=${appointmentdet.appoitmentid}">Decline</a></td>
        				</tr>
    				</tbody>
    			</c:forEach>
				</table>
				
				<hr>
				<h3>Completed Requests</h3>
				<table class="table table-striped table-bordered table-condensed">
    				<thead>
        				<tr>
            				<th>Patient FirstName</th>
            				<th>Patient LastName</th>
            				<th>Doctor Name</th>
            				<th>Hospital Name</th>
            				<th>Date of Visit</th>
            				<th>View Patient Profile</th>
        				</tr>
    				</thead>
    			<c:forEach var="appointmentdet2" items="${requestScope.appointmentList2}">	
    				<tbody>
        				<tr>
            				<td>${appointmentdet2.patientFirstname}</td>
            				<td>${appointmentdet2.patientLastname}</td>
            				<td>${appointmentdet2.doctorName}</td>
            				<td>${appointmentdet2.hospitalName}</td>
            				<td>${appointmentdet2.dateRequested}</td>
            				<td width="125"><a href="viewprofile.htm?appointmentID=${appointmentdet2.appoitmentid}">ViewProfile</a></td>
        				</tr>
    				</tbody>
    			</c:forEach>
				</table>
        	</form:form>
        </div>
        
		</div>
	
	
</body>
</html>