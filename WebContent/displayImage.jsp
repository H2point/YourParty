<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@ include file = "layout.jsp" %>

<c:forEach items="${commentList}" var="c">

<hr>
<h3>${c.id_comment}</h3>
<img src="dataImage?id=${c.id_comment}"/>
<hr>
</c:forEach>
</body>
</html>