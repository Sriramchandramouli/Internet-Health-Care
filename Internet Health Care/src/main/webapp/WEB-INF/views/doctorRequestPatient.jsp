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
<title>Request Patient</title>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/adminNav.css" rel="stylesheet">
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
	
	</div><br><br><br><br><br>
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
            				<th>Send Report</th>
            			
        				</tr>
    				</thead>
    			<c:forEach var="patientrequest" items="${requestScope.viewPatientRequests}">	
    				<tbody>
        				<tr>
            				<td>${patientrequest.patientName}</td>
            				<td>${patientrequest.ssn}</td>
            				<td>${patientrequest.reason}</td>
            				<td>${patientrequest.doctorName}</td>
            				<td>${patientrequest.hospitalName}</td>
            				<td width="125"><a href="replyrequests.htm?requestId=${patientrequest.requestId}">Reply</a></td>
            
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