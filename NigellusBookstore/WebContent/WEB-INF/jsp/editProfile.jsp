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
			<c:if test="${sessionScope.editProfileSuccess != null}">
				<font color="green">${sessionScope.editProfileSuccess}</font>
				<a href="index">Home page</a>
			</c:if>
			<form action="editProfile" method="get" id="frmEditProfile">

				<div class="form-group">
					<label for="fullname">Fullname</label> <input name="fullname"
						id="fullname" class="form-control"
						value="${sessionScope.CUSTOMER.getFullname() }" />
				</div>
				<div class="form-group">
					<label for="address">Address</label> <input name="address"
						id="address" class="form-control"
						value="${sessionScope.CUSTOMER.getAddress() }" />
				</div>
				<div class="form-group">
					<label for="email">Email</label> <input name="email" id="email"
						class="form-control" value="${sessionScope.CUSTOMER.getEmail() }" />
				</div>
				<div class="form-group">
					<label for="phone">Phone</label> <input name="phone" id="phone"
						class="form-control" value="${sessionScope.CUSTOMER.getPhone() }" />
				</div>
				<input name="submit" class="btn btn-success" type="submit"
					value="Update" /> <input name="reset" type="reset"
					class="btn btn-danger" value="Reset" />
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
		$("#frmEditProfile")
				.validate(
						{
							rules : {
								fullname : {
									required : true,
									rangelength : [ 1, 50 ]

								},
								address : {
									required : true,
									rangelength : [ 1, 70 ]
								},
								email : {
									required : true,
									rangelength : [ 1, 50 ],
									email : true
								},
								phone : {
									required : true,
									rangelength : [ 1, 20 ],
									digits : true
								}
							},
							messages : {
								fullname : {
									required : "Fullname is required!",
									rangelength : "Fullname must be between 1 and 50 characters long."
								},
								email : {
									required : "Email is required!",
									rangelength : "Email must be between 1 and 50 characters long.",
									email : "Invalid email!"
								},
								phone : {
									required : "Phone is required!",
									rangelength : "Phone must be between 1 and 20 characters long!",
									digits : "Please enter digit character!"
								},
								address : {
									required : "Address is required!",
									rangelength : "Address must be between 1 and 70 characters long."
								},
							},
						})
	});
</script>
</html>