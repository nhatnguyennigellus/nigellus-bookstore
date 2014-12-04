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
			<div style="background-color: #FFD3D3; padding: 10px 10px 10px 10px">
				Welcome, <b> ${sessionScope.customer } </b> <br /> <a
					href="logoutUser">Logout</a> <br /> <a href="toEditProfile">Edit
					Profile</a> <br /> <a href="toChangePassword">Change Password</a><br />
				<a href="customerViewOrder">Order History</a>

			</div>
			<div class="col-md-12"></div>
		</c:when>
		<c:otherwise>
			<div class="col-md-12">
				<div style="padding: 10px 10px 10px 10px;">
					<form action="loginUser" method="get">
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
							class="btn btn-danger btn-xs" />
					</form><a href="forgotPassword">Forgot Password?</a>
					<c:if test="${sessionScope.customerLoginErr != null}">
						<font color="red" style="font-style: bold">${sessionScope.customerLoginErr }</font>

					</c:if>

				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<div class="col-md-12">
		<div style="padding: 10px 10px 10px 10px">
			<label >Search</label>
			<form action="CustomerViewBooks" class="form-inline">
				<div class="form-group form-group-sm">
					<div class="col-md-12">
						<input id="key" placeholder="Title"
						 name="key" class="form-control input-sm" />
					</div>
				</div>
				<div class="form-group form-group-sm">
					<div class="col-md-12">
						<input id="author" placeholder="Author" 
						name="author" class="form-control input-sm" />
					</div>
				</div>
				<p>
				</p>
			</form>
			<p>
				<a href="index">Home</a>
			</p>
			<p>
				<a href="viewCart"> <img alt="Nigellus Bookstore" width="20"
					src="<c:url value="/resources/images/basket.png" />" /></a>
				<c:choose>
					<c:when test="${sessionScope.CART != null }">
						<font color="blue" style="font-weight: bold;">(${sessionScope.CART.size() })</font>
					</c:when>
					<c:otherwise>
						<font color="blue" style="font-weight: bold;">(0)</font>
					</c:otherwise>
				</c:choose>

			</p>
			<p>
				<a href="CustomerViewBooks?key=&author=">Our library</a>
			</p>
			<p>
				<a href="CustomerViewCategories">Categories</a>
			</p>
			
			
		</div>
	</div>
</body>
</html>