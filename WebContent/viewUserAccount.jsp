<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file = "layout.jsp" %>
<head>
<meta charset="UTF-8">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>View Account</title>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box
}
body {
    font-family: 'Poppins', sans-serif;
    background-color: #ffeaf1
}
.wrapper {
    padding: 30px 50px;
    border: 1px solid #ddd;
    border-radius: 15px;
    margin: 10px auto;
    max-width: 600px
}
h4,h1 {
    letter-spacing: -1px;
    font-weight: 400
  
}
.img {
    width: 70px;
    height: 70px;
    border-radius: 6px;
    object-fit: cover
}
#img-section p,
#deactivate p {
    font-size: 12px;
    color: #777;
    margin-bottom: 10px;
    text-align: justify
}
#img-section b,
#img-section button,
#deactivate b {
    font-size: 14px
}
label {
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 500;
    color: #777;
    padding-left: 3px
}
.form-control {
    border-radius: 10px
}
input[placeholder] {
    font-weight: 500
}
.form-control:focus {
    box-shadow: none;
    border: 1.5px solid #4f262f
}
select {
    display: block;
    width: 100%;
    border: 1px solid #ddd;
    border-radius: 10px;
    height: 40px;
    padding: 5px 10px
}
select:focus {
    outline: none
}
.button {
    background-color: #fff;
    color: #4f262f
}
.button:hover {
    background-color: #0779e4;
   color: #4f262f
}
.btn-primary {
    background-color: #4f262f
     border: 1.5px solid #4f262f
     color: #4f262f
}
.danger {
    background-color: #fff;
    color: #e20404;
    border: 1px solid #ddd
}
.danger:hover {
    background-color: #e20404;
    color: #fff
}
@media(max-width:576px) {
    .wrapper {
        padding: 25px 20px
    }
    #deactivate {
        line-height: 18px
    }
}
</style>
</head>
<body>

	<div class="wrapper bg-white mt-sm-5">
    <h4 class="pb-4 border-bottom">Account settings</h4>
	
    <form action="AccountServlet" method="post" id="profile" enctype="multipart/form-data">
      	<div class="d-flex align-items-start py-3 border-bottom"> <img src="userImage?id_user=${currentUserProfile.id}" class="img" alt="">
       
        <div class="form-group">
		 	<div class="input-group">
		 		<label class="file">
		 		<b>Profile Photo</b>
		 				<p>Upload a new profile photo</p>
					  <input type="file" id="file" aria-label="File browser example"  name="profilepictureUpdate">
					  <span class="file-custom"></span>
					  <button type="submit" name="updateProfilePicture" class="btn btn-primary" style="background:#4f262f;border-color:#4f262f;color:white;"><i class="fa fa-camera"></i></button>
					</label>
							 		
		 	</div>
		 </div>
    </div> 

    </form>
    <form action="AccountServlet" method="post">
    <div class="py-2 border-bottom">
        <div class="row py-2">
        	
            <div class="col-md-6"> <label for="firstnameViewAccount">First Name</label> <input type="text" name="firstnameAccount" class="bg-light form-control" value="${currentUserProfile.first_name}"> </div>
            <div class="col-md-6 pt-md-0 pt-3"> <label for="lastnameViewAccount">Last Name</label> <input type="text" name="lastnameAccount" class="bg-light form-control" value="${currentUserProfile.last_name}"> </div>
        </div>
        <div class="row py-2">
            <div class="col-md-6 pt-md-0 pt-3"> <label for="usernameViewAccount">Username</label> <input type="tel" name="usernameAccount" class="bg-light form-control" value="${currentUserProfile.username}"> </div>
            <div class="col-md-6"> <label for="emailViewAccount">Email Address</label> <input type="text" name="emailAccount" class="bg-light form-control" value="${currentUserProfile.email}"> </div>
        </div>
       
    </div>
     <div class="py-2 border-bottom">
        <div class="row py-2">
            <div class="col-md-6"> <label for="passwordViewAccount">Your Password</label> <input type="text" name="passwordAccount" class="bg-light form-control" value="${currentUserProfile.password}" disabled> </div>
            <div class="col-md-6 pt-md-0 pt-3"> <label for="new_passwordViewAccount">New Password</label> <input type="text" name="new_passwordViewAccount" class="bg-light form-control" > </div>
             <div class="col-md-6 pt-md-0 pt-3"> <label for="confirm_new_passwordViewAccount">Confirm New Password</label> <input type="text" name="confirm_new_passwordViewAccount" class="bg-light form-control"> </div>
        </div>
     
       
    </div>
    <div class="py-2 ">
       
        	<div class="py-3 pb-4 "> <button type="submit" name="updateProfileUser" class="btn btn-primary" style="background:#4f262f;border-color:#4f262f;color:white;">Save Changes</button> </div>
        
    </div>
    </form>
