var pricePer10;

function hideStuff(){
	document.getElementById("reservation-form").style.display = "none";
}

var id_event;
function openReservationForm(clicked) {
	id_event = clicked;
	document.getElementById("id-event").value = clicked;
	document.getElementById("nbr-people").value = "10";
	document.getElementById("price-reservation").value = document.getElementById(clicked+"/pricePer10").value;
	document.getElementById("reservation-form-title").innerHTML = "Make a reservation for a " + document.getElementById(clicked+"/nameEvent").value;
	document.getElementById("event-name").value = document.getElementById(clicked+"/nameEvent").value;
	console.log(document.getElementById("event-name").value);
	document.getElementById("reservation-form").style.display = "block";
	document.getElementById("id-event").readOnly = true;	
	document.getElementById("price-reservation").readOnly = true;
	
}
function closeReservationForm() {
	document.getElementById("reservation-form").style.display = "none";
}

function calculate_price(){
	document.getElementById("price-reservation").value = (document.getElementById("nbr-people").value * document.getElementById(id_event+"/pricePer10").value)/10;
}
