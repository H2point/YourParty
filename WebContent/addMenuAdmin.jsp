<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
<%@ include file = "layout.jsp" %>
<%@ include file = "sidenav.jsp" %>

<div class="main">

<div class="container">
  <h1>ADD AN ITEM TO A MENU</h1>
  <form action="MenuAdmin" method="post">
    
     <div class="form-group">
		  <label for="menuTheme">Theme :</label>
		  <select class="form-control" id="exampleFormControlSelect1" name="dropdownMenu">
    
    <c:forEach items="${evenementList}" var="ev">
    <option  value="${ev.nameEvent}">${ev.nameEvent}</option>
       </c:forEach>
  
    </select>
	</div> 
    <div class="form-group">
      <label >Name of the Menu Item :</label>
      <input type="text" class="form-control" id="itemAddMenu" placeholder="Enter a menu item" name="itemAddMenu" >
    </div>
    <div class="form-group">
      <label >Description of the Menu Item :</label>
      <input type="text" class="form-control" id="descriptionAddMenu" placeholder="Enter a description" name="descriptionAddMenu" >
    </div>
    
  <br>
  <hr>
    <div class="form-group">
    <button type="submit" name="addMenuItem" class="btn btn-primary">Submit</button>
    </div>
   
  </form>
</div>
</div>
</body>
</html>