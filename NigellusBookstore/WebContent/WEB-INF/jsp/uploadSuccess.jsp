<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${sessionScope.ChangeImgSuccess != null}">
		<font color="green">${sessionScope.ChangeImgSuccess }</font>
	</c:if>
	<c:if test="${sessionScope.ChangeImgError != null}">
		<font color="red">${sessionScope.ChangeImgError }</font>
	</c:if>
	<a href="viewBooks?key=">Back</a>
</body>
</html>