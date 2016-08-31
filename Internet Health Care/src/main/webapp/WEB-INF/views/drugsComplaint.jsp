<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>Drugs Complaint</title>
	
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/patientnav.css" rel="stylesheet">
	<link href="${pageContext.servletContext.contextPath}/resources/css/drugscomplaint.css" rel="stylesheet">
	
	<script type="text/javascript">
	function Submit(){
		
		var numRegex = /^[0-9]*$/;
		var commonRegex = /^[a-zA-Z0-9\s]/;
		var spaceRegex = /\s+/;
		var alphabRegex = /^[a-zA-Z\s]*$/;
		var dname = $("#dname").val();
		var mname = $("#mname").val();
		var complaint = $("#complaint").val();
		
		if(($("#dname").val() == "" )||(!commonRegex.test(dname))){
			   $("#dname").focus();
			   $("#errorBox").html("Enter valid Drug Name");
			   return false;
		} else if(($("#mname").val() == "" )||(!commonRegex.test(mname))){
			   $("#mname").focus();
			   $("#errorBox").html("Enter valid Drug Manufacturer Name");
			   return false;
		}else if($('input[name=drugtype]:checked').length<=0){
		    $("#errorBox").html("Select a drug type");
		    return false;
		}else if(($("#complaint").val() == "" ) ||(!alphabRegex.test(complaint))){
			   $("#complaint").focus();
			   $("#errorBox").html("Enter valid complaint");
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
<<div class="navbar navbar-custom navbar-fixed-top">
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
	
	</div>  <br><br><br><br><br>
<div id="container">
  <div id="container_body">
    <div>
      <h2 class="form_title">Report an Issue about Drugs</h2>

<!--Form  start-->
    <div id="form_name">
		<form name="form" method="post" action="drugscomplaint.htm" onsubmit="return Submit()">
		<div id="errorBox">
		</div>
		<div class="form-group">
                                    <label for="drugname" class="col-md-4 control-label">Enter the drug name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id = "dname"name="drugname" placeholder="Drug Name"/>
                                    </div>
                                </div> <br><br>
								
								<div class="form-group">
                                    <label for="manufacturername" class="col-md-4 control-label">Enter the Manufacturer name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="mname"name="manufacturername" placeholder="Manufacturer Name"/>
                                    </div>
                                </div> <br><br>
		
							
							<div class="form-group">
                                    <label for="drugtype" class="col-md-4 control-label">Drug Type</label>
                                    <div class="col-md-8">
                                        <input type="radio" name="drugtype" value="Syrup">&nbsp;&nbsp;Syrup &nbsp;&nbsp;&nbsp;
										<input type="radio" name="drugtype" value="Tablet">&nbsp;&nbsp;Tablet
										<input type="radio" name="drugtype" value="Capsule">&nbsp;&nbsp;Capsule
                                    </div>
                            </div> <br><br>
								
							<div class="form-group">
                                    <label for="claimnumber" class="col-md-12 control-label">Enter your Complaint below</label>
                                    
                                </div> <br><br>
								
							<div class="form-group">
                                   
                                    <div class="col-md-12">
                                    	<textarea rows="5" cols="80" id = "complaint" name="complaint" ></textarea>
                                        
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
