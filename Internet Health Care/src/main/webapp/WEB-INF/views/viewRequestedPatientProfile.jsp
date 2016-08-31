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
<title>Patient Record</title>
<link type ="text/css" rel = "stylesheet" href ="css/bootstrap.css">
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>

</head>
<body>
<div class="container">    
        <div id="formbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Patient Record</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >
                            <div class="form-group">
                                    <label for="firstname" class="col-md-4 control-label">Patient First Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.firstName}" name="firstname" disabled>
                                    </div>
                                </div> <br><br>
                                
                            <div class="form-group">
                                    <label for="lastname" class="col-md-4 control-label">Patient Last Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.lastName}" name="lastname" disabled>
                                    </div>
                                </div> <br><br>
								
							<div class="form-group">
                                    <label for="streetaddress" class="col-md-4 control-label">Patient Street Address</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.streetAddress}" name="streetaddress" disabled>
                                    </div>
                                </div> <br><br>
							
							<div class="form-group">
                                    <label for="city" class="col-md-4 control-label">Patient City</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.city}" name="city" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="state" class="col-md-4 control-label">Patient State</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.state}" name="state" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="gender" class="col-md-4 control-label">Patient Gender</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.gender}" name="gender" disabled>
                                    </div>
                            </div> <br><br>
                            
                            <div class="form-group">
                                    <label for="ssn" class="col-md-4 control-label">Patient SSN</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.ssn}" name="ssn" disabled>
                                    </div>
                            </div> <br><br>
                            
                            <div class="form-group">
                                    <label for="dateattended" class="col-md-4 control-label">Date Attended</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.dataVisited}" name="dateattended" disabled>
                                    </div>
                            </div> <br><br>
						
							<div class="form-group">
                                    <label for="reason" class="col-md-4 control-label">Reason For Visit</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.reason}" name="reason" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="hospitalname" class="col-md-4 control-label">Hospital Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.hospitalName}" name="hospitalname" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="doctorname" class="col-md-4 control-label">Doctor Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.doctorName}" name="doctorname" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="bp" class="col-md-4 control-label">Patient BloodPressure</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.bloodPressure}" name="bp" disabled>
                                    </div>
                            </div> <br><br>
                            
                            
                            <div class="form-group">
                                    <label for="temp" class="col-md-4 control-label">Patient Temperature</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.temperature}" name="temp" disabled>
                                    </div>
                            </div> <br><br>
                            
                            <div class="form-group">
                                    <label for="pulse" class="col-md-4 control-label">Patient Pulse</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.pulse}" name="pulse" disabled>
                                    </div>
                            </div> <br><br>
                            
                            <div class="form-group">
                                    <label for="weight" class="col-md-4 control-label">Patient Weight</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.weight}" name="weight" disabled>
                                    </div>
                            </div> <br><br>
                        
                        <div class="form-group">
                                    <label for="height" class="col-md-4 control-label">Patient Height</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.height}" name="height" disabled>
                                    </div>
                            </div> <br><br>   
                            
                            <div class="form-group">
                                    <label for="bmi" class="col-md-4 control-label">Patient BMI</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.bmi}" name="bmi" disabled>
                                    </div>
                            </div> <br><br>    
                            
                            <div class="form-group">
                                    <label for="insurance" class="col-md-4 control-label">Patient Insurance Agent</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.insuranceCompany}" name="insurance" disabled>
                                    </div>
                            </div> <br><br>
                            
                            <div class="form-group">
                                    <label for="comments" class="col-md-4 control-label">Comments</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.comments}" name="comments" disabled>
                                    </div>
                            </div> <br><br>
                            <div class="form-group">
                                    <label for="medication" class="col-md-4 control-label">Medication1</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.medication1}" name="medication" disabled>
                                    </div>
                            </div> <br><br>
                            
                            <div class="form-group">
                                    <label for="medication2" class="col-md-4 control-label">Medication2</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${reqpatientRecord.medication2}" name="medication2" disabled>
                                    </div>
                            </div> <br><br>
                            
                             
					
                    </div>  
                    </div>  
        </div>
    </div>
</body>
</html>