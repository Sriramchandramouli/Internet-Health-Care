<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>About Us</title>
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link href="${pageContext.servletContext.contextPath}/resources/css/aboutus.css" rel="stylesheet">
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
    
      <h2>  About Us </h2>
	<p>Steward Health Care System is a community-based accountable care organization with 3,000 physicians, 10 hospital campuses, 24 affiliated urgent care providers, home care, and other post acute services. Steward is committed to providing the highest quality, cost effective, and integrated patient care in the communities where our patients live.

In 2010, Steward was formed with investment from Cerberus Capital Management. It then acquired the six hospitals of the Caritas Christi Healthcare network, which included Carney Hospital in Dorchester, St. Elizabeth’s Medical Center in Brighton, Good Samaritan Medical Center in Brockton, Norwood Hospital in Norwood, Holy Family Hospital in Metheun and Saint Anne’s Hospital in Fall River. Steward committed to making significant investments in the system and assumed Caritas’ pension obligations and debt.

Steward went on to expand throughout eastern Massachusetts with the acquisition of Nashoba Valley Medical Center (Ayer, Massachusetts), Merrimack Valley Hospital (Haverhill, Massachusetts), Quincy Medical Center now Quincy Community Care Network (Quincy, Massachusetts) and Morton Hospital (Taunton, Massachusetts). In addition to these hospital acquisitions, Steward increased the number of physicians in its network. Steward Medical Group, the employed physician group, now has approximately 750 primary care and specialists physicians. Steward Health Care Network, the affiliated physician group, now has approximately 2,500 primary care and specialist physicians.

Since 2010, Steward has invested more than $850 million in its integrated care system to improve the quality of care, renovate facilities, upgrade technology and enhance the patient experience. Steward community hospitals now earn top quality and safety ratings. All nine acute care community hospitals received ‘A’ ratings from the Leapfrog Group, which evaluates hospitals on quality and safety measures.

As a result of Steward’s investments, patients now have access to high-quality community hospitals, physicians and other health care services in their communities. In most communities where it operates, Steward is also one of the largest employers and taxpayers.

Steward serves more than one million patients annually in more than 150 communities.</p>

	 <h2>Ralph de la Torre, MD - Chairman and Chief Executive Officer, Steward Health Care System </h2>
	<p>Dr. Ralph de la Torre is the Chairman and Chief Executive Officer of Steward Health Care System. Within two years of becoming CEO of Caritas Christi, Dr. de la Torre dramatically improved the system. During this time, Dr. de la Torre implemented changes in governance, operational structure and strategy, leading to the creation of a fully integrated community care organization with significant participation in risk contracting. He has founded several health care-related businesses and has numerous issued or pending patents. He was recently voted one of the 25 most powerful physician executives in the United States by Modern Healthcare magazine. Dr. de la Torre graduated from Duke University in 1988 (BSE), where he was a member of Phi Beta Kappa and Tau Beta Pi, and from a joint program between Harvard Medical School (MD) and the Massachusetts Institute of Technology (MS) in 1992.
   </p>
	</div>
    </div>
</div>
</body>
</html>                      