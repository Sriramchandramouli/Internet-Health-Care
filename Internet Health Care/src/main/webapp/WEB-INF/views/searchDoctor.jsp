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
<title>Search for Doctor</title>

	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/searchdoctor.css" rel="stylesheet">
	<link href="${pageContext.servletContext.contextPath}/resources/css/patientnav.css" rel="stylesheet">
	<link href="${pageContext.servletContext.contextPath}/resources/css/srchdoctors.css" rel="stylesheet">

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
	
	</div>
	<div class="col-sm-6 col-md-4 col-lg-12 jumbotron">
	<br><br><br>
<div id="container">
  <div id="container_body">
    <div>
      <h2 class="form_title">Search For Doctor</h2>

<!--Form  start-->
    <div id="form_name">
		<form name="form" method="post" action="searchdoctor.htm" onsubmit="return Submit()">
		<div id="errorBox">
		</div>
		<div class="form-group">
                                    <label for="lastname" class="col-md-4 control-label">Doctor's Last Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="fnameval" name="lastname" placeholder="Last Name"/>
                                    </div>
                                </div> <br><br><br>
		<div class="form-group">
                                    <label for="firstname" class="col-md-4 control-label">Doctor's First Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="lnameval" name="firstname" placeholder="First Name"/>
                                    </div>
                                </div> <br><br><br>
								
								<div class="form-group">
                                	<label for="gender" class="col-md-4 control-label">Gender</label>
                                    <div class="col-md-8">
                                        <select class="form-control" id="gender" name ="gender"> 
                                        	 <option selected="" value="">Gender</option>
    										<option value="Male">Male</option>
    										<option value="Female">Female</option>
    										
										</select>
                                    </div>
								</div> <br><br>
								
		<div class="form-group">
                                    <label for="speciality" class="col-md-4 control-label">Speciality</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="specialityval" name="speciality" placeholder="speciality"/>
                                    </div>
                                </div> <br><br>
							
						<div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-4 col-md-8">
                                    
                                        <input type="submit" name ="submit" value = "Search" id="btn-signup" class="btn btn-success">
                                    </div>
                                </div>

			</form>
		</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>
