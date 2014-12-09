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
		<div style="padding: 10px 10px 10px 10px">
			<h3>Payment Method</h3>
			<p>Select your payment method:</p>
			<form action="updatePaymentMethod">
				<div class="form-group">
					<div class="form-group col-md-6">
						<select name="method" id="method" class="form-control">
							<option onclick="hide()" value="Cash">Cash</option>
							<option onclick="view()" value="Credit Card">Credit Card</option>
							<option onclick="view()" value="Debit Card">Debit Card</option>
						</select>
					</div>
					<input name="btnSubmit" id="btnSubmit" type="submit" value="Submit"
						class="btn btn-success" />
				</div>
				<div class="panel panel-info" id="card" style="display: none;">
					<div class="panel-body">
						<img alt="" title=""
							src="http://www.credit-card-logos.com/images/multiple_credit-card-logos-1/credit_card_logos_10.gif"
							height="70" border="0" />
						<div class="form-group">
							<label for="phone" class="col-sm-6 control-label">Card
								holder name</label>
							<div class="col-sm-8">
								<input name="holder" id="holder" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-sm-6 control-label">Card ID</label>
							<div class="col-sm-8">
								<input name="card" id="card" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-sm-6 control-label">PIN</label>
							<div class="col-sm-8">
								<input name="phone" id="phone" type="password"
									class="form-control" />
							</div>
						</div>

					</div>
				</div>
			</form>
		</div>
	</div>
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
<script type="text/javascript">
	$('#method').change(function() {
		if ($(this).val() == 'Cash') {
			$("#card").fadeOut();
		} else {
			$("#card").fadeIn();
		}

	});
	$(function() {
	});
</script>
</html>