<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>Doctor Complaint</title>
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/patientnav.css" rel="stylesheet">
	<link href="${pageContext.servletContext.contextPath}/resources/css/doctorcomplaint.css" rel="stylesheet">
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
	<script type="text/javascript">
	function Submit(){
		
		var numRegex = /^[0-9]*$/;
		var commonRegex = /^[a-zA-Z0-9\s]/;
		var spaceRegex = /\s+/;
		var alphabRegex = /^[a-zA-Z\s]*$/;
		var alphabRegex1 = /^[a-zA-Z]*$/;
		var fname = $("#fname").val();
		var lname = $("#lname").val();
		var npi = $("#npi").val();
		var daddress = $("#daddress").val(); 
		var city = $("#city").val();
		var state = $("#state").val();
		var datepicker = $("#datepicker").val();
		var problem = $("#problem").val();
		var comments = $("#comments").val();
		
		
		if(($("#fname").val() == "" )||(!alphabRegex1.test(fname))){
			   $("#fname").focus();
			   $("#errorBox").html("Enter valid Name");
			   return false;
		} else if(($("#lname").val() == "" ) ||(!alphabRegex1.test(lname))){
			   $("#lname").focus();
			   $("#errorBox").html("Enter valid Name");
			   return false;
		}else if(($("#npi").val() == "" ) ||(!numRegex.test(npi))){
			   $("#npi").focus();
			   $("#errorBox").html("Enter valid NPI");
			   return false;
		} else if(($("#daddress").val() == "" ) ||(!commonRegex.test(daddress))){
			   $("#daddress").focus();
			   $("#errorBox").html("Enter valid Address");
			   return false;
		}else if(($("#city").val() == "" ) ||(!alphabRegex1.test(city))){
			   $("#city").focus();
			   $("#errorBox").html("Enter valid City");
			   return false;
		}else if(($("#state").val() == "" ) ||(!alphabRegex1.test(state))){
			   $("#state").focus();
			   $("#errorBox").html("Enter valid State");
			   return false;
		}else if(($("#datepicker").val() == "" )){
			   $("#datepicker").focus();
			   $("#errorBox").html("Enter valid Date");
			   return false;
		}else if($('input[name=complaint]:checked').length<=0){
			 $("#errorBox").html("Select an answer");
			  return false;
	}else if(($("#problem").val() == "" ) ||(!alphabRegex.test(problem))){
			   $("#problem").focus();
			   $("#errorBox").html("Enter valid Problem");
			   return false;
		}else if($('input[name=contactpractioner]:checked').length<=0){
				 $("#errorBox").html("Select an answer");
				  return false;
		}else if($('input[name=formalhearing]:checked').length<=0){
			 $("#errorBox").html("Select an answer");
			  return false;
		}else if($('input[name=care]:checked').length<=0){
			 $("#errorBox").html("Select an answer");
			  return false;
		}else if(($("#comments").val() == "" ) ||(!alphabRegex.test(comments))){
			   $("#comments").focus();
			   $("#errorBox").html("Enter valid comments");
			   return false;
		}
		
	}
	
	</script>
</head>
<body>
<div id="emptyDiv">
</div>
<div id="description">
</div>
<!--container start-->
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
	</div> <br><br><br>
<div id="container">
  <div id="container_body">
    <div>
      <h2 class="form_title">Report an Issue about Doctor</h2>

<!--Form  start-->
    <div id="form_name">
		<form name="form" method="post" action="doctorcomplaint.htm" onsubmit="return Submit()">
			<div id="errorBox">
			</div>
								<div class="form-group">
                                    <label for="doctorfirstname" class="col-md-4 control-label">Enter the Doctor First Name you are complaining</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="fname" name="firstname" placeholder="Doctor First Name"/>
                                    </div>
                                </div> <br><br><br>
								
								<div class="form-group">
                                    <label for="doctorlastname" class="col-md-4 control-label">Enter the Doctor Last Name you are complaining</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="lname" name="lastname" placeholder="Doctor Last Name"/>
                                    </div>
                                </div> <br><br>
                                
                                <div class="form-group">
                                    <label for="doctornpi" class="col-md-4 control-label">Enter the Doctor NPI</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="npi" name="docnpi" placeholder="Doctor NPI"/>
                                    </div>
                                </div> <br><br>
								
								<div class="form-group">
									<label for="doctoraddress" class="col-md-4 control-label">Enter the Doctor Address you are complaining</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="daddress" name="doctoraddress" placeholder="Doctor Address"/>
                                    </div>
                                </div> <br><br>
								
								<div class="form-group">
									<label for="doctorcity" class="col-md-4 control-label">Enter the city</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="city" name="city" placeholder="Doctor City"/>
                                    </div>
                                </div> <br><br>
								
								<div class="form-group">
									<label for="doctorstate" class="col-md-4 control-label">Enter the State</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="state" name="state" placeholder="Doctor State"/>
                                    </div>
                                </div> <br><br>
								
								<div class="form-group">
                                    <label for="dateattended" class="col-md-4 control-label">Date Attended</label>
                                    <div class="col-md-8">
                                        <input type="text" id="datepicker" class="form-control" name="dateattended" placeholder="Date Attended"/>
                                    </div>
                                </div> <br><br>
								
								<div class="form-group">
                                    <label for="complaint" class="col-md-4 control-label">Nature of the Complaint</label>
                                    <div class="col-md-8">
                                        <input type="checkbox" name="complaint" value="Quality of Care"/>&nbsp;Quality of Care
										<input type="checkbox" name="complaint" value="Inappropriate prescribing"/>&nbsp;Inappropriate prescribing
										<input type="checkbox" name="complaint" value="Excessive test or treatment"/>&nbsp;Excessive test or treatment
										<input type="checkbox" name="complaint" value="Misdiagnosis of condition"/>&nbsp;Misdiagnosis of condition
										<input type="checkbox" name="complaint" value="Failure to release patient records"/>&nbsp;Failure to release patient records
										<input type="checkbox" name="complaint" value="Substance abuse"/> &nbsp;Substance abuse
										<input type="checkbox" name="complaint" value="Misfilled prescription"/>&nbsp;Misfilled prescription
										<input type="checkbox" name="complaint" value="Patient abandonment/neglect"/>&nbsp;Patient abandonment/neglect
										<input type="checkbox" name="complaint" value="Unlicensed"/>&nbsp;Unlicensed 
                                    </div>
                                </div> <br><br>
								
								<div class="form-group">
                                    <label for="otherproblem" class="col-md-4 control-label">Problem other than listed above </label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="problem" name="otherproblem" placeholder="Other Problem"/>
                                    </div>
                                </div> <br><br>
		
							
							<div class="form-group">
                                    <label for="contactpractioner" class="col-md-4 control-label">Have you attempted to contact the practitioner concerning your complaint?</label>
                                    <div class="col-md-8">
                                        <div class="btn-group" data-toggle="buttons">
											<label class="btn btn-default">
											<input type="radio" name="contactpractioner" value="Yes">Yes
											</label>
											<label class="btn btn-default">
												<input type="radio" name="contactpractioner" value="No">No
											</label>
											
										</div>
                                    </div>
                            </div> <br><br><br>
							
							<div class="form-group">
                                    <label for="formalhearing" class="col-md-4 control-label">Would you be willing to testify if this matter goes to a formal hearing? </label>
                                    <div class="col-md-8">
                                        <div class="btn-group" data-toggle="buttons">
											<label class="btn btn-default">
											<input type="radio" name="formalhearing" value="Yes">Yes
											</label>
											<label class="btn btn-default">
												<input type="radio" name="formalhearing" value="No">No
											</label>
											
										</div>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="care" class="col-md-4 control-label">Are you under the care of a physician</label>
                                    <div class="col-md-8">
                                        <div class="btn-group" data-toggle="buttons">
											<label class="btn btn-default">
											<input type="radio" name="care" value="Yes">Yes
											</label>
											<label class="btn btn-default">
												<input type="radio" name="care" value="No">No
											</label>
											
										</div>
                                    </div>
                            </div> <br><br>
								
							<div class="form-group">
                                    <label for="comments" class="col-md-12 control-label">Any other Comments</label>
                                    
                                </div> <br><br>
								
							<div class="form-group">
                                   
                                    <div class="col-md-12">
                                    	<textarea rows="5" cols="80" id="comments" name="comments" ></textarea>
                                        
                                    </div>
                                </div> <br><br><br><br><br><br>
								
						<div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-4 col-md-8">
                                    
                                        <input type="submit" name ="submit" value = "Submit" id="btn-signup" class="btn btn-success">
                                    </div>
                                </div>

			</form>
		</div>
	</div>
	</div>
	</div>

</body>
</html>
