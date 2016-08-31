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
		<center>
		<div class="col-md-8">
			<form:form method = "POST" action="message.htm">
				<table class="table table-striped table-bordered table-condensed">
    				<thead>
        				<tr>
            				<th>Patient Name</th>
            				<th>Patient SSN</th>
            				<th>Request Reason</th>
            				<th>Doctor Name</th>
            				<th>Hospital Name</th>
            				<th>Status</th>
            				<th>Patient Profile</th>
            			
        				</tr>
    				</thead>
    			<c:forEach var="requestedPatientList" items="${requestScope.requestedPatientList}">	
    				<tbody>
        				<tr>
            				<td>${requestedPatientList.patientName}</td>
            				<td>${requestedPatientList.ssn}</td>
            				<td>${requestedPatientList.reason}</td>
            				<td>${requestedPatientList.doctorName}</td>
            				<td>${requestedPatientList.hospitalName}</td>
            				<td>${requestedPatientList.status}</td>
            				<c:choose>
            				<c:when test= "${requestedPatientList.status == 'pending'}">
            				<td width="125"><a href="requestedPatientList.htm?ssn=${requestedPatientList.ssn}" onclick="return false;">View Patient Profile</a></td>
            				</c:when>
            				 <c:otherwise>
            				 <td width="125"><a href="requestedPatientList.htm?ssn=${requestedPatientList.ssn}">View Patient Profile</a></td>
            				 </c:otherwise>
            				</c:choose>
        				</tr>
    				</tbody>
    			</c:forEach>
				</table>
        	</form:form>
        </div>
        </center>
        </div>
		
</body>
</html>