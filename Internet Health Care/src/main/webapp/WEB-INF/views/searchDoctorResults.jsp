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
<title>Doctor Result</title>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="basic.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	
	<script>
	$('a').click(function (event){
	    var linkID = $(this).attr("id"); 
	    var imgSrcVal = $('img', this).attr("src");
	    //alert(imgSrcVal);
	    return false;
	})
	</script>
	<style>
	.navbar-custom {
    background-color:#999999;
    color: #ffffff;
    border-radius:0;
}

.navbar-custom .navbar-nav > li > a {
    color: #000000;
}
.navbar-custom .navbar-nav > .active > a, .navbar-nav > .active > a:hover, .navbar-nav > .active > a:focus {
    color: #ffffff;
    background-color:transparent;
}
.navbar-custom .navbar-brand {
    color:#eeeeee;
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
			<div class="col-md-8">
				<table class="table table-striped table-bordered table-condensed">
    				<thead>
        				<tr>
            				<th>Name</th>
           					 <th>Interest</th>
            				<th>Location</th>
            		
        				</tr>
    				</thead>
            
            
           			 <c:forEach var="doctordet" items="${requestScope.doctorList}">
                
       				<tbody>
        				<tr>
            				<td width="60">
            		<div class="row">
            		<div class="col-sm-4">
            		
            		<div class="img">
            		<a target="_blank" href="searchdoctor1.htm?npi=${doctordet.npi}" id="turn-of-cloth-01_lg">
            		<img src="${pageContext.servletContext.contextPath}/resources/images/${doctordet.imageLocation}" class="img-rounded" alt="Cinque Terre" width="80" height="80"/>
            		</a>
            		</div>
            		
            		</div>
            		<div class="col-sm-8">
            		${doctordet.firstName} ${doctordet.lastName}<br>${doctordet.speciality1} &emsp; ${doctordet.speciality2}
            		
            		</div>
            		</div>
            		</td>
            		<td width="30">${doctordet.speciality1} <br> ${doctordet.speciality2}</td>
            		<td width="60">${doctordet.streetAddress} &emsp; ${doctordet.city} &emsp; ${doctordet.state}</td>
            		
            		
        		</tr>
        
    		</tbody>
                
            </c:forEach>
                    
        	</table>
       
        </div>
        </div>
       
</body>
</html>