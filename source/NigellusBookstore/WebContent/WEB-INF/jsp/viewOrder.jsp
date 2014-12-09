<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Orders</title>
</head>
<body>
	<div style="padding: 5px 10px 10px 10px">
		<c:if test="${param.username == null }">
			<h4>SEARCH ORDER:</h4>
			<form action="viewOrderMonthly" class="form-inline">

				<div class="form-group">
					<label for="from" class="col-sm-2 control-label"> Select
						month</label>
				</div>
				<div class="form-group">
					<select name="year" class="form-control">
						<option>2014</option>
					</select>

				</div>



				<div class="form-group">
					<select name="month" class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
					</select>
				</div>
				<div class="form-group">

					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" value="Search" class="btn btn-primary" />

					</div>

				</div>
				<div class="form-group">

					<div class="col-sm-offset-2 col-sm-10">
						<a href="viewOrder"> <input type="button" value="View all"
							class="btn btn-success" />
						</a>
					</div>

				</div>
			</form>
		</c:if>
	</div>
	<div class="col-md-12">
		<h2>
			<b>ORDER </b>
			<c:if test="${param.month != null && param.year != null }">
				${param.month }/${param.year }
			</c:if>
		</h2>
		<a href="javascript:history.go(-1)">Back</a>
		<c:choose>
			<c:when
				test="${sessionScope.ORDERLIST == null || sessionScope.ORDERLIST.size() == 0 }">
				<p>
					<font color="red">No data</font>
				</p>
			</c:when>
			<c:otherwise>
				<div class="table-responsive">
					<table class="table table-striped" width="100%" id="myTable">
						<thead>
							<tr>
								<th>No</th>
								<th>Customer</th>
								<th>Fullname</th>
								<th>Order date</th>
								<th align="right">Total Amount</th>
								<th>Status</th>
								<th>View Details</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${sessionScope.ORDERLIST }" var="order"
								varStatus="no">
								<tr>
									<td>${no.count }</td>
									<td>${order.customer.username}</td>
									<td>${order.fullname}</td>
									<td><fmt:formatDate value="${order.orderDate}"
											pattern="dd.MM.yyyy HH:mm:ss" /></td>
									<td align="right">${order.totalAmount}</td>
									<td><font style="font-weight: bold;"
										color="<c:if test="${order.status == 'Delivered'}">green</c:if>
				<c:if test="${order.status == 'Pending'}">#C41307</c:if>
				<c:if test="${order.status == 'Submitted'}">blue</c:if>">
											${order.status} </font></td>
									<td align="center"><c:url var="url" value="viewDetails">
											<c:param name="id" value="${order.id}" />
											<c:param name="fullname" value="${order.fullname}" />
											<c:param name="address" value="${order.address}" />
											<c:param name="phone" value="${order.phone}" />
											<c:param name="email" value="${order.email}" />
											<c:param name="total" value="${order.totalAmount}" />
											<c:param name="status" value="${order.status}" />
										</c:url> <a href="${url }"> <button type="button" class="btn btn-success">
										<img alt="Nigellus Bookstore"
											src="<c:url value="/resources/images/221.png" />" /> </button>
									</a></td>

								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:otherwise>
		</c:choose>

	</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#myTable').dataTable({
			"bFilter" : false
		});
	});
</script>
</html>