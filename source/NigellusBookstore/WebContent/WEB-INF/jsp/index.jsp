<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="nigellus.bookstore.dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nigellus Bookstore - Homepage</title>
</head>
<body>

	<div class="col-md-12">
		<h1>Welcome</h1>
		<!-- Button trigger modal -->
		<!-- Button trigger modal -->
		
		<!-- /.modal -->
		<div class="col-md-3">
			<div class="panel panel-info">
				<div class="panel-heading">
					<a href="CustomerViewCategories">CATEGORIES</a>
				</div>
				<div class="panel-body">
					<ul>
						<c:forEach items="${sessionScope.CATEINDEX }" var="cate">
							<li>${cate.name}</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-9">
			<div class="panel panel-info">
				<div class="panel-heading">
					<a href="CustomerViewBooks?key=&author=">PRODUCTS</a>
				</div>
				<div class="panel-body">
					<marquee align="left" behavior="alternate">
						<c:forEach items="${sessionScope.BOOKINDEX }" var="book">
							<img class="img-thumbnail" alt="${book.title }" width="150"
								src="<c:url value="${book.imageUrl}" />" />
						</c:forEach>
					</marquee>
				</div>
			</div>
		</div>
		<script type="text/javascript">
	/*		$(".btn").click($(function() {
				$('#myModal').modal({
					keyboard : true
				})
			}));*/
		</script>
</body>
</html>