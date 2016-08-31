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
<title>Enter Severity</title>

	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/adminNav.css" rel="stylesheet">
	<link href="${pageContext.servletContext.contextPath}/resources/css/sevLevel.css" rel="stylesheet">
	
	<script type="text/javascript">
	function Submit(){
		
		var numRegex = /^[0-9]*$/;
		var commonRegex = /^[a-zA-Z0-9]/;
		var spaceRegex = /\s+/;
		var alphabRegex = /^[a-zA-Z\s]*$/;
		var sevlevel = $("#sevlevel").val();
		
		if(($("#sevlevel").val() == "" )||(!commonRegex.test(sevlevel))){
			   $("#sevlevel").focus();
			   $("#errorBox").html("Enter valid Severity Level");
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
<!--container start-->
<div id="container">
  <div id="container_body">
    <div>
      <h2 class="form_title">Enter Severity</h2>

<!--Form  start-->
    <div id="form_name">
		<form name="form" method="post" action="entersev.htm" onsubmit="return Submit()">	
			<div id="errorBox">
			</div>
				<div class="form-group">
 				     <label for="sevlevel" class="col-md-4 control-label">Enter Severity Level</label>
                          <div class="col-md-8">
                            	<input type="text" class="form-control" id = "sevlevel" name="sevlevel" placeholder="Severity Level"/>
                          </div>
                </div> <br><br><br>
									
						<div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-4 col-md-8">
                                    
                                        <input type="submit" name ="submit" value = "Enter" id="btn-signup" class="btn btn-info">
                                    	<input type="hidden" name="complaintID" value="${complaintID}" />
                                    </div>
                                </div>

			</form>
		</div>
		<br><br>
	</div>
	</div>
	</div>

</body>
</html>
