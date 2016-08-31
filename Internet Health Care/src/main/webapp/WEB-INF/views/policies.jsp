<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>Policies</title>
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/policies.css" rel="stylesheet">
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
    
       <h2> Visitor Policy</h2>
		<p>Steward Health Care System recognizes the important role that visitors play in the care of hospitalized 
		patients. Steward Health Care System makes every attempt to allow visitors without restriction.  You as the
		 patient, and or your designated support person have the right to accept or decline visitors. Read the full 
		 policy here.</p>
		<h2>Non-discrimination Notice</h2>
		<p>As a recipient of Federal financial assistance, Steward Health Care System  does not exclude, deny 
		benefits to, or otherwise discriminate against any person on the basis of race, color, national origin, 
		disability, or age in admission to, participation in, or receipt of services and benefits under any of its 
		programs and activities, whether carried out by Steward Health Care System directly or through a contractor 
		or any other entity with which Steward Health Care arranges to carry out its programs and activities. Read 
		full policy here.</p>
		<h2>Program Accessibility</h2>
		<p>Steward Health Care System and all of its programs and activities are accessible to and useable by 
		disabled persons, including persons who are deaf, hard of hearing, or blind, or who have other sensory 
		impairments. Read the full policy here.</p>
		<h2>Vendors</h2>
		<p>Steward is committed to behaving and doing business honestly, responsibly and in accordance with laws and 
		regulations. As a Steward vendor, you are an important part of our commitment to ethical and legal business
		 practices and prevention of violations of federal and state, fraud, waste and abuse laws. As part of doing 
		 business with Steward, please review and abide by the information provided in the vendor packet.</p>
    </div>
    </div>
</div>
</body>
</html>                      