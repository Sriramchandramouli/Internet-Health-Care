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
<title>Patient Form</title>
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
<div class="container">    
        <div id="formbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Patient Information</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >
                                    
                            <div class="form-group">
                                    <label for="firstname" class="col-md-4 control-label">Patient First Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.patientFirstname}" name="firstname" disabled>
                                    </div>
                                </div> <br><br>
                                
                            <div class="form-group">
                                    <label for="lastname" class="col-md-4 control-label">Patient Last Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.patientLastname}" name="lastname" disabled>
                                    </div>
                                </div> <br><br>
								
							<div class="form-group">
                                    <label for="nickname" class="col-md-4 control-label">Patient Birth Date</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.patientBirthdate}" name="birthdate" disabled>
                                    </div>
                            </div> <br><br>
								
							<div class="form-group">
                                    <label for="birthdate" class="col-md-4 control-label">Patient Street Address</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.patientStreetaddress}" name="streetaddress" disabled>
                                    </div>
                                </div> <br><br>
							
							<div class="form-group">
                                    <label for="city" class="col-md-4 control-label">Patient City</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.patientCity}" name="city" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="state" class="col-md-4 control-label">Patient State</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.patientState}" name="state" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="zipcode" class="col-md-4 control-label">Patient Zip Code</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.patientZipcode}" name="zipcode" disabled>
                                    </div>
                            </div> <br><br>
						
							<div class="form-group">
                                    <label for="ssn" class="col-md-4 control-label">Patient Gender</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.patientGender}" name="gender" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="email" class="col-md-4 control-label">Reason for Visit</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.reason}" name="reason" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="homephone" class="col-md-4 control-label">Are You In Good Health</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.question1}" name="question1" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="workphone" class="col-md-4 control-label">Any Changes in Health</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.question2}" name="question2" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="cellphone" class="col-md-4 control-label">Patient Weight</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.weight}" name="weight" disabled>
                                    </div>
                            </div> <br><br>
								
							<div class="form-group">
                                    <label for="preferredlanguage" class="col-md-4 control-label">Patient Height</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.height}" name="height" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="relation" class="col-md-4 control-label">Under any care of Physician</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.question3}" name="question3" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="phonenumber" class="col-md-4 control-label">Any Illness Or Hospitalized</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.question4}" name="question4" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="initial" class="col-md-4 control-label">Anything Told to Doctor</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.question5}" name="question5" disabled>
                                    </div>
                            </div> <br><br>
							
							
							<div class="form-group">
                                    <label for="relation1" class="col-md-4 control-label">Have Any Disease?</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.question6}" name="question6" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="phonenumber1" class="col-md-4 control-label">Have Any other Disease</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.question7}" name="question7" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="initial1" class="col-md-4 control-label">Family Has Disease?</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.question8}" name="question8" disabled>
                                    </div>
                            </div> <br><br>
                            
							<div class="form-group">
                                    <label for="relation1" class="col-md-4 control-label">Taking Any Drugs?</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.question9}" name="question9" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="phonenumber1" class="col-md-4 control-label">Is this Related To Accident?</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.question10}" name="question10" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="initial1" class="col-md-4 control-label">Is this Related To Automobie?</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.question11}" name="question11" disabled>
                                    </div>
                            </div> <br><br>
                            
                            <div class="form-group">
                                    <label for="phonenumber1" class="col-md-4 control-label">Is this Related To Work</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.question12}" name="question12" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="initial1" class="col-md-4 control-label">Any Other Issue?</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.question13}" name="question13" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="relation1" class="col-md-4 control-label">Patient Signature</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${patientProfile.signature}" name="signature" disabled>
                                    </div>
                            </div> <br><br>
                        </div>          
					
                    </div>  
        </div>
    </div>
</body>
</html>