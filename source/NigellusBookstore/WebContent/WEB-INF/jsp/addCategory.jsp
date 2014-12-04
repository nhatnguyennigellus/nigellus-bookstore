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
			<form:form role="form" id="mainForm" method="post" commandName="model">
				<div class="form-group">
					<label for="category" class="col-sm-4 control-label">Category:</label>
					<div class="col-sm-6">
						<form:input id="category" class="form-control"
							path="category.name" />
					</div>
				</div>
				<div class="form-group">
					<label for="description" class="col-sm-4 control-label">Description:</label>
					<div class="col-sm-6">
						<form:textarea id="description" class="form-control"
							path="category.description" rows="5" />

					</div>
				</div>
				<div class="col-md-12">
					<form:button class="btn btn-success">Add Category</form:button>
					<a href="viewCategories">Back</a>
				</div>
			</form:form>
		</div>
	</div>
	<c:if test="${sessionScope.addCategorySuccess != null}">
		<font color="green">${sessionScope.addCategorySuccess }</font>
	</c:if>

</body>
</html>