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
<title>Update Patient Record</title>
<link type ="text/css" rel = "stylesheet" href ="css/bootstrap.css">
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/adminNav.css" rel="stylesheet">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<link rel="stylesheet" href="/resources/demos/style.css">
	<style>
#errorBox{
 color:#F00;
 }
</style>
	<script type="text/javascript">
	function Submit(){
		
		var numRegex = /^[0-9\.]*$/;
		var commonRegex = /^[a-zA-Z0-9]/;
		var spaceRegex = /\s+/;
		var alphabRegex = /^[a-zA-Z\s]*$/;
		var pbp = $("#pbp").val();
		var ptemp = $("#ptemp").val();
		var ppulse = $("#ppulse").val();
		var pbmi = $("#pbmi").val();
		var comment = $("#comment").val();
		var pmed = $("#pmed").val();
		var pmed2 = $("#pmed2").val();
		var pcharges = $("#pcharges").val();
		
		if(($("#pbp").val() == "" )||(!commonRegex.test(pbp))){
			   $("#pbp").focus();
			   $("#errorBox").html("Enter valid Blood Pressure");
			   return false;
		} else if(($("#ptemp").val() == "" ) ||(!numRegex.test(ptemp))){
			   $("#ptemp").focus();
			   $("#errorBox").html("Enter valid Temperature");
			   return false;
		} else if(($("#ppulse").val() == "" ) ||(!numRegex.test(ppulse))){
			   $("#ppulse").focus();
			   $("#errorBox").html("Enter valid Pulse");
			   return false;
		}else if(($("#pbmi").val() == "" ) ||(!commonRegex.test(pbmi))){
			   $("#pbmi").focus();
			   $("#errorBox").html("Enter valid BMI");
			   return false;
		}else if(($("#comment").val() == "" ) ||(!alphabRegex.test(comment))){
			   $("#comment").focus();
			   $("#errorBox").html("Enter valid Comment");
			   return false;
		}else if(($("#pmed").val() == "" ) ||(!commonRegex.test(pmed))){
			   $("#pmed").focus();
			   $("#errorBox").html("Enter valid Medication");
			   return false;
		}else if(($("#pmed2").val() == "" ) ||(!commonRegex.test(pmed2))){
			   $("#pmed2").focus();
			   $("#errorBox").html("Enter valid Medication");
			   return false;
		}else if(($("#pcharges").val() == "" ) ||(!commonRegex.test(pcharges))){
			   $("#pcharges").focus();
			   $("#errorBox").html("Enter valid Charge");
			   return false;
		}
	}
	
	</script>
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
        <div id="formbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Patient Record</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >
                    
                    	 <form method="post" action="updaterecord.htm" id="loginform" class="form-horizontal" role="form" onsubmit="return Submit()">
                           <div id="errorBox">
							</div>         
                            <div class="form-group">
                                    <label for="firstname" class="col-md-4 control-label">Patient First Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${pat.firstname}" name="firstname" disabled>
                                    </div>
                                </div> <br><br>
                                
                            <div class="form-group">
                                    <label for="lastname" class="col-md-4 control-label">Patient Last Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${pat.lastname}" name="lastname" disabled>
                                    </div>
                                </div> <br><br>
								
							<div class="form-group">
                                    <label for="streetaddress" class="col-md-4 control-label">Patient Street Address</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${pat.streetaddress}" name="streetaddress" disabled>
                                    </div>
                                </div> <br><br>
							
							<div class="form-group">
                                    <label for="city" class="col-md-4 control-label">Patient City</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${pat.city}" name="city" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="state" class="col-md-4 control-label">Patient State</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${pat.state}" name="state" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="gender" class="col-md-4 control-label">Patient Gender</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${pat.gender}" name="gender" disabled>
                                    </div>
                            </div> <br><br>
                            
                            <div class="form-group">
                                    <label for="ssn" class="col-md-4 control-label">Patient SSN</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${pat.ssn}" name="ssn" disabled>
                                    </div>
                            </div> <br><br>
                            
                            <div class="form-group">
                                    <label for="dateattended" class="col-md-4 control-label">Date Attended</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${fixappt.dateRequested}" disabled>
                                    </div>
                            </div> <br><br>
						
							<div class="form-group">
                                    <label for="reason" class="col-md-4 control-label">Reason For Visit</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${fixappt.reason}" name="reason" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="hospitalname" class="col-md-4 control-label">Hospital Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${fixappt.hospitalName}" name="hospitalname" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="doctorname" class="col-md-4 control-label">Doctor Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${fixappt.doctorName}" name="doctorname" disabled>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="bp" class="col-md-4 control-label">Patient BloodPressure</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id = "pbp" name="bp">
                                    </div>
                            </div> <br><br>
                            
                            
                            <div class="form-group">
                                    <label for="temp" class="col-md-4 control-label">Patient Temperature</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id = "ptemp" name="temp">
                                    </div>
                            </div> <br><br>
                            
                            <div class="form-group">
                                    <label for="pulse" class="col-md-4 control-label">Patient Pulse</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id = "ppulse" name="pulse">
                                    </div>
                            </div> <br><br>
                            
                            <div class="form-group">
                                    <label for="weight" class="col-md-4 control-label">Patient Weight</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${fixappt.weight}" name="weight" disabled>
                                    </div>
                            </div> <br><br>
                        
                        <div class="form-group">
                                    <label for="height" class="col-md-4 control-label">Patient Height</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${fixappt.height}" name="height" disabled>
                                    </div>
                            </div> <br><br>   
                            
                            <div class="form-group">
                                    <label for="bmi" class="col-md-4 control-label">Patient BMI</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id = "pbmi" name="bmi">
                                    </div>
                            </div> <br><br>    
                            
                            <div class="form-group">
                                    <label for="insurance" class="col-md-4 control-label">Patient Insurance Agent</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" value="${apt.insurancecompany}" name="insurance" disabled>
                                    </div>
                            </div> <br><br>
                            
                            <div class="form-group">
                                    <label for="comments" class="col-md-4 control-label">Comments</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id = "comment" name="comments">
                                    </div>
                            </div> <br><br>
                            <div class="form-group">
                                    <label for="medication" class="col-md-4 control-label">Medication1</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id = "pmed" name="medication">
                                    </div>
                            </div> <br><br>
                            
                            <div class="form-group">
                                    <label for="medication2" class="col-md-4 control-label">Medication2</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id = "pmed2" name="medication2">
                                    </div>
                            </div> <br><br>
                            
                            <div class="form-group">
                                    <label for="charges" class="col-md-4 control-label">total Charges</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id = "pcharges" name="charges">
                                    </div>
                            </div> <br><br>
                            
                            <div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-4 col-md-8">
                                    <!--    <button id="btn-signup" type="button" class="btn btn-info"><i class="icon-hand-right"></i> Sign Up</button>  -->  
                                        <input type="submit" name ="submit" value = "Update" id="btn-signup" class="btn btn-success">
                                    </div>
                                </div>
                            
                             </form>   
					
                    </div>  
                    </div>  
        </div>
    </div>
</body>
</html>