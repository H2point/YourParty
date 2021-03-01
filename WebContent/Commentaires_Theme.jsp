<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@ include file = "layout.jsp" %>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>All Comments</title>
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
    background-color: #4a5054;;
    border-color: #a88734 #9c7e31 #846a29;
    color: black;
    border-width: 1px;
    border-style: solid;
    border-radius: 13px;
    width: 50%
}
body {
    background-color: white
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
    border: #4a5054;;
    background-color: #4a5054;;
    border-radius: 5px;
    padding: 20px
}</style>
</head>
<body>


					 <div class="container">
        						<div class="row">
					   		 
								
					    			 
					    				<c:forEach items="${commentsOFtheme}" var="r">
					    					
					    					
					    					<div class="col-sm-20 col-md-30 col-12 pb-50">
					    					<div class="comment mt-4 float-left" style="width: 1300px"> <img src="userImage?id_user=${r.id_user}"  class="rounded-circle" width="40" height="40">
							                    <h4>${r.username}</h4> <span>-at  ${r.date_comment}</span><span>- Likes : ${r.nbr_likes}</span> <br>
							                    <p>${r.comment}</p>
							              	
							              		<form action="CommentServlet" method="get">
													                <input type="hidden" name="idComment" value="${r.id_comment}" />
													               <input type="hidden" name="idTheme" value="${r.id_theme}" />
													   	            <button type="submit" name="like" id="like" class="btn btn-primary" onsubmit="return false"><i class="fa fa-heart"></i></button>
													              		
												</form>
												<c:set var="themeEvent" value="${r.id_theme}"/>
							                </div>
								      			</div>	
											   
					      				</c:forEach>
					      			
					  			
					  			<%
											    String i = (String)pageContext.getAttribute("themeEvent");   
											  %>
					   		
					 		
					   	</div><br><br>
					   <!-- >p--><!--%=i%--> <!--/p> -->
					  			<a href="Event?nom=<%=i%>&afficherUnEventIndex=" class="btn btn-primary">Close Comments</a>
					</div>
   			<br><br>
	<!-- Footer -->
 <%@ include file = "footer.jsp" %>


</body>
</html>