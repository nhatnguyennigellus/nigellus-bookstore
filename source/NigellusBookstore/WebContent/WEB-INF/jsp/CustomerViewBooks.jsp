<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:fb="http://ogp.me/ns/fb#">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Our products</title>

</head>
<body>

	<div style="background-color: #FEFFD3; padding: 3px 3px 3px 3px">
		<h3>
			SEARCH BOOK <img alt="Nigellus Bookstore"
				src="<c:url value="/resources/images/search_icon.png" />" />
		</h3>
		<form action="CustomerViewBooks" class="form-horizontal">
			<div class="form-group">
				<label for="key" class="col-sm-2 control-label">Title:</label>
				<div class="col-sm-6">
					<input id="key" name="key" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<label for="author" class="col-sm-2 control-label">Author:</label>
				<div class="col-sm-6">
					<input id="author" name="author" class="form-control" />
				</div>
				<input type="submit" value="Search" class="btn btn-primary" />
			</div>

		</form>
	</div>
	<br />
	<div class="col-md-8">

		<h2>BOOKS</h2>
	</div>
	<div class="col-md-12">
		<form:form id="mainForm" method="post" commandName="model">
			<c:if test="${model.books.size() == 0 }">
				<font color="red">No data</font>
			</c:if>

			<table width="100%" class="table table-striped tablesorter"
				id="tableBook">
				<c:forEach items="${model.books }" var="book">
				<c:if test="${book.status == 1 }">
					<tr>
						<td align="center" width="35%" id="myCarousel${book.id }"
							class="carousel slide">

							<ol class="carousel-indicators">

								<li data-target="#myCarousel${book.id }" data-slide-to="0" class="active"></li>
								<c:forEach items="${sessionScope.GALLERY }" var="img"
									varStatus="no">
									<c:if test="${img.book.id == book.id }">
										<li data-target="#myCarousel${book.id }" data-slide-to="${no.count }"></li>
									</c:if>
								</c:forEach>

							</ol> <!-- Wrapper for Slides -->
							<div class="carousel-inner">
								<div class="item active">
									<!-- Set the first background image using inline CSS below. -->
									<img alt="Nigellus Bookstore" width="150"
										src="<c:url value="${book.imageUrl}" />" />

								</div>
								<c:forEach items="${sessionScope.GALLERY }" var="img"
									varStatus="no">
									<c:if test="${img.book.id == book.id }">
										<div class="item">
											<img alt="Nigellus Bookstore" width="150"
											src="<c:url value="${img.imageUrl}" />" />
										</div>
									</c:if>
								</c:forEach>

							</div> <!-- Controls --> <a class="left carousel-control"
							href="#myCarousel${book.id }" data-slide="prev"> <span class="icon-prev"></span>
						</a> <a class="right carousel-control" href="#myCarousel${book.id }"
							data-slide="next"> <span class="icon-next"></span>
						</a>

						</td>

						<td>
						
							<h2 id="title${book.id}">${book.title}</h2> 
							<i id="author${book.id}">${book.authorList}</i><br /> <u>Category:</u>
							<c:forEach items="${book.categories }" var="category">
									- ${category.name}
								</c:forEach> <br /> <br /> <div id="descr${book.id}">${book.description }</div><br />
							<h2 style="color: green; font-weight: bold; text-align: right;" id="price${book.id}">
							${book.unitPrice.toString().replace('.0','')}&nbsp;VND</h2> <c:url var="urlCart" value="addToCart">
								<c:param name="bookId" value="${book.id}" />
							</c:url>
							<div id="img${book.id}" style="display: none;">${book.imageUrl}</div>
							<div style="text-align: right;">
								<c:if test="${book.quantity > 0 }">
									<a href="${urlCart}"><img alt="Nigellus Bookstore" width="16px"
										src="<c:url value="/resources/images/basket.png" />" /></a>
									
								</c:if>
								<c:if test="${book.quantity == 0 }">
									<font color="red">Sold out</font>
								</c:if>
								<a onclick="shareProduct(${book.id }, ${book.unitPrice})">
									<img src="<c:url value="/resources/images/facebook.png" />" width="16px"/>
									
									</a>
							</div>

						</td>
					</tr></c:if>
				</c:forEach>
			</table>
			<br />

		</form:form>
	</div>
	<div class="col-md-12">
	<div class="fb-comments col-lg-12" data-href="http://localhost:8080/NigellusBookstore/" data-numposts="5" data-colorscheme="light"></div>
	</div>
</body>
<script type="text/javascript"
	src="<c:url value='/resources/js/all.js' />"></script>
<script type="text/javascript">
	function submitForm() {
		document.getElementById('mainForm').submit();
	}
	function shareProduct(id, uPrice, image) {
		var title = $('#title'+id).html();
		var author = $('#author'+id).html();
		var price = uPrice.toString().replace('.0', '') + " VND";
		var desc = $('#descr'+id).html();
		var image = $('#img'+id).html();
// 		var mes = title.toUpperCase() + "\n";
// 		mes += "Author: " + author + "\n";
// 		mes += "Price: " + price + "\n";
// 		mes += "Description: " + desc + "\n";
		
// 		FB.login(function(){
// 			 FB.api('/me/feed', 'post', {message: mes});
// 			}, {scope: 'publish_actions'});
		FB.login(function(){
		FB.ui({
			method: 'feed',
			name: title,
			link: 'https://www.facebook.com/NigellusBookstore',
			caption: author,
			picture: 'http://2.gravatar.com/avatar/4b780e49f88361908563ed1b96fbd86f',
			description: 'From Nigellus Bookstore: ' + desc + 'Price: ' +  price
		});});
	}
</script>

</html>