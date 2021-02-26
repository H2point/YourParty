<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>
<%@ include file = "layout.jsp" %>
<%@ include file = "sidenav.jsp" %>

<div class="main ">
 <c:forEach items="${menuList}" var="ml">
<form action="MenuAdmin" method="POST">
<input type="text" class="form-control" id="theme" value="${ml.id_menu}" name="id_menu" hidden="true">
    <div class="form-group">
      <label for="email">Theme:</label>
      <input type="text" class="form-control" id="theme" value="${ml.theme_menu}" name="theme" >
    </div>
    <div class="form-group">
      <label >Name of Item:</label>
      <input type="text" class="form-control" value="${ml.item_menu}" name="nameItemMenu" >
    </div>
    <div class="form-group">
      <label >Description of Item:</label>
      <input type="text" class="form-control" id="price" value="${ml.description_item_menu} " name="descriptionItemMenu" >
    </div>
    
 
  <br>
    <div class="form-group">
    <button type="submit" name="modifierMenu" class="btn btn-primary">Submit</button>
    </div>

  </form>
   </c:forEach>
</div>
</body>
</html>