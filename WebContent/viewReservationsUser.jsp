<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
	<%@ include file = "layout.jsp" %><br><br>
	<section class="container text-center"><h1 style="color:#4f262f">Your Pending Reservations</h1></section>
 	<br><br> <br><br>
   	<% List<String> listNames = (List<String>)request.getAttribute("pendingEvenementNames");
   		int i = 0;
   	%>
    	
   	<div class="container">
   		<div class="row hidden-md-up">
   			<c:forEach items="${pendingReservationsByUser}" var="r">
   				<div class="col-md-3" style="margin-bottom:20px">
   					<div class="card text-center" style="width: 18rem; height:20rem; border-color:#4f262f">
			    		<div class="card-header" style="color:#4f262f">
						    Reservation : #${r.idReservation}
						</div>
						<div class="card-body">
						    <h5 class="card-title">Theme : <%=listNames.get(i) %></h5>
						    <% i++; %>
						    <h6 class="card-subtitle mb-2 text-muted">Price : ${r.prixReservation} Dhs</h6>
						    <p class="card-text">Number Of People : ${r.nbrPersonnes}.</p>
						    <p class="card-text">Date : ${r.dateReservation}</p>
			 			</div>
			 			<div class="card-footer">
						    <a href="#" class="btn btn-danger">Cancel Reservation</a>
					  	</div>
				 	</div>
				 </div>
			 </c:forEach>
		 </div>
	</div>
	<br><br>
    	
   	<%if(null != session.getAttribute("finishedReservationsByUser")){%>
   		<section class="container text-center"><h1 style="color:#4f262f">Your Finished Reservations</h1></section>
		<br><br> <br><br>
	   	<% List<String> listNames2 = (List<String>)request.getAttribute("finishedEvenementNames");
	   		int j = 0;
	   	%>
	   	<div class="container">
	   		<div class="row hidden-md-up">
	   			<c:forEach items="${finishedReservationsByUser}" var="r">
	   				<div class="col-md-3" style="margin-bottom:20px">
	   					<div class="card text-center" style="width: 18rem; height:15rem; border-color:#4f262f">
				    		<div class="card-header" style="color:#4f262f">
							    Reservation : #${r.idReservation}
							</div>
							<div class="card-body">
							    <h5 class="card-title">Theme : <%=listNames2.get(j) %></h5>
							    <% j++; %>
							    <h6 class="card-subtitle mb-2 text-muted">Price : ${r.prixReservation} Dhs</h6>
							    <p class="card-text">Number Of People : ${r.nbrPersonnes}.</p>
							    <p class="card-text">Date : ${r.dateReservation}</p>
				 			</div>
					 	</div>
					 </div>
				 </c:forEach>
			 </div>
		 </div>
	 <%} %>      
    
  <%@ include file = "footer.jsp" %>
    
  

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


    
  </body>
</html>