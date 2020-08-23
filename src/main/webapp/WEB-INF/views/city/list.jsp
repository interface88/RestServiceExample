<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@include file="../includes/header.jsp"%>
<div class="row">

	<!-- <div class="col-lg-12">

		<h1 class="page-header"><i class="fa fa-map-marker fa-fw"></i> City Master</h1>
	</div>
 -->
	<!-- /.col-lg-12 -->
</div>
<div class="row">
	<div class="col-lg-9">
		<c:if test="${not empty message}">
			<div class="alert alert-info">
				${message}
	        </div>
        </c:if>
    </div>
    <div class="col-lg-3">

		<div class="pull-right"><br>
			<a class="btn btn-primary btn-sm" href="<spring:url value="/mvc/city/view" htmlEscape="true"/>"><b>Add New</b></a>
		</div> 
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
	
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color:#B0DAF8;"> <center><b>City List</b></center></div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			<div class="table-panel">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-city">
					<thead>
						<tr>
							<th><center>Sr. No.</center></th>
							<th><center>City</center></th>
							<th><center>State</center></th>
							<th><center>Action</center></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cityList}" var="city" varStatus="cnt">

							<tr>

								<td><center>${cnt.index + 1}</center></td>
								<td>${city.cityName}</td>
								<td>${city.state.stateName}</td>
								
                                <td><center>
                                	<a href="<spring:url value="/mvc/city/view?id=${city.id}" />" class="btn btn-primary btn-sm" style="font-size:11px;"><b> Edit</b></a>
                                	<a href="<spring:url value="/mvc/city/delete?id=${city.id}" />" onclick="return confirm('Are you sure you want to delete [${city.cityName}] city ?')" class="btn btn-danger btn-sm"style="font-size:11px;"><b> Delete</b></a>
                               </center> </td>
                               
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
			<!-- /.panel-body -->
		</div>
	    <script>
	    $(document).ready(function() {
	        $('#dataTables-city').DataTable({
	        	 responsive: true,
		            dom:  "<'ui grid'"+
	                "<'row'"+
	                "<'four wide column'l>"+
	                "<'center aligned eight wide column'B>"+
	                "<'right aligned four wide column'f>"+
	             ">"+
	             "<'row dt-table'"+
	                "<'sixteen wide column'tr>"+
	             ">"+
	             "<'row'"+
	                "<'seven wide column'i>"+
	                "<'right aligned nine wide column'p>"+
	             ">"+
	          ">",
	                buttons: [
	                   // 'copy', 'csv', 'excel', 'pdf', 'print'
	                    {	
	                       extend: 'copy',
	                       exportOptions: {columns: [ 0, 1, 2] }
	                    },
	                    {
	                        extend: 'csv',
	                        exportOptions: {columns: [ 0, 1, 2] }
	                    },
	                    {
	                        extend: 'excel',
	                        exportOptions: {columns: [ 0, 1, 2] }
	                    },
	                    {
	                        extend: 'pdf',
	                        exportOptions: {columns: [ 0, 1, 2] }
	                    },
	                    {
	                        extend: 'print',
	                        exportOptions: {columns: [ 0, 1, 2] }
	                    }
	                         
	                ]
		        });
		        table.buttons().container()
		        .appendTo( $('div.eight.column:eq(0)', table.table().container()) );
		    });
		    
	    
	    </script>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>