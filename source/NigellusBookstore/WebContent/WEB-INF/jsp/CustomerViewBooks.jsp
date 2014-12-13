<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
							<h2>${book.title}</h2> <i>${book.authorList}</i><br /> <u>Category:</u>
							<c:forEach items="${book.categories }" var="category">
									- ${category.name}
								</c:forEach> <br /> <br /> ${book.description }<br />
							<h2 style="color: green; font-weight: bold; text-align: right;">${book.unitPrice}
								VND</h2> <c:url var="urlCart" value="addToCart">
								<c:param name="bookId" value="${book.id}" />
							</c:url>
							<div style="text-align: right;">
								<c:if test="${book.status == 1 }">

									<img alt="Nigellus Bookstore" width="30"
										src="<c:url value="/resources/images/basket.png" />" />
									<a href="${urlCart}">Add to cart</a>

								</c:if>
								<c:if test="${book.status == 0 }">
									<font color="red">Sold out</font>
								</c:if>
							</div>

						</td>
					</tr>
				</c:forEach>
			</table>
			<br />

		</form:form>
	</div>

</body>
<script type="text/javascript">
	function submitForm() {
		document.getElementById('mainForm').submit();
	}
</script>
</html>