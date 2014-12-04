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
			<div style="padding: 10px 10px 10px 10px">
				<div class="col-md-12">
					<p>
						<a href="admin">Home</a>
					</p>
					<p>
						<a href="viewBooks?key=&author=">Books</a>
					</p>
					<p>
						<a href="viewCategories">Categories</a>
					</p>
					<p>
						<a href="viewCustomers">Customers</a>
					</p>
					<p>
						<a href="viewOrder">Order</a>
					</p>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="col-md-12">
				<div style="padding: 10px 10px 10px 10px">
					<form action="login" method="get" role="form">
						<div class="form-group">
							<input id="user" placeholder="Username" 
							class="form-control input-sm" name="user" />
						</div>
						<div class="form-group">
						<input id="pass" placeholder="Password" 
							name="pass" type="password" class="form-control input-sm" />
						</div>
						<input class="btn btn-success btn-xs" name="submit" type="submit"
							value="Login" /> <input name="reset" type="reset" value="Reset"
							class="btn btn-danger btn-xs" />
					</form>
				</div>
				<c:if test="${sessionScope.adminLoginErr != null}">
					<font color="red" style="font-style: bold">${sessionScope.adminLoginErr }</font>

				</c:if>
			</div>
		</c:otherwise>
	</c:choose>



</body>
</html>