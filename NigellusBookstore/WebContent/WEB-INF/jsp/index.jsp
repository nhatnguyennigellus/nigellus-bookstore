<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/site.css' />">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nigellus Bookstore - Homepage</title>
</head>
<body>
	<table border="0" cellpadding="2" cellspacing="2" align="center"
		width="95%">
		<tr>
			<td height="30" colspan="2"
				style="background-color: #FFDFDF; color: #FF5500"><jsp:include
					page="/WEB-INF/jsp/header.jsp"></jsp:include></td>
		</tr>
		<tr>
			<td height="1000" style="background-color: #C0E9FF" width="20%"><jsp:include
					page="/WEB-INF/jsp/menu.jsp"></jsp:include></td>
			<td height="1000" style="background-color: #E7E7E7">
				<h1>Welcome</h1>
			</td>
		</tr>
		<tr>
			<td height="50" colspan="2"
				style="background-color: #00A2FF; color: #FFFFFF;"><jsp:include
					page="/WEB-INF/jsp/footer.jsp"></jsp:include></td>
		</tr>
	</table>
</body>
</html>