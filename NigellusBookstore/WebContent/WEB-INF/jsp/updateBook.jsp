<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-12">
		<div style="padding: 10px 10px 10px 10px">
			<form id="frmAddBook" action="updateBook" method="get">
				<input name="id" type="hidden" value="${sessionScope.book.getId() }" />
				<div class="form-group">
					<label for="title">Title</label> <input name="title" id="title"
						placeholder="Title" class="form-control"
						value="${sessionScope.book.getTitle() }" />
				</div>

				<div class="form-group">
					<label for="authorList">Author</label> <input name="authorList"
						id="authorList" placeholder="Author"
						value="${sessionScope.book.getAuthorList()}" class=" form-control" />
				</div>

				<div class="form-group">
					<label for="unitPrice">Unit Price</label>
					<fmt:parseNumber var="i" integerOnly="true" 
                       type="number" value="${sessionScope.book.getUnitPrice() }" />
					 <input name="unitPrice"
						id="unitPrice" placeholder="Unit Price"
						value="${sessionScope.book.getUnitPrice().toString().replace(".0", "") }" class="form-control" />
				</div>

				<div class="form-group">
					<label for="description">Description</label>
					<textarea rows="3" name="description" id="description"
						placeholder="Description" class="form-control">${sessionScope.book.getDescription() }</textarea>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							<label> <input type="checkbox"
								<c:if test="${sessionScope.book.getStatus() == 1 }">
								checked
							</c:if>
								id="available" /> Available
							</label>
						</div>

					</div>
				</div>

				<div class="form-group">
					<label for="selectedCate">Category:</label> <select
						id="selectedCate" name="selectedCate" multiple="multiple"
						class="form-control" size="5">
						<c:forEach items="${sessionScope.categories }" var="cate">
							<option value="${cate.getId() }"
								<c:if test="${ sessionScope.selCates.contains(cate.getName())}">
									selected
								</c:if>>${cate.getName() }
							</option>
						</c:forEach>
					</select>
				</div>
				<input class="btn btn-success" name="submit" type="submit"
					value="Update" /> <input name="reset" type="reset" value="Reset"
					class="btn btn-danger" /> <a href="viewBooks?key=&author=">Back</a>
				<c:if test="${sessionScope.updateBookSuccess != null}">
					<font color="green">${sessionScope.updateBookSuccess }</font>
				</c:if>
			</form>
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
	$(function() {
		$("#frmAddBook")
				.validate(
						{
							rules : {
								title : {
									required : true,
									rangelength : [ 1, 45 ]
								},
								unitPrice : {
									required : true,
									digits : true
								},
								authorList : {
									required : true,
									rangelength : [ 1, 50 ]

								},
							},
							messages : {
								title : {
									required : "Title is required!",
									rangelength : "Title must be between 1 and 45 characters long."
								},
								unitPrice : {
									required : "Unit Price is required!",
									digits : "Please enter a number!"
								},
								authorList : {
									required : "Author List is required!",
									rangelength : "Author list must be between 1 and 50 characters long."
								}
							},
						})
	});
</script>
</html>