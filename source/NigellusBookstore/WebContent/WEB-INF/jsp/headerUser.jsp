<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-12">
		<div style="padding: 5px 5px 5px 5px">
			<c:choose>
				<c:when test="${sessionScope.customer != null}">
				
					Welcome, <b> ${sessionScope.customer } </b> | <a href="logoutUser">Logout</a>
					| <a href="toEditProfile">Edit Profile</a> | <a
						href="toChangePassword">Change Password</a> | <a
						href="customerViewOrder">Order History</a> | <a href="viewCart">
						<img alt="Nigellus Bookstore" width="20"
						src="<c:url value="/resources/images/basket.png" />" /> Shopping
						Cart
					</a>
					<c:choose>
						<c:when test="${sessionScope.CART != null }">
							<font color="blue" style="font-weight: bold;">(${sessionScope.CART.size() })</font>
						</c:when>
						<c:otherwise>
							<font color="blue" style="font-weight: bold;">(0)</font>
						</c:otherwise>
					</c:choose>

				</c:when>
				<c:otherwise>
					<form action="loginUser" method="get" class="form-inline">
						<label>Login</label>
						<div class="form-group">
							<input id="user" placeholder="Username"
								class="form-control input-sm" name="user" />
						</div>
						<div class="form-group">
							<input id="pass" placeholder="Password" name="pass"
								type="password" class="form-control input-sm" />
						</div>
						<input class="btn btn-success btn-xs" name="submit" type="submit"
							value="Login" /> <input name="reset" type="reset" value="Reset"
							class="btn btn-danger btn-xs" /> <a href="forgotPassword">Forgot
							Password?</a> <a href="toRegister">Register</a>
					</form>

					<c:if test="${sessionScope.customerLoginErr != null}">
						<font color="red" style="font-style: bold">${sessionScope.customerLoginErr }</font>

					</c:if>

				</c:otherwise>
			</c:choose>
		</div>

	</div>

	<img alt="Nigellus Bookstore" width="100%"
		src="<c:url value="/resources/images/banner.gif"/>" />
</body>
</html>