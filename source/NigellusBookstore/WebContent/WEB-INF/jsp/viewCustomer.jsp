<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer</title>
</head>
<body>
	<div class="col-md-12">
		<h2>CUSTOMER LIST</h2>
		<table class="table table-striped" width="100%">
			<tr>
				<th>No</th>
				<th>Username</th>
				<th>Fullname</th>
				<th>Address</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Order History</th>
			</tr>
			<c:forEach items="${sessionScope.CUSTOMERLIST }" var="customer"
				varStatus="no">
				<tr>
					<td>${no.count }</td>
					<td>${customer.username }</td>
					<td>${customer.fullname}</td>
					<td>${customer.address}</td>
					<td>${customer.email}</td>
					<td>${customer.phone}</td>

					<td><c:url var="url" value="viewOrderByCustomer">
							<c:param name="username" value="${customer.username}" />
						</c:url> <a href="${url }">Order History</a></td>

				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>