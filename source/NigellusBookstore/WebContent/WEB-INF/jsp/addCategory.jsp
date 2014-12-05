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
		<h3>ADD CATEGORY</h3><a href="javascript:history.go(-1);">Back</a>
		<div style="padding: 10px 10px 10px 10px">
			
			<input class="btn btn-default" id="btnForm" type="button"
				onclick="openForm()" value="Add by form" /> <input id="btnCSV"
				type="button" value="Add by CSV" onclick="openCSVImport()"
				class="btn btn-default" />
			<c:if test="${sessionScope.addCateSuccess != null}">
				<font color="green">${sessionScope.addCateSuccess }</font>
			</c:if>
		</div>
	</div>
	<div class="col-md-12">
		<div style="padding: 10px 10px 10px 10px">
			<c:if test="${sessionScope.csvError != null}">
				<font color="red" style="font-style: bold">${sessionScope.csvError  }</font>

			</c:if>
			<c:if test="${sessionScope.addCategorySuccess != null}">
				<font color="green">${sessionScope.addCategorySuccess }</font>
			</c:if>
			<form:form role="form" id="mainForm" method="post"
				commandName="model">
				<div class="form-group">
					<label for="category">Category:</label>
					<div>
						<form:input id="category" class="form-control"
							path="category.name" />
					</div>
				</div>
				<div class="form-group">
					<label for="description">Description:</label>
					<div>
						<form:textarea id="description" class="form-control"
							path="category.description" rows="5" />

					</div>
				</div>
				<form:button class="btn btn-success">Add Category</form:button>
				
			</form:form>
			<form role="form" action="importCSVCate" id="frmImportCSV"
				method="post" enctype="multipart/form-data">
				<font color="blue" style="font-size: x-small;"><b>Note:</b>
					Line of data in CSV File must be:
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
		$('#mainForm').fadeIn();
		$('#frmImportCSV').hide();
	}

	function openCSVImport() {
		$('#frmImportCSV').fadeIn();
		$('#mainForm').hide();
	}
	$(function() {
		$("#frmImportCSV").hide();
		$("#mainForm")
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