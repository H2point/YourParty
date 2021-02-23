<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name="google-signin-client_id" content="472186934776-9h9f5kqu9rbp1ttvovop1ircc59husc0.apps.googleusercontent.com">
<title>Insert title here</title>
</head>
<body>

  
<% 
 session.invalidate(); //destroy session
 
 response.sendRedirect("login.jsp");
%>
</body>
</html>