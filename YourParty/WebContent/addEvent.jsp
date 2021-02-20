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
<%@ include file = "sidenav.jsp" %>

<div class="main">

<div class="container">
  <h1>ADD EVENT INFOS</h1>
  <form action="AdminServlet">
    <div class="form-group">
      <label for="email">Theme:</label>
      <input type="text" class="form-control" id="theme" placeholder="theme" name="theme" >
    </div>
    <div class="form-group">
      <label >Nombre de personnes:</label>
      <input type="text" class="form-control" placeholder="Nombre de personnes" name="nbr_personne" >
    </div>
    <div class="form-group">
      <label >Price:</label>
      <input type="text" class="form-control" id="price" placeholder="Set a price" name="price" >
    </div>
    <div class="custom-file">
    <input type="file" name="file" class="custom-file-input" id="validatedCustomFile">
    <label class="custom-file-label" for="validatedCustomFile">Choose image...</label>
    <div class="invalid-feedback">Example invalid custom file feedback</div>
  </div>
  <br>
  <hr>
    <div class="form-group">
    <button type="submit" name="addEvent" class="btn btn-primary">Submit</button>
    </div>
   
  </form>
</div>
</div>
</body>
</html>