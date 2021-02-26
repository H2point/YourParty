<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- just a test  --> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload to database</title>
</head>
<body>
		<form action="UserProfilePictureServlet" method="post" enctype="multipart/form-data">
			<table border="0">
				<tr>
					<td>Enter your Username: </td>
					<td><input type="text" name="nameTest" size="50"/> </td>
				</tr>
				<tr>
					<td>Upload your Photo: </td>
					<td><input type="file" name="profilepictureTest" size="50"/> </td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="upload" name="upload"> </td>
				</tr>
			</table>
													              		
		</form>
	
</body>
</html>