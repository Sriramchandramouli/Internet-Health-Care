<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>Patient Details</title>
	
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/doctorNav.css" rel="stylesheet">
	<link href="${pageContext.servletContext.contextPath}/resources/css/drugscomplaint.css" rel="stylesheet">
	<style>
	#errorBox{
 	color:#F00;
 	}
	</style>
	<script type="text/javascript">
	function Submit(){
		
		var numRegex = /^[0-9]*$/;
		var commonRegex = /^[a-zA-Z0-9]/;
		var spaceRegex = /\s+/;
		var alphabRegex = /^[a-zA-Z\s]*$/;
		var ssn = $("#ssn").val();
		var pname = $("#pname").val();
		var reason = $("#reason").val();
		
		if(($("#ssn").val() == "" )||(!numRegex.test(ssn))||(spaceRegex.test(ssn)) ){
			   $("#ssn").focus();
			   $("#errorBox").html("Enter valid SSN");
			   return false;
		} else if(($("#pname").val() == "" ) ||(!alphabRegex.test(pname))){
			   $("#pname").focus();
			   $("#errorBox").html("Enter the valid Name");
			   return false;
		} else if(($("#reason").val() == "" ) |(!alphabRegex.test(reason))){
			   $("#reason").focus();
			   $("#errorBox").html("Enter the valid Reason");
			   return false;
		}else if($(ssn != '' && pname != '' && reason != '' )){
			   $("#errorBox").html("form submitted successfully")
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
				<a href="#" class="navbar-brand">Doctor Home</a>
			</div>
			
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="viewappointment.htm">View all Appointments</a></li>
					<li><a href="drugscomplaint1.htm">Report an Issue about Drugs</a></li>
					<li class="dropdown">
					<a href="#" class ="dropdown-toggle" data-toggle="dropdown">Patient Details</a>
					<ul class ="dropdown-menu">
					<li><a href="requestpatient.htm">Request Patient Details</a></li>
					<li><a href="viewpatientdetails.htm">View Patient Details</a></li>
					</ul>
					</li>
					<li><a href="complaint.htm">View Complaints</a></li>
					</ul>
				<ul class="nav navbar-nav navbar-right">
	
                <li><a href="logout.htm">Logout</a></li>
            </ul>
			</div>
		
		</div>
	
	</div>  <br><br><br><br><br>
<div id="container">
  <div id="container_body">
    <div>
      <h2 class="form_title">Request Patient Details</h2>

<!--Form  start-->
    <div id="form_name">
		<form:form name="form" method="post" commandName="requestPatient" action="requestpatient.htm" onsubmit="return Submit()">
		<div id="errorBox">
		</div>
		<div class="form-group">
                                    <label for="ssn" class="col-md-4 control-label">Enter Patient SSN</label>
                                    <div class="col-md-8">
                                        <form:input type="text" class="form-control" id ="ssn" path="ssn" name="ssn" placeholder="Patient SSN"/>
                                    </div>
                                </div> <br><br>
								
								<div class="form-group">
                                    <label for="patientName" class="col-md-4 control-label">Enter Patient name</label>
                                    <div class="col-md-8">
                                        <form:input type="text" class="form-control" id ="pname" path="patientName" name="patientName" placeholder="Patient Name"/>
                                    </div>
                                </div> <br><br>
								
							<div class="form-group">
                                    <label for="reason" class="col-md-12 control-label">Enter reason for request</label>
                                    
                                </div> <br><br>
								
							<div class="form-group">
                                   
                                    <div class="col-md-12">
                                    	<form:textarea rows="5" cols="80" id ="reason" path="reason" name="reason" />
                                        
                                    </div>
                                </div> <br><br><br><br><br><br>
								
						<div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-4 col-md-8">
                                    
                                        <input type="submit" name ="submit" value = "Request" id="btn-signup" class="btn btn-success">
                                    </div>
                                </div>

			</form:form>
		</div>
	</div>
	</div>
	</div>

</body>
</html>
