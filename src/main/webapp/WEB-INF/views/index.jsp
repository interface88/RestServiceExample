<%@include file="includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<!-- <h1>Welcome to Geostone-VR Admin Panel</h1> -->
		<security:authorize access="hasAnyRole('ADMIN')"><b><h1>Welcome to Geostone-VR Admin Panel</h1></b></security:authorize>
		<security:authorize access="hasAnyRole('SALES')"><b><h1>Welcome to Geostone-VR Sales Panel</h1></b></security:authorize>
	</div>
</div>

<%@include file="includes/footer.jsp"%>