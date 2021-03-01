<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
	<link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/reservationForm.css">
    <style>
    	.dropdown:hover > .dropdown-menu {
		    display: block;
		}
		.dropdown > .dropdown-toggle:active {
		    /*Without this, clicking will make it sticky*/
		    pointer-events: none;
		}
    </style>
  </head>
  <body>
		<div class="wrap">
			<div class="container">
				<div class="row justify-content-between">
						
						<div class="col d-flex justify-content-end">
							<div class="social-media">
				    		<p class="mb-0 d-flex">
				    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a>
				    			<a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a>
				    		</p>
			        </div>
						</div>
				</div>
			</div>
		</div>
		
	<nav class="navbar navbar-expand-lg navbar-light ftco_navbar bg-light ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	    	<a class="navbar-brand" href="welcome">Party<span>Setter</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="fa fa-bars"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	        	<li class="nav-item active"><a href="home" class="nav-link">Home</a></li>
	        	
	        	
	         <li class="nav-item">
			          		<a href="offers" class="nav-link"><i class="fa fa-bullhorn fa-lg" aria-hidden="true"></i>&nbsp; Sales</a>
			          	</li>
			            <li class="nav-item dropdown">
			            	
			            	<%
          if(null == session.getAttribute("id")){
        	  
              %>
         <a  href="login" class="nav-link"><i class="fa fa-user fa-lg" aria-hidden="true"></i>&nbsp; Account</a>     
          
          
          <% }
          else {
        	  
          %>
          <a class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user fa-lg" aria-hidden="true"></i>&nbsp; Account</a>
			            	<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	       <a class="dropdown-item" href="AccountServlet">View Account</a>
			<a class="dropdown-item" href="MyReservations">View reservations</a>
	      
           <%
          }
          %>
					         
					        
						</li>
						<li class="nav-item">
			          		<a href="contactUs" class="nav-link"><i class="fa fa-envelope fa-lg" aria-hidden="true"></i>&nbsp; Contact Us</a>
			          	</li>
	        </ul>
	        
	        </div>
	        <% if (request.getAttribute("id")!=null) {
          int id = (Integer)request.getAttribute("id");
          session.setAttribute("id",id);}
          %>
          
          
         <!--  <li class="nav-item"><a href="about.html" class="nav-link">About</a></li> -->
          
          
          <%
          if(null == session.getAttribute("id")){
        	  
              %>
          <a href="login.jsp" class='btn btn-dark' style="color:white">login</a>
          
          <% }
          else {
        	  
          %>
	       <a href="logout.jsp" class='btn btn-dark' style="color:white">logout</a>
	      
           <%
          }
          %>
	        
	       
	      </div>
	      
	      
	      
	    </div>
	  </nav>
    <!-- END nav -->
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script> 
</body>
