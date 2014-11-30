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
	<c:if test="${sessionScope.changePassError != null}">
		<font color="red">${sessionScope.changePassError}</font>
	</c:if>
	<c:if test="${sessionScope.changePassSuccess != null}">
		<font color="green">${sessionScope.changePassSuccess }</font>
	</c:if>
	<form action="changePassword" method="get" enctype="multipart/form-data"
		id="frmRegister">
		<table width="70%">
			<tr>
				<td>Old Password</td>
				<td><input id="oldPassword" name="oldPassword" type="password" />*</td>

			</tr>
			<tr>
				<td>New Password</td>
				<td><input id="newPassword" name="newPassword" type="password" />*</td>

			</tr>
			<tr>
				<td>Confirm Password</td>
				<td><input name="cfmPassword" type="password" />*</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input name="submit"
					type="submit" value="Submit" /> <input name="reset" type="reset"
					value="Reset" /></td>
			</tr>
		</table>

	</form>
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
		$("#frmRegister")
				.validate(
						{
							rules : {
								oldPassword : {
									required : true,
									rangelength : [ 6, 30 ]

								},
								newPassword : {
									required : true,
									rangelength : [ 6, 30 ]

								},
								cfmPassword : {
									required : true,
									equalTo : "#newPassword",
									rangelength : [ 6, 30 ]
								},
							},
							messages : {
								oldPassword : {
									required : "Password is required!",
									rangelength : "Password must be between 6 and 30 characters long."
								},
								newPassword : {
									required : "Password is required!",
									rangelength : "Password must be between 6 and 30 characters long."
								},
								cfmPassword : {
									required : "Confirmed password is required!",
									equalTo : "Password mismatch!",
								},
							},
						})
	});
</script>
</html>