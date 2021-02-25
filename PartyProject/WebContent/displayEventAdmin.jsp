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
        <th>Theme</th>
        <th>Nombre de personne</th>
        <th>Prix</th>
        <th>image</th>
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
        <td><img src="dataImage?id=${e.id}" width="60px" height="60px"/> </td>
        
        <td>
         <form action="Offre" method="POST">
         <div class="form-group">
             <input name="id" type="hidden" class="form-control" value="${e.id}">
             </div>
             <button value="" style="border: none;background:transparent;" name="afficherUnEvent" type="submit" data-toggle="tooltip" title="Edit" class="pd-setting-ed"><i class="fa fa-pencil-square-o" style="font-size:20px" aria-hidden="true"></i></button>
            
		</form>  
        </td>
        <td>
         <form action="Offre" method="POST">
         <div class="form-group">
             <input name="idx" type="hidden" class="form-control" value="${e.id}">
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