<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Our products</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/site.css' />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/jquery-ui.css' />" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/style.css' />" />
</head>
<body>
	<form:form id="mainForm" method="post" commandName="model">
		<strong>Choose the category:</strong>
		<form:select path="selectedCategory.id" onchange="submitForm()">
			<form:options items="${model.categories}" itemValue="id"
				itemLabel="name" />
		</form:select>
		<br />


		<br />
		<c:choose>
			<c:when test="${model.selectedCategory.books.size() == 0 }">
				<font color="red">No data</font>
			</c:when>
			<c:otherwise>
				<table width="100%">

					<c:forEach items="${model.selectedCategory.books }" var="book">
						<tr>
							<td id="data" align="center" width="35%"><img alt="Nigellus Bookstore"
								width="150" src="<c:url value="${book.imageUrl}" />" /></td>

							<td id="data">
								<h2>${book.title}</h2> <i>${book.authorList}</i><br /> <u>Category:</u>
								<c:forEach items="${book.categories }" var="category">
									${category.name}&nbsp;
								</c:forEach>
								<h2 style="color: green; font-weight: bold; text-align: right;">${book.unitPrice} VND</h2>

								<c:url var="urlCart" value="addToCart">
									<c:param name="bookId" value="${book.id}" />
								</c:url>
								<div style="text-align: right;">
									<img alt="Nigellus Bookstore" width="30"
										src="<c:url value="/resources/images/basket.png" />" /> 
										<a href="${urlCart}">Add to cart</a>
								</div>

							</td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>



	</form:form>
	<a href="addCategory">Add Category</a> |
	<a href="toAddBook">Add Book</a>
</body>
<script type="text/javascript">
	function submitForm() {
		document.getElementById('mainForm').submit();
	}
</script>
</html>