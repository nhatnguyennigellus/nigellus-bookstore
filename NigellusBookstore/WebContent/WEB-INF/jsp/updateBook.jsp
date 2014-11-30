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
<form action="updateBook" method="get" enctype="multipart/form-data">
		<table width="70%">
			<input name="id" type="hidden" value="${sessionScope.book.getId() }"/>
			<tr>
				<td>Title</td>
				<td><input name="title" value="${sessionScope.book.getTitle() }" /></td>
			</tr>
			<tr>
				<td>Author</td>
				<td><input name="authorList" value="${sessionScope.book.getAuthorList() }"  /></td>
			</tr>
			<tr>
				<td>Unit Price</td>
				<td><input name="unitPrice" value="${sessionScope.book.getUnitPrice() }" /></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><input name="description" value="${sessionScope.book.getDescription() }"/></td>
			</tr>
			<tr>
				<td>Category:</td>
				<td><select name="selectedCate" multiple="multiple" size="5">
						<c:forEach items="${sessionScope.categories }" var="cate">
							<option value="${cate.getId() }" 
								<c:if test="${ sessionScope.selCates.contains(cate.getName())}">
									selected
								</c:if>	>${cate.getName() }
								</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input name="submit"
					type="submit" value="Update" /> <input name="reset" type="reset"
					value="Reset" /></td>
			</tr>
		</table>
		<a href="viewBooks?key=">Back</a>
		<c:if test="${sessionScope.updateBookSuccess != null}">
			<font color="green">${sessionScope.updateBookSuccess }</font>
		</c:if>
	</form>
</body>
</html>