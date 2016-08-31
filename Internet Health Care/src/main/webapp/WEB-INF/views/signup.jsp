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
<title>LogIn Page</title>
<head>
	<title>Sign Up</title>
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>

<script type="text/javascript">
function Submit(){
	 var emailRegex = /^[A-Za-z0-9._]*\@[A-Za-z]*\.[A-Za-z]{2,5}$/;
	 var alphabRegex = /^[a-zA-Z]*$/;
	 var emailval = $("#emailval").val();
	 var userval = $("#userval").val();
	 var passval = $("#passval").val();
	 var roleval = $("#roleval").val();
	 var genderval = $("#genderval").val();
	 var ageval = $("#ageval").val();
	 var ansval = $("#ansval").val();
	 var question = $("#question").val();
	 var numRegex = /^[0-9]+$/;
	 var commonRegex = /^[a-zA-Z0-9]/;
	 
	 if(($("#emailval").val() == "" )||(!emailRegex.test(emailval))){
		   $("#emailval").focus();
		   $("#errorBox").html("Enter valid Email");
		   return false;
	} else if(($("#userval").val() == "" )){
		   $("#userval").focus();
		   $("#errorBox").html("Enter valid User Name");
		   return false;
	} else if(($("#passval").val() == "" )){
		   $("#passval").focus();
		   $("#errorBox").html("Enter valid Password");
		   return false;
	}else if(($("#roleval").val() == "" )||(!alphabRegex.test(roleval))){
		   $("#roleval").focus();
		   $("#errorBox").html("Enter valid Role");
		   return false;
	}else if($('input[name=gender]:checked').length<=0){
	    $("#errorBox").html("Select an Gender");
	    return false;
	}else if(($("#ageval").val() == "" )||(!numRegex.test(ageval))){
		   $("#ageval").focus();
		   $("#errorBox").html("Enter valid Age");
		   return false;
	}else if(($("#question").val() == "" )){
		   $("#question").focus();
		   $("#errorBox").html("Enter a Question");
		   return false;
	}else if(($("#ansval").val() == "" )||(!commonRegex.test(ansval))){
		   $("#ansval").focus();
		   $("#errorBox").html("Enter valid Answer");
		   return false;
	}
}
		
</script>
<style>
#errorBox{
 color:#F00;
 }
</style>
</head>
<body>


<div class="container"> 

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
</nav><br><br><br><br>
    <div id="container_body">
		<div id="signupbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Sign Up</div>
                        <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="login.htm">Sign In</a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form:form method="post" action="signup.htm" id="loginform" class="form-horizontal" role="form" commandName="newUser" onsubmit="return Submit()">
                            <div id="errorBox">
                            <c:out value="${error1}" />
							</div>        
                            <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" id="emailval" name="email" path="email" placeholder="Email Address"/>
                                   		<form:errors path="email" cssStyle="color:#ff0000" cssClass="error"/>   
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label for="username" class="col-md-3 control-label">UserName</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" id="userval" name="username1" path="username" placeholder="UserName"/>
                                   		<form:errors path="username" cssStyle="color:#ff0000" cssClass="error"/>   
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label">Password</label>
                                    <div class="col-md-9">
                                        <form:input type="password" class="form-control" id="passval" name="passwd" path="password" placeholder="Password"/>
                                    	<form:errors path="password" cssStyle="color:#ff0000" cssClass="error"/>  
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label for="role" class="col-md-3 control-label">Role</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" id="roleval" name="role" path="role" placeholder=""/>
                                        <form:errors path="role" cssStyle="color:#ff0000" cssClass="error"/>  
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="gender" class="col-md-3 control-label">Gender</label>
                                    <div class="col-md-9">
                                        <input type="radio" name="gender" id="genval" value="Male">&nbsp;&nbsp;Male &nbsp;&nbsp;&nbsp;
										<input type="radio" name="gender" id="genval" value="female">&nbsp;&nbsp;Female
                                    </div>
                            	</div>
                                
                                <div class="form-group">
                                    <label for="age" class="col-md-3 control-label">Age</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" id="ageval" value = "" name="age" path="age" placeholder="Age"/>
                                    	<form:errors path="age" cssStyle="color:#ff0000" cssClass="error"/>  
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                	<label for="question" class="col-md-3 control-label">Secret Question</label>
                                    <div class="col-md-9">
                                        <form:select class="form-control" id = "question" path="secretquestion" name ="question">
                                        	<form:option selected="" value="">Secret Question</form:option>
    										<form:option value="What is your birth city"/>What is your birth city
    										<form:option value="What is your pet name"/>What is your pet name
    										<form:option value="What is your favourite car"/>What is your favourite car
    										<form:option value="Who is your favourite sportsman"/>Who is your favourite sportsman
    										<form:option value="Which is your favourite vacation spot"/>Which is your favourite vacation spot
										</form:select>
                                    </div>
								</div>
								
								<div class="form-group">
                                    <label for="answer" class="col-md-3 control-label">Answer</label>
                                    <div class="col-md-9">
                                        <form:input type="text" class="form-control" id="ansval" path="answer" name="answer" placeholder=""/>
                                    	<form:errors path="answer" cssStyle="color:#ff0000" cssClass="error"/>  
                                    </div>
                                </div>


                                <div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-3 col-md-9">
                                    <!--    <button id="btn-signup" type="button" class="btn btn-info"><i class="icon-hand-right"></i> Sign Up</button>  -->  
                                        <input type="submit" name ="submit" value = "Sign Up" id="btn-signup" class="btn btn-success">
                                    </div>
                                </div>

                            </form:form>     



                        </div>                     
                    </div>  
        </div>
     	</div>
         </div> 
</body>
</html>