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
			<h3>CONFIRM ORDER</h3>
			<p>Please enter the code which was sent you via email:</p>
			<form action="confirmOrder" method="get">
				<div class="form-group col-md-6">
					<input id="cfmCode" placeholder="Confirm code" class="form-control"
						name="code" />
				</div>

				<input class="btn btn-success" name="submit" type="submit"
					value="Confirm" />
				<c:url value="resendEmail" var="urlResend">
					<c:param name="id">${sessionScope.order.id }</c:param>
				</c:url>
				<a href="${urlResend }">Resend confirm Email</a>
			</form>

			<c:if test="${sessionScope.confirmError != null}">
				<font color="red" style="font-style: bold">${sessionScope.confirmError }</font>

			</c:if>

		</div>
	</div>
</body>
</html>