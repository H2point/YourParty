<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Reset Password</title>
    <link rel="stylesheet" href="/css/style.css" >
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
<!-- CSS -->
<style>
body {
     background-position: center;
     background-color: #f3f4f7;
     background-repeat: no-repeat;
     background-size: cover;
     color: #505050;
     font-family: "Rubik", Helvetica, Arial, sans-serif;
     font-size: 14px;
     font-weight: normal;
     line-height: 1.5;
     text-transform: none
 }
 
h2{
	color:#fd7792;
}
 .forgot {
     background-color: #4a5054;
     padding: 12px;
     color : white;
     border-raduis: 30px solid #4a5054
 }
 .padding-bottom-3x {
     padding-bottom: 72px !important
 }
 .card-footer {
     background-color: #fff
 }
 .btn {
     font-size: 13px
 }
 .form-control:focus {
     color: #495057;
     background-color: #fff;
     border-color: #fd7792;
     outline: 0;
     box-shadow: 0 0 0 0px #28a745
 }
</style>
</head>
<body>
<%@ include file = "layout.jsp" %>
   	<div class="container padding-bottom-3x mb-2 mt-5">
	    <div class="row justify-content-center">
	        <div class="col-lg-8 col-md-10">
	            <div class="forgot">
	                <h2>Forgot your password?</h2>
	                <p>Change your password in three easy steps. This will help you to secure your password!</p>
	                <ol class="list-unstyled">
	                    <li><span><i class="fa fa-pencil"></i> </span>Enter your email address below.</li>
	                    <li><span><i class="fa fa-send"></i> </span>Our system will send you an email with your new password</li>
	                    <li><span><i class="fa fa-user"></i> </span>Use this password to login and change it later</li>
	                </ol>
	            </div>
	            <form id="resetForm" action="reset_password" method="post" class="card mt-4">
	                <div class="card-body">
	                    <div class="form-group"> <label for="email-for-pass">Enter your email address</label> <input class="form-control" type="text" name="email" id="email"><small class="form-text text-muted">Enter the email address you used during the registration. Then we'll email a link to this address.</small> </div>
	                </div>
	                <div class="card-footer"> <button class="btn btn-success" id="resetPassword" name="resetPassword" type="submit">Get New Password</button></div>
	            </form>
	            <form id="resetForm2" action="reset_password" method="post" class="card mt-4">
	            		<button class="btn btn-primary" name="backLoginReset" type="submit">Back to Login</button>
	            </form>
	        </div>
	    </div>
	</div>
<script type="text/javascript">
		$(document).on("submit", "#resetForm", function(event) {
		    var $form = $(this);
			 $.post($form.attr("post"), $form.serialize(), function(response) { 
		    	;
		    });
		    alert('<%=session.getAttribute("message")%>');
	        var elt = document.getElementsByName("email")
	        elt[0].value = "";
		    
		    event.preventDefault(); // Important! Prevents submitting the form.
		});
	
</script>

	
</body>
</html>