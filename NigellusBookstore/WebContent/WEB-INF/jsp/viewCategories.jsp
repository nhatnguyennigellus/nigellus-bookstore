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
		<div class="form-group form-group-sm">
			<label for="selCate" class="col-sm-2 control-label"> Select
				category:</label>
			<div class="col-xs-6">
				<form:select id="selCate" path="selectedCategory.id"
					onchange="submitForm()" class="form-control">

					<form:options items="${model.categories}" itemValue="id"
						itemLabel="name" />
				</form:select>

			</div>
		</div>
		<div class="col-md-8">

			<h2>BOOKS</h2>
		</div>
		<div class="col-md-12">
			<a href="addCategory">Add Category</a> | <a href="toAddBook">Add
				Book</a>
			<c:choose>

				<c:when test="${model.selectedCategory.books.size() == 0 }">
					<font color="red">No data</font>
				</c:when>
				<c:otherwise>
					<table width="100%" class="table table-striped">
						<tr>
							<th>Title</th>
							<th>Author</th>
							<th>Price</th>
							<th></th>
							<th>Category</th>
							<th>Action</th>
						</tr>
						<c:forEach items="${model.selectedCategory.books }" var="book">
							<tr>
								<td>${book.title}</td>
								<td>${book.authorList}</td>
								<td>${book.unitPrice}</td>

								<td><img class="img-thumbnail" alt="Nigellus Bookstore"
									width="100" src="<c:url value="${book.imageUrl}" />" /> <br />
									<c:url var="url" value="toChangeImage">
										<c:param name="id" value="${book.id}" />
										<c:param name="title" value="${book.title}" />
										<c:param name="author" value="${book.authorList}" />
									</c:url> <a href="${url }">Edit Image</a></td>
								<td><c:forEach items="${book.categories }" var="category">
									${category.name}<br />
									</c:forEach></td>
								<td><a href="deleteBook?id=${book.id }"
									onclick="confirm('Are you sure?')"> Delete</a> 
									<c:url var="url" value="toUpdateBook">
										<c:param name="id" value="${book.id}" />
									</c:url> <a href="${url}">Update</a></td>
							</tr>
						</c:forEach>
					</table>
				</c:otherwise>

			</c:choose>

		</div>

	</form:form>
</body>
<script type="text/javascript">
	function submitForm() {
		document.getElementById('mainForm').submit();
	}
</script>
</html>