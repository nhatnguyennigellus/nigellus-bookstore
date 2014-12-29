<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-12">
		<h3>ORDER CONFIGURATION</h3>
	</div>
	<div class="col-md-6">
	<c:if test="${sessionScope.configSuccess != null}">
				
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">CONFIGURATION SUCCESS</h4>
							</div>
							<div class="modal-body">
			 					<font color="green">${sessionScope.configSuccess }</font>
							</div>
							<div class="modal-footer">
								<a href="admin">
								<button type="button" class="btn btn-primary"><img alt="Nigellus Bookstore" width="20px"
		src="<c:url value="/resources/images/go-back.png" />" /> OK </button></a>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<div class="modal fade" id="modalMinMax" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">ERROR</h4>
							</div>
							<div class="modal-body">
			 					<font color="red">Minimum value must be less than maximum value</font>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
								data-dismiss="modal"> Back </button>
							</div>
						</div>
					</div>
				</div>
		<form role="form" action="configOrder" id="frmConfigOrder"
			method="get">
			<div class="form-group">
				<label for="min">Minimum</label> <input name="min" id="min"
					placeholder="Min" class="form-control" type="number" min=50000
					step=5000 max=500000 
					value="${sessionScope.config.getMin().toString().replace('.0', '') }" />
			</div>
			<div class="form-group">
				<label for="max">Maximum</label> <input name="max" id="max"
					placeholder="Max" class="form-control" type="number" min=50000
					step=5000 max=50000000 
					value="${sessionScope.config.getMax().toString().replace('.0', '') }" />
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label> <input type="checkbox"
						<c:if test="${sessionScope.config.getActive() == 1 }">
								checked
							</c:if> id="chkActive" value="Active" name="active" /> 
							Active
						</label>
					</div>

				</div>
			</div>
			<input class="btn btn-success" name="submit" type="submit"
					value="Update" /> 
		</form>
	</div>

</body>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.validate.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.additional-methods.js' />"></script>
<script type="text/javascript">
$(window).load(function() {
	$('#myModal').modal('show');
});
$(function() {
	$("#frmConfigOrder").validate({
		rules: {
			min : {
				required: true,
				digits: true
			},
			max : {
				required: true,
				digits: true
			}
		},
		messages: {
			min : {
				required: "Minimum value is required",
				digits: "Please enter a number"
			},
			max : {
				required: "Maximum value is required",
				digits: "Please enter a number"
			}
		},
		submitHandler : function (form) {
			var min = parseInt($("#min").val());
			var max = parseInt($("#max").val());
			if (min > max) {
				$('#modalMinMax').modal('show');
				return false;
			}
			
			form.submit();
		}
		
	});
});
</script>
</html>