<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>HOLIM - Dashboard</title>

<link href="<c:url value="/static/bootstrap/css/bootstrap.min.css" />"
	rel="stylesheet">

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
	<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 300px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}

body {
	color: #999;
	background: #f5f5f5;
	font-family: 'Arial';
}
.h1,.h2,.h3,.h4,.h5,.h6{
    font-family: 'Arial';
}
.form-control {
	box-shadow: none;
	border-color: #ddd;
	 width: 100%;
}

.form-control:focus {
	border-color: #1863e6;
}

.login-form {
	width: 350px;
	margin: 0 auto;
	padding: 30px 0;
}

.login-form form {
	color: #434343;
	border-radius: 1px;
	margin-bottom: 15px;
	background: #fff;
	border: 1px solid #f3f3f3;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.login-form h4 {
	text-align: center;
	font-size: 22px;
	margin-bottom: 20px;
}



.login-form .avatar i {
	font-size: 62px;
}

.login-form .form-group {
	margin-bottom: 20px;
}

.login-form .form-control, .login-form .btn {
	min-height: 40px;
	border-radius: 2px;
	transition: all 0.5s;
}

.login-form .close {
	position: absolute;
	top: 15px;
	right: 15px;
}

.login-form .btn {
	background: #1863e6;
	border: none;
	line-height: normal;
}

.login-form .btn:hover, .login-form .btn:focus {
	background: #6093ec;
}

.login-form .checkbox-inline {
	float: left;
}

.login-form input[type="checkbox"] {
	margin-top: 2px;
}

.login-form .forgot-link {
	float: right;
}

.login-form .small {
	font-size: 13px;
}

.login-form a {
	color: #1863e6;
}
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}
</style>
</head>

<body>
	<div class="login-form">
		<form name='loginForm' action="<c:url value='/mvc/security/sendResetPasswordLink' />" method='POST' role="form">
			<div class="avatar">
				<img src="${pageContext.request.contextPath}/static/images/holcimlogo.png" width="300" class="center" />
			</div>
			<h4 class="modal-title">Password Reset</h4>
			<c:if test="${not empty error}">
				<div class="error">${error}</div>
			</c:if>
			<c:if test="${not empty message}">
				<div class="msg">${message}</div>
			</c:if>
			<div class="form-group">
				<input class="form-control" placeholder="Email" required="required" type="text" name="email" value="" autofocus>
			</div>
			
			<input type="submit" class="btn btn-primary btn-block btn-lg" value="Submit">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /><br>
			<div style="float:right;"><a href="${pageContext.request.contextPath}/loginPage" ><u>back</u></a></div>
		</form>
		
	</div>

</body>

</html>

