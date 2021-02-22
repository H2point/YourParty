<style type="text/css">
      /* Set the size of the div element that contains the map */
      #map {
        height: 400px;
        /* The height is 400 pixels */
        width: 100%;
        /* The width is the width of the web page */
      }
</style>

<div class="modal" id="google-maps-modal">
	<div class="modal-dialog" role="document">
	   	<div class="modal-content">
	     	<div class="modal-header">
	       		<h5 class="modal-title" id="google-maps-modal-title">Google Maps</h5>
	       		<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeGoogleMapsModal()">
	       			<span aria-hidden="true">&times;</span>
	       		</button>
	   		</div>
	   		
   			<div class="modal-body" style="height: 500px;">
   				<div id="map"></div>
       		</div>
   			
	   	</div>
	</div>
</div>
