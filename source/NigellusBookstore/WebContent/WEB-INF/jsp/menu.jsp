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
	<c:if test="${sessionScope.admin != null}">
		<div style="padding: 10px 0px 10px 0px">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-heading"><b>MANAGEMENT</b></div>
					<div class="panel-body">
						<p>
							<a href="index">Homepage</a>
						</p>
						<p>
							<a href="admin">Admin page</a>
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
						<p>
							<a href="viewPromotions">Coupons
							</a>
						</p>
					</div>
				</div>
			</div>

		</div>
	</c:if>

	<c:if test="${sessionScope.adminLoginErr != null}">
		<font color="red" style="font-style: bold">${sessionScope.adminLoginErr }</font>

	</c:if>

</body>
</html>