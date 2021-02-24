<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%@ include file = "layout.jsp" %>
	
	<body style="background-image: url('images/contact-us-background4.jpg');  background-repeat: no-repeat; background-attachment: fixed; background-size: 100% 100%;"></body>
	<br><br>
	<section class="container">
		<div class="col-md-5 text-center">
			<h1 style="color:#4f262f">Contact Us</h1>
		</div>
		</section>
 	<br><br> <br><br>
	<section class="ftco-section ftco-services container">
    	<div class="container">
    		<div class="row">
   				<div class="col-md-5 d-flex services align-self-stretch px-4 ftco-animate">
            		<div class="d-block services-wrap text-center">
            			<div class="media-body py-4 px-3">
            			<form action="contactUs" method="POST" id="contact">
	            			<div class="row my-4 text-center">
	   							<div class="col-md-6">
			              			<input class="form-control form-control-sm" type="text" placeholder="First Name" id="inputSmall" name="contact-first-name-input" value="${currentUser.first_name}" required>
								</div>
								<div class="col-md-6">	
									<input class="form-control form-control-sm" type="text" placeholder="Last Name" id="inputSmall" name="contact-last-name-input" value="${currentUser.last_name}" required>
			              		</div>
			                </div>
			                <div class="row my-4 text-center">
			                	<div class="col-md-6">
	   								<input class="form-control form-control-sm" type="text" placeholder="Email" id="inputSmall" name="contact-email-input" value="${currentUser.email}" required>
	   							</div>
	   							<div class="col-md-6">
	   								<input class="form-control form-control-sm" type="text" placeholder="Subject" id="inputSmall" name="contact-subject-input" required>
	   							</div>
			                </div>
                			<div class="row my-4 text-center">
			                	<textarea class="form-control form-control-sm" placeholder="Message" id="inputSmall" name="contact-message-input" style="width: 500px" rows="4" required></textarea>
			                </div>
			                <p><button class="btn btn-primary" name="submit" type="submit" value="Submit">Send Message</button></p>
             			 </form>
             			 </div>
            		</div>      
          		</div>   
        	</div>
    	</div>
   	</section> 
    
	
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
  <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
	
	<script type="text/javascript">
		$(document).on("submit", "#contact", function(event) {
		    var $form = $(this);
	
		    $.post($form.attr("post"), $form.serialize(), function(response) { 
		    	;
		    });
		    alert("Message Sent Successfully!");
	        var elt = document.getElementsByName("contact-subject-input")
	        elt[0].value = "";
		    elt = document.getElementsByName("contact-message-input")
			elt[0].value = "";
		    event.preventDefault(); // Important! Prevents submitting the form.
		});
	</script>
	
</html>