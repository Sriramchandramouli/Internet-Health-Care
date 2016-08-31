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
<title>View Doctor Issue</title>
<link type ="text/css" rel = "stylesheet" href ="css/bootstrap.css">
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<link rel="stylesheet" href="/resources/demos/style.css">
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
	
	</div><br><br><br>
<div class="container">    
        <div id="formbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Patient Information</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >
                                    
                            <div class="form-group">
                                    <label for="firstname" class="col-md-4 control-label">Doctor First Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${doctorComplaint.firstName}" name="firstname" disabled>
                                    </div>
                                </div> <br><br>
                                
                            <div class="form-group">
                                    <label for="lastname" class="col-md-4 control-label">Doctor Last Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${doctorComplaint.lastName}" name="lastname" disabled>
                                    </div>
                                </div> <br><br>
								
							<div class="form-group">
                                    <label for="birthdate" class="col-md-4 control-label">Doctor Street Address</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${doctorComplaint.address}" name="streetaddress" disabled>
                                    </div>
                                </div> <br><br>
							
							<div class="form-group">
                                    <label for="city" class="col-md-4 control-label">Doctor City</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${doctorComplaint.city}" name="city" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="state" class="col-md-4 control-label">Doctor State</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${doctorComplaint.state}" name="state" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="zipcode" class="col-md-4 control-label">Date Attended</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${doctorComplaint.dateAttended}" name="zipcode" disabled>
                                    </div>
                            </div> <br><br>
						
							<div class="form-group">
                                    <label for="ssn" class="col-md-4 control-label">Reason For Complaint</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${doctorComplaint.complaintReason}" name="gender" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="question1" class="col-md-4 control-label">Did You Contact Practitioner</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${doctorComplaint.question1}" name="question1" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="question2" class="col-md-4 control-label">Ready To Testify</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${doctorComplaint.question2}" name="question2" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="severityLevel" class="col-md-4 control-label">Severity Level</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${doctorComplaint.severityLevel}" name="severityLevel" disabled>
                                    </div>
                            </div> <br><br>
                            
                            
                            <div class="form-group">
                                    <label for="severityLevel" class="col-md-4 control-label">Comments</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${doctorComplaint.comments}" name="severityLevel" disabled>
                                    </div>
                            </div> <br><br>
                        </div>          
					
                    </div>  
        </div>
    </div>
</body>
</html>