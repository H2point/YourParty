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
        <th>Username</th>
        <th>Theme</th>
        <th>Comment</th>
        <th>Likes Number</th>
        <th>Date of Comment</th>
        <th>Delete</th>
      </tr>
    </thead>
    
    <tbody>
    <c:forEach items="${commentsList}" var="cl">
      <tr>
        <td>${cl.username}</td>
        <td>${cl.id_theme}</td>
        <td>${cl.comment} </td>
        <td>${cl.nbr_likes} &#9825;</span></td>
        <td>${cl.date_comment} </td>
        <td>
         <form action="CommentsAdmin" method="POST">
         <div class="form-group">
             <input name="id_comment_trash" type="hidden" class="form-control" value="${cl.id_comment}">
          </div>
           
             <button name="supprimerComment" style="border: none;background:transparent;" data-toggle="tooltip" title="Trash" class="pd-setting-ed"><i class="fa fa-trash-o" style="font-size:20px;color:red" aria-hidden="true"></i></button>
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