<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Our products</title>
</head>
<body>
	<div class="col-md-12">
		<h2>ORDER HISTORY</h2>
		<a href="javascript:history.go(-1)">Back</a>
		<table class="table table-striped" width="100%">
			<tr>
				<th>No</th>
				<th>Order date</th>
				<th>Total Amount</th>
				<th>Address</th>
				<th>Phone</th>
				<th>Email</th>
				<th>Status</th>
				<th>View Details</th>
			</tr>
			<c:forEach items="${sessionScope.ORDERHISTORY }" var="order"
				varStatus="no">
				<tr>
					<td>${no.count }</td>
					<td><fmt:formatDate value="${order.orderDate}" pattern="dd.MM.yyyy HH:mm:ss" /></td>
					<td>${order.totalAmount}</td>
					<td>${order.address}</td>
					<td>${order.phone}</td>
					<td>${order.email}</td>
					<td><font color="<c:if test="${order.status == 'Delivered'}">green</c:if>
				<c:if test="${order.status == 'Pending'}">#C41307</c:if>
				<c:if test="${order.status == 'Submitted'}">blue</c:if>">
									${order.status} </font><br/>
									<c:if test="${order.status == 'Pending'}">
									<c:url value="resendEmail" var="urlResend">
										<c:param name="id">${order.id }</c:param>
									</c:url>
									<a href="toConfirmOrder?id=${order.id }">Confirm order</a><br/>
									<a href="${urlResend }">Resend confirm Email</a>
									</c:if></td>
					<td><c:url var="url" value="customerViewDetails">
							<c:param name="id" value="${order.id}" />
							<c:param name="total" value="${order.totalAmount}" />
						</c:url> <a href="${url }">Detail</a></td>

				</tr>
			</c:forEach>
		</table>
	</div>
</body>
<script type="text/javascript">
	function submitForm() {
		document.getElementById('mainForm').submit();
	}
</script>
</html>