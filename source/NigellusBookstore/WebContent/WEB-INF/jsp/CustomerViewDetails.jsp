<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Our products</title>
</head>
<body>
	<div class="col-md-12">
		<h2>ORDER DETAILS</h2>
		<a href="javascript:history.go(-1)"><img alt="Nigellus Bookstore" width="20px"
					src="<c:url value="/resources/images/go-back.png" />" /> Back</a>
					<br /> Order No: <b>${param.id}</b><br />
		Customer: <b>${sessionScope.customer }</b>
		<table class="table table-striped" width="100%">
			<tr>
				<th>No</th>
				<th>Book Title</th>
				<th>Unit Price</th>
				<th>Quantity</th>
				<th>Amount</th>
			</tr>
			<c:forEach items="${sessionScope.DETAILS }" var="detail"
				varStatus="no">
				<tr>
					<td>${no.count}</td>
					<td>${detail.book.title}</td>
					<td align="right">${detail.book.unitPrice}</td>
					<td align="right">${detail.quantity}</td>
					<td align="right">${detail.book.unitPrice * detail.quantity}</td>

				</tr>
			</c:forEach>
			<c:forEach items="${sessionScope.PROMS }" var="prom" varStatus="no">
				<tr class="info">
					<td colspan="4" align="right">${prom.description}</td>
					<td colspan="2"	align="right">${prom.value}</td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="4" align="right">Total:</td>
				<td colspan="2"
					style="color: green; font-weight: bold; font-size: 20px"
					align="right">${param.total}</td>

			</tr>
		</table>
	</div>
</body>
<script type="text/javascript">
	function submitForm() {
		document.getElementById('mainForm').submit();
	}
</script>
</html>