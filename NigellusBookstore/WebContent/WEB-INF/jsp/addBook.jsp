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
	<form action="addBook" id="frmAddBook" method="get" enctype="multipart/form-data">
		<table width="70%">
			<tr>
				<td>Title</td>
				<td><input name="title" id="title" /></td>
			</tr>
			<tr>
				<td>Author</td>
				<td><input name="authorList" id="authorList" /></td>
			</tr>
			<tr>
				<td>Unit Price</td>
				<td><input name="unitPrice" id="unitPrice" /></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><input name="description" id="description"/></td>
			</tr>
			<tr>
				<td>Category:</td>
				<td><select name="selectedCate" multiple="multiple" size="5">
						<c:forEach items="${sessionScope.categories }" var="cate">
							<option value="${cate.getId() }">${cate.getName() }</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input name="submit"
					type="submit" value="Add" /> <input name="reset" type="reset"
					value="Reset" /></td>
			</tr>
		</table>
		<a href="viewBooks?key=">Back</a>
		<c:if test="${sessionScope.addBookSuccess != null}">
			<font color="green">${sessionScope.addBookSuccess }</font>
		</c:if>
	</form>
</body>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.10.2.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.validate.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.additional-methods.js' />"></script>
<script type="text/javascript">
	$(function() {
		$("#frmAddBook").validate({
			rules: {
				title: {
					required: true,
					rangelength:[5,45]
				},
				unitPrice: {
					required: true,
					digits: true
				},
				authorList: {
					required: true,
					rangelength:[1,50]
					
				},
				selectedCate: {
					required: true,
				}
			},
		messages: {
				title: {
					required: "Title is required!",
					rangelength: "Title must be between 5 and 45 characters long."
				} ,
				unitPrice: {
					required: "Unit Price is required!",
					digits: "Please enter a number!" 
				} ,
				authorList: {
					required: "Author List is required!",
					rangelength: "Author list must be between 1 and 50 characters long."
				},
				selectedCate: {
					required: "Please select a category!"
				}
			},
		})
	});
</script>
</html>