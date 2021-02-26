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
        <th>Name of Item</th>
        <th>Description of Item</th>
        <th>Modifier</th>
        <th>Delete</th>
      </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${menuList}" var="ml">
      <tr>
        <td>${ml.theme_menu}</td>
        <td>${ml.item_menu}</td>
        <td>${ml.description_item_menu} </td>
        <td>
         <form action="MenuAdmin" method="POST">
         <div class="form-group">
             <input name="id_menu" type="hidden" class="form-control" value="${ml.id_menu}">
             </div>
             <button value="" style="border: none;background:transparent;" name="afficherUnMenu" type="submit" data-toggle="tooltip" title="Edit" class="pd-setting-ed"><i class="fa fa-pencil-square-o" style="font-size:20px" aria-hidden="true"></i></button>
            
		</form>  
        </td>
        <td>
         <form action="MenuAdmin" method="POST">
         <div class="form-group">
             <input name="id_menu_trash" type="hidden" class="form-control" value="${ml.id_menu}">
          </div>
           
             <button name="supprimerMenu" style="border: none;background:transparent;" data-toggle="tooltip" title="Trash" class="pd-setting-ed"><i class="fa fa-trash-o" style="font-size:20px;color:red" aria-hidden="true"></i></button>
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