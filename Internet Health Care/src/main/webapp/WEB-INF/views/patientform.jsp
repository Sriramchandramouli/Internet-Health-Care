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
	<script>
		$(function() {
	    	$( "#datepicker" ).datepicker({
	      	changeMonth: true,
	      	changeYear: true
	    });
	  });
	</script>
	<style>
	#errorBox{
		 color:#F00;
		 }
	</style>
</head>
<body>
	
		<div class="container">    
        <div id="formbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Patient Information</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >
                            
                        <form:form method="post" action="patientform.htm" id="loginform" commandName="patient" class="form-horizontal" role="form">
                                   <div id="errorBox">
		 								<c:if test="${not empty errors }">
                                   		<h5 style="color: #F00">You have errors in your input</h5>
                                   		<ul>
                                   			<c:forEach var="error" items="${errors}">
                                   				<li style="color: #F00"><c:out  value="${error.errorMessage}"></c:out></li>
                                   			</c:forEach>
                                   		</ul>
                                   </c:if> 
                                  </div>
                            <div class="form-group">
                                    <label for="firstname" class="col-md-3 control-label">First Name</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="firstname" path="firstname" placeholder="First Name"/>
                                    </div>
                                </div>
                                
                            <div class="form-group">
                                    <label for="lastname" class="col-md-3 control-label">Last Name</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="lastname" path="lastname" placeholder="Last Name"/>
                                    </div>
                                </div>
								
							<div class="form-group">
                                    <label for="nickname" class="col-md-3 control-label">Nick Name</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="nikname" path="nickname" placeholder="Nick Name"/>
                                    </div>
                            </div>
								
							<div class="form-group">
                                    <label for="birthdate" class="col-md-3 control-label">Birth Date</label>
                                    <div class="col-md-9">
                                        <form:input type="text" id="datepicker" class="form-control" name="birthdate" path ="birthdate" placeholder="Birth Date (MM/DD/YYYY)" onkeypress="return isNumber(event)"/>
                                    </div>
                                </div>
							
								
							<div class="form-group">
                                    <label for="streetaddress" class="col-md-3 control-label">Street Address</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="streetaddress" path="streetaddress" placeholder="Street Address"/>
                                    </div>
                            </div>
							
							<div class="form-group">
                                    <label for="city" class="col-md-3 control-label">City</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="city" path ="city" placeholder="City"/>
                                    </div>
                            </div>
							
							<div class="form-group">
                                    <label for="state" class="col-md-3 control-label">State</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="state" path ="state" placeholder="State"/>
                                    </div>
                            </div>
							
							<div class="form-group">
                                    <label for="zipcode" class="col-md-3 control-label">Zip Code</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="zipcode" path ="zipcode" placeholder="Zip Code" onkeypress="return isNumber(event)"/>
                                    </div>
                            </div>
							
							<div class="form-group">
                                    <label for="gender" class="col-md-3 control-label">Gender</label>
                                    <div class="col-md-9">
                                   		 <form:radiobutton path="gender" name="gender" value="Male"/>&nbsp;&nbsp;Male &nbsp;&nbsp;&nbsp;
                                         <form:radiobutton path="gender" name="gender" value="female"/>&nbsp;&nbsp;Female
                                    </div>
                            </div>
							
							<div class="form-group">
                                	<label for="maritalstatus" class="col-md-3 control-label">Marital Status</label>
                                    <div class="col-md-9">
                                        <form:select class="form-control" path ="maritalstatus" name ="maritalstatus"> 
    										<form:option value="Single"/>Single</option>
    										<form:option value="Married"/>Married</option>
    										<form:option value="Divorced"/>Divorced</option>
    										<form:option value="Separated"/>Separated</option>
    										<form:option value="Widowed"/>Widowed</option>
											<form:option value="Others"/>Others</option>
										</form:select>
                                    </div>
								</div>
							
							<div class="form-group">
                                    <label for="ssn" class="col-md-3 control-label">SSN</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" path ="ssn" name="ssn" placeholder="SSN" onkeypress="return isNumber(event)"/>
                                    </div>
                            </div>
							
							<div class="form-group">
                                    <label for="email" class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="email" path ="email" placeholder="Email"/>
                                    </div>
                            </div>
							
							<div class="form-group">
                                    <label for="homephone" class="col-md-3 control-label">Home Phone</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="homephone" path ="homephone" placeholder="Home Phone" onkeypress="return isNumber(event)"/>
                                    </div>
                            </div>
							
							<div class="form-group">
                                    <label for="workphone" class="col-md-3 control-label">Work Phone</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="workphone" path ="workphone" placeholder="Work Phone" onkeypress="return isNumber(event)"/>
                                    </div>
                            </div>
							
							<div class="form-group">
                                    <label for="cellphone" class="col-md-3 control-label">Cell Phone</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="cellphone" path ="cellphone" placeholder="Cell Phone" onkeypress="return isNumber(event)"/>
                                    </div>
                            </div>
							<div class="form-group">
                                	<label for="preferredcontact" class="col-md-3 control-label">Which number do you Prefer to Call</label>
                                    <div class="col-md-9">
                                        <form:select class="form-control" path ="preferredphone" name ="preferredcontact"> 
    										<form:option value="Home"/>Home</option>
    										<form:option value="Work"/>Work</option>
    										<form:option value="Cell"/>Cell</option>
										</form:select>
                                    </div>
								</div>
							
								<div class="form-group">
                                	<label for="race" class="col-md-3 control-label">Race</label>
                                    <div class="col-md-9">
                                        <form:select class="form-control" path ="race" name ="race"> 
    										<form:option value="Caucasian"/>Caucasian</option>
    										<form:option value="African American"/>African American</option>
    										<form:option value="American Indian"/>American Indian</option>
											<form:option value="Asian"/>Asian</option>
    										<form:option value="Hispanic-Latino"/>Hispanic-Latino</option>
										</form:select>
                                    </div>
								</div>	

								<div class="form-group">
                                	<label for="ethnicity" class="col-md-3 control-label">Ethnicity</label>
                                    <div class="col-md-9">
                                        <form:select class="form-control" path ="ethnicity" name ="ethnicity"> 
    										<form:option value="American"/>American</option>
    										<form:option value="Mexican"/>Mexican</option>
    										<form:option value="Japanese"/>Japanese</option>
											<form:option value="Chinese"/>Chinese</option>
											<form:option value="Asian"/>Asian</option>
    										<form:option value="European"/>European</option>
											<form:option value="Latino"/>Latino</option>
										</form:select>
                                    </div>
								</div>	
								
							<div class="form-group">
                                    <label for="preferredlanguage" class="col-md-3 control-label">Preferred Language</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="preferredlanguage" path ="preferredlanguage" placeholder="Preferred Language"/>
                                    </div>
                            </div>
							
							Due to privacy regulations, please indicate below anyone that you want to allow to inquire about your medical status.<br>
							
							*I authorize the following person(s) to communicate with your office regarding my care:
							
							<div class="form-group">
                                    <label for="relation" class="col-md-3 control-label">Name/Relationship</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="relation" path ="relation1" placeholder="Name/Relationship"/>
                                    </div>
                            </div>
							
							<div class="form-group">
                                    <label for="phonenumber" class="col-md-3 control-label">Phone Number</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="phonenumber" path ="phone1" placeholder="Phone Number" onkeypress="return isNumber(event)"/>
                                    </div>
                            </div>
							
							<div class="form-group">
                                    <label for="initial" class="col-md-3 control-label">Your Initial</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="initial" path ="initial1" placeholder="Your Initial"/>
                                    </div>
                            </div>
							
							
							<div class="form-group">
                                    <label for="relation1" class="col-md-3 control-label">Name/Relationship</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="relation1" path ="relation2" placeholder="Name/Relationship"/>
                                    </div>
                            </div>
							
							<div class="form-group">
                                    <label for="phonenumber1" class="col-md-3 control-label">Phone Number</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" path ="phone2" name="phonenumber1" placeholder="Phone Number" onkeypress="return isNumber(event)"/>
                                    </div>
                            </div>
							
							<div class="form-group">
                                    <label for="initial1" class="col-md-3 control-label">Your Initial</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" name="initial1" path ="initial2" placeholder="Your Initial"/>
                                    </div>
                            </div>

							
							<div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-3 col-md-9">
                                    <!--    <button id="btn-signup" type="button" class="btn btn-info"><i class="icon-hand-right"></i> Sign Up</button>  -->  
                                        <input type="submit" name ="submit" value = "Submit" id="btn-signup" class="btn btn-success">
                                    </div>
                                </div>
   
                            </form:form>     

                        </div>          
					
                    </div>  
        </div>
    </div>
</body>
</html>

<script language="javascript">
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
</script>