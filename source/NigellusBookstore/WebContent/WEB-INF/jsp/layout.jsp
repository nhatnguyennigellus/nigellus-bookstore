<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="shortcut icon"
	href="<c:url value='/resources/images/logo.png'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/> ">
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.css'/> ">
<link rel="stylesheet"
	href="<c:url value='/resources/css/jquery-ui.css'/> ">
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap-theme.min.css'/> ">
<link rel="stylesheet"
	href="<c:url value='/resources/css/datepicker.css'/> ">
<script src="<c:url value='/resources/js/bootstrap.min.js'/> "></script>

<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-ui.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-1.10.2.js' />"></script>
</head>
<body
	style="padding-top: 15px; background-repeat: no-repeat; background-attachment: fixed;"
	background="<c:url value='/resources/images/background.jpg'/>">
	<table border="1" style="border-style: ridge; margin-bottom: 5px" cellpadding="2"
		cellspacing="2" align="center" width="90%">
		<tr>
			<td height="30" colspan="2"><tiles:insertAttribute
					name="header" /></td>
		</tr>
		<tr>
			<td height="300" class="content"
				style="background-color: #C0E9FF; vertical-align: top;" width="20%">
				<tiles:insertAttribute name="menu" />
			</td>
			<td style="vertical-align: top; background-color: #FFFFFF;"><tiles:insertAttribute
					name="body" /></td>
		</tr>
		<tr>
			<td height="50" colspan="2"
				style="background-color: #00A2FF; color: #FFFFFF"><tiles:insertAttribute
					name="footer" /></td>
		</tr>
	</table>
</body>
</html>