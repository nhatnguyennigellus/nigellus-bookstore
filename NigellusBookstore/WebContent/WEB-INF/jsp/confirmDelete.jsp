<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-6">
		<form action="deleteBook" method="post" role="form">
			<input type="hidden" value="${param.id }" name="id"/>

			<h5>Are you sure you want to remove this book?</h5>
			<input type="submit" class="btn btn-success" value="Yes" /> <a
				href="viewBooks?key=&author="><input type="button" class="btn btn-danger"
				value="No" /></a>
		</form>

	</div>
</body>
</html>