<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>Hospitals</title>
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/hospital.css" rel="stylesheet">
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
            <a class="navbar-brand" href="#">Sriram Health Care</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav">
               <li class="active"><a href="hospitals.htm">Our Hospitals</a></li> 
                <li><a href="service.htm">Hospital Services</a></li>
                <li><a href="policies.htm">Policies</a></li>
				<li><a href="aboutus.htm">About Us</a></li>
				<li><a href="http://www.tutorialrepublic.com/contact-us.php" target="_blank">Contact Us</a></li>
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
    
        <h2>World class medical care, from our family to yours</h2>
        <p>We recognize that you have a choice about where to go for your health care. Your time is very valuable 
        and it’s important for you to have quick and easy access to information that can help you make important 
        decisions for you and your family. Whether you are seeking a physician, update on new technology, or a 
        support group, you’ve come to the right place.</p>
        <p>
        Many of our physicians are Boston-trained and bring the expertise and experience of Boston hospitals to your 
        bedside. With a new state-of-the-art Emergency Room, expanded cardiovascular services that includes elective
         heart procedures and emergency primary angioplasty as well as comprehensive women’s health and cancer
         care, Good Samaritan provides world class care, close to home.</p>
         <p>
         Thank you for taking the time to learn more about the high quality exceptional care and services we 
         provide. Good Samaritan Medical Center is a member of Steward Health Care, the largest fully integrated 
         community care organization in New England.
         </p>
    </div>
    </div>
</div>
</body>
</html>                      