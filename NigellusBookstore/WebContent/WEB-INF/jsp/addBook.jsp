<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
			<form role="form" action="addBook" id="frmAddBook" method="get">
				<div class="form-group">
					<label for="title">Title</label> <input name="title" id="title"
						placeholder="Title" class="form-control" />
				</div>

				<div class="form-group">
					<label for="authorList">Author</label> <input name="authorList"
						id="authorList" placeholder="Author" class="form-control" />
				</div>

				<div class="form-group">
					<label for="unitPrice">Unit Price</label> <input name="unitPrice"
						id="unitPrice" placeholder="Unit Price" class="form-control" />
				</div>

				<div class="form-group">
					<label for="description">Description</label>
					<textarea rows="3" name="description" id="description" onkeyup="InsertBreak(event);"
						placeholder="Description" class="form-control"></textarea>
				</div>

				<div class="form-group">
					<label for="selectedCate">Category:</label> <select
						class="form-control" id="selectedCate" name="selectedCate"
						multiple="multiple" size="5">
						<c:forEach items="${sessionScope.categories }" var="cate">
							<option value="${cate.getId() }">${cate.getName() }</option>
						</c:forEach>
					</select>
				</div>

				<input class="btn btn-success" name="submit" type="submit"
					value="Add" /> <input name="reset" type="reset" value="Reset"
					class="btn btn-danger" /> <a href="viewBooks?key=&author=">Back</a>
				<c:if test="${sessionScope.addBookSuccess != null}">
					<font color="green">${sessionScope.addBookSuccess }</font>
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
	function InsertBreak(e) {
		//check for return key=13
		if (parseInt(e.keyCode) == 13) {
			//get textarea object
			var objTxtArea;
			objTxtArea = document.getElementById("description");
			//insert the existing text with the <br>
			objTxtArea.innerText = objTxtArea.value + "<br>";
		}
	}
	$(function() {
		$("#frmAddBook")
				.validate(
						{
							rules : {
								title : {
									required : true,
									rangelength : [ 5, 45 ]
								},
								unitPrice : {
									required : true,
									digits : true
								},
								authorList : {
									required : true,
									rangelength : [ 1, 50 ]

								},
								selectedCate : {
									required : true,
								}
							},
							messages : {
								title : {
									required : "Title is required!",
									rangelength : "Title must be between 5 and 45 characters long."
								},
								unitPrice : {
									required : "Unit Price is required!",
									digits : "Please enter a number!"
								},
								authorList : {
									required : "Author List is required!",
									rangelength : "Author list must be between 1 and 50 characters long."
								},
								selectedCate : {
									required : "Please select a category!"
								}
							},
						})
	});
</script>
</html>