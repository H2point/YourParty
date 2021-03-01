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
        <th>Nom d'evenement</th>
        <th>Description</th>
        <th>image</th>
        <th>Delete</th>
      </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${evenementList}" var="ev">
      <tr>
        <td>${ev.nameEvent}</td>
        <td>${ev.description}</td>
        <td><img src="evenementImage?id=${ev.id_event}" width="60px" height="60px"/> </td>
        
         
         <td>
         <form action="Event" method="POST">
         <div class="form-group">
             <input name="id_event" type="hidden" class="form-control" value="${ev.id_event}">
          </div>
           
             <button name="supprimerEvenement" style="border: none;background:transparent;" data-toggle="tooltip" title="Trash" class="pd-setting-ed"><i class="fa fa-trash-o" style="font-size:20px;color:red" aria-hidden="true"></i></button></a>
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