<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<div class="modal" id="reservation-form">
	<div class="modal-dialog" role="document">
	   	<div class="modal-content">
	     	<div class="modal-header">
	       		<h5 class="modal-title" id="reservation-form-title">Make a Reservation</h5>
	       		<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeReservationForm()">
	       			<span aria-hidden="true">&times;</span>
	       		</button>
	   		</div>
	   		<form action="authorize_payment" method="post">
	   			<% List<String> listDates = (List<String>)request.getAttribute("listDates"); %>
	   			<div class="modal-body">
	   				<div class="row my-3 text-center" hidden>
	   					<div class="col-md-6">
		        			<label class="col-form-label col-form-label-sm" for="inputSmall">ID Event</label>
							<input id="id-event" class="form-control form-control-sm" type="text" id="inputSmall" name="id-event">
						</div>
						<div class="col-md-6">
							<input class="form-control form-control-sm" id="event-name" name="event-name" hidden>
						</div>
					</div>
	   				<div class="row my-3 text-center">
	   					<div class="col-md-6">
		        			<label class="col-form-label col-form-label-sm" for="inputSmall">Number Of people</label>
							<input class="form-control form-control-sm" type="number" placeholder="Enter the number of people here" id="nbr-people" name="nbr-people-input" onchange onpropertychange  onkeyuponpaste oninput="calculate_price()" required>
						</div>
						<div class="col-md-6">
		        			<label class="col-form-label col-form-label-sm" for="inputSmall">Date</label>
		        			<input type="text" name="date-input" class="form-control datepicker" autocomplete="off" required>
						</div>
					</div>
					<div class="row my-3 text-center">
	   					<div class="col-md-6">
		        			
						</div>
						<div class="col-md-6">
		        			
						</div>
					</div>
					<div class="row my-3 text-center">
	   					<div class="col-md-6">
		        			<label class="col-form-label col-form-label-sm" for="inputSmall">Address</label>
							<input class="form-control form-control-sm" type="text" placeholder="Enter the adress here" id="inputSmall" name="address-input" required>
						</div>
						<div class="col-md-6">
		        			<label class="col-form-label col-form-label-sm" for="inputSmall">Calculated Price</label>
							<input class="form-control form-control-sm" type="text" id="price-reservation" name="price-reservation-input">
						</div>
					</div>
	       		</div>
	   			<div class="modal-footer">
	        		<button class="btn btn-primary" type="submit" name="reservation-details">Confirm Reservation</button>
	   			</div>
	   		</form>
	   	</div>
	</div>
</div>

<script src="js/user-home.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.js"></script>
<script  type="text/javascript">
	//datePicker.min = new Date().toISOString().split("T")[0];
    var disableDates1 ="<%=listDates%>";
    disableDates1=disableDates1.replace("[", "");
    disableDates1=disableDates1.replace("]", "");
    var disableDates2 = disableDates1.split(",", '<%=listDates.size()%>');
    for (var i in disableDates2){
   	  disableDates2[i]=disableDates2[i].replace(" ", "")
   	}
          
    $('.datepicker').datepicker({
    	format: 'yyyy-mm-dd',
    	orientation: "bottom",
    	todayHighlight: true,
        beforeShowDay: function(date){
            dmy = date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
            if(disableDates2.indexOf(dmy) != -1){
                return false;
            }
            else{
                return true;
            }
        },
        startDate: new Date(),
        container: '.modal-body'
    });
    
</script>