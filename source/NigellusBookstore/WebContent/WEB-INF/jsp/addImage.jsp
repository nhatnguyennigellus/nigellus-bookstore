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
		<form method="POST" role="form" action="addImage" id="frmAddImage"
			enctype="multipart/form-data">
			<input type="hidden" value="${param.id }" name="id">

			<div class="form-group">
				<label for="fileUpload">File to upload: </label> <input type="file"
					id="fileUpload" name="file">
			</div>
			
			<input class="btn btn-success" type="submit" value="Upload">
			Press here to upload the file!
		</form>
	</div>
	<div class="col-md-10">
		<h3>GALLERY</h3>
		<c:if test="${sessionScope.BOOKIMAGES.size() == 0 }">
			<br/> <font color="red">No image in gallery</font>
		</c:if>
		<table class="table table-hover">
			<c:forEach items="${sessionScope.BOOKIMAGES }" var="image">
				<tr>
					<td><img alt="Nigellus Bookstore" width="150"
						src="<c:url value="${image.imageUrl}" />" /></td>
					<td>
						<button type="button" class="btn btn-danger btn-xs"
							data-toggle="modal" data-target="#myModalDel"
							data-id="${image.id}">
							<img alt="Nigellus Bookstore"
								src="<c:url value="/resources/images/del_icon.png" />" />
						</button>
						<div class="modal fade" id="myModalDel" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">Delete image</h4>
									</div>
									<div class="modal-body">Are you sure you want to delete
										this image?</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">No</button>
										<a id="del"><button type="button" class="btn btn-primary">Yes</button></a>
									</div>
								</div>
							</div>
						</div> </a>
					</td>
				</tr>
			</c:forEach>
		</table>
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
	
	$(document).on("click", ".btn-danger", function() {

		$("a").attr("href", "deleteImage?id=" + $(this).data('id'));
	});
	$(window).load(function() {
		$('#myModalDel').modal('show');
	});
</script>
</html>
