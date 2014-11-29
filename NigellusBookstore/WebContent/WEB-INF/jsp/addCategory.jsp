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
	<form:form id="mainForm" method="post" commandName="model">
		<table>
			<tr>
				<td>Category: </td>
				<td><form:input path="category.name" /></td>
			</tr>
			<tr>
				<td>Description: </td>
				<td><form:input path="category.description" /></td>
			</tr>
		</table>
		
		<form:button>Add Category</form:button>
	</form:form>
	<br />
	<a href="viewCategories">Back</a>
	<c:if test="${sessionScope.addCategorySuccess != null}">
		<font color="green">${sessionScope.addCategorySuccess }</font>
	</c:if>

</body>
</html>