<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>CricScore</title>
    <link rel="stylesheet" href="<c:url value="/static/assets/vendors/mdi/css/materialdesignicons.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/static/assets/vendors/flag-icon-css/css/flag-icon.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/static/assets/vendors/jquery-bar-rating/css-stars.css"/>" />
    <link rel="stylesheet" href="<c:url value="/static/assets/vendors/font-awesome/css/font-awesome.min.css"/>" />
    <link rel="shortcut icon" href="<c:url value="/static/assets/images/favicon.png"/>" />
	<link href="<c:url value="/static/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css" />" rel="stylesheet">
    <link href="<c:url value="/static/assets/vendors/datatables/css/dataTables.bootstrap.min.css" />" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/static/assets/vendors/css/vendor.bundle.base.css"/>">
    <link rel="stylesheet" href="<c:url value="/static//assets/vendors/select2/select2.min.css"/>" />
    <link rel="stylesheet" href="<c:url value="/static/assets/vendors/select2-bootstrap-theme/select2-bootstrap.min.css"/>" />
    <link rel="stylesheet" href="<c:url value="/static/assets/css/demo_1/style.css"/>" />
    
    <script src="<c:url value="/static/assets/vendors/js/vendor.bundle.base.js" />"></script>
  </head>
  <body>
    <div class="container-scroller">
        <tiles:insertAttribute name="menu" />
        <tiles:insertAttribute name="header" />
        <div class="main-panel">
        	<div class="content-wrapper pb-0">
		    	<tiles:insertAttribute name="body" />
		    </div>
		    <tiles:insertAttribute name="footer" />
		</div>
    </div>
    <script src="<c:url value="/static/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js" />"></script>
    <script src="<c:url value="/static/assets/vendors/inputmask/jquery.inputmask.js" />"></script>
     
     <script src="<c:url value="/static/assets/vendors/datatables/js/jquery.dataTables.js" />"></script>
    <script src="<c:url value="/static/assets/vendors/datatables/js/dataTables.bootstrap4.js" />"></script>
    <script src="<c:url value="/static/assets/vendors/select2/select2.min.js" />"></script>
    <script>
    	$('.dropdown-toggle').dropdown()
    </script>
  </body>
</html>