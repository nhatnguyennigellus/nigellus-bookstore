<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Our products</title>
</head>
<body>
	<div style="background-color: #F3F781; padding: 5px 5px 5px 10px">

	</div>
	<br />
	<div class="col-md-12">

		<c:if test="${sessionScope.warehouseSuccess != null}">

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">WAREHOUSE SUCCESS</h4>
						</div>
						<div class="modal-body">${sessionScope.warehouseSuccess}</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">OK</button>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<div class="modal fade" id="myModalDel" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Warehouse book</h4>
					</div>
					<form action="warehouse" method="post" id="frmWare">
						<div class="modal-body col-md-6">

							<input type="hidden" name="id" id="id" />
							<div class="form-group">
								<b>Product: </b>
								<p id="title"></p>
							</div>
							<div class="form-group">
								<label for="quantity">Quantity</label> <font color="red"><input
									name="quantity" id="quantity" placeholder="Quantity"
									class="form-control" type="text" value="10"/></font>
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
		<div class="btn-group" role="group">
			<button type="button" id="btnStock" class="btn btn-default" onclick="showStockItems()">Stock items</button>
			<button type="button" id="btnWare" class="btn btn-default" onclick="showHistory()">Warehousing history</button>
		</div>
		<br />
		<div id="stockItem">
			<h3>STOCK ITEMS</h3>
			<c:choose>
				<c:when test="${sessionScope.BOOK.size() == 0 }">
					<p>
						<font color="red">No data</font>
					</p>
				</c:when>
				<c:otherwise>
					<div class="table-responsive">
						<table class="table table-striped" width="100%" id="tableItems">
							<thead>
								<tr>
									<th>Title</th>
									<th>Quantity</th>
									<th>Warehouse</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sessionScope.BOOK }" var="book">

									<tr>
										<td>${book.title}</td>
										<td>${book.quantity}</td>
										<td>
											<button type="button" class="btn btn-success btn-xs"
												data-toggle="modal" data-target="#myModalDel"
												data-id="${book.id}" data-title="${book.title}">
												&nbsp;<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;
											</button>
										</td>
									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="ware">
			<h3>WAREHOUSING HISTORY</h3>
			<c:choose>
				<c:when test="${sessionScope.WAREHOUSE.size() == 0 }">
					<p>
						<font color="red">No data</font>
					</p>
				</c:when>
				<c:otherwise>

					<div class="table-responsive">
						<table class="table table-striped" width="100%" id="tableWare">
							<thead>
								<tr>
									<th>Date</th>
									<th>Product</th>
									<th>Quantity</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sessionScope.WAREHOUSE }" var="data">

									<tr>
										<td><fmt:formatDate value="${data.dateWarehousing}"
												pattern="dd.MM.yyyy HH:mm:ss" /></td>
										<td>${data.book.title}</td>
										<td>${data.quantityWarehousing}</td>
										
									</tr>

								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.validate.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.additional-methods.js' />"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#tableWare').dataTable({

			"bFilter" : false,
			"iDisplayLength": 5,
			"aoColumnDefs": [
			                 { 'bSortable': false, 'aTargets': [ 1, 2 ] }
			              ]
		});
		$('#tableItems').dataTable({

			"bFilter" : false,
			"iDisplayLength": 5
		});
	});
	$(document).on("click", ".btn-success", function() {

		$("input#id").attr("value", $(this).data('id'));
		$("p#title").html($(this).data('title'));
	});

	$.validator.addMethod('minStrict', function(value, el, param) {
		return value > param;
	});
	
	function showHistory() {
		$("#stockItem").hide();
		$("#ware").fadeIn();
		$("#btnStock").attr("class", "btn btn-default");
		$("#btnWare").attr("class", "btn btn-primary");
	}
	
	function showStockItems() {
		$("#ware").hide();
		$("#stockItem").fadeIn();
		$("#btnStock").attr("class", "btn btn-primary");
		$("#btnWare").attr("class", "btn btn-default");
	}
	$(window).load(function() {
		$('#myModal').modal('show');
	});

	$(function() {
		$("#ware").hide();
		$("#btnStock").attr("class", "btn btn-primary");
		$("#frmWare").validate({
			rules : {
				quantity : {
					required : true,
					digits : true,
					minStrict : 0
				},
			},
			messages : {
				quantity : {
					required : "Quantity field is required!",
					digits : "Please enter a number!",
					minStrict : "Please enter a number greater than 0"
				}
			},
		});
	});
</script>
</html>