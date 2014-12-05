<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nigellus Bookstore - Homepage</title>
</head>
<body>
	<div class="col-md-12">
		<h1>Administrator page</h1>
		<c:if test="${sessionScope.admin == null }">
			<div class="col-md-6">You have to login as administrator</div>
		</c:if>
		<c:if test="${sessionScope.admin != null }">
			<div class="col-md-6">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">MANAGEMENT</h3>
					</div>
					<div class="panel-body">
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
			</div>
			<div class="col-md-6">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">REPORT</h3>
					</div>
					<div class="panel-body">Underconstructor</div>
				</div>
			</div>
		</c:if>
	</div>

</body>
</html>