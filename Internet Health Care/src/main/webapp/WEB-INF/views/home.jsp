<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/style.css" rel="stylesheet">
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
    
        <h1>Welcome to Steward Health Care</h1>
        <p>The World Health Organization defines health as a state of complete physical, mental and social well-being and not merely the absence of disease or infirmity.  Healthy People 2020 tells us that health begins at home by learning self-care, eating well and staying active, not smoking, having recommended immunizations and screenings, and seeing a doctor when we are sick to return us to health.</p>
        <p>We render quality services </a></p>
        
        <h2>World class health care where you live.</h2>
            <p>Steward Health Care System is a community-based accountable care organization that offers a full range of health care services to patients in Eastern Massachusetts. Steward has 3,000 physicians, 10 hospital campuses, 24 affiliated urgent care providers, home care, hospice and other services.

				Steward offers modern facilities, world class doctors and state-of-the-art technology in the communities where our patients live. Patients do not need to travel to academic medical centers in Boston to receive high-quality care.

				Since 2010, Steward has invested more than $850 million in its integrated care system to improve the quality of care, renovate facilities, upgrade technology and enhance the patient experience. Steward community hospitals earn top quality and safety ratings from leading industry groups.

				Steward serves more than one million patients annually in more than 150 communities. It is also one of the largest employers and taxpayers in most cities and towns where it operates.

				Providing world class health care, close to home, where you need it most.</p>
    </div>
    </div>
</div>
</body>
</html>                                		