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
				<font color="red" style="font-style: bold">${sessionScope.usernameError }</font>

			</c:if>
			<c:if test="${sessionScope.passRecovered != null}">
				<font color="green" style="font-style: bold">${sessionScope.passRecovered }</font>

			</c:if>
		</div>
	</div>
</body>
</html>