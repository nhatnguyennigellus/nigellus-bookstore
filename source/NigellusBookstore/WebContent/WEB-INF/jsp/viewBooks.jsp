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
			
			<c:if test="${sessionScope.exportBookSuccess != null}">
				
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
									</button>
									<h4 class="modal-title" id="myModalLabel">EXPORT SUCCESS</h4>
								</div>
								<div class="modal-body">Exported CSV successfully!</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">OK</button>
								</div>
							</div>
						</div>
					</div>
			</c:if>
			<br/>
		<form:form id="mainForm" method="post" commandName="model">
			<c:choose>

				<c:when test="${model.books.size() == 0 }">
					<p><font color="red">No data</font></p>
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
										<td id="myCarousel${book.id }" class="carousel slide">
											<ol class="carousel-indicators">
												<li data-target="#myCarousel${book.id}" data-slide-to="0"
													class="active"></li>
												<c:forEach items="${sessionScope.GALLERY }" var="img"
													varStatus="no">
													<c:if test="${img.book.id == book.id }">
														<li data-target="#myCarousel${book.id}" data-slide-to="${no.count }"></li>
													</c:if>
												</c:forEach>

											</ol> <!-- Wrapper for Slides -->
											<div class="carousel-inner">
												<div class="item active">
													<!-- Set the first background image using inline CSS below. -->
													<img alt="Nigellus Bookstore" width="150"
														src="<c:url value="${book.imageUrl}" />" />

												</div>
												<c:forEach items="${sessionScope.GALLERY }" var="img"
													varStatus="no">
													<c:if test="${img.book.id == book.id }">
														<div class="item">
															<img alt="Nigellus Bookstore" width="150"
																src="<c:url value="${img.imageUrl}" />" />
														</div>
													</c:if>
												</c:forEach>

											</div> <!-- Controls --> <a class="left carousel-control"
											href="#myCarousel${book.id }" data-slide="prev"> <span
												class="icon-prev"></span>
										</a> <a class="right carousel-control" href="#myCarousel${book.id }"
											data-slide="next"> <span class="icon-next"></span>
										</a> 
										
										<br /> 
										<br /> <c:url var="url" value="toChangeImage">
												<c:param name="id" value="${book.id}" />
												<c:param name="title" value="${book.title}" />
												<c:param name="author" value="${book.authorList}" />
											</c:url> <a href="${url }">Edit Cover Image</a> <c:url var="urlAdd"
												value="toAddImage">
												<c:param name="id" value="${book.id}" />
												<c:param name="title" value="${book.title}" />
												<c:param name="author" value="${book.authorList}" />
											</c:url> <br /> <a href="${urlAdd }">Add Image Gallery</a>
										</td>
										<td><c:forEach items="${book.categories }" var="category">
							${category.name}<br />
											</c:forEach> <c:if test="${book.categories.size() == 0 }">
												<i>Uncategorized</i>
											</c:if></td>
										<td>
											<button type="button" class="btn btn-danger btn-xs"
												data-toggle="modal" data-target="#myModalDel"
												data-id="${book.id}">
												<img alt="Nigellus Bookstore"
													src="<c:url value="/resources/images/del_icon.png" />" />
											</button>
											<div class="modal fade" id="myModalDel" tabindex="-1"
												role="dialog" aria-labelledby="myModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">
																<span aria-hidden="true">&times;</span><span
																	class="sr-only">Close</span>
															</button>
															<h4 class="modal-title" id="myModalLabel">Delete
																book</h4>
														</div>
														<div class="modal-body">Are you sure you want to
															delete this book?</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">No</button>
															<a id="del"><button type="button"
																	class="btn btn-primary">Yes</button></a>
														</div>
													</div>
												</div>
											</div> <c:url var="url" value="toUpdateBook">
												<c:param name="id" value="${book.id}" />
											</c:url><a href="${url}">
												<button type="button" class="btn btn-success btn-xs">
													<img alt="Nigellus Bookstore"
														src="<c:url value="/resources/images/edit-icon.png" />" />
												</button>
										</a>
										</td>
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
	$(document).on("click", ".btn-danger", function() {

		$("a").attr("href", "deleteBook?id=" + $(this).data('id'));
	});
	function submitForm() {
		document.getElementById('mainForm').submit();
	}
	$(window).load(function() {
		$('#myModal').modal('show');
	});
</script>
</html>