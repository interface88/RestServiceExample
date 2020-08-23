<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>HOLCIM - Password Reset</title>
		<!-- Bootstrap Core CSS -->
    
    <link href="<c:url value="/static/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">

	<link href="<c:url value="/static/datatables-plugins/dataTables.bootstrap.css" />" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<c:url value="/static/metisMenu/metisMenu.min.css" />" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/static/css/sb-admin-2.css" />" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/static/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script src="<c:url value="/static/jquery/jquery.min.js" />"></script>
	</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title"style="background-color:#B0DAF8;"><center>Reset password</center></h3>
					</div>
					<div class="panel-body">
						<form:form method="POST"
							action="${pageContext.request.contextPath}/mvc/security/savePassword" commandName="passwordVo">
							<fieldset>
								<div class="form-group">
									<label>New Password</label>
									<input id="newPassword" class="form-control" placeholder="Password" name="newPassword" type="password" value="">
								</div>
								<div class="form-group">
									<label>Confirm Password</label>
									<input id="matchPassword" class="form-control" placeholder="Password"
										name="mtatchPassword" type="password" value=""><span id='message'></span>
								</div>
								<input type="submit" class="btn btn-lg btn-success btn-block" value="Submit">
								
							</fieldset>
							<br>
			<div style="float:right;"><a href="${pageContext.request.contextPath}/loginPage" ><u>Login</u></a></div>
						</form:form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<script>
		$('#newPassword, #matchPassword').on('keyup', function () {
		  if ($('#newPassword').val() == $('#matchPassword').val()) {
		    $('#message').html('Matching').css('color', 'green');
		  } else 
		    $('#message').html('Not Matching').css('color', 'red');
		});
	</script>


</body>
</html>