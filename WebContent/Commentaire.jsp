<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- <form action="CommentServlet" method="post">
                    <div class="form-group">
                        <h4>Leave a comment</h4> 
                        <label for="message">Message</label> 
                        <input name="comment" type="text"  cols="30" rows="5" class="form-control" style="background-color:white;"></input>
                    </div>
                    <div class="form-group"> 
                    <button type="submit" name="addComment" class="btn">Post Comment</button> 
                    </div>
                 
</form>  -->

	<form action="uploadImage" method="post" enctype="multipart/form-data">

		<input type="file" name="image" required="required" /><br />
		<br /> <input type="submit" value="Upload" />
	</form>
	<h3>${message}</h3>
	
	<form action="ViewImage" method="get">
	 <button type="submit"  class="btn">VOIRRR</button>

	</form>
	

</body>
</html>