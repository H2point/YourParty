<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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

<section class="merci" style="height: 100vh">
<img src="images/merci.png" alt="Girl in a jacket" width="100%" height="100%">
<div style="position: absolute; top: 50%;left: 50%; transform: translate(-50%, -50%);">

<br>
<% String email=(String)session.getAttribute("email");
              %>
<form action="Thank">  
<input name="to" type="hidden" class="form-control" value="<%=email%>">
<button type="submit" data-toggle="tooltip" title="" style="background:#e3c652;margin-left:45%;color:white;border: none;width:100px;height:40px;font-size: 15px;margin-top:15px;cursor: pointer;" hidden>Clicker ici si vous souhaitez recevoir votre recu par mail</button>         
 
  </form>
  </div>
</section>
</body>
</html>