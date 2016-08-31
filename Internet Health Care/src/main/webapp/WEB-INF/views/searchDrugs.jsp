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
<title>Search for Drugs</title>

	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/drugManufacturerNav.css" rel="stylesheet">
	<link href="${pageContext.servletContext.contextPath}/resources/css/searchDrugs.css" rel="stylesheet">
	<script type="js/bootstrap.js"></script>
	
	<script type="text/javascript">
	function Submit(){
		
		var commonRegex = /[^a-zA-Z0-9\s]/;
		var drugname = $("#drugname").val();
		
		if(($("#drugname").val() == "" )||(commonRegex.test(drugname))){
			   $("#drugname").focus();
			   $("#errorBox").html("Enter valid Search");
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
	
	</div>
<br><br><br><br><br><br>
<!--container start-->
<div id="container">
  <div id="container_body">
    <div>
      <h2 class="form_title">Search For Drugs</h2>

<!--Form  start-->
    <div id="form_name">
		<form name="form" method="post" action="searchdrugs.htm" onsubmit="return Submit()">	
			<div id="errorBox">
		</div>
				<div class="form-group">
 				     <label for="drugname" class="col-md-4 control-label">Enter Drug Name</label>
                          <div class="col-md-8">
                            	<input type="text" class="form-control" name="drugname" id = "drugname" placeholder="Drug Name"/>
                          </div>
                </div> <br><br><br>
									
						<div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-4 col-md-8">
                                    
                                        <input type="submit" name ="submit" value = "Search" id="btn-signup" class="btn btn-info">
                                    </div>
                                </div>

			</form>
		</div>
		<br><br>
		
			<table class="table table-striped table-bordered table-condensed">
    				<thead>
        				<tr>
            				<th>Drug Name</th>
            				<th>Drug Type</th>
            				<th>Creation Date</th>
            				<th>Expiry Date</th>
            				<th>Hospital Name</th>
        				</tr>
    				</thead>
    			<c:forEach var="drugdet" items="${requestScope.drugList}">	
    				<tbody>
        				<tr>
            				<td>${drugdet.drugName}</td>
            				<td>${drugdet.drugType}</td>
            				<td>${drugdet.creationDate}</td>
            				<td>${drugdet.expiryDate}</td>
            				<td>${drugdet.hospitalName}</td>
        				</tr>
    				</tbody>
    			</c:forEach>
				</table>
	</div>
	</div>
	</div>

</body>
</html>
