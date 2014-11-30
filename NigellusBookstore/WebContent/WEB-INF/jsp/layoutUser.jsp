<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/site.css' />"/>
</head>
<body>
<table border="0" cellpadding="2" cellspacing="2" align="center" width="95%">
	<tr>
		<td height="30" colspan="2" style="background-color: #FFDFDF; color: #FF5500">
			<tiles:insertAttribute name="header"/>
		</td>
	</tr>
	<tr>
		<td height="300" class="content" style="background-color: #C0E9FF; vertical-align: top;" width="20%">
			<tiles:insertAttribute name="menu"/>
		</td>
		<td class="content" >
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