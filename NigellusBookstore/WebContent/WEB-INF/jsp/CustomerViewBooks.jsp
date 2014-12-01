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
	<form action="CustomerViewBooks">
		Title: <input name="key" /> &nbsp; Author: <input name="author" /> 
		<p><input type="submit" value="Search" /></p>
	</form>
	<br />
	<c:if test="${sessionScope.loginRequire != null }">
		<font color="red">${sessionScope.loginRequire }</font>
	</c:if>
	<form:form id="mainForm" method="post" commandName="model">

		<table width="95%">

			<c:forEach items="${model.books }" var="book">
				<tr>
					<td id="data" align="center" width="35%"><img
						alt="Nigellus Bookstore" width="150"
						src="<c:url value="${book.imageUrl}" />" /></td>

					<td id="data">
						<h2>${book.title}</h2> <i>${book.authorList}</i><br /> <u>Category:</u>
						<c:forEach items="${book.categories }" var="category">
									${category.name}&nbsp;
								</c:forEach>
						<h2 style="color: green; font-weight: bold; text-align: right;">${book.unitPrice}
							VND</h2> <c:url var="urlCart" value="addToCart">
							<c:param name="bookId" value="${book.id}" />
						</c:url>
						<div style="text-align: right;">
							<img alt="Nigellus Bookstore" width="30"
								src="<c:url value="/resources/images/basket.png" />" /> <a
								href="${urlCart}">Add to cart</a>
						</div>

					</td>
				</tr>
			</c:forEach>
		</table>
		<br />
		<a href="toAddBook">Add Book</a>


	</form:form>
</body>
<script type="text/javascript">
	function submitForm() {
		document.getElementById('mainForm').submit();
	}
</script>
</html>