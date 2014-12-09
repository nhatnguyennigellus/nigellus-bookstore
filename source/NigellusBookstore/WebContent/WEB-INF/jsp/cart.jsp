<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-6">
		<h1>CART ITEMS</h1>
	</div>

	<div class="col-md-12">
		<table class="table table-striped" width="95%">
			<tr>
				<th>No</th>
				<th>Book Title</th>
				<th>Unit Price</th>
				<th>Quantity</th>
				<th>Amount</th>
				<th>Action</th>
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
						<td><input name="quantity" type="number" min=1
							value="${item.quantity}" class="form-control input-sm"/></td>
						<td align="right">${item.book.unitPrice * item.quantity}</td>
						<td><input type="submit" value="Submit"
							class="btn btn-success btn-sm" /> <c:url var="urlRmvCart"
								value="removeFromCart">
								<c:param name="bookId" value="${item.book.id}" />
							</c:url> <a href="${urlRmvCart}"> 
								<input type="button" class="btn btn-danger btn-sm" value="Remove">
							</a></td>
					</form>


				</tr>

			</c:forEach>
			<c:if
				test="${sessionScope.CART == null or sessionScope.CART.size() == 0 }">
				<td colspan="2" style="color: red; font-weight: bold;">No item
					in cart</td>
			</c:if>
			<tr>
				<td colspan="4" align="right">Total:</td>
				<td colspan="2"
					style="color: green; font-weight: bold; font-size: 20px"
					align="right">${sessionScope.totalAmount}</td>

			</tr>

		</table>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<a href="toSubmitOrder"> <input type="button"
				class="btn btn-success" value="Submit" />
			</a> <a href="CustomerViewBooks?key=&author="> <input type="button"
				class="btn btn-primary" value="Continue" />
			</a>
		</div>
	</div>
</body>
</html>