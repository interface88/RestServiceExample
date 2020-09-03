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
    <!-- plugins:css -->
    <link rel="stylesheet" href="<c:url value="/static/assets/vendors/mdi/css/materialdesignicons.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/static/assets/vendors/flag-icon-css/css/flag-icon.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/static/assets/vendors/css/vendor.bundle.base.css"/>">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="<c:url value="/static/assets/vendors/jquery-bar-rating/css-stars.css"/>" />
    <link rel="stylesheet" href="<c:url value="/static/assets/vendors/font-awesome/css/font-awesome.min.css"/>" />
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
     <!-- Layout styles -->
    <link rel="stylesheet" href="<c:url value="/static/assets/css/demo_1/style.css"/>" />
    <!-- End layout styles -->
    <link rel="shortcut icon" href="<c:url value="/static/assets/images/favicon.png"/>" />
    
    <!-- Datepicker -->
    <link href="<c:url value="/static/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css" />" rel="stylesheet">	 
    
    
    
    
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="<c:url value="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js" />"></script>
	
    <!-- Datepicker -->
    <script src="<c:url value="/static/datepicker/js/bootstrap-datepicker.min.js" />"></script>
    <script src="<c:url value="/static/assets/js/numbermask.js"/>"></script>
    
	
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
    <script src="<c:url value="/static/assets/vendors/js/bootstrap-datepicker.min.js" />"></script>
    <script src="<c:url value="/static/assets/vendors/inputmask/jquery.inputmask.js" />"></script>
  </body>
</html>