function openOffreReservationForm(clicked) {
	document.getElementById("offre-reservation-form").style.display = "block";
	console.log(clicked+"/theme");
	document.getElementById("offer-id-event").value = document.getElementById(clicked+"/theme").value;
	document.getElementById("nbr-people-offer").value = document.getElementById(clicked+"/nbr_personne").value;
	document.getElementById("price-reservation").value = document.getElementById(clicked+"/price").value;
	document.getElementById("price-reservation").readOnly = true;
	
}
function closeOffreReservationForm() {
	document.getElementById("offre-reservation-form").style.display = "none";
}