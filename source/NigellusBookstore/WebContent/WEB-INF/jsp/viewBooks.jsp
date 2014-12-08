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
	<div style="background-color: #F3F781; padding: 5px 5px 5px 10px">
		<h3>
			SEARCH BOOK <img alt="Nigellus Bookstore"
				src="<c:url value="/resources/images/search_icon.png" />" />
		</h3>
		<form action="viewBooks" class="form-horizontal">
			<div class="form-group">
				<label for="key" class="col-sm-2 control-label">Title:</label>
				<div class="col-sm-6">
					<input id="key" name="key" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label for="author" class="col-sm-2 control-label">Author:</label>
				<div class="col-sm-6">
					<input id="author" name="author" class="form-control" />
				</div>
			</div>

			<p>
			<div class="form-group">

				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" value="Search" class="btn btn-primary" />
				</div>
			</div>

			</p>
		</form>
	</div>
	<br />
	<div class="col-md-12">

		<a href="toAddBook"><img alt="Nigellus Bookstore"
			src="<c:url value="/resources/images/img_add.gif" />" /> Add Book</a> <a
			href="exportCSV"><img alt="Nigellus Bookstore"
			src="<c:url value="/resources/images/221.png" />" /> Export CSV</a>
		<c:if test="${sessionScope.exportSuccess != null}">
			<font color="green">${sessionScope.exportSuccess }</font>
		</c:if>
		<form:form id="mainForm" method="post" commandName="model">
			<c:choose>

				<c:when test="${model.books.size() == 0 }">
					<font color="red">No data</font>
				</c:when>
				<c:otherwise>
					<div class="table-responsive">
						<table class="table table-striped" width="100%" id="myTable">
							<thead>
								<tr>
									<th>Title</th>
									<th>Author</th>
									<th>Price</th>
									<th></th>
									<th>Category</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${model.books }" var="book">

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
											</c:forEach> <c:if test="${book.categories.size() == 0 }">
												<i>Uncategorized</i>
											</c:if></td>
										<td><a href="confirmDelete?id=${book.id }"> <img
												alt="Nigellus Bookstore" 
												src="<c:url value="/resources/images/del_icon.png" />" />
										</a> <c:url var="url" value="toUpdateBook">
												<c:param name="id" value="${book.id}" />
											</c:url> <a href="${url}"> <img alt="Nigellus Bookstore"
												src="<c:url value="/resources/images/edit-icon.png" />" />
										</a></td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</form:form>

	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		$('#myTable').dataTable({

			"bFilter" : false
		});
	});
	function submitForm() {
		document.getElementById('mainForm').submit();
	}
</script>
</html>