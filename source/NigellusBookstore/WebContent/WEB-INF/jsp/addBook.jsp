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
		<h3>ADD BOOK</h3>
		<div style="padding: 10px 10px 10px 10px">

			<input class="btn btn-default" id="btnForm" type="button"
				onclick="openForm()" value="Add by form" /> <input id="btnCSV"
				type="button" value="Add by CSV" onclick="openCSVImport()"
				class="btn btn-default" />
		</div>
	</div>
	<div class="col-md-12">

		<div style="padding: 10px 10px 10px 10px">
			<c:if test="${sessionScope.csvError != null}">
				<font color="red" style="font-style: bold">${sessionScope.csvError  }</font>

			</c:if>
			<c:if test="${sessionScope.addBookSuccess != null}">
					<font color="green">${sessionScope.addBookSuccess }</font>
				</c:if>
			<form role="form" action="addBook" id="frmAddBook" method="get">
				<div class="form-group">
					<label for="title">Title</label> <font color="red"> <input name="title" id="title"
						placeholder="Title" class="form-control" /></font>
				</div>

				<div class="form-group">
					<label for="authorList">Author</label> <font color="red"><input name="authorList"
						id="authorList" placeholder="Author" class="form-control" /></font>
				</div>

				<div class="form-group">
					<label for="unitPrice">Unit Price</label> <font color="red"><input name="unitPrice"
						id="unitPrice" placeholder="Unit Price" class="form-control" /></font>
				</div>

				<div class="form-group">
					<label for="description">Description</label>
					<font color="red"><textarea rows="3" name="description" id="description"
						placeholder="[Use HTML tag to edit] Description"
						class="form-control"></textarea></font>
				</div>

				<div class="form-group">
					<label for="selectedCate">Category:</label> <font color="red"><select
						class="form-control" id="selectedCate" name="selectedCate"
						multiple="multiple" size="5">
						<c:forEach items="${sessionScope.categories }" var="cate">
							<option value="${cate.getId() }">${cate.getName() }</option>
						</c:forEach>
					</select></font>
				</div>

				<input class="btn btn-success" name="submit" type="submit"
					value="Add" /> <input name="reset" type="reset" value="Reset"
					class="btn btn-danger" /> <a href="viewBooks?key=&author=">Back</a>
				
			</form>
			<form role="form" action="importCSV" id="frmImportCSV" method="post"
				enctype="multipart/form-data" >
				<font color="blue" style="font-size:x-small ;"><b>Note:</b> Line of data in CSV File must be: 
				[title],[price],[description],[author],[imageUrl],[category1;category2;...;]</font>
				<div class="form-group">
					<label for="fileUpload">File to upload: </label> <input type="file"
						id="fileUpload" name="file">
				</div>

				<input class="btn btn-success" type="submit" value="Import">

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
	
	function openForm() {
		$('#frmAddBook').fadeIn();
		$('#frmImportCSV').fadeOut();
	}

	function openCSVImport() {
		$('#frmAddBook').fadeOut();
		$('#frmImportCSV').fadeIn();
	}
	$(function() {
		$("#frmImportCSV").hide();
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