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
<title>Forgot Passowrd</title>
<link type ="text/css" rel = "stylesheet" href ="css/bootstrap.css">
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/patientnav.css" rel="stylesheet">
	
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
		
		var numRegex = /^[0-9]*$/;
		var commonRegex = /^[a-zA-Z0-9]/;
		var spaceRegex = /\s+/;
		var alphabRegex = /^[a-zA-Z\s]*$/;
		var uname = $("#uname").val();
		var question = $("#question").val();
		var answer = $("#answer").val();
		var npwd = $("#npwd").val();
		var cpwd = $("#cpwd").val();
		
		
		if(($("#uname").val() == "" )){
			   $("#uname").focus();
			   $("#errorBox").html("Enter valid User Name");
			   return false;
		}  else if($('#question').val() == ""){
		    $("#question").focus();
		    $("#errorBox").html("Select a Gender");
		    return false;
		  }else if(($("#answer").val() == "" )){
			   $("#answer").focus();
			   $("#errorBox").html("Enter valid answer");
			   return false;
		}else if(($("#npwd").val() == "" )){
			   $("#npwd").focus();
			   $("#errorBox").html("Enter Password");
			   return false;
		}else if(($("#cpwd").val() == "" )){
			   $("#cpwd").focus();
			   $("#errorBox").html("Enter Password");
			   return false;
		}
	}
	
	</script>
</head>
<body>
	<nav id="myNavbar" class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="healthcare.htm">Steward Health Care</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="hospitals.htm">Our Hospitals</a></li> 
                <li><a href="service.htm">Hospital Services</a></li>
                <li><a href="policies.htm">Policies</a></li>
				<li><a href="aboutus.htm">About Us</a></li>
				
            </ul>
				<ul class="nav navbar-nav navbar-right">
                <li><a href="login.htm">Login</a></li>
            </ul>
        </div>
    </div>
</nav> <br><br><br><br><br>
		<div class="container">    
        <div id="formbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Forgot Password</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >
                            
                        <form method="post" action="forgotpassword.htm" id="loginform" class="form-horizontal" role="form" onsubmit="return Submit()">
                            
                            <div id="errorBox">
                            <c:out value="${error1}" />
							</div>        
                            
                            <div class="form-group">
                                    <label for="username" class="col-md-3 control-label">Enter Your User Name</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" id= "uname" name="username" placeholder="User Name"/>
                                    </div>
                                </div>
                                
                            <div class="form-group">
                                	<label for="question" class="col-md-3 control-label">Secret Question</label>
                                    <div class="col-md-9">
                                        <select class="form-control" id = "question" name ="question"> 
                                        	<option selected="" value=""></option>
    										<option value="What is your birth city"/>What is your birth city</option>
    										<option value="What is your pet name"/>What is your pet name</option>
    										<option value="What is your favourite car"/>What is your favourite car</option>
    										<option value="Who is your favourite sportsman"/>Who is your favourite sportsman</option>
    										<option value="Which is your favourite vacation spot"/>Which is your favourite vacation spot</option>
										</select>
                                    </div>
								</div>
                            
                            <div class="form-group">
                                    <label for="answer" class="col-md-3 control-label">Enter Your Answer</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" id= "answer" name="answer" placeholder=""/>
                                    </div>
                                </div>
                                
                            <div class="form-group">
                                    <label for="lastname" class="col-md-3 control-label">Enter New Password</label>
                                    <div class="col-md-9">
                                        <input type="password" class="form-control" id= "npwd" name="newpass" placeholder="New Password"/>
                                    </div>
                                </div>
								
							<div class="form-group">
                                    <label for="nickname" class="col-md-3 control-label">Confirm Password</label>
                                    <div class="col-md-9">
                                        <input type="password" class="form-control" name="cpwd" placeholder="Confirm Password"/>
                                    </div>
                            </div>
								
							
							
							<div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-3 col-md-9">
                                    <!--    <button id="btn-signup" type="button" class="btn btn-info"><i class="icon-hand-right"></i> Sign Up</button>  -->  
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