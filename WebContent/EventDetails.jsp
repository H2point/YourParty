<%@page import="com.party.models.Evenement"%>
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
    background-color: #f3f4f7
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
    border: #4a5054;
    background-color: #4a5054;
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
h4 {
    color: white;
    font-weight: bold
}
h1 {
    color: #4f262f;
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
    border: #4f262f;
    background-color: #4f262f;
    border-radius: 5px;
    padding: 20px
}</style>
</head>
<body>

<!--  p>Message:-->
<!--%= request.getAttribute("themeGetting")%> ITS ME--> <!-- ITS ME</p> -->

		<section class="ftco-section bg-white">
    	<div class="container" style="background-color:white;border-color:white;">
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
         <div class="col-md-6 wrap-about ftco-animate" >
	          <div class="heading-section">
	          	<div class="pl-md-5">
		            <h2 class="mb-2">What we offer</h2>
	            </div>
	          </div>
	          <div class="pl-md-5">
							<p>We offer various menu items to match the theme you chose and offer you the best party you could ever dream of with tastful food</p>
							<div class="row">
		            
		            	<c:forEach items="${menuList}" var="m">
   			
         						    
              				<div class="services-2 col-lg-6 d-flex w-100">
					              <div class="icon d-flex justify-content-center align-items-center">
					            		<span class="flaticon-diet-1"></span>
					              </div>
					              <div class="media-body pl-3">
					                <h3 class="heading">${m.item_menu}</h3>
					                <p>${m.description_item_menu}</p>
					              </div>
					            </div>  
         			 </c:forEach> 
		
		          </div>  
						</div>
					</div>
				</div>
			</div>    
       
    	
    </section>
  
		<!-- Comments -->
		<section>
		
		
    <div class="container bg-light">
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
                        <h4>Leave a comment</h4><input name="comment" type="text"  cols="30" rows="5" class="form-control" style="background-color:white;border-color:#4f262f;"></input>
                    </div>
                    <div class="form-group"> <button type="submit" name="addComment"  class="btn btn-dark">Post Comment</button> </div>
                     <div class="form-group"><button type="submit" id="test" name="showComment" class="btn btn-dark">Show all comments</button></div>
				</form>
				
				 
            </div>
           
            
        </div>
    </div>
    <br><br>
</section>



<!-- Footer -->
 <%@ include file = "footer.jsp" %>
   	<!-- p>Message: -->
	<!-- %= session.getAttribute("username")%> ITS ME --><!-- %= session.getAttribute("currentTheme")%>wdjhwejk --><!-- %= request.getParameter("nom")%>huyjhjkjk</p> -->
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
  </script>EventDetails
	 
</body>
</html>