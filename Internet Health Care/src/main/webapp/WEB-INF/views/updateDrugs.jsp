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
<title>Update Drugs</title>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/drugManufacturerNav.css" rel="stylesheet">
	

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
				<a href="drugmanufacturerhome.htm" class="navbar-brand">Drug Manufacturer Home</a>
			</div>
			
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
				
					<li class="dropdown">
					<a href="#" class ="dropdown-toggle" data-toggle="dropdown">Manage Drugs</a>
					<ul class ="dropdown-menu">
					<li><a href="managedrug.htm">Create Drugs</a></li>
					<li><a href="updatedrug.htm">Update Drugs</a></li>
					</ul>
					</li>
					<li><a href="managedrug.htm">View Sales Distribution</a></li>
					<li><a href="searchdrugs.htm">Search for Drugs</a></li>
					<li><a href="viewdrugcomplaints.htm">View Complaints</a></li>
					
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
            				<th>Drug Name</th>
            				<th>Drug Type</th>
            				<th>Creation Date</th>
            				<th>Expiry Date</th>
            				<th>Hospital Name</th>
            				<th>Drug License Number</th>
            				<th>Update or Delete</th>
            				
        				</tr>
    				</thead>
    			<c:forEach var="drugList" items="${requestScope.drugList}">	
    				<tbody>
        				<tr>
            				<td>${drugList.drugName}</td>
            				<td>${drugList.drugType}</td>
            				<td>${drugList.creationDate}</td>
            				<td>${drugList.expiryDate}</td>
            				<td>${drugList.hospitalName}</td>
            				<td>${drugList.licenseNumber}</td>
            				<td width="125"><a href="updatedrugdetail.htm?drugId=${drugList.shipmentId}">Update</a> or
        					<a href="deletedrug.htm?drugId=${drugList.shipmentId}">Delete</a></td>
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