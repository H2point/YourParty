<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<%@ include file = "layout.jsp" %>
<%@ include file = "sidenav.jsp" %>

	<div class="main">
		<br>
	  	<br>
	   	<div class="row main" >
	   		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	   			<table class="table">
	    			<thead>
	      				<tr>
	        				<th>ID Reservation</th>
					        <th>ID User</th>
					        <th>Address</th>
					        <th>Date</th>
					        <th>ID Event</th>
					        <th>Number of People</th>
					        <th>Price</th>
	      				</tr>
	    			</thead>
	    
	    			<tbody>
	    				<c:forEach items="${finishedReservationsList}" var="r">
	      					<tr>
						        <td>${r.idReservation}</td>
						        <td>${r.idUser}</td>
						        <td>
						        	<div class="row">
						        		${r.adresse}
						        	</div>
						        	<div class="row">
										<button id="${r.idReservation}" value="${r.adresse}" name="viewOnGoogleMaps" style="border-color: red;background:transparent;" data-toggle="tooltip" title="Trash" type="submit" class="pd-setting-ed" onclick="openGoogleMapsModal(this.id)"><i class="fa fa-map-marker" style="font-size:20px;color:red" aria-hidden="true"></i> View on Google Maps</button>	
						        		<%@ include file = "viewOnGoogleMaps.jsp" %>
						        	</div>
						        </td>
						        <td>${r.dateReservation}</td>
						        <td>${r.idEvenenemnt}</td>
						        <td>${r.nbrPersonnes}</td>
						        <td>${r.prixReservation}</td>
	      					</tr>      
	      				</c:forEach>
	      			</tbody>
	  			</table>
	   		</div>
	   	</div>
	</div>

	<!-- script -->
	<script>
	
	function myFunction() {
	  var x = document.getElementById("event");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	}
	</script>
	<script src="js/googleMaps.js"></script>
	<script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrEQP3EY36MHia17iu39Cc8LB9YFkWV70&callback=initMap&libraries=&v=weekly"
      async>
	</script>
</body>
</html>