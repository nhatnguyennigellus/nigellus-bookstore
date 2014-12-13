<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nigellus Bookstore - Homepage</title>
<link rel="stylesheet"
	href="<c:url value='/resources/css/sb-admin.css'/> ">
<link rel="stylesheet"
	href="<c:url value='/resources/css/font-awesome.min.css'/> ">
</head>
<body>
	<div class="col-md-12">
		<h1>Administrator page</h1>
		<c:if test="${sessionScope.admin == null }">
			<div class="col-md-6">You have to login as administrator</div>
		</c:if>
		<c:if test="${sessionScope.admin != null }">
			<!-- <div class="col-md-6">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">MANAGEMENT</h3>
					</div>
					<div class="panel-body">
						<p>
							<a href="viewBooks?key=&author=">Books</a>
						</p>
						<p>
							<a href="viewCategories">Categories</a>
						</p>
						<p>
							<a href="viewCustomers">Customers</a>
						</p>
						<p>
							<a href="viewOrder">Order</a>
						</p>
						<p>
							<a href="viewPromotions">Coupons
							</a>
						</p>
					</div>
				</div>
			</div>
			-->
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-book fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${sessionScope.BookNo }</div>
									<div>Books</div>
									<div><b>${sessionScope.CateNo } Categories</b></div>
								</div>
							</div>
						</div>
						<a href="viewBooks?key=&author=">
							<div class="panel-body">
								<span class="pull-left">Manage Books</span>
								<span class="pull-right">
									<i class="glyphicon glyphicon-circle-arrow-right"></i>
								</span>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-green">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-user fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${sessionScope.CusNo }</div>
									<div>Customer</div>
								</div>
							</div>
						</div>
						<a href="viewCustomers">
							<div class="panel-body">
								<span class="pull-left">View</span>
								<span class="pull-right">
									<i class="glyphicon glyphicon-circle-arrow-right"></i>
								</span>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-shopping-cart fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${sessionScope.OrderNo }</div>
									<div>Orders</div>
								</div>
							</div>
						</div>
						<a href="viewOrder">
							<div class="panel-body">
								<span class="pull-left">View Orders</span>
								<span class="pull-right">
									<i class="glyphicon glyphicon-circle-arrow-right"></i>
								</span>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-red">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-credit-card fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${sessionScope.CouponNo }</div>
									<div>Coupons</div>
								</div>
							</div>
						</div>
						<a href="viewPromotions">
							<div class="panel-body">
								<span class="pull-left">Manage coupons</span>
								<span class="pull-right">
									<i class="glyphicon glyphicon-circle-arrow-right"></i>
								</span>
							</div>
						</a>
					</div>
				</div>
			</div>
			
		</c:if> 
	</div>

</body>
</html>