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
		<h2>ORDER DETAILS</h2><a href="javascript:history.go(-1)">Back</a>
		<form action="updateOrderStatus?id=${param.id }" method="post" role="form">
			<div class="form-group form-group-sm">
				Order No: <b>${param.id}</b>
			</div>
			<div class="form-group form-group-sm">
				Customer: <b>${param.fullname }</b>
			</div>
			<div class="form-group form-group-sm">
				Address: <b>${param.address}</b>
			</div>
			<div class="form-group form-group-sm">
				Email: <b>${param.email}</b>
			</div>
			<div class="form-group form-group-sm">
				Phone: <b>${param.phone}</b>
			</div>
		
			<div class="form-group form-group-sm">
				<div class="col-xs-4">
				<select name="status" class="form-control">
					<option value="Pending"
						<c:if test="${param.status eq 'Pending'}">selected</c:if>>Pending</option>
					<option value="Submitted"
						<c:if test="${param.status eq 'Submitted'}">selected</c:if>>Submitted</option>
					<option value="Delivered"
						<c:if test="${param.status eq 'Delivered'}">selected</c:if>>Delivered</option>
				</select> 
				</div><input value="Update status" class="btn btn-default" type="submit" />
			</div>
		</form>

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
					<td>${detail.book.unitPrice}</td>
					<td>${detail.quantity}</td>
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