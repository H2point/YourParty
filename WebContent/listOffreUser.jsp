<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<!DOCTYPE html>


<html lang="en">

  <%@ include file = "layout.jsp" %>
    <!-- END nav -->
    <br><br>
	<section class="container"><h1 style="color:#4f262f">Book now! Our offers are limited</h1></section>
 <br><br> <br><br>
    <section class="ftco-section ftco-services container">
    	<div class="container">
    	<div class="row">
    	
    	<% List<String> listNames = (List<String>)request.getAttribute("evenementNames");
    		int i = 0;
    	%> 
    	<c:forEach items="${eventList}" var="e">
   
          <div class="col-md-4 d-flex services align-self-stretch px-4 ftco-animate">
            <div class="d-block services-wrap text-center">
            
              
              <img class="img" src="dataImage?id=${e.id}" />
             
              <div class="media-body py-4 px-3">
              	<input id="${e.id}" value="${e.id}" type="hidden">
              	<input id="${e.id}/nbr_personne" value="${e.nbr_personne}" type="hidden">
              	<input id="${e.id}/price" value="${e.price}" type="hidden">
              	<input id="${e.id}/theme" value="${e.id_evenement}" type="hidden">
                
                <h3 class="heading">Offer : <%=listNames.get(i) %></h3>
                <% i++; %> 
                <h3 class="heading">Number of people :${e.nbr_personne}</h3>
                <h3 class="heading">Offer price : ${e.price} Dhs</h3>
                
                
             
                <p><button id="${e.id}" class="btn btn-primary" onclick="openOffreReservationForm(this.id)">Reserve</button></p>
              </div>
            </div>      
          </div>
         
           <%@ include file ="offreReservationForm.jsp" %>  
          
         </c:forEach>    
               
        </div>
    	</div>
    </section>
  
 
		


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

	<script>
	
    </script>
    
  </body>
</html>