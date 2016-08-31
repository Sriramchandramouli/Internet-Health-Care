<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>Schedule Appointment</title>
	
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap-theme.min.css" />" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="js/bootstrap.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<link rel="stylesheet" href="/resources/demos/style.css">
	<link href="${pageContext.servletContext.contextPath}/resources/css/appointment.css" rel="stylesheet">
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
		var commonRegex = /^[a-zA-Z0-9]/;
		var spaceRegex = /\s+/;
		var alphabRegex = /^[a-zA-Z\s]*$/;
		var reason = $("#reason").val();
		var height = $("#height").val();
		var weight = $("#weight").val();
		var datepicker = $("#datepicker").val(); 
		var inscompany = $("#inscompany").val();
		var claimno = $("#claimno").val();
		var hname = $("#hname").val();
		var datepicker1 = $("#datepicker1").val();
		var signature = $("#signature").val();
		
		
		if(($("#reason").val() == "" )||(!alphabRegex.test(reason))){
			   $("#reason").focus();
			   $("#errorBox").html("Enter valid Reson");
			   return false;
		} else if($('input[name=health]:checked').length<=0){
	    	$("#errorBox").html("Select an answer");
	    	return false;
	 	}else if($('input[name=healthchange]:checked').length<=0){
		    $("#errorBox").html("Select an answer");
		    return false;
		}else if(($("#weight").val() == "" ) ||(!numRegex.test(weight))){
			   $("#weight").focus();
			   $("#errorBox").html("Enter valid Weight");
			   return false;
		}else if(($("#height").val() == "" ) ||(!numRegex.test(height))){
			   $("#height").focus();
			   $("#errorBox").html("Enter valid Height");
			   return false;
		} else if($('input[name=care]:checked').length<=0){
				 $("#errorBox").html("Select an answer");
				  return false;
		}else if($('input[name=treatmenthistory]:checked').length<=0){
			 $("#errorBox").html("Select an answer");
			  return false;
		}else if($('input[name=concern]:checked').length<=0){
			 $("#errorBox").html("Select an answer");
			  return false;
		}else if($('input[name=disease]:checked').length<=0){
		 	$("#errorBox").html("Select an option");
		 	 return false;
		}else if($('input[name=disease1]:checked').length<=0){
		 	$("#errorBox").html("Select an option");
		 	 return false;
		}else if($('input[name=disease2]:checked').length<=0){
		 	$("#errorBox").html("Select an option");
		 	 return false;
		}else if($('input[name=disease3]:checked').length<=0){
		 	$("#errorBox").html("Select an option");
		 	 return false;
		}else if($('input[name=automobile]:checked').length<=0){
			 $("#errorBox").html("Select an answer");
	  		return false;
		}else if($('input[name=workrelated]:checked').length<=0){
			 $("#errorBox").html("Select an answer");
	  		return false;
		}else if($('input[name=other]:checked').length<=0){
			 $("#errorBox").html("Select an answer");
		  		return false;
		}else if(($("#datepicker").val() == "" )){
			   $("#datepicker").focus();
			   $("#errorBox").html("Enter valid Date");
			   return false;
		}else if(($("#inscompany").val() == "" ) ||(!alphabRegex.test(inscompany))){
			   $("#inscompany").focus();
			   $("#errorBox").html("Enter valid Insurance Company name");
			   return false;
		}else if(($("#claimno").val() == "" ) ||(!numRegex.test(claimno))){
			   $("#claimno").focus();
			   $("#errorBox").html("Enter valid Claim NO");
			   return false;
		}else if(($("#hname").val() == "" ) ||(!alphabRegex.test(hname))){
			   $("#hname").focus();
			   $("#errorBox").html("Enter valid Hospital Name");
			   return false;
		}else if(($("#datepicker1").val() == "" )){
			   $("#datepicker1").focus();
			   $("#errorBox").html("Enter valid Date");
			   return false;
		}else if(($("#signature").val() == "" ) ||(!alphabRegex.test(signature))){
			   $("#signature").focus();
			   $("#errorBox").html("Enter valid Signature");
			   return false;
		}
		
	}
	
	</script>
	
</head>
<body>
<div id="emptyDiv">
</div>
<div id="description">
</div>
<!--container start-->
<div id="container">
  <div id="container_body">
    <div>
      <h2 class="form_title">Schedule an Appointment</h2>

<!--Form  start-->
    <div id="form_name">
		<form name="form" method="post" action="appointment1.html" onsubmit="return Submit()">
		<div id="errorBox">
		</div>
		<div class="form-group">
                                    <label for="reason" class="col-md-4 control-label">What is the reason for Visit</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" name="reason" id = "reason" placeholder="Reason for Visit"/>
                                    </div>
                                </div> <br><br>
		<div class="form-group">
                                    <label for="health" class="col-md-4 control-label">Are you in Good health</label>
                                    <div class="col-md-8">
                                        <div class="btn-group" data-toggle="buttons">
											<label class="btn btn-default">
											<input type="radio" name="health" value="Yes">Yes
											</label>
											<label class="btn btn-default">
												<input type="radio" name="health" value="No">No
											</label>
											
										</div>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="healthchange" class="col-md-4 control-label">Have there been any changes in your general health in the past year</label>
                                    <div class="col-md-8">
                                        <div class="btn-group" data-toggle="buttons">
											<label class="btn btn-default">
											<input type="radio" name="healthchange" value="Yes">Yes
											</label>
											<label class="btn btn-default">
												<input type="radio" name="healthchange" value="No">No
											</label>
											
										</div>
                                    </div>
                            </div> <br><br><br>
							
							
							
							<div class="form-group">
                                    <label for="weight" class="col-md-4 control-label">What is your weight</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id = "weight" name="weight" placeholder="weight"/>
                                    </div>
                                </div> <br><br>
								<div class="form-group">
                                    <label for="height" class="col-md-4 control-label">What is your height</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id = "height" name="height" placeholder="height">
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="care" class="col-md-4 control-label">Are you under the care of a physician</label>
                                    <div class="col-md-8">
                                        <div class="btn-group" data-toggle="buttons">
											<label class="btn btn-default">
											<input type="radio" name="care" value="Yes">Yes
											</label>
											<label class="btn btn-default">
												<input type="radio" name="care" value="No">No
											</label>
											
										</div>
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="treatmenthistory" class="col-md-4 control-label">Have you had any illness, operation or been hospitalized in the past five years </label>
                                    <div class="col-md-8">
                                        <div class="btn-group" data-toggle="buttons">
											<label class="btn btn-default">
											<input type="radio" name="treatmenthistory" value="Yes">Yes
											</label>
											<label class="btn btn-default">
												<input type="radio" name="treatmenthistory" value="No">No
											</label>
											
										</div>
                                    </div>
                            </div> <br><br><br><br>
							
							<div class="form-group">
                                    <label for="concern" class="col-md-4 control-label">Is there anything that the doctor should be told about health</label>
                                    <div class="col-md-8">
                                        <div class="btn-group" data-toggle="buttons">
											<label class="btn btn-default">
											<input type="radio" name="concern" value="Yes">Yes
											</label>
											<label class="btn btn-default">
												<input type="radio" name="concern" value="No">No
											</label>
											
										</div>
                                    </div>
                            </div> <br><br><br><br>
							
							<div class="form-group">
                                    <label for="disease" class="col-md-4 control-label">Have you had or do you currently have (Check all that apply)</label>
                                    <div class="col-md-8">
                                        <input type="checkbox" name="disease" value="Rheumatic fever"/>&nbsp;Rheumatic fever
										<input type="checkbox" name="disease" value="High BP"/>&nbsp;High BP
										<input type="checkbox" name="disease" value="Low blood sugar"/>&nbsp;Low blood sugar
										<input type="checkbox" name="disease" value="Kidney Trouble"/>&nbsp;Kidney Trouble
										<input type="checkbox" name="disease" value="Contagious diseases"/>&nbsp;Contagious diseases&emsp;&emsp;&emsp;&emsp;&nbsp;
										<input type="checkbox" name="disease" value="Tumor"/> &nbsp;A tumor or growth 
										<input type="checkbox" name="disease" value="Alcohol"/>&nbsp;A history of alcohol abuse
										<input type="checkbox" name="disease" value="None"/>&nbsp;None
                                    </div>
                                </div> <br><br><br><br>
								
								
							<div class="form-group">
                                    <label for="disease1" class="col-md-4 control-label">Have you had or do you currently have (Check all that apply)</label>
                                    <div class="col-md-8">
                                        <input type="checkbox" name="disease1" value="Stroke"/>&nbsp;Stroke
										<input type="checkbox" name="disease1" value="Thyroid trouble"/>&nbsp;Thyroid trouble
										<input type="checkbox" name="disease1" value="Diabetes"/>&nbsp;Diabetes
										<input type="checkbox" name="disease1" value="Low blood pressure"/>&nbsp;Low blood pressure
										<input type="checkbox" name="disease1" value="Chest pain"/>&nbsp;Chest pain/angina
										<input type="checkbox" name="disease1" value="Heart attack"/> &nbsp;Heart attack(s) 
										<input type="checkbox" name="disease1" value="Smoking"/>&nbsp;Smoking
										<input type="checkbox" name="disease1" value="Tuberculosis"/>&nbsp;Tuberculosis
										<input type="checkbox" name="disease" value="None"/>&nbsp;None
                                    </div>
                                </div> <br><br><br>
								
								
							<div class="form-group">
                                    <label for="disease2" class="col-md-4 control-label">Is there a FAMILY history of</label>
                                    <div class="col-md-8">
                                        <input type="checkbox" name="disease2" value="Cancer"/>&nbsp;Cancer 
										<input type="checkbox" name="disease2" value="Diabetes"/>&nbsp;Diabetes
										<input type="checkbox" name="disease2" value="Heart Disease"/>&nbsp;Heart Disease
										<input type="checkbox" name="disease2" value="Anesthetic Problems"/>&nbsp;Anesthetic Problems
										<input type="checkbox" name="disease" value="None"/>&nbsp;None
										
                                    </div>
                                </div> <br><br>
								
							<div class="form-group">
                                    <label for="disease1" class="col-md-4 control-label">Are you taking any kind of medication, drug, pills</label>
                                    <div class="col-md-8">
                                        <input type="checkbox" name="disease3" value="Blood thinners"/>&nbsp;Blood thinners 
										<input type="checkbox" name="disease3" value="dietpills"/>&nbsp;Have you ever taken diet pills
										<input type="checkbox" name="disease3" value="sleepingpills"/>&nbsp;Have ever taken sleeping pills
										<input type="checkbox" name="disease" value="None"/>&nbsp;None
                                    </div>
                                </div> <br><br>
								
								
							<div class="form-group">
                                    <label for="accident" class="col-md-4 control-label">Is this related to an accident?</label>
                                    <div class="col-md-8">
                                        <input type="radio" name="accident" value="Yes">&nbsp;&nbsp;Yes &nbsp;&nbsp;&nbsp;
										<input type="radio" name="accident" value="No">&nbsp;&nbsp;No
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="automobile" class="col-md-4 control-label">Automobile?</label>
                                    <div class="col-md-8">
                                        <input type="radio" name="automobile" value="Yes">&nbsp;&nbsp;Yes &nbsp;&nbsp;&nbsp;
										<input type="radio" name="automobile" value="No">&nbsp;&nbsp;No
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="workrelated" class="col-md-4 control-label">Is this Work related?</label>
                                    <div class="col-md-8">
                                        <input type="radio" name="workrelated" value="Yes">&nbsp;&nbsp;Yes &nbsp;&nbsp;&nbsp;
										<input type="radio" name="workrelated" value="No">&nbsp;&nbsp;No
                                    </div>
                            </div> <br><br>
							
							<div class="form-group">
                                    <label for="other" class="col-md-4 control-label">Other?</label>
                                    <div class="col-md-8">
                                        <input type="radio" name="other" value="Yes">&nbsp;&nbsp;Yes &nbsp;&nbsp;&nbsp;
										<input type="radio" name="other" value="No">&nbsp;&nbsp;No
                                    </div>
                            </div> <br><br>
                                
                            <div class="form-group">
                                    <label for="injury" class="col-md-4 control-label">Date of Injury</label>
                                    <div class="col-md-8">
                                        <input type="text" id="datepicker" class="form-control" name="injury" placeholder="Date of Injury"/>
                                    </div>
                                </div> <br><br>
								
							<div class="form-group">
                                    <label for="insurancecompany" class="col-md-4 control-label">Insurance company handling this claim</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" name="insurancecompany" id = "inscompany" placeholder="insurancecompany"/>
                                    </div>
                                </div> <br><br>
								
							<div class="form-group">
                                    <label for="claimnumber" class="col-md-4 control-label">Claim Number</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" name="claimnumber" id = "claimno" placeholder="claimnumber"/>
                                    </div>
                                </div> <br><br>
                                
                                <div class="form-group">
                                    <label for="hospitalname" class="col-md-4 control-label">Hospital Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" name="hospitalname" id = "hname" placeholder="Hospital Name"/>
                                    </div>
                                </div> <br><br>
                                
                                <div class="form-group">
                                    <label for="appointmentdate" class="col-md-4 control-label">Appointment Date</label>
                                    <div class="col-md-8">
                                        <input type="text" id="datepicker1" class="form-control" name="appointmentdate" placeholder="Appointment Date"/>
                                    </div>
                                </div> <br><br>
								
							<div class="form-group">
                                    <label for="claimnumber" class="col-md-12 control-label">Verification</label>
                                    
                                </div> <br><br>
								
							<div class="form-group">
                                    <label for="claimnumber" class="col-md-12 control-label">I certify that I have read and I understand the questions above. 
									I acknowledge that my questions, if any, about the inquiries set forth above have been answered to my satisfaction. I will 
									not hold my doctor, or any other member of his / her staff, responsible for any errors or omissions that I have made in the 
									completion of this form.</label>
                                    
                                </div> <br><br>
								
							<div class="form-group">
                                   
                                    <div class="col-md-12">
                                    	<textarea rows="3" cols="80" id = "signature" name="signature" ></textarea>
                                        
                                    </div>
                                </div> <br><br><br><br>
								
						<div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-4 col-md-8">
                                    
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
