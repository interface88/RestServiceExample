<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>HOLCIM - Admin Panel</title>

    <!-- Bootstrap Core CSS -->
 
    <link href="<c:url value="/static/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">

	<link href="<c:url value="/static/datatables-plugins/dataTables.bootstrap.css" />" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<c:url value="/static/metisMenu/metisMenu.min.css" />" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/static/css/sb-admin-2.css" />" rel="stylesheet">

   <!-- bootstrap cdn -->
   
    <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css" rel="stylesheet" type="text/css">
   
   	<!-- Datepicker -->
    <link href="<c:url value="/static/datepicker/css/bootstrap-datepicker3.min.css" />" rel="stylesheet">	 
    
<!-- 
 	<script src="<c:url value="/static/jquery/jquery.min.js" />"></script>
 -->
	 <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="<c:url value="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js" />"></script>
	<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
    
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script> 
	<script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script> 
	<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.print.min.js"></script>
	<!-- jquery cdn -->
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
	<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script> 
  	<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script> 
	 
	<script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script> 
	<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.flash.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.print.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.19/js/dataTables.semanticui.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.semanticui.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.colVis.min.js"></script>
 	<link href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css" rel="stylesheet" type="text/css">
 	<link href="https://cdn.datatables.net/1.10.19/css/dataTables.semanticui.min.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.semanticui.min.css" rel="stylesheet" type="text/css">
	<link href="<c:url value="/static/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">


	<!-- Datepicker -->
	<script src="<c:url value="/static/datepicker/js/bootstrap-datepicker.min.js" />"></script>
	
	
	
</head>

<body>

    <div id="wrapper">
		<form:form id="logoutform" action="${pageContext.request.contextPath}/perform_logout" method="POST"></form:form>
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-static-top" role="navigation">
            <div class="navbar-header">
              <a class="navbar-brand" href="${pageContext.request.contextPath}" style="padding-left:50px;">
                <img src="${pageContext.request.contextPath}/static/images/holcimlogo.png" width="200" height="100" />
              </a>    
            </div>
          <div class="nav navbar-top-links navbar-center">
              <center><h1 style="margin-top:40px;">Geostone-VR Application 
              	<security:authorize access="hasAnyRole('ADMIN')">Admin Panel</security:authorize>
              	<security:authorize access="hasAnyRole('SALES')">Sales Panel</security:authorize>
              </center>
              </h1>
               </div>
          </center>
            <!-- /.navbar-header -->
           
            <ul class="nav navbar-top-links navbar-right">
          <a href="#"  onclick="document.getElementById('logoutform').submit();" style="margin-bottom:20px;margin-right:30px;" >
          				<span style="font-size:18px;margin-bottom:20px;"><b>Logout</b></span><i class="fa fa-sign-out fa-fw"style="font-size:35px;margin-bottom:20px;"> </i>
           			   </a>
                </ul>
              
            <div class="navbar-inverse sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                    	<li>
		                     <div class="avatar text-center">
								<i class='fas fa-user-circle' style='font-size:58px;color:green'></i><br>
								<h4>
									<security:authorize access="hasAnyRole('ADMIN')"><b>Admin</b></security:authorize>
					              	<security:authorize access="hasAnyRole('SALES')"><b>Sales</b></security:authorize>
								</h4>
							</div>
                    	</li>
		                <security:authorize access="hasAnyRole('ADMIN')">    
                        <li>
                        	<a href="<spring:url value="/mvc/product/list" htmlEscape="true"/>">
                        		<i class="fa fa-shopping-cart fa-fw"></i> Product Managment
                        	</a>
                        </li>
                        </security:authorize>
                        <li>
                        	<a href="<spring:url value="/mvc/customer/list" htmlEscape="true"/>">
                        		<i class="fa fa-group fa-fw"></i> Customer List
                        	</a>
                        </li>
                        <security:authorize access="hasAnyRole('ADMIN')">
                        <li>
                        	<a href="<spring:url value="/mvc/city/list" htmlEscape="true"/>">
                        		<i class="fa fa-map-marker fa-fw"></i> City List
                        	</a>
                        </li>
                        </security:authorize>
                        <li>
                            <a href="#"><i class="fa fa-file-pdf-o fa-fw"></i> Reports<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<spring:url value="/mvc/report/stateWise" htmlEscape="true"/>"><i class="fa fa-chevron-right  fa-fw"></i>State wise</a>
                                </li>
                                <li>
                                    <a href="<spring:url value="/mvc/report/cityWise" htmlEscape="true"/>"><i class="fa fa-chevron-right  fa-fw"></i>City wise</a>
                                </li>
                                <li>
                                    <a href="<spring:url value="/mvc/report/productTypeWise" htmlEscape="true"/>"><i class="fa fa-chevron-right  fa-fw"></i>Product Type wise</a>
                                </li>
                                <li>
                                    <a href="<spring:url value="/mvc/report/productWise" htmlEscape="true"/>"><i class="fa fa-chevron-right  fa-fw"></i>Product wise</a>
                                </li>
                                <li>
                                    <a href="<spring:url value="/mvc/report/scenarioWise" htmlEscape="true"/>"><i class="fa fa-chevron-right  fa-fw"></i>Scenaio wise</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <security:authorize access="hasAnyRole('ADMIN')">
                         	<li>
                        	<a href="<spring:url value="/mvc/user/list" htmlEscape="true"/>">
                        		<i class="fa fa-user fa-fw"></i> User Management
                        	</a>
                        	</li>
						</security:authorize>
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <!-- Page Content -->
  
        <div id="page-wrapper">
            <div class="container-fluid">
                        