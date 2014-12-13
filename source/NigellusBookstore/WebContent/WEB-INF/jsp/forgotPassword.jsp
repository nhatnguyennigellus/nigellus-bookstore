<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-12">
		<div style="padding: 10px 10px 10px 10px;">
			<h3>PASSWORD RECOVERY</h3>
			<p>Please enter your username:</p>
			<form action="recoverPassword" method="get">
				<div class="form-group col-md-6">
					<input id="username" placeholder="Username" class="form-control"
						name="username" />
				</div>

				<input class="btn btn-success" name="submit" type="submit"
					value="Submit" />
			</form>

			<c:if test="${sessionScope.usernameError != null}">
				
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
							<div class="modal-body">
								<font color="red" style="font-style: bold">${sessionScope.usernameError }</font>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">OK</button>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${sessionScope.passRecovered != null}">
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
								<font color="green" style="font-style: bold">${sessionScope.passRecovered }</font>
							</div>
							<div class="modal-footer">
								<a href="index"><button type="button"
										class="btn btn-primary">Back to homepage</button></a>
							</div>
						</div>
					</div>
				</div>
				

			</c:if>
		</div>
	</div>
</body>
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
								username : {
									required : true,
								}
							},
							messages : {
								username : {
									required : "Please enter a username!",
								}
							}
						})
	});
	$(window).load(function() {
		$('#myModal').modal('show');
	});
</script>
</html>