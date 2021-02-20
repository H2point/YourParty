var pricePer10;

function hideStuff(){
	document.getElementById("reservation-form").style.display = "none";
}

function openReservationForm(clicked) {
	var title;
	if(clicked == 1){
		title = "Birthday";
		document.getElementById("price-reservation").value = "1000";
		pricePer10 = 1000
	}	
	else if(clicked == 2){
		title = "Baby Shower";
		document.getElementById("price-reservation").value = "1500";
		pricePer10 = 1500
	}
	else if(clicked == 3){
		title = "Gender Reveal Party";
		document.getElementById("price-reservation").value = "900";
		pricePer10 = 900
	}
	else if(clicked == 4){
		title = "Wedding Party";
		document.getElementById("price-reservation").value = "2000";
		pricePer10 = 2000;
	}
	else if(clicked == 5){
		title = "Graduation Party";
		document.getElementById("price-reservation").value = "700";
		pricePer10 = 700;
	}
	document.getElementById("reservation-form-title").innerHTML = "Make a reservation for a " + title;
	document.getElementById("reservation-form").style.display = "block";
	document.getElementById("id-event").readOnly = true;
	document.getElementById("id-event").value = clicked;
	document.getElementById("nbr-people").value = "10";
	document.getElementById("price-reservation").readOnly = true;
	
}
function closeReservationForm() {
	document.getElementById("reservation-form").style.display = "none";
}

function calculate_price(){
	document.getElementById("price-reservation").value = (document.getElementById("nbr-people").value * pricePer10)/10;
}


