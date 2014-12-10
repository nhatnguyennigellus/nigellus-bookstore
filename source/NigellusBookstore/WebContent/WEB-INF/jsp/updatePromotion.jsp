<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap-datetimepicker.min.css'/> ">
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap-datetimepicker.css'/> ">
</head>
<body>

	<div class="col-md-12">
		<h3>UPDATE PROMOTION COUPON</h3>
	</div>
	<div class="col-md-8">

		<div style="padding: 10px 10px 10px 10px">
			<c:if test="${sessionScope.updatePromoteSuccess != null}">
				<font color="green">${sessionScope.updatePromoteSuccess }</font>
				<img alt="Nigellus Bookstore" width="20px"
		src="<c:url value="/resources/images/go-back.png" />" />
				<a href="viewPromotions">Back</a>
			</c:if>
			<form role="form" action="updatePromotion?" id="frmUpdatePromote"
				method="get" onsubmit="validateDatetime()">
				<input name="id" type="hidden" value="${sessionScope.promotion.id }" />
				<div class="form-group">
					<label for="type">Discount Type</label> <font color="red"> <select
						name="type" id="type" placeholder="Title" class="form-control">
							<option value="Percent"
								<c:if test="${sessionScope.promotion.discountType eq 'Percent' }">
								selected
							</c:if>>%</option>
							<option value="Fee"
								<c:if test="${sessionScope.promotion.discountType eq 'Fee' }">
								selected
							</c:if>>Fee</option>
					</select></font>
				</div>

				<div class="form-group">
					<label for="amount">Discount Amount</label> <font color="red"><input
						name="amount" id="amount" placeholder="Discount Amount"
						value="${sessionScope.promotion.discountAmount.toString().replace(".0", "") }"
						class="form-control" /></font>
				</div>

				<div class="form-group">
					<label for="amount">Condition</label> <font color="red"><input
						name="condition" id="condition" placeholder="Discount Condition"
						<c:if test="${sessionScope.promotion.condition == ''}">
							value="${sessionScope.promotion.condition }"
						</c:if>
						<c:if test="${sessionScope.promotion.condition != ''}">
							value="${sessionScope.promotion.condition.toString().replace(".0", "") }"
						</c:if>
						class="form-control" /></font>
				</div>

				<div class="form-group">
					<label for="description">Description</label> <font color="red"><textarea
							rows="3" name="description" id="description"
							placeholder="[Use HTML tag to edit] Description"
							class="form-control"
							value="${sessionScope.promotion.description }"></textarea></font>
				</div>

				<div class="form-group">
					<label for="start">Start date</label> <font color="red">
						<div class="input-group date form_datetime col-md-8"
							data-date-format="mm/dd/yyyy hh:ii:00"
							data-link-field="dtp_input1">
							<input class="form-control" size="16" type="text" value=""
								readonly name="start" id="start" placeholder="Start date"
								pattern="MM/dd/yyyy HH:mm:ss" /> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-th"></span></span> <input type="hidden"
								value="<fmt:formatDate value="${sessionScope.promotion.startDate }"
									pattern="MM/dd/yyyy HH:mm:ss" />"
								id="startDate">
						</div>
					</font>
				</div>

				<div class="form-group">
					<label for="start">End date</label> <font color="red">
						<div class="input-group date form_datetime col-md-8"
							data-date-format="mm/dd/yyyy hh:ii:00"
							data-link-field="dtp_input1">
							<input class="form-control" size="16" type="text" value=""
								readonly name="end" id="end" placeholder="End date"> <span
								class="input-group-addon"><span
								class="glyphicon glyphicon-th"></span></span> <input type="hidden"
								value="<fmt:formatDate value="${sessionScope.promotion.endDate }"
									pattern="MM/dd/yyyy HH:mm:ss" />"
								id="endDate">

						</div>
				</div>
				
				
				<div id="dateNoti" class="form-group"
					style="color: red; display: none;">Start date must be before
					end date</div>
					
				<div class="form-group">
					<label for="type">Status</label> <font color="red"> <select
						name="status" id="status" class="form-control">
							<option value="Active"
								<c:if test="${sessionScope.promotion.status eq 'Active' }">
								selected
							</c:if>>Active</option>
							<option value="Inactive"
								<c:if test="${sessionScope.promotion.discountType eq 'Inactive' }">
								selected
							</c:if>>Inactive</option>
					</select></font>
				</div>
				
				<input class="btn btn-success" name="submit" type="submit"
					value="Add" /> <input name="reset" type="reset" value="Reset"
					class="btn btn-danger" /> <a href="viewBooks?key=&author=">Back</a>

			</form>
		</div>

	</div>

</body>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-ui.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-1.10.2.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.validate.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.additional-methods.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/bootstrap-datepicker.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/bootstrap-datetimepicker.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/bootstrap-datetimepicker.min.js' />"></script>
<script type="text/javascript">
	/*	function startValidate() {
	 if($("#end").val() == "") {
	 $("#end").val($("#start").val());
	 } 
	 else {
	 var startDate = new Date($("#start").val());
	 var endDate = new Date($("#end").val());
	 if(startDate > endDate) {
	 alert('Start date must be before end date');
	 $("#start").val($("#end").val());
	 }
	 }
	 }
	
	 function endValidate() {
	 if($("#start").val() == "") {
	 $("#start").val($("#end").val());
	 } 
	 else {
	 var startDate = new Date($("#start").val());
	 var endDate = new Date($("#end").val());
	 if(startDate > endDate) {
	 alert('Start date must be before end date');
	 $("#end").val($("#start").val());
	
	 }
	 }
	 }
	 */
	function validateDatetime() {

	}
	$(function() {
		$("#frmUpdatePromote").validate({
			rules : {
				amount : {
					required : true,
					digits : true
				},
				start : {
					required : true,
				},
				end : {
					required : true,
				},
				type : {
					required : true,
				}
			},
			messages : {
				amount : {
					required : "Please enter discount amount",
					digits : "Please enter a number"
				},
				start : {
					required : "Invalid date or empty field"

				},
				end : {
					required : "Invalid date or empty field",
				},
				type : {
					required : "Please select a coupon type"
				}
			},
			submitHandler : function(form) {

				var startDate = new Date($("#start").val());
				var endDate = new Date($("#end").val());
				if (startDate > endDate) {
					$("#dateNoti").show();
					$("#end").val($("#start").val());
					return false;
				}

				if ($("#type option:selected").text() == '%') {
					var amount = parseInt($("#amount").val());
					if (amount > 100) {
						alert('Percentage must be less than or equal to 100!');
						return false;
					}

				}
				form.submit();
			}
		})
	});
	$('.form_datetime').datetimepicker({
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		forceParse : 0
	});
	$("#start").datetimepicker({
		format: "mm/dd/yyyy HH:mm:00"
	});
	$("#end").datetimepicker({
		format: "mm/dd/yyyy HH:mm:00"
	});
	$(function() {
		$("#start").datetimepicker('setDate', new Date($("#startDate").val()));
		$("#end").datetimepicker('setDate', new Date($("#endDate").val()));
	});
</script>
</html>