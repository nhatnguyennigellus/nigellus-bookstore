<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title><!-- 
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/site.css' />"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jquery-ui.css' />"/> -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body style="padding-top: 15px">
<table border="1" style="border-style: ridge;" cellpadding="2" cellspacing="2" align="center" width="80%">
	<tr>
		<td height="30" colspan="2" >
			<tiles:insertAttribute name="header"/>
		</td>
	</tr>
	<tr>
		<td height="300" class="content" style="background-color: #C0E9FF; vertical-align: top;" width="20%">
			<tiles:insertAttribute name="menu"/>
		</td>
		<td style="vertical-align: top;">
			<tiles:insertAttribute name="body" />
		</td>
	</tr>
	<tr>
		<td height="50" colspan="2" style="background-color: #00A2FF; color: #FFFFFF">
			<tiles:insertAttribute name="footer"/>
		</td>
	</tr>
</table>
</body>
</html>