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
	href="<c:url value='/resources/css/bootstrap.css'/> ">
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/> ">
<link rel="stylesheet"
	href="<c:url value='/resources/css/jquery.dataTables.min.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/dataTables.bootstrap.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/jquery-ui.css'/> ">
<link rel="stylesheet"
	href="<c:url value='/resources/css/full-slider.css'/> ">
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap-theme.min.css'/> ">


<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-ui.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-1.10.2.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.dataTables.min.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/all.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/dataTables.bootstrap.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/> "></script>
</head>
<body
	style="padding-top: 5px; background-repeat: no-repeat; background-attachment: fixed;"
	background="<c:url value='/resources/images/background.jpg'/>">
	<table border="0" style="border-style: solid; margin-bottom: 5px"
		cellpadding="2" cellspacing="2" align="center" width="90%">
		<tr>
			<td height="30" colspan="2" style="background-color: #FFDFDF;"><tiles:insertAttribute
					name="header" /></td>
		</tr>
		<tr>
			<td height="600"
				style="background-color: #FFFFB7; vertical-align: top;" width="18%">
				<div id="fb-root"></div>
				<tiles:insertAttribute name="menu" />
			</td>
			<td style="vertical-align: top; background-color: #FFFFFF;"><tiles:insertAttribute
					name="body" />
			
			</td>
					
		</tr>
		<tr>
			<td height="50" colspan="2"
				style="background-color: #145CAE; color: #FFFFFF"><tiles:insertAttribute
					name="footer" /></td>
		</tr>
	</table>
</body>
<script type="text/javascript">
	window.fbAsyncInit = function() {
		FB.init({
			appId : '345755782258353',
			channelUrl : '//localhost:8080/NigellusBookstore/channel.html',
			status : true,
			cookie : true,
			xfbml : true
		});

		FB.getLoginStatus(function(response) {
			if (response.status === 'connected') {
				$('#fb_status').text('Connected!');
				$('#user_auth_info').css('display', 'block');
                $('#fb_login_link').css('display', 'none');
				testAPI();
				getProfilePicture();
			} else if (response.status === 'not_authorized') {
				$('#fb_status').text('Not Authorize');

			} else {
				$('#fb_status').text('Not logged in');
			}
		});
	};
	(function(d) {
        var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement('script');
        js.id = id;
        js.async = true;
        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=345755782258353";
        ref.parentNode.insertBefore(js, ref);
    }(document));
	
</script>
<script type="text/javascript">
	function loginFacebook() {
		FB.login(function (response) {
			if (response.authResponse) {
				loginStatusInfo();
				testAPI();
				getProfilePicture();
			}
		}, {scope: 'public_profile,user_about_me,user_birthday,user_videos,user_activities,user_interests,email,user_status,publish_stream'});
	}
	
	
	function testAPI() {
		console.log('Welcome! Fetching your information');
		FB.api('/me', function(response) {
			$('#name').text(response.name);
			var image = document.getElementById('avatar');
			image.src = 'https://graph.facebook.com/' + response.id + '/picture';
		});
	}
	
	function loginStatusInfo() {
		FB.getLoginStatus(function(response) {
			if (response.status === 'connected') {
				$('#fb_status').text('Connected');
				getProfilePicture();
			}
		});
	}
</script>
</html>