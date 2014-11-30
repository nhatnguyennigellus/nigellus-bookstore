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
		<c:when test="${sessionScope.customer != null}">
			<div style="background-color: #FFA6A6; padding: 10px 10px 10px 10px">
				Welcome, <b> ${sessionScope.customer } </b> | <a href="logoutUser">Logout</a>
				| <a href="toEditProfile">Edit Profile</a> | <a
					href="toChangePassword">Change Password</a>
			</div>

			<p>
				<a href="viewCategories">Your orders</a>
			</p>
			<p>
				<a href="viewCategories">Your cart</a>
			</p>

		</c:when>
		<c:otherwise>
			<div style="background-color: #FFA6A6; padding: 10px 10px 10px 10px">
				<form action="loginUser" method="get">
					<table width="200" style="background-color: #FFA6A6">
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
						<tr>
							<td colspan="2">Not a member? <a href="toRegister">Register</a></td>
						</tr>
					</table>
				</form>

				<c:if test="${sessionScope.customerLoginErr != null}">
					<font color="red" style="font-style: bold">${sessionScope.customerLoginErr }</font>

				</c:if>

			</div>
		</c:otherwise>
	</c:choose>
	<p>
		<a href="index">Home</a>
	</p>
	<p>
		<a href="CustomerViewBooks?key=">Our library</a>
	</p>
	<p>
		<a href="CustomerViewCategories">Categories</a>
	</p>
	<p>
		<a href="viewCategories">About</a>
	</p>
	<p>
		<a href="viewCategories">Contact</a>
	</p>


</body>
</html>