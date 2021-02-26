<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file = "layout.jsp" %>
<head>
<meta charset="UTF-8">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Review</title>
<style type="text/css">

body {
    background:  #4a5054 ;
    
}

.card {
    border: none;
    max-width: 450px;
    border-radius: 15px;
    margin: 150px 0 150px;
    padding: 35px;
    padding-bottom: 20px !important
}

.heading {
    color: #fd7792;
    font-size: 24px;
    font-weight: 500
}
h4{
	color: #4f262f;
}
img {
    transform: translate(160px, -10px)
}

img:hover {
    cursor: pointer
}

.text-warning {
    font-size: 12px;
    font-weight: 500;
    color: #edb537 !important
}

#cno {
    transform: translateY(-10px)
}

input {
    border-bottom: 1.5px solid #E8E5D2 !important;
    font-weight: bold;
    border-radius: 0;
    border: 0
}

.form-group input:focus {
    border: 0;
    outline: 0
}

.col-sm-5 {
    padding-left: 90px
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

.btn:focus {
    box-shadow: none
} 
</style>
</head>
<body>
	<div class="container-fluid">
	
    <div class="row d-flex justify-content-center">
    	
        <div class="col-sm-12">
        
            <div class="card mx-auto">
            	<h4>Please Review Before Paying</h4>
                <p class="heading">Transaction Details</p>
                <form class="card-details" action="execute_payment" method="post">
                   <input type="hidden" name="paymentId" value="${param.paymentId}" />
                <input type="hidden" name="PayerID" value="${param.PayerID}" />
                 <div class="form-group mb-0">
                        <p>Description</p> <input type="text" class="bg-light form-control" name="card-num" value="${transaction.description}" size="15" id="cno" minlength="10" maxlength="15" disabled> 
                    </div>
                    <div class="form-group">
                        <p>Total</p> <input type="text" class="bg-light form-control" name="name" value="${transaction.amount.total} USD" size="15" id="cno" minlength="10" maxlength="15" disabled>
                    </div>
                    <div class="form-group pt-2">
                        <div class="row d-flex">
                            
                            <div class="col-sm-5 pt-0"><input type="submit" value="Pay Now" class="btn btn-primary" style="background:#4f262f;border-color:#4f262f;color:white;"/> </div>
                        </div>
                    </div>
                </form>
                
            </div>
        </div>
    </div>
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
