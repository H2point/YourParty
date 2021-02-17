<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
  <form action="EvenementServlet" >
    <div class="form-group">
      <label for="email">Name Event:</label>
      <input type="text" class="form-control" id="nameEvent" placeholder="name Event" name="nameEvent" >
    </div>
    <div class="form-group">
      <label for="email">Name Event:</label>
      <input type="text" style="height:100px !important" class="form-control" placeholder="Description" name="description" >
    </div>
     
   
    
    <div class="custom-file">
    <input type="file" name="file" class="custom-file-input" id="validatedCustomFile">
    <label class="custom-file-label" for="validatedCustomFile">Choose image...</label>
    <div class="invalid-feedback">Example invalid custom file feedback</div>
  </div>
  <br>
  <hr>
    <div class="form-group">
    <button type="submit" name="addEvenement" class="btn btn-primary">Submit</button>
    </div>
   
  </form>
</div>
</div>
</body>
</html>