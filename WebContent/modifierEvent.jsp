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
 <c:forEach items="${eventList}" var="e" >
<form action="Offre" method="POST">
<input type="text" class="form-control" id="theme" value="${e.id}" name="id" hidden="true">
<input type="text" class="form-control" id="theme" value="${e.theme}" name="theme" hidden="true">
<input type="text" class="form-control" id="theme" value="${e.id_evenement}" name="id_evenement" hidden="true">
 <%-- <div class="form-group">
    <label for="exampleFormControlSelect1">Theme</label>
    
    <select class="form-control" id="exampleFormControlSelect1" name="theme" value="${e.theme}">
  
      <option>Birthday</option>
      <option>Baby Shower</option>
      <option>Gender Reveal Party</option>
      <option>Wedding Party</option>
      <option>Graduation Party</option>
    </select>
    
  </div> --%>
    <%-- <div class="form-group">
      <label for="email">Theme:</label>
      <input type="text" class="form-control" id="theme" value="${e.theme}" name="theme" >
    </div> --%>
     <div class="form-group">
     <img src="dataImage?id=${e.id}" width="50px" height="50px" class="img" alt="">
     </div>
    <div class="form-group">
      <label >Nombre de personnes:</label>
      <input type="text" class="form-control" value="${e.nbr_personne}" name="nbr_personne" >
    </div>
    <div class="form-group">
      <label >Price:</label>
      <input type="text" class="form-control" id="price" value="${e.price} " name="price" >
    </div>
     
 
  <br>
    <div class="form-group">
    <button type="submit" name="modifierEvent" class="btn btn-primary">Submit</button>
    </div>

  </form>
   </c:forEach>
</div>
</body>
</html>