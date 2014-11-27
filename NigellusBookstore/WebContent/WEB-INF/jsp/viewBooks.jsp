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
	<form:form id="mainForm" method="post" commandName="model">
		
		<table border="1" width="100%">
			<tr>
				<th>Title</th>
				<th>Author</th>
				<th>Price</th>
				<th></th>
				<th>Action</th>
			</tr>
			<c:forEach items="${model.books }" var="book">
				<tr>
					<td>${book.title}</td>
					<td>${book.authorList}</td>
					<td>${book.unitPrice}</td>
					<td><img alt="Nigellus Bookstore" width="100"
						src="<c:url value="${book.imageUrl}" />" /></td>
					<td>
						<!-- 
						<a href="/book-online/book.do?action=deleteBook&bookId=${book.id}"
							onclick="confirm('Are you sure?')">Delete</a>
						<c:url var="url" value="update.jsp">
							<c:param name="id" value="${book.id}" />
							<c:param name="title" value="${book.title}" />
							
						</c:url>
						<a href="${url}">Update</a> -->
					</td>
				</tr>
			</c:forEach>
		</table>



	</form:form>
</body>
<script type="text/javascript">
	function submitForm() {
		document.getElementById('mainForm').submit();
	}
</script>
</html>