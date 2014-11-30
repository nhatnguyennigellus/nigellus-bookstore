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
	<c:if test="${sessionScope.registerFail != null}">
		<font color="red">${sessionScope.registerFail}</font>
	</c:if>
	<c:if test="${sessionScope.registerSuccess != null}">
		<font color="green">${sessionScope.registerSuccess}</font>
	</c:if>
	<form action="register" method="get" enctype="multipart/form-data" id="frmRegister">
		<table width="70%">
			<tr>
				<td>Username</td>
				<td><input name="username" />*</td>
			</tr>
			<tr>
				<td>Fullname</td>
				<td><input name="fullname" />*</td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input id="password" name="password" type="password"/>*</td>
				
			</tr>
			<tr>
				<td>Confirm Password</td>
				<td><input name="cfmPassword" type="password"/>*</td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input name="address" />*</td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input name="email" />*</td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input name="phone" />*</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input name="submit"
					type="submit" value="Register" /> <input name="reset" type="reset"
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
		$("#frmRegister").validate({
			rules: {
				username: {
					required: true,
					rangelength:[5,30]
				},
				fullname: {
					required: true,
					rangelength:[1,50]
					
				},
				password: {
					required: true,
					rangelength:[6,30]
					
				},
				cfmPassword: {
					required: true,
					equalTo: "#password",
					rangelength:[6,30]
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
				username: {
					required: "Username is required!",
					rangelength: "Username must be between 5 and 30 characters long."
				} ,
				fullname: {
					required: "Fullname is required!",
					rangelength: "Fullname must be between 1 and 50 characters long."
				} ,
				email: {
					required: "Email is required!",
					rangelength: "Email must be between 1 and 50 characters long.",
					email: "Invalid email!"
				} ,
				password: {
					required: "Password is required!",
					rangelength: "Password must be between 6 and 30 characters long."
				} ,
				cfmPassword: {
					required: "Confirmed password is required!",
					equalTo: "Password mismatch!",
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