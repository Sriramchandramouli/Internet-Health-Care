<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>Hospital Service</title>
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/hospitalservice.css" rel="stylesheet">
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
</nav>
<div class="col-sm-6 col-md-4 col-lg-12 jumbotron">
<div class="container">
	<div class="row">
    
        <h3>Behavioral Health</h3><br><br>
        <h3>Second largest provider of behavioral health services in Massachusetts</h3>
        <p>As the second largest provider of behavioral health services in Massachusetts, caring for a patient’s 
        physical well-being, along with their mental well-being, is Steward’s main mission. Our comprehensive 
        behavioral health care focuses on a full range of conditions and strives to restore balance and a sense of 
        wellness to those living within the communities we touch.Steward® Behavioral Health Services offers unique, 
        specialized care, including psychiatric services to patients, young and old. In addition to these services, 
        our addiction treatment programs deliver excellent outcomes for individuals suffering from substance abuse 
        problems. We offer substance abuse treatment services at the following Steward locations – NORCAP Lodge in 
        Foxboro, Massachusetts, St. Elizabeth's Medical Center's Comprehensive Addiction Program (SECAP) in Metro 
        Boston, and Holy Family Hospital at Merrimack Valley (ValleyCAP) in Haverhill, Massachusetts.</p>
    </div>
    </div>
</div>
</body>
</html>                                		