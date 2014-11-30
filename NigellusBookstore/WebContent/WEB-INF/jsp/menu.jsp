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
	
	<c:choose>
		<c:when test="${sessionScope.admin != null}">
			<div style="background-color: #FFA6A6; padding: 10px 10px 10px 10px">
				Welcome, ${sessionScope.admin } | <a href="logout">Logout</a>
			</div>
			
			<p>
				<a href="viewBooks?key=">Our library</a>
			</p>
			<p>
				<a href="viewCategories">Categories</a>
			</p>
			<p>
				<a href="viewCustomers">Customers</a>
			</p>

		</c:when>
		<c:otherwise>
			<div style="background-color: #FFA6A6; padding: 10px 10px 10px 10px">
				<form action="login" method="get">
					<table width="200">
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
			</div>
			<c:if test="${sessionScope.adminLoginErr != null}">
				<font color="red" style="font-style: bold">${sessionScope.adminLoginErr }</font>

			</c:if>
		</c:otherwise>
	</c:choose>



</body>
</html>