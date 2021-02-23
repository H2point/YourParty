<%@page import="com.party.models.Evenement"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.party.util.HibernateUtil"%>
<%@page import="java.io.*"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@ include file = "layout.jsp" %>

<head>
<meta charset="UTF-8">
<title>Details</title>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS -->
<style>
.navbar-nav {
    width: 100%
}

@media(min-width:568px) {
    .end {
        margin-left: auto
    }
}

@media(max-width:768px) {
    #post {
        width: 100%
    }
}

#clicked {
    padding-top: 1px;
    padding-bottom: 1px;
    text-align: center;
    width: 100%;
    background-color: #ecb21f;
    border-color: #a88734 #9c7e31 #846a29;
    color: black;
    border-width: 1px;
    border-style: solid;
    border-radius: 13px
}

#profile {
    background-color: unset
}

#post {
    margin: 10px;
    padding: 6px;
    padding-top: 2px;
    padding-bottom: 2px;
    text-align: center;
    background-color: #ecb21f;
    border-color: #a88734 #9c7e31 #846a29;
    color: black;
    border-width: 1px;
    border-style: solid;
    border-radius: 13px;
    width: 50%
}

body {
    background-color: black
}

#nav-items li a,
#profile {
    text-decoration: none;
    color: rgb(224, 219, 219);
    background-color: black
}

.comments {
    margin-top: 5%;
    margin-left: 20px
}

.darker {
    border: 1px solid #ecb21f;
    background-color: black;
    float: right;
    border-radius: 5px;
    padding-left: 40px;
    padding-right: 30px;
    padding-top: 10px
}

.comment {
    border: 1px solid rgba(16, 46, 46, 1);
    background-color: rgba(16, 46, 46, 0.973);
    float: left;
    border-radius: 5px;
    padding-left: 40px;
    padding-right: 30px;
    padding-top: 10px
}

.comment h4,
.comment span,
.darker h4,
.darker span {
    display: inline
}

.comment p,
.comment span,
.darker p,
.darker span {
    color: rgb(184, 183, 183)
}

h1,
h4 {
    color: white;
    font-weight: bold
}

label {
    color: rgb(212, 208, 208)
}

#align-form {
    margin-top: 20px
}

.form-group p a {
    color: white
}

#checkbx {
    background-color: black
}

#darker img {
    margin-right: 15px;
    position: static
}

.form-group input,
.form-group textarea {
    background-color: black;
    border: 1px solid rgba(16, 46, 46, 1);
    border-radius: 12px
}

form {
    border: 1px solid rgba(16, 46, 46, 1);
    background-color: rgba(16, 46, 46, 0.973);
    border-radius: 5px;
    padding: 20px
}</style>
</head>
<body>

<p>Message:
<%= request.getAttribute("themeGetting")%> ITS ME</p>

		<section class="ftco-section bg-light">
    	<div class="container">
    	<div class="row no-gutters">
    	<div class="col-md-6 wrap-about">
    	
    	<c:forEach items="${evenementList}" var="ev">
   
          <!-- div class="col-md-4 d-flex services align-self-stretch px-4 ftco-animate"> -->
            <!-- div class="d-block services-wrap text-center"> -->
            
              <div class="img img-2 mb-4">
              	<img class="img" height="600dp" src="evenementImage?id=${ev.id_event}" />
              	 
			</div>
              <h2>${ev.nameEvent}</h2>
                
                <p>Description :${ev.description}</p>
              
			 
               
              
            <!-- /div> -->      
          <!--/div>  -->
         
          
          
          </c:forEach> 
               
         </div>      
        </div>
    	</div>
    </section>
  
		<!-- Comments -->
		<section>
		
		
    <div class="container">
        <div class="row">
            	<div class="col-sm-5 col-md-6 col-12 pb-4">
                <h1>Reviews</h1>
                
                <c:forEach items="${reviewsList}" var="review" begin="0" end="3" step="1">
					    					
					    					
					    					
					    					<div class="comment mt-4 float-left" style="width: 600px"> <img src="userImage?id_user=${review.id_user}"  class="rounded-circle" width="40" height="40">
							                    <h4>${review.username}</h4> <span>-at  ${review.date_comment}</span><span>- Likes : ${review.nbr_likes}</span> <br>
							                    <p>${review.comment}</p>							              		
											
							                </div>
											   
					      				</c:forEach>
			</div>
            
            <div class="col-lg-4 col-md-5 col-sm-4 offset-md-1 offset-sm-1 col-12 mt-4">
                <form action="CommentServlet" method="post">
                    <div class="form-group">
                        <h4>Leave a comment</h4> <label for="message">Message</label> <input name="comment" type="text"  cols="30" rows="5" class="form-control" style="background-color:white;"></input>
                    </div>
                    <div class="form-group"> <button type="submit" name="addComment" id="post" class="btn">Post Comment</button> </div>
                     <div class="form-group"><button type="submit" id="test" name="showComment" class="btn btn-primary">Show all comments</button></div>
				</form>
				
				 
            </div>
           
            
        </div>
    </div>
    
</section>



<!-- Footer -->
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
   	<p>Message:
	<%= session.getAttribute("username")%> ITS ME<%= session.getAttribute("currentTheme")%>wdjhwejk<%= request.getParameter("nom")%>huyjhjkjk</p>
	  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
  <script type="text/javascript">
  	hideStuff();
  </script>
	 
</body>
</html>