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
<link rel="stylesheet"
	href="<c:url value='/resources/css/full-slider.css'/> " />
<style>
.slider-size {
	height: 350px; /* This is your slider height */
}

.carousel {
	width: 100%;
}
</style>
</head>
<body>

	<div class="col-md-12">
		<h1>Welcome</h1>
		<!-- Button trigger modal -->
		<!-- Button trigger modal -->

		<!-- /.modal -->

		<div class="col-md-5">
			<div class="panel panel-info">
				<div class="panel-heading">
					<a href="CustomerViewBooks?key=&author=">PRODUCTS</a>
				</div>
				<div class="panel-body carousel slide" id="myCarousel"
					style="height: 250; display: block;">
					<ol class="carousel-indicators">

						<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
						<c:forEach items="${sessionScope.BOOKINDEX }" var="book"
							varStatus="no">
							<li data-target="#myCarousel" data-slide-to="${no.count }"></li>

						</c:forEach>

					</ol>
					<!-- Wrapper for Slides -->
					<div class="carousel-inner">
						<div class="item active" style="background-color: #848484;">
							<div
									style="background:url(<c:url value="${sessionScope.BOOKINDEX.get(sessionScope.BOOKINDEX.size() - 1).imageUrl}" />) center center; 
          background-size:cover;"
									class="slider-size"></div>
							
							<div class="carousel-caption">
								<h3>${sessionScope.BOOKINDEX.get(sessionScope.BOOKINDEX.size() - 1).title }</h3>
							</div>
						</div>
						<c:forEach items="${sessionScope.BOOKINDEX }" var="book"
							varStatus="no">
							<div class="item" style="background-color: #848484;">

								<div
									style="background:url(<c:url value="${book.imageUrl}" />) center center; 
          background-size:cover;"
									class="slider-size"></div>
								<div class="carousel-caption">
									<h3>${book.title }</h3>
								</div>
							</div>
						</c:forEach>

					</div>
					<!-- Controls -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span class="icon-prev"></span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span class="icon-next"></span>
					</a>

				</div>
			</div>
		</div>

		<div class="col-md-7">
			<div class="panel panel-info" style="height: 75">
				<div class="panel-heading">PREFERENCE</div>
				<div class="panel-body carousel slide" id="myCarousel1">
					<ol class="carousel-indicators">

						<li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel1" data-slide-to="1"></li>
						<li data-target="#myCarousel1" data-slide-to="2"></li>
					</ol>
					<!-- Wrapper for Slides -->
					<div class="carousel-inner">
						<div class="item active">
							<!-- Set the first background image using inline CSS below. 
							<center>
								<img alt="Nigellus Bookstore" width="80%"
									src="<c:url value="/resources/images/member_discount.jpg" />" />
							</center>-->
							<div
								style="background:url(<c:url value="/resources/images/member_discount.jpg" />) center center; 
          background-size:cover;"
								class="slider-size"></div>
						</div>
						<div class="item">
							<!--<center>
								<img alt="Nigellus Bookstore" width="80%"
									src="<c:url value="/resources/images/CouponP.jpg" />" />
							</center>
-->
							<div
								style="background:url(<c:url value="/resources/images/CouponP.jpg" />) center center; 
          background-size:cover;"
								class="slider-size"></div>
						</div>
						<div class="item">
							<!-- 	<center>
								<img alt="Nigellus Bookstore" width="80%"
									src="<c:url value="/resources/images/CouponF.jpg" />" />
							</center> -->
							<div
								style="background:url(<c:url value="/resources/images/CouponF.jpg" />) center center; 
          background-size:cover;"
								class="slider-size"></div>

						</div>
						<!-- Controls -->
						<a class="left carousel-control" href="javascript:void(0)"
							data-target="#myCarousel1" data-slide="prev"> <span
							class="icon-prev"></span>
						</a> <a class="right carousel-control" href="javascript:void(0)"
							data-target="#myCarousel1" data-slide="next"> <span
							class="icon-next"></span>
						</a>

					</div>
				</div>

			</div>
			<script type="text/javascript">
				/*		$(".btn").click($(function() {
							$('#myModal').modal({
								keyboard : true
							})
						}));*/
			</script></div>
</body>
</html>