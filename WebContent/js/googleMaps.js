// Initialize and add the map
/*function initMap() {
  // The location of Uluru
  const kenitra = { lat: 34.272564585522886, lng: -6.558288381240794 };
  // The map, centered at Uluru
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 4,
    center: kenitra,
  });
  // The marker, positioned at Uluru
  const marker = new google.maps.Marker({
    position: kenitra,
    map: map,
  });
}*/
var idButton;
function openGoogleMapsModal(clicked){
	idButton = clicked;
	document.getElementById("google-maps-modal").style.display = "block";
	initMap();
}
function closeGoogleMapsModal(){
	document.getElementById("google-maps-modal").style.display = "none";
}
function initMap() {
	const map = new google.maps.Map(document.getElementById("map"), {
		zoom: 8,
	    center: { lat: -34.397, lng: 150.644 },
	});
  	const geocoder = new google.maps.Geocoder();
  	geocodeAddress(geocoder, map);
}

function geocodeAddress(geocoder, resultsMap) {
	const address = document.getElementById(idButton).value;
  	geocoder.geocode({ address: address }, (results, status) => {
    if (status === "OK") {
      resultsMap.setCenter(results[0].geometry.location);
      new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location,
      });
    } else {
      alert("Geocode was not successful for the following reason: " + status);
    }
  });
}