<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<p>
		<a href="index">Home</a>
	</p>
	<c:choose>
		<c:when test="${sessionScope.admin != null}">
		Welcome, ${sessionScope.admin } | <a href="logout">Logout</a>
			<p>
				<a href="viewBooks?key=">Our library</a>
			</p>
			<p>
				<a href="viewCategories">Categories</a>
			</p>
			<c:if test="${sessionScope.adminLoginErr != null}">
				<font color="red" style="font-style: bold">${sessionScope.adminLoginErr }</font>
			
			</c:if>
			
		</c:when>
		<c:otherwise>
			<form action="login" method="get">
				<table width="200" border="1">
					<tr>
						<td>Username</td>
						<td><input name="user" /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input name="pass" type="password" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input name="submit"
							type="submit" value="Login" /> <input name="reset" type="reset"
							value="Reset" /></td>
					</tr>
				</table>
			</form>
		</c:otherwise>
	</c:choose>



</body>
</html>