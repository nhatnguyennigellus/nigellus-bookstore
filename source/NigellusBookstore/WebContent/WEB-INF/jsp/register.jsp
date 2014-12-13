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
	<div style="padding: 15px 10px 10px 10px">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">REGISTER ACCOUNT</h3>
				</div>
				<div class="panel-body">

					<c:if test="${sessionScope.registerFail != null}">

						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">FAILED</h4>
									</div>
									<div class="modal-body">${sessionScope.registerFail}</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">OK</button>
									</div>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${sessionScope.registerSuccess != null}">
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">
											<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">SUCCESS!</h4>
									</div>
									<div class="modal-body">${sessionScope.registerSuccess}</div>
									<div class="modal-footer">
										<a href="index"><button type="button"
												class="btn btn-primary">OK!</button></a>
									</div>
								</div>
							</div>
						</div>
						<a href="index">Homepage</a>
					</c:if>
					<form action="register" method="get" role="form" id="frmRegister">
						<div class="form-group">
							<label for="username">Username</label> <font color="red"><input
								id="username" name="username" placeholder="Username"
								class="form-control input-sm" /></font>
						</div>
						<div class="form-group">
							<label for="fullname">Fullname</label> <font color="red"><input
								name="fullname" id="Fullname" placeholder="Fullname"
								class="form-control input-sm" /></font>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <font color="red">
								<input id="password" name="password" type="password"
								class="form-control input-sm" />
							</font>
						</div>
						<div class="form-group">
							<label for="password">Confirm Password</label> <font color="red"><input
								class="form-control input-sm" id="cfmPassword"
								name="cfmPassword" type="password" /></font>
						</div>
						<div class="form-group">
							<label for="address">Address</label> <font color="red"><input
								name="address" id="address" placeholder="Address"
								class="form-control input-sm" /></font>
						</div>
						<div class="form-group">
							<label for="email">Email</label><font color="red"> <input
								name="email" id="email" placeholder="Email"
								class="form-control input-sm" /></font>
						</div>
						<div class="form-group">
							<label for="address">Phone</label> <font color="red"><input
								name="phone" id="phone" placeholder="Phone"
								class="form-control input-sm" /></font>
						</div>
						<input class="btn btn-success" name="submit" type="submit"
							value="Register" /> <input class="btn btn-danger" name="reset"
							type="reset" value="Reset" />
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.validate.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.additional-methods.js' />"></script>
<script type="text/javascript">
	$(window).load(function() {
		$('#myModal').modal('show');
	});
	$(function() {
		$("#frmRegister")
				.validate(
						{
							rules : {
								username : {
									required : true,
									rangelength : [ 5, 30 ]
								},
								fullname : {
									required : true,
									rangelength : [ 1, 50 ]

								},
								password : {
									required : true,
									rangelength : [ 6, 30 ]

								},
								cfmPassword : {
									required : true,
									equalTo : "#password",
									rangelength : [ 6, 30 ]
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
								username : {
									required : "Username is required!",
									rangelength : "Username must be between 5 and 30 characters long."
								},
								fullname : {
									required : "Fullname is required!",
									rangelength : "Fullname must be between 1 and 50 characters long."
								},
								email : {
									required : "Email is required!",
									rangelength : "Email must be between 1 and 50 characters long.",
									email : "Invalid email!"
								},
								password : {
									required : "Password is required!",
									rangelength : "Password must be between 6 and 30 characters long."
								},
								cfmPassword : {
									required : "Confirmed password is required!",
									equalTo : "Password mismatch!",
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