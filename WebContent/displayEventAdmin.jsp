<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<title>Admin panel</title>
</head >
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 160px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  
  color: #818181;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  padding: 0px 10px;
}


</style>
<body >
<div class="sidenav">
<form action="AdminServlet" method="POST">
<button onclick="myFunction()" value="AfficherEvent" name="afficherEvent" type="submit" data-toggle="tooltip" title="" style="background:transparent;color:grey;border: none;width:150px;height:50px;font-size: 17px;">Liste events</button>
   
    
   
 </form>
  
  <hr>
  <a href="addEvent.jsp">Add event</a>
  <hr>
  <a href="#">View reservations</a>
    <hr>
  
</div>
<div class="main container" id="event">


  
   <div class="row" >
   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
   <table class="table">
    <thead>
      <tr>
        <th>Theme</th>
        <th>Nombre de personne</th>
        <th>Prix</th>
        <th>Modifier</th>
        <th>Delete</th>
      </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${eventList}" var="e">
      <tr>
        <td>${e.theme}</td>
        <td>${e.nbr_personne}</td>
        <td>${e.price} </td>
        <td>
         <form action="AdminServlet" method="POST">
         <div class="form-group">
             <input name="id" type="hidden" class="form-control" value="${e.id}">
             </div>
             <button value="" style="border: none;background:transparent;" name="afficherUnEvent" type="submit" data-toggle="tooltip" title="Edit" class="pd-setting-ed"><i class="fa fa-pencil-square-o" style="font-size:20px" aria-hidden="true"></i></button>
            
		</form>  
        </td>
        <td>
         <form action="AdminServlet" method="POST">
         <div class="form-group">
             <input name="id" type="hidden" class="form-control" value="${e.id}">
          </div>
           
             <button name="supprimerEvent" style="border: none;background:transparent;" data-toggle="tooltip" title="Trash" class="pd-setting-ed"><i class="fa fa-trash-o" style="font-size:20px;color:red" aria-hidden="true"></i></button></a>
		</form>  
        </td>
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
</body>
</html>