<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Holcim Error Page</title>
	<!-- Bootstrap Core CSS -->
	
	<link href="<c:url value="/static/bootstrap/css/bootstrap.min.css" />"
		rel="stylesheet">
	
	<link
		href="<c:url value="/static/datatables-plugins/dataTables.bootstrap.css" />"
		rel="stylesheet">
	
	<!-- MetisMenu CSS -->
	<link href="<c:url value="/static/metisMenu/metisMenu.min.css" />"
		rel="stylesheet">
	
	<!-- Custom CSS -->
	<link href="<c:url value="/static/css/sb-admin-2.css" />"
		rel="stylesheet">
	
	<!-- Custom Fonts -->
	<link
		href="<c:url value="/static/font-awesome/css/font-awesome.min.css" />"
		rel="stylesheet" type="text/css">
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
			        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
			    <![endif]-->
	<script src="<c:url value="/static/jquery/jquery.min.js" />"></script>
			<style>
			p {
				font-size: 12px;
				color: #373737;
				font-family: Arial;
				line-height: 18px;
			}
			
			p a {
				color: #218bdc;
				font-size: 12px;
				text-decoration: none;
			}
			
			a {
				outline: none;
			}
			
			.f-left {
				float: left;
			}
			
			.f-right {
				float: right;
			}
			
			.clear {
				clear: both;
				overflow: hidden;
			}
			
			#block_error {
				width: 845px;
				height: 384px;
				border: 1px solid #cccccc;
				margin: 72px auto 0;
				-moz-border-radius: 4px;
				-webkit-border-radius: 4px;
				border-radius: 4px;
				background: #fff url(../static/images/block.gif) no-repeat 0 51px;
			}
			
			#block_error div {
				padding: 100px 40px 0 186px;
			}
			
			#block_error div h2 {
				color: #218bdc;
				font-size: 24px;
				display: block;
				padding: 0 0 14px 0;
				border-bottom: 1px solid #cccccc;
				margin-bottom: 12px;
				foant-weight: normal;
			}
			</style>
	</head>
	<body>
		<div id="block_error">
			<div>
				<h2>Error 404. &nbspOops you've have encountered an error</h2>
				<p>
					It appears that Either something went wrong or the page doesn't
					exist anymore..<br /> This website is temporarily unable to service
					your request.
				</p>
			</div>
		</div>
	</body>
</html>