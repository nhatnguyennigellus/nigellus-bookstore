<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="order" method="get" enctype="multipart/form-data"
		id="frmOrder">
		<table width="70%">
			<input type="hidden" name="username"
				value="${sessionScope.customer }" />
			<tr>
				<td>Fullname</td>
				<td><input name="fullname"
					value="${sessionScope.CUSTOMER.getFullname() }" />*</td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input name="address"
					value="${sessionScope.CUSTOMER.getAddress() }" />*</td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input name="email"
					value="${sessionScope.CUSTOMER.getEmail() }" />*</td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input name="phone"
					value="${sessionScope.CUSTOMER.getPhone() }" />*</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="checkbox"
					id="chkAgree" /> I have read and accept the Terms and
					Conditions <input name="btnSubmitOrder" id="btnSubmitOrder"
					type="submit" value="Submit order" disabled="disabled" /> <a href="viewCart">Back
						to cart</a></td>
			</tr>
		</table>

	</form>
	<table border="1" width="100%">
		<tr>
			<th>No</th>
			<th>Book Title</th>
			<th>Unit Price</th>
			<th>Quantity</th>
			<th>Amount</th>
		</tr>
		<c:forEach items="${CART}" var="item" varStatus="no">
			<tr>
				<form action="addToCart" method="post">
					<input type="hidden" name="bookId" value="${item.book.id }" /> <input
						type="hidden" name="title" value="${item.book.title }" /> <input
						type="hidden" name="price" value="${item.book.unitPrice }" />
					<td>${no.count}</td>
					<td>${item.book.title}</td>
					<td>${item.book.unitPrice}</td>
					<td>${item.quantity}</td>
					<td align="right">${item.book.unitPrice * item.quantity}</td>

				</form>


			</tr>

		</c:forEach>
		<tr>
			<td colspan="4" align="right">Total:</td>
			<td colspan="2"
				style="color: green; font-weight: bold; font-size: 20px"
				align="right">${sessionScope.totalAmount}</td>

		</tr>

	</table>

</body>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-ui.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-1.10.2.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.validate.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.additional-methods.js' />"></script>
<script type="text/javascript">
	$('#chkAgree').click(function() {

		$('#btnSubmitOrder').attr("disabled", !this.checked);

	});

	$(function() {
		$("#frmOrder")
				.validate(
						{
							rules : {
								fullname : {
									required : true,
									rangelength : [ 1, 50 ]

								},
								address : {
									required : true,
									rangelength : [ 1, 70 ]
								},
								email : {
									required : true,
									rangelength : [ 1, 50 ],
									email : true
								},
								phone : {
									required : true,
									rangelength : [ 1, 20 ],
									digits : true
								}
							},
							messages : {
								fullname : {
									required : "Fullname is required!",
									rangelength : "Fullname must be between 1 and 50 characters long."
								},
								email : {
									required : "Email is required!",
									rangelength : "Email must be between 1 and 50 characters long.",
									email : "Invalid email!"
								},
								phone : {
									required : "Phone is required!",
									rangelength : "Phone must be between 1 and 20 characters long!",
									digits : "Please enter digit character!"
								},
								address : {
									required : "Address is required!",
									rangelength : "Address must be between 1 and 70 characters long."
								},
							},
						})
	});
</script>
</html>