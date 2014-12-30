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
	<c:if test="${sessionScope.ReportNoti != null}">

		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">ADMIN REPORT</h4>
					</div>
					<div class="modal-body">${sessionScope.ReportNoti}</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<div class="col-md-12">
		<h1>Administrator page</h1>
		<c:if test="${sessionScope.admin == null }">
			<div class="col-md-6">You have to login as administrator</div>
		</c:if>
		<c:if test="${sessionScope.admin != null }">
			<div class="row">
				<div class="btn-group col-md-6" role="group">
					<button type="button" id="btnManage" class="btn btn-default"
						onclick="manage()">MANAGEMENT</button>
					<button type="button" id="btnReport" class="btn btn-default"
						onclick="report()">REPORT</button>
				</div>
			</div>
			<br />
			<div class="row" id="report">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-red">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-euro fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<h3>YEARLY INCOME</h3>
								</div>
							</div>
						</div>
						<a>

							<div class="modal fade" id="modalIncome" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">Income Report</h4>
										</div>
										<form action="reportYearIncome" method="post" id="frmWare">
											<div class="modal-body col-md-6">

												<input type="hidden" name="id" id="id" />
												<div class="form-group">
													<label for="quantity">Year</label> <font color="red">
														<input type="number" min="2010" max="2020"
														name="yearIncome" id="yearIncome" class="form-control"
														value="2014" />
													</font>
												</div>


											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-success">Submit</button>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Cancel</button>

											</div>
										</form>
									</div>
								</div>
							</div>

							<div class="panel-body" data-toggle="modal"
								data-target="#modalIncome">
								<span class="pull-left">Report</span> <span class="pull-right">
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
									<i class="glyphicon glyphicon-book fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<h3>BEST SELLERS</h3>
								</div>
							</div>
						</div>
						<a href="reportTop5BestSeller">
							<div class="panel-body">
								<span class="pull-left">Report</span> <span class="pull-right">
									<i class="glyphicon glyphicon-circle-arrow-right"></i>
								</span>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-barcode fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<h3>WAREHOUSE</h3>
								</div>
							</div>
						</div>
						<a href="reportYearIncome?yearIncome=2014">
							<div class="panel-body">
								<span class="pull-left">Report</span> <span class="pull-right">
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
									<i class="glyphicon glyphicon-shopping-cart fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<h3>EXPORT ORDER</h3>
								</div>
							</div>
						</div>
						<a href="viewOrder">
							<div class="panel-body">
								<span class="pull-left">View</span> <span class="pull-right">
									<i class="glyphicon glyphicon-circle-arrow-right"></i>
								</span>
							</div>
						</a>
					</div>
				</div>
			</div>

			<div class="row" id="manage">
				<div class="col-lg-4 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-book fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${sessionScope.BookNo }</div>
									<div>Books</div>
								</div>
							</div>
						</div>
						<a href="viewBooks?key=&author=">
							<div class="panel-body">
								<span class="pull-left">Manage Books</span> <span
									class="pull-right"> <i
									class="glyphicon glyphicon-circle-arrow-right"></i>
								</span>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
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
								<span class="pull-left">View</span> <span class="pull-right">
									<i class="glyphicon glyphicon-circle-arrow-right"></i>
								</span>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="panel panel-purple">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-barcode fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${sessionScope.Stock }</div>
									<div>Items in stock</div>
								</div>
							</div>
						</div>
						<a href="viewStock">
							<div class="panel-body">
								<span class="pull-left">View</span> <span class="pull-right">
									<i class="glyphicon glyphicon-circle-arrow-right"></i>
								</span>
							</div>
						</a>
					</div>
				</div>

				<div class="col-lg-4 col-md-6">
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
								<span class="pull-left">Manage coupons</span> <span
									class="pull-right"> <i
									class="glyphicon glyphicon-circle-arrow-right"></i>
								</span>
							</div>
						</a>
					</div>
				</div>

				<div class="col-lg-4 col-md-6">
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
								<span class="pull-left">View Orders</span> <span
									class="pull-right"> <i
									class="glyphicon glyphicon-circle-arrow-right"></i>
								</span>
							</div>
						</a> <a href="toOrderConfig">
							<div class="panel-body">
								<span class="pull-left">Configure Order</span> <span
									class="pull-right"> <i
									class="glyphicon glyphicon-circle-arrow-right"></i>
								</span>
							</div>
						</a>
					</div>
				</div>
			</div>

		</c:if>
	</div>

</body>
<script type="text/javascript">
	function manage() {
		$("#report").hide();
		$("#manage").fadeIn();
		$("#btnManage").attr("class", "btn btn-primary");
		$("#btnReport").attr("class", "btn btn-default");
	}
	$(window).load(function() {
		$('#myModal').modal('show');
	});
	function report() {
		$("#manage").hide();
		$("#report").fadeIn();
		$("#btnManage").attr("class", "btn btn-default");
		$("#btnReport").attr("class", "btn btn-primary");
	}

	$(function() {
		$("#report").hide();
		$("#btnManage").attr("class", "btn btn-primary");
	});
</script>
</html>