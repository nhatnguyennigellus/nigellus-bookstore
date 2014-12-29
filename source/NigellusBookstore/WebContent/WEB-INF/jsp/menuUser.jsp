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
						
						<input id="key" placeholder="Title" name="key"
							class="form-control input-sm" />
							<div class="input-group-addon">
							<img alt="Nigellus Bookstore" height="16px"
								src="<c:url value="/resources/images/search_icon.png" />" />
						</div>
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
				</div>
			</div>
			<div class="panel panel-info">
				<div class="panel-heading">
				<img src="<c:url value="/resources/images/facebook.png" />" width="16px"/>
					<b>CONNECT TO FACEBOOK!</b>
				</div>
				<div class="panel-body">
					<div class="fb-like" data-href="https://www.facebook.com/NigellusBookstore" 
								data-layout="button_count" data-action="like" data-show-faces="true" data-share="true"></div>
								<br/>
					<a id="fb_login_link" href="" onclick="loginFacebook(); return false;">
					Login</a>
					<img id="avatar" ></img>&nbsp;<label id="name"></label>
					
				</div>
			</div>
			<div class="panel panel-info">
				<div class="panel-heading">
					<b>OUR CAREGORIES</b>
				</div>
				<div class="panel-body">
					<ul>
					<c:forEach items="${sessionScope.CATEINDEX }" var="cate">
						<li>
							<a href="customerViewBookCategories?id=${cate.id}">${cate.name }</a>
						</li>
					</c:forEach>
					</ul>
				</div>
			</div>
			<img alt="Nigellus Bookstore" height="180"
								src="<c:url value="/resources/images/member_discount.jpg" />"
		</div>
		
	</div>
</body>
</html>