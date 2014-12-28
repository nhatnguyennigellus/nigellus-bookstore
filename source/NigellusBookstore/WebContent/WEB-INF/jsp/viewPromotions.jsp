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
			<a href="toAddPromotion"> <img alt="Nigellus Bookstore"
				src="<c:url value="/resources/images/img_add.gif" />" /> Add Coupon
			</a>
			<c:choose>
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
								<th>Discount Type</th>
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
									<td>${promote.discountType}</td>
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
										</c:url> <a href="${url }">
											<button type="button" class="btn btn-success btn-xs">
												<img alt="Nigellus Bookstore"
													src="<c:url value="/resources/images/edit-icon.png" />" />
											</button>
									</a>

										<div class="modal fade" id="myModal" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" 
														onclick="passData(${promote.promotionCode})">
															<span aria-hidden="true">&times;</span><span
																class="sr-only">Close</span>
														</button>
														<h4 class="modal-title" id="myModalLabel">DETAILS</h4>
													</div>
													<div class="modal-body">
														<b>Promotion Code: </b> <p id="codeA"></p>
														<b>Discount amount: </b> <p id="amountA"></p>
														<b>Condition:</b> <p id="conditionA"></p>
														<b>Description:</b><p id="descriptionA"></p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-danger"
															data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
										<button type="button" class="btn btn-primary btn-xs"
											data-toggle="modal" data-target="#myModal" data-code="${promote.promotionCode}"
											data-amount="${promote.discountAmount.toString().replace('.0','')}" 
											data-condition="${promote.conditionAmount.toString().replace('.0','')}"
											data-type="<c:if test="${promote.discountType eq 'Fee'}"> VND</c:if>
														<c:if test="${promote.discountType eq 'Percent'}">%</c:if>" data-desc="${promote.description}">
											<img alt="Nigellus Bookstore"
												src="<c:url value="/resources/images/221.png" />" />
										</button></td>

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

				$('#myTable').dataTable({
					"bFilter" : false
				});
			});
			
			$(document).on("click", ".btn-primary", function () {
				$("p#codeA").html($(this).data('code'));
				$("p#amountA").html($(this).data('amount')+$(this).data('type'));
				$("p#descriptionA").html($(this).data('desc'));
				$("p#conditionA").html($(this).data('condition'));
			});
			
			function passData(code){
				$("#codeA").html(code);
			}
		</script>
</body>

</html>