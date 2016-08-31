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
<title>Manage Drugs</title>

	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/drugManufacturerNav.css" rel="stylesheet">
	<link href="${pageContext.servletContext.contextPath}/resources/css/manageDrugs.css" rel="stylesheet">
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
	<script>
		$(function() {
	    	$( "#datepicker1" ).datepicker({
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
		var dname = $("#dname").val();
		var dID = $("#dID").val();
		var dquantity = $("#dquantity").val();
		var dtype = $("#dtype").val();
		var datepicker = $("#datepicker").val();
		var datepicker1 = $("#datepicker1").val();
		var hID = $("#hID").val();
		var hname = $("#hname").val();
		
		if(($("#dname").val() == "" ) || (!commonRegex.test(dname)) ||(!spaceRegex.test(dname))){
			   $("#dname").focus();
			   $("#errorBox").html("Enter valid Drug Name");
			   return false;
		} else if(($("#dID").val() == "" ) ||(!numRegex.test(dID))){
			   $("#dID").focus();
			   $("#errorBox").html("Enter valid Drug ID");
			   return false;
		} else if(($("#dquantity").val() == "" ) ||(!numRegex.test(dquantity))){
			   $("#dquantity").focus();
			   $("#errorBox").html("Enter valid Quantity");
			   return false;
		} else if(($("#datepicker").val() == "" )){
			   $("#datepicker").focus();
			   $("#errorBox").html("Enter valid Creation Date");
			   return false;
		} else if(($("#datepicker1").val() == "" )){
			   $("#datepicker1").focus();
			   $("#errorBox").html("Enter valid Expiry Date");
			   return false;
		}else if(($("#hID").val() == "" ) ||(!numRegex.test(hID))){
			   $("#hID").focus();
			   $("#errorBox").html("Enter valid Hospital ID");
			   return false;
		}else if(($("#hname").val() == "" ) ||(!commonRegex.test(hname))){                  
			   $("#hname").focus();
			   $("#errorBox").html("Enter valid Hospital Name");
			   return false;
		}else if(($("#dtype").val() == "" )){
			   $("#dtype").focus();
			   $("#errorBox").html("Enter valid Drug Type");
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
				<a href="drugmanufacturerhome.htm" class="navbar-brand">Drug Manufacturer Home</a>
			</div>
			
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
				
					<li class="dropdown">
					<a href="#" class ="dropdown-toggle" data-toggle="dropdown">Manage Drugs</a>
					<ul class ="dropdown-menu">
					<li><a href="managedrug.htm">Create Drugs</a></li>
					<li><a href="updatedrug.htm">Update Drugs</a></li>
					</ul>
					</li>
					<li><a href="managedrug.htm">View Sales Distribution</a></li>
					<li><a href="searchdrugs.htm">Search for Drugs</a></li>
					<li><a href="viewdrugcomplaints.htm">View Complaints</a></li>
					
					</ul>
				<ul class="nav navbar-nav navbar-right">
	
                <li><a href="logout.htm">Logout</a></li>
            </ul>
			</div>
		
		</div>
	
	</div> <br><br><br><br>
<!--container start-->
<div id="container">
  <div id="container_body">
    <div>
      <h2 class="form_title">Manage Drugs</h2>

<!--Form  start-->
    	<div id="form_name">
			<form:form name="form" method="post" commandName="drugDetail" action="managedrug.htm" onsubmit="return Submit()">
					<div id="errorBox">
					</div>
								<div class="form-group">
                                    <label for="drugname" class="col-md-4 control-label">Drug Name</label>
                                    <div class="col-md-8">
                                        <form:input type="text" class="form-control" id ="dname" path="drugName" name="drugname" placeholder="Drug Name" onsubmit="return Submit()"/>
                                    </div>
                                </div> <br><br>
								<div class="form-group">
                                    <label for="drugid" class="col-md-4 control-label">Drug ID</label>
                                    <div class="col-md-8">
                                        <form:input type="text" class="form-control" id ="dID" path="drugId" name="drugid" placeholder="Drug ID"/>
                                    </div>
                                </div> <br><br>
                                
                                <div class="form-group">
                                	<label for="quantity" class="col-md-4 control-label">Drug Quantity</label>
                                    <div class="col-md-8">
                                        <form:input type="text" class="form-control" id ="dquantity" path="quantity" name="quantity" placeholder="Drug Quantity"/>
                                    </div>
								</div> <br><br>
								
								<div class="form-group">
                                	<label for="type" class="col-md-4 control-label">Drug Type</label>
                                    <div class="col-md-8">
                                        <form:select class="form-control" path="drugType" id = "dtype" name ="type"> 
                                       		<form:option selected="" value=""/>Drug Type
    										<form:option value="Capsule"/>Capsule
    										<form:option value="Syrup"/>Syrup
    										<form:option value="Tablet"/>Tablet
										</form:select>
                                    </div>
								</div> <br><br>
								
								<div class="form-group">
                                    <label for="creationdate" class="col-md-4 control-label">Creation Date</label>
                                    <div class="col-md-8">
                                        <form:input type="text" id="datepicker" class="form-control" name="creationdate" path ="creationDate" placeholder="Creation Date"/>
                                    </div>
                                </div> <br><br>
							
							<div class="form-group">
                                    <label for="keyword" class="col-md-4 control-label">Expiry Date</label>
                                    <div class="col-md-8">
                                        <form:input type="text" id="datepicker1" class="form-control" name="expirydate" path ="expiryDate" placeholder="Expiry Date"/>
                                    </div>
                                </div> <br><br>
                                
                            <div class="form-group">
                                	<label for="hospitalid" class="col-md-4 control-label">Hospital Id</label>
                                    <div class="col-md-8">
                                        <form:input type="text" class="form-control" id ="hID" path="hospitalId" name="hospitalid" placeholder="Hospital ID"/>
                                    </div>
								</div> <br><br>
								
								<div class="form-group">
                                	<label for="hospitalname" class="col-md-4 control-label">Hospital Name</label>
                                    <div class="col-md-8">
                                        <form:input type="text" class="form-control" id ="hname" path="hospitalName" name="hospitalname" placeholder="Hospital Name"/>
                                    </div>
								</div> <br><br>
									
						<div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-4 col-md-8">
                                    
                                        <input type="submit" name ="submit" value = "Submit" id="btn-primary" class="btn btn-primary">
                                    </div>
                                </div>

			</form:form>
		</div>
	</div>
	</div>
	</div>

</body>
</html>