</div>

    <footer class="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-3 mb-md-0 mb-4">
						<h2 class="footer-heading"><a href="#" class="logo">Vacation Rental</a></h2>
						<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
						<a href="#">Read more <span class="fa fa-chevron-right" style="font-size: 11px;"></span></a>
					</div>
					<div class="col-md-6 col-lg-3 mb-md-0 mb-4">
						<h2 class="footer-heading">Services</h2>
						<ul class="list-unstyled">
              <li><a href="#" class="py-1 d-block">Map Direction</a></li>
              <li><a href="#" class="py-1 d-block">Accomodation Services</a></li>
              <li><a href="#" class="py-1 d-block">Great Experience</a></li>
              <li><a href="#" class="py-1 d-block">Perfect central location</a></li>
            </ul>
					</div>
					<div class="col-md-6 col-lg-3 mb-md-0 mb-4">
						<h2 class="footer-heading">Tag cloud</h2>
						<div class="tagcloud">
	            <a href="#" class="tag-cloud-link">apartment</a>
	            <a href="#" class="tag-cloud-link">home</a>
	            <a href="#" class="tag-cloud-link">vacation</a>
	            <a href="#" class="tag-cloud-link">rental</a>
	            <a href="#" class="tag-cloud-link">rent</a>
	            <a href="#" class="tag-cloud-link">house</a>
	            <a href="#" class="tag-cloud-link">place</a>
	            <a href="#" class="tag-cloud-link">drinks</a>
	          </div>
					</div>
					<div class="col-md-6 col-lg-3 mb-md-0 mb-4">
						<h2 class="footer-heading">Subcribe</h2>
						<form action="#" class="subscribe-form">
              <div class="form-group d-flex">
                <input type="text" class="form-control rounded-left" placeholder="Enter email address">
                <button type="submit" class="form-control submit rounded-right"><span class="sr-only">Submit</span><i class="fa fa-paper-plane"></i></button>
              </div>
            </form>
            <h2 class="footer-heading mt-5">Follow us</h2>
            <ul class="ftco-footer-social p-0">
              <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><span class="fa fa-facebook"></span></a></li>
              <li class="ftco-animate"><a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><span class="fa fa-instagram"></span></a></li>
            </ul>
					</div>
				</div>
			</div>
			<div class="w-100 mt-5 border-top py-5">
				<div class="container">
					<div class="row">
	          <div class="col-md-6 col-lg-8">

	            <p class="copyright mb-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
	  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
	  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
	          </div>
	          <div class="col-md-6 col-lg-4 text-md-right">
	          	<p class="mb-0 list-unstyled">
	          		<a class="mr-md-3" href="#">Terms</a>
	          		<a class="mr-md-3" href="#">Privacy</a>
	          		<a class="mr-md-3" href="#">Compliances</a>
	          	</p>
	          </div>
	        </div>
				</div>
			</div>
		</footer>
    
 
</body>
</html>