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
    <title>Plus Admin</title>
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
    <link rel="stylesheet" href="<c:url value="/static/assets/css/demo_2/style.css"/>" />
    <!-- End layout styles -->
    <link rel="shortcut icon" href="<c:url value="/static/assets/images/favicon.png"/>" />
  </head>
  <body>
    <div class="container-scroller">
    	<div class="horizontal-menu">
	        <tiles:insertAttribute name="header" />
	        <tiles:insertAttribute name="menu" />
        </div>
        <div class="container-fluid page-body-wrapper">
	        <div class="main-panel">
	        	<div class="content-wrapper pb-0">
			    <tiles:insertAttribute name="body" />
			    </div>
			</div>
		</div>
    <tiles:insertAttribute name="footer" />
    </div>
  </body>
</html>