<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-10">
		<h2>UPLOAD IMAGE</h2>
		<form method="POST" role="form" action="changeImage" id="frmAddImage"
			enctype="multipart/form-data">
			<input type="hidden" value="${param.id }" name="id">

			<div class="form-group">
				<label for="fileUpload">File to upload: </label> <input type="file"
					id="fileUpload" name="file">
			</div>
			<div class="form-group">
				<label for="name">Name</label> <input id="name" type="text"
					name="name" class="form-control"
					<%String title = request.getParameter("title");
			String author = request.getParameter("author");
			String imgName = title.toLowerCase().replace(" ", "") + "-"
					+ author.toLowerCase().replace(" ", "");%>
					value="<%=imgName%>">
			</div>
			<input class="btn btn-success" type="submit" value="Upload">
			Press here to upload the file!
		</form>
	</div>
	<br />

</body>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.validate.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.additional-methods.js' />"></script>
<script type="text/javascript">
	$(function() {
		$("#frmAddImage").validate({
			rules : {
				name : {
					required : true,
					rangelength : [ 1, 30 ]
				}
			},
			messages : {
				name : {
					required : "Name must not be empty",
					rangelength : "Name must be less than 30 characters length"
				}
			},
		})
	});
</script>
</html>