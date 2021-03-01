<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<%@ include file = "layout.jsp" %>
<%@ include file = "reservationForm.jsp" %>

    <div class="hero-wrap js-fullheight" style="background-image: url('images/glass_crits.jpg'); width: fit-content;" data-stellar-background-ratio="0.2">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
          <div class="col-md-7 ftco-animate">
          	
          	<h1 class="mb-4">Let us help you set the perfect party</h1>
            
            <!-- <form action="Offre" method="POST">
			<button  value="AfficherEvent" name="afficherEventUser" type="submit" data-toggle="tooltip" title="" style="background:red;color:grey;border: none;width:150px;height:50px;font-size: 17px;">Liste offres</button>
			  
			 </form> -->
			 <br>
            
           
          </div>
        </div>
      </div>
      
    </div>

   <br><br><br><br><br>
   <section class="ftco-section ftco-services" id="services">
    	<div class="container">
    		<div class="row">
    		<%int i=0; %>
	    		<c:forEach items="${evenementList}" var="ev">
	    		<%i=i+1; if(i==4){ %>
	    		<div class="w-100"></div> <br><%} %>
	    			<input id="${ev.id_event}/nameEvent" value="${ev.nameEvent}" hidden>
	              	<input id="${ev.id_event}/pricePer10" value="${ev.pricePer10}" hidden>
	              
	              	
					<div class="col-md-4 d-flex services align-self-stretch px-4 ftco-animate">
					  <div class="d-block services-wrap text-center">
					    <div class="img" style="background-image: url(evenementImage?id=${ev.id_event});"></div>
					    <div class="media-body py-4 px-3">
					      <h3 class="heading">${ev.nameEvent}</h3>
					      <p>${ev.description}</p>
					      <p><button class="btn btn-primary" onclick="openReservationForm(${ev.id_event})">Reserve</button></p>
					       
					       <form action="Event" method="GET">
     						<input name="nom" type="hidden" value="${ev.nameEvent}">
							<button name="afficherUnEventIndex" type="submit"  class="btn btn-primary" style="background:#4f262f;;color:white;">Read More</button>
  							<hr>
 							</form>
					   
					    </div>
					  </div>    
					</div>
				</c:forEach>	
			</div>	
    	</div>
    </section>
  
   
		
		<section class="ftco-intro" style="background-image: url(images/baby_shower.jpg);" data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-9 text-center">
						<h2>Ready to get started</h2>
						<p class="mb-4">It is safe to book online with us! Get your dream stay in clicks or drop us a line with your questions.</p>
						<p class="mb-0"><a href="#" class="btn btn-primary">Learn more</a> 
            <a href="contactUs" class="btn btn-primary"> Contact Us</a></p>
					</div>
				</div>
			</div>
		</section>


<%@ include file = "footer.jsp" %>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/user-home.js"></script>
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
  <script type="text/javascript">
  	hideStuff();
  </script>

    
  </body>
</html>