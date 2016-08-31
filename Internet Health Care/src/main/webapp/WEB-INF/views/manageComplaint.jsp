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
<title>Manage Complaint</title>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link href="${pageContext.servletContext.contextPath}/resources/css/adminNav.css" rel="stylesheet">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>

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
	
	</div> <br><br><br><br><br>
		<div class="container">
		<div class="col-md-8">
			<form:form method = "POST" action="message.htm">
				<h3>Drugs Complaint</h3>
				<table class="table table-striped table-bordered table-condensed">
    				<thead>
        				<tr>
            				<th>Drug Name</th>
            				<th>Drug Type</th>
            				<th>Complaint</th>
            				<th>Manufacturer Name</th>
            				<th>View Complete Detail</th>
            				<th>Severity Level</th>
        				</tr>
    				</thead>
    			<c:forEach var="drugsComplaintList" items="${requestScope.drugsComplaintList}">	
    				<tbody>
        				<tr>
            				<td>${drugsComplaintList.drugName}</td>
            				<td>${drugsComplaintList.drugType}</td>
            				<td>${drugsComplaintList.manufacturerName}</td>
            				<td>${drugsComplaintList.enterComplaint}</td>
            				<td width="125"><a href="viewcompdetail.htm?complaintID=${drugsComplaintList.complaintId}">View Detail</a></td>
            				<td width="125"><a href="entersev.htm?complaintID=${drugsComplaintList.complaintId}&type=drugs">Enter Sev Level</a></td>
        				</tr>
    				</tbody>
    			</c:forEach>
				</table>
				
				<hr>
				<h3>Doctor Complaint</h3>
				<table class="table table-striped table-bordered table-condensed">
    				<thead>
        				<tr>
            				<th>Doctor FirstName</th>
            				<th>Doctor LastName</th>
            				<th>Complaint Reason</th>
            				<th>Date Attended</th>
            				<th>View Complete Detail</th>
            				<th>Severity Level</th>
        				</tr>
    				</thead>
    			<c:forEach var="doctorComplaintList" items="${requestScope.doctorComplaintList}">	
    				<tbody>
        				<tr>
            				<td>${doctorComplaintList.firstName}</td>
            				<td>${doctorComplaintList.lastName}</td>
            				<td>${doctorComplaintList.complaintReason}</td>
            				<td>${doctorComplaintList.dateAttended}</td>
            				<td width="125"><a href="viewcompdetail1.htm?complaintID=${doctorComplaintList.complaintId}">View Detail</a></td>
            				<td width="125"><a href="entersev.htm?complaintID=${doctorComplaintList.complaintId}&type=doctors">Enter Sev Level</a></td>
        				</tr>
    				</tbody>
    			</c:forEach>
				</table>
        	</form:form>
        </div>
        
		</div>
	
	
</body>
</html>