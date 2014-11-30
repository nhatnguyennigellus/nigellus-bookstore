<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="POST" action="changeImage" enctype="multipart/form-data">
		<input type="hidden" value="${param.id }" name="id"> File to
		upload: <input type="file" name="file"><br /> Name: <input
			type="text" name="name"
			<%String title = request.getParameter("title");
			String author = request.getParameter("author");
			String imgName = title.toLowerCase().replace(" ", "") + "-"
					+ author.toLowerCase().replace(" ", "");%>
			value="<%=imgName%>"><br /> <br /> <input type="submit"
			value="Upload"> Press here to upload the file!
	</form>
	<br />
	
</body>
</html>