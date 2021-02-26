<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>YOUR PARTY ! MAKE IT SPECIA!</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
    
     <link rel="stylesheet" href="css/sidenav.css">
  </head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<title>Admin panel</title>
</head >
<body>
<div class="sidenav">
 <br><br><br><br>
<form action="Offre" method="get">
<button  value="AfficherEvent" name="afficherEvent" type="submit" data-toggle="tooltip" title="" style="background:transparent;color:grey;border: none;width:150px;height:50px;font-size: 17px;">List offers</button>
  <hr/>
 </form>
  <form action="Offre" method="get">
<button  name="addOffer" type="submit" data-toggle="tooltip" title="" style="background:transparent;color:grey;border: none;width:150px;height:50px;font-size: 17px;">Add Offer</button>

 </form>

  <hr>
 <form action="Paiement" method="get">
<button  value="AfficherEvent" name="listPayment" type="submit" data-toggle="tooltip" title="" style="background:transparent;color:grey;border: none;width:150px;height:50px;font-size: 17px;">Transactions</button>
  <hr>
 </form>
 


  
  <form action="Event" method="get">
<button  value="AfficherEvenement" name="afficherEvenement" type="submit" data-toggle="tooltip" title="" style="background:transparent;color:grey;border: none;width:150px;height:50px;font-size: 17px;">Liste events</button>

 </form>


  <hr>
  <a type="button" href="addEvenement.jsp">Add Event</a>
  
  <hr>
  <form action="Reservations" method="POST">
				<button  value="viewPendingReservations" name="viewPendingReservations" type="submit" data-toggle="tooltip" title="" style="background:transparent;color:grey;border: none;width:150px;height:50px;font-size: 17px;">View Pending Reservations</button>
			</form>
			<hr>
		    <form action="Reservations" method="POST">
				<button  value="viewFinishedReservations" name="viewFinishedReservations" type="submit" data-toggle="tooltip" title="" style="background:transparent;color:grey;border: none;width:150px;height:50px;font-size: 17px;">View Finished Reservations</button>
			</form>
		    <hr>
		    		    <hr>
<form action="MenuAdmin" method="get">
<button  value="afficherMenus" name="afficherMenus" type="submit" data-toggle="tooltip" title="" style="background:transparent;color:grey;border: none;width:150px;height:50px;font-size: 17px;">List of Menus</button>
  <hr/>
 </form>
  <form action="MenuAdmin" method="get">
<button  name="addMenu" type="submit" data-toggle="tooltip" title="" style="background:transparent;color:grey;border: none;width:150px;height:50px;font-size: 17px;">Add a Menu Item</button>

 </form>

  <hr>
<form action="CommentsAdmin" method="get">
<button  value="afficherComments" name="afficherComments" type="submit" data-toggle="tooltip" title="" style="background:transparent;color:grey;border: none;width:150px;height:50px;font-size: 17px;">List of Comments</button>
  <hr/>
 </form>
		    <hr>


  
</div>
</body>
</html>