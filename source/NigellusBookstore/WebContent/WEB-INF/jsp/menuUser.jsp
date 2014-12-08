<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-12">
		<div style="padding: 10px 0px 10px 0px">

			<form action="CustomerViewBooks">
				<div class="form-group form-group-sm">
					<div class="input-group">
						<div class="input-group-addon">
							<img alt="Nigellus Bookstore" height="16px"
								src="<c:url value="/resources/images/search_icon.png" />" />
						</div>
						<input id="key" placeholder="Title" name="key"
							class="form-control input-sm" />
							
					</div>
				</div>
				<div class="form-group form-group-sm">
					<input type="hidden" id="author" placeholder="Author" name="author"
						class="form-control input-sm" />
				</div>
				<div class="form-group form-group-sm" style="display: none;">
					<input type="submit" value="Search" class="btn btn-primary btn-xs" />

				</div>

			</form>
			<div class="panel panel-info">
				<div class="panel-heading">
					<b>EXPLORE!</b>
				</div>
				<div class="panel-body">
					<p>
						<a href="index">Home</a>
					</p>
					<p>
						<a href="CustomerViewBooks?key=&author=">Our library</a>
					</p>
					<p>
						<a href="CustomerViewCategories">Categories</a>
					</p>
				</div>
			</div>
			<img alt="Nigellus Bookstore" height="180"
								src="<c:url value="/resources/images/member_discount.jpg" />"
		</div>
		
	</div>
</body>
</html>