<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Promotions</title>
</head>
<body>
	<div style="padding: 5px 10px 10px 10px">
		<div class="col-md-12">
			<h2>
				<b>PROMOTION COUPONS</b>
			</h2>
			<a href="toAddPromotion"><a href="javascript:history.go(-1)">
					<img alt="Nigellus Bookstore" width="20px"
					src="<c:url value="/resources/images/go-back.png" />" /> Back
			</a> <a href="toAddPromotion"> <img alt="Nigellus Bookstore"
					src="<c:url value="/resources/images/img_add.gif" />" /> Add Coupon
			</a> <c:choose>
					<c:when
						test="${sessionScope.PROMOTIONLIST == null || sessionScope.PROMOTIONLIST.size() == 0 }">
						<p>
							<font color="red">No data</font>
						</p>
					</c:when>
					<c:otherwise>
						<table class="table table-striped" width="100%" id="myTable">
							<thead>
								<tr>
									<th>No</th>
									<th>Promotion Code</th>
									<th>Discount Type</th>
									<th>Discount Amount</th>
									<th>Condition</th>
									<th>Start date</th>
									<th>End date</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sessionScope.PROMOTIONLIST }" var="promote"
									varStatus="no">
									<tr>
										<td>${no.count }</td>
										<td>${promote.promotionCode}</td>
										<td>${promote.discountType}</td>
										<td>${promote.condition}</td>
										<td>${promote.discountAmount} <c:if
												test="${promote.discountType eq 'Fee'}">
									VND
								</c:if> <c:if test="${promote.discountType eq 'Percent'}">
									%
								</c:if>
										</td>
										<td><fmt:formatDate value="${promote.startDate}"
												pattern="dd.MM.yyyy HH:mm:ss" /></td>
										<td><fmt:formatDate value="${promote.endDate}"
												pattern="dd.MM.yyyy HH:mm:ss" /></td>
										<td><font style="font-weight: bold;"
											color="<c:if test="${promote.status == 'Active'}">green</c:if>
				<c:if test="${promote.status == 'Inactive'}">#9A0000</c:if>">
												${promote.status} </font></td>
										<td><c:url var="url" value="toUpdatePromotion">
												<c:param name="id" value="${promote.id}" />
											</c:url> <a href="${url }"> <button type="button" class="btn btn-success btn-xs">
											<img alt="Nigellus Bookstore"
												src="<c:url value="/resources/images/edit-icon.png" />" />
												</button></a></td>

									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
		</div>
		<script src="<c:url value='/resources/js/bootstrap-datepicker.js'/>"></script>
		<script type="text/javascript">
			// When the document is ready
			$(document).ready(function() {

				$('#from, #to').datepicker({
					format : "yyyy-mm-dd"
				});
				$('#myTable').dataTable({
					"bFilter" : false
				});
			});
		</script>
</body>

</html>