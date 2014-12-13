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
	<div class="col-md-12">
		<div style="padding: 10px 10px 10px 10px">
			<h3>SUBMIT ORDER</h3>
			<form action="order" method="get" enctype="multipart/form-data"
				id="frmOrder" role="form">
				<input type="hidden" name="username"
					value="${sessionScope.customer }" />
				<div class="form-group">
					<label for="fullname" class="col-sm-6 control-label">Fullname</label>
					<div class="col-sm-8">
						<font color="red"><input name="fullname" id="fullname" class="form-control"
							value="${sessionScope.CUSTOMER.getFullname() }" /></font>
					</div>
				</div>
				<div class="form-group">
					<label for="address" class="col-sm-6 control-label">Address</label>
					<div class="col-sm-8">
						<font color="red"><input name="address" id="address" class="form-control"
							value="${sessionScope.CUSTOMER.getAddress() }" /></font>
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="col-sm-6 control-label">Email</label>
					<div class="col-sm-8">
						<font color="red"><input name="email" id="email" class="form-control"
							value="${sessionScope.CUSTOMER.getEmail() }" /></font>
					</div>
				</div>
				<div class="form-group">
					<label for="phone" class="col-sm-6 control-label">Phone</label>
					<div class="col-sm-8">
						<font color="red"><input name="phone" id="phone" class="form-control "
							value="${sessionScope.CUSTOMER.getPhone() }" /></font>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							<label> <input type="checkbox" id="chkAgree" /> I have
								read and accept the Terms and Conditions
							</label>
						</div>

					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input name="btnSubmitOrder" id="btnSubmitOrder" type="submit"
							value="Submit order" disabled="disabled" class="btn btn-success" />
						<a href="viewCart">Back to cart</a>
					</div>
				</div>

			</form>


			<div class="col-md-6">
				<h2>CART ITEMS</h2>
			</div>

			<table class="table table-striped" width="100%">
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
				<c:if test="${sessionScope.customer != null }">
					<tr class="success">
						<td colspan="4" align="right">Membership discount (-5%):</td>
						<td colspan="2" align="right">-${sessionScope.totalAmount * 5 / 100}</td>

					</tr>

				</c:if>
				<tr class="warning">
					<td colspan="4" align="right">Shipping fee (10%):</td>
					<td colspan="2" align="right">${sessionScope.totalAmount * 10 / 100}</td>

				</tr>
				<c:if test="${sessionScope.promote != null }">
					<tr class="success">
						<td colspan="4" align="right">Promotion discount <c:if
								test="${sessionScope.promote.discountType eq 'Fee' }">VND
						</c:if> <c:if test="${sessionScope.promote.discountType eq 'Percent' }">%
						</c:if>
						</td>
						<td colspan="2" align="right"><c:if
								test="${sessionScope.promote.discountType eq 'Fee' }">
							-${sessionScope.promote.discountAmount }
						</c:if> <c:if test="${sessionScope.promote.discountType eq 'Percent' }">
							-${sessionScope.totalAmount * sessionScope.promote.discountAmount / 100}
						</c:if></td>

					</tr>
				</c:if>
				<tr>
					<td colspan="4" align="right">Total:</td>
					<td colspan="2"
						style="color: green; font-weight: bold; font-size: 20px"
						align="right">
						<c:choose>
							<c:when test="${sessionScope.customer != null }">
								<c:if test="${sessionScope.promote == null}">
						<c:set var="total" scope="application" value="${sessionScope.totalAmount * 105 / 100}"/>
								</c:if>
								<c:if test="${sessionScope.promote.discountType eq 'Fee' }">
						<c:set var="total" scope="application" 
						value="${sessionScope.totalAmount * 105 / 100 - sessionScope.promote.discountAmount}"/>
						
								</c:if>
								<c:if test="${sessionScope.promote.discountType eq 'Percent' }">
						<c:set var="total" scope="application" 
						value="${sessionScope.totalAmount * 105 / 100 - sessionScope.totalAmount * sessionScope.promote.discountAmount / 100}" />
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${sessionScope.promote == null}">
						<c:set var="total" scope="application" 
						value="${sessionScope.totalAmount * 110 / 100}" />
								</c:if>
								<c:if test="${sessionScope.promote.discountType eq 'Fee' }">
						<c:set var="total" scope="application" 
						value="${sessionScope.totalAmount * 110 / 100 - sessionScope.promote.discountAmount}" />
								</c:if>
								<c:if test="${sessionScope.promote.discountType eq 'Percent' }">
						<c:set var="total" scope="application" 
						value="${sessionScope.totalAmount * 110 / 100 - sessionScope.totalAmount * sessionScope.promote.discountAmount / 100}" />
								</c:if>

							</c:otherwise>
						</c:choose>
						<c:if test="${total <= 0}">
							0
						</c:if>
						<c:if test="${total > 0}">
							${total }
						</c:if>
						
						
						</td>

				</tr>


			</table>
			<c:if test="${sessionScope.promote == null }">
				<div class="panel panel-info">
					<div class="panel-body">
						If you have a promotion code, please enter below and click
						"Verify"
						<form action="verifyCode" class="form-inline">
							<label for="proCode">Promotion Code</label>
							<div class="form-group">
								<input name="proCode" id="proCode" class="form-control input-sm" />
							</div>
							<input name="btnVerifyCode" id="btnVerifyCode" type="submit"
								value="Verify" class="btn btn-success btn-sm" />
						</form>
						<font color="red">${sessionScope.promoteError }</font>
					</div>
				</div>
			</c:if>
			<br />
		</div>
	</div>

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