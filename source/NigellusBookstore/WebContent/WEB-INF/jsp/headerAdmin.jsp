<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-12">
		<c:choose>
			<c:when test="${sessionScope.admin != null}">
				<div style="padding: 3px 3px 3px 3px">
					Welcome, <b>${sessionScope.admin } </b> | <a href="logout">Logout</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-md-12">
					<div style="padding: 3px 3px 3px 3px">

						<form action="login" method="get" class="form-inline" role="form">
							<label>Login</label>
							<div class="form-group">
								<input id="user" placeholder="Username"
									class="form-control input-sm" name="user" />
							</div>
							<div class="form-group">
								<input id="pass" placeholder="Password" name="pass"
									type="password" class="form-control input-sm" />
							</div>
							<input class="btn btn-success btn-xs" name="submit" type="submit"
								value="Login" /> <input name="reset" type="reset" value="Reset"
								class="btn btn-danger btn-xs" />
						</form>
						<c:if test="${sessionScope.adminLoginErr != null}">
							<font color="red" style="font-style: bold">${sessionScope.adminLoginErr }</font>

						</c:if>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
</body>
</html>