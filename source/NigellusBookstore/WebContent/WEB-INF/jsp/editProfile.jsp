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

	<div class="col-md-8">

		<div style="padding: 10px 10px 10px 10px">
			<c:if test="${sessionScope.editProfileSuccess != null}">
				<!-- <font color="green">${sessionScope.editProfileSuccess}</font> -->
				
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">EDIT SUCCESS</h4>
							</div>
							<div class="modal-body">
			 		<font color="green">${sessionScope.editProfileSuccess}</font></div>
							<div class="modal-footer">
								<a href="index"><button type="button" class="btn btn-primary">Back to homepage</button></a>
							</div>
						</div>
					</div>
				</div>
				<a href="index">Home page</a>
			</c:if>
			<form action="editProfile" method="get" id="frmEditProfile">

				<div class="form-group">
					<label for="fullname">Fullname</label> 
					<font color="red"><input name="fullname"
						id="fullname" class="form-control"
						value="${sessionScope.CUSTOMER.getFullname() }" /></font>
				</div>
				<div class="form-group">
					<label for="address">Address</label> <font color="red">
					<input name="address"
						id="address" class="form-control"
						value="${sessionScope.CUSTOMER.getAddress() }" /></font>
				</div>
				<div class="form-group">
					<label for="email">Email</label> <font color="red">
					<input name="email" id="email"
						class="form-control" value="${sessionScope.CUSTOMER.getEmail() }" /> </font>
				</div>
				<div class="form-group">
					<label for="phone">Phone</label> <font color="red"><input name="phone" id="phone"
						class="form-control" value="${sessionScope.CUSTOMER.getPhone() }" /> </font>
				</div>
				<input name="submit" class="btn btn-success" type="submit"
					value="Update" /> <input name="reset" type="reset"
					class="btn btn-danger" value="Reset" />
			</form>
		</div>
	</div>

</body>
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
	$(window).load(function(){
        $('#myModal').modal('show');
    });
</script>
</html>