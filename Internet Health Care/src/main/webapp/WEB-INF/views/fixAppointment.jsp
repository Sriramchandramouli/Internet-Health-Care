<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>Fix Appointment</title>
	
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/adminNav.css" rel="stylesheet">
	<link href="${pageContext.servletContext.contextPath}/resources/css/drugscomplaint.css" rel="stylesheet">
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
		var commonRegex = /^[a-zA-Z0-9]/;
		var spaceRegex = /\s+/;
		var alphabRegex = /^[a-zA-Z\s]*$/;
		var dname = $("#dname").val();
		var dID = $("#dID").val();
		var adate = $("#adate").val();
		
		if(($("#dname").val() == "" )||(!alphabRegex.test(dname))){
			   $("#dname").focus();
			   $("#errorBox").html("Enter valid Doctor Name");
			   return false;
		} else if(($("#dID").val() == "" ) ||(!numRegex.test(dID))){
			   $("#dID").focus();
			   $("#errorBox").html("Enter valid Doctor ID");
			   return false;
		} else if(($("#datepicker").val() == "" )){
			   $("#datepicker").focus();
			   $("#errorBox").html("Enter valid Date");
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
<div id="container">
  <div id="container_body">
    <div>
      <h2 class="form_title">Fix Appointment</h2>

<!--Form  start-->
    <div id="form_name">
		<form:form name="form" method="post" commandName = "fixAppointment" action="fixappointment.htm" onsubmit="return Submit()">
		<div id="errorBox">
		</div>
		<div class="form-group">
                                    <label for="doctorname" class="col-md-4 control-label">Enter the doctor name</label>
                                    <div class="col-md-8">
                                        <form:input type="text" class="form-control" id="dname" name="doctorname" path="doctorName" placeholder="Doctor Name"/>
                                    </div>
                                </div> <br><br><br><br><br><br>
								
								<div class="form-group">
                                    <label for="doctorId" class="col-md-4 control-label">Enter the Doctor ID</label>
                                    <div class="col-md-8">
                                        <form:input type="text" class="form-control" id="dID" name="doctorId" path="doctornpi" placeholder="Doctor ID"/>
                                    </div>
                                </div> <br><br><br><br>
                                
                                <div class="form-group">
                                    <label for="appointmentdate" class="col-md-4 control-label">Appointment Date</label>
                                    <div class="col-md-8">
                                        <form:input type="text" id="datepicker" class="form-control" name="appointmentdate" path="dateRequested" placeholder="Appointment Date"/>
                                    </div>
                                </div> <br><br>
	
						<div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-4 col-md-8">
                                    
                                        <input type="submit" name ="submit" value = "Confirm Appointment" id="btn-signup" class="btn btn-success">
                                    </div>
                                </div>
                 
			</form:form>
		</div>
	</div>
	</div>
	</div>

</body>
</html>
