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
	<c:if test="${sessionScope.editProfileSuccess != null}">
		<font color="green">${sessionScope.editProfileSuccess}</font>
	</c:if>
	<form action="editProfile" method="get" id="frmEditProfile">
		<table width="80%">
			<tr>
				<td>Fullname</td>
				<td><input name="fullname" value="${sessionScope.CUSTOMER.getFullname() }"/>*</td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input name="address" value="${sessionScope.CUSTOMER.getAddress() }"/>*</td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input name="email" value="${sessionScope.CUSTOMER.getEmail() }"/>*</td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input name="phone" value="${sessionScope.CUSTOMER.getPhone() }"/>*</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input name="submit"
					type="submit" value="Update" /> <input name="reset" type="reset"
					value="Reset" /></td>
			</tr>
		</table>
		
	</form>
</body>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.10.2.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.validate.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.additional-methods.js' />"></script>
<script type="text/javascript">
	$(function() {
		$("#frmEditProfile").validate({
			rules: {
				fullname: {
					required: true,
					rangelength:[1,50]
					
				},
				address: {
					required: true,
					rangelength:[1,70]
				},
				email: {
					required: true,
					rangelength:[1,50],
					email: true
				},
				phone: {
					required: true,
					rangelength:[1,20],
					digits: true
				}
			},
		messages: {
				fullname: {
					required: "Fullname is required!",
					rangelength: "Fullname must be between 1 and 50 characters long."
				} ,
				email: {
					required: "Email is required!",
					rangelength: "Email must be between 1 and 50 characters long.",
					email: "Invalid email!"
				} ,
				phone: {
					required: "Phone is required!",
					rangelength: "Phone must be between 1 and 20 characters long!",
					digits: "Please enter digit character!"
				} ,
				address: {
					required: "Address is required!",
					rangelength: "Address must be between 1 and 70 characters long."
				} ,
			},
		})
	});
</script>
</html>