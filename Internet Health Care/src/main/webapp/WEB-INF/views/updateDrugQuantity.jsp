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
<title>Update Drug Quantity</title>
<style>
*{
 margin:0px;
 padding:0px;
 }
body{
 font-family:Tahoma, Geneva, sans-serif;
 }
#container{
 width:45%;
 background-color:rgba(250,250,252,.9);
 margin:auto;
 margin-top:10px;
 margin-bottom:10px;
 box-shadow:0 0 3px #999;
 }
#container_body{
 padding:20px;
 }
.form_title{
 font-size:35px;
 color:#141823;
 text-align:center;
 padding:10px;
 font-weight:normal;
 }
.head_para{
 font-size:19px;
 color:#99a2a7;
 text-align:center;
 font-weight:normal;
 }
#form_name{
 padding:25px 0 0 15px;
 margin-left: 5%;
 margin-right:5%;
 }
.firstnameorlastname{
  margin-right:20px;
 }
.input_name{
 width:20%;
 padding:5px;
 font-size:18px;
 }
#email_form{
 clear:both;
 padding:15px 0 10px 0px;
 }
.input_email{
 width:45%;
 padding:5px;
 font-size:18px;
 }
#Re_email_form{
 padding:10px 0 10px 0px;
 }
.input_Re_email{
 width:45%;
 padding:5px;
 font-size:18px;
 }
#password_form{
 padding:10px 0 10px 0px;
 }
.input_password{
 width:45%;
 padding:5px;
 font-size:18px;
 }
.birthday_title{
 font-size:16px;
 color:#8b919d;
 font-weight:normal;
 padding:0 0 10px 0;
 }
select{
 padding:5px;
 }
#birthday{
 font-size:12px;
 color:#8b919d;
 padding-top:10px;
 }
#radio_button{
 padding:10px 0 0 0;
 }
#sign_user{
 font-size:14px;
 color:#FFF;
 text-align:center;
 background-color:#3B5998;
 padding:10px;
 margin-top:10px;
 cursor: pointer;
 }
#errorBox{
 color:#F00;
 }

	</style>
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/drugManufacturerNav.css" rel="stylesheet">
	
	<script type="text/javascript">
	function Submit(){
		
		var numRegex = /^[0-9]*$/;
		
		var dquantity = $("#dquantity").val();
		
		 if(($("#dquantity").val() == "" ) ||(!numRegex.test(dquantity))){
			   $("#dquantity").focus();
			   $("#errorBox").html("Enter valid Quantity");
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
      <h2 class="form_title">Update Drugs Quantity</h2>

<!--Form  start-->
    <div id="form_name">
		<form name="form" method="post" action="updatedrugdetail.htm" onsubmit="return Submit()">	
			<div id="errorBox">
		</div>
				<div class="form-group">
 				     <label for="drugquantity" class="col-md-4 control-label">Enter Drug Quantity</label>
                          <div class="col-md-8">
                            	<input type="text" class="form-control" id = "dquantity" name="drugquantity" placeholder="Drug Quantity"/>
                          </div>
                </div> <br><br><br>
									
						<div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-4 col-md-8">
                                    
                                        <input type="submit" name ="submit" value = "Update" id="btn-signup" class="btn btn-info">
                                   		<input type="hidden" name="drugID" value="${drugId}" />
                                    </div>
                                </div>

			</form>
		</div>
		</div>
		</div>
		</div>