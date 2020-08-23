<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@include file="../includes/header.jsp"%>


<!-- /.row -->
<div class="row">
<br><center>
	<div class="col-lg-12">
	
		<form class="form-inline" action ="${pageContext.request.contextPath}/mvc/customer/list" method="get">
			
		  <div class="form-group">
		        <div class="input-daterange input-group" id="datepicker">
		        	<span class="input-group-addon">Date Filter</span>
			        <input type="text" class="form-control" name="startDate" value="${startDate}" />
			        <span class="input-group-addon">to</span>
			        <input type="text" class="form-control" name="endDate" value="${endDate}"/>
			    </div>
		  </div>
			  <button type="submit" class="btn btn-default" onclick="return checkValidDate();">Apply</button>
		</form>
	</div></center>
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"style="background-color:#B0DAF8;"><center><b>Customer Management</b></center></div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			<div class="table-panel">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-customer">
					<thead>
						<tr>
							<th><center>Sr. No.</center></th>
							<th><center>Name</center></th>
							<th><center>E-Mail Id</center></th>
							<th><center>Phone Number</center></th>
							<th><center>City</center></th>
							<th><center>State</center></th>
							<th><center>Action</center></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${customerList}" var="customer" varStatus="cnt">

							<tr>

								<td><center>${cnt.index+1}</center></td>
								<td>${customer.customerName}</td>
								<td>${customer.email}</td>
								<td>${customer.phone}</td>
								<td>${customer.city.cityName}</td>
								<td>${customer.city.state.stateName}</td>
								<td><center>
                                	<a href="<spring:url value="/mvc/customer/view?id=${customer.id}" />" class="btn btn-primary btn-sm"style="font-size:11px;"></i> <b>Edit</b></a>
                                	<%-- <a href="<spring:url value="/mvc/customer/delete?id=${customer.id}" />" class="btn btn-danger btn-sm"style="font-size:11px;"></i> Delete</a> --%>
                                </center></td>
								
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
		        // init datepicker
		        $('#datepicker').datepicker({format: "dd-mm-yyyy"});
		       // $('#toDate').datepicker();

		        $('#dataTables-customer').DataTable({
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
	                       exportOptions: {columns: [ 0, 1, 2, 3, 4,5] }
	                    },
	                    {
	                        extend: 'csv',
	                        exportOptions: {columns: [ 0, 1, 2, 3, 4,5] }
	                    },
	                    {
	                        extend: 'excel',
	                        exportOptions: {columns: [ 0, 1, 2, 3, 4,5] }
	                    },
	                    {
	                        extend: 'pdf',
	                        exportOptions: {columns: [ 0, 1, 2, 3, 4,5] }
	                    },
	                    {
	                        extend: 'print',
	                        exportOptions: {columns: [ 0, 1, 2, 3, 4,5] }
	                    }
	                         
	                ]
		        });
		        table.buttons().container()
		        .appendTo( $('div.eight.column:eq(0)', table.table().container()) );
		    });
		    
		    
		    function checkValidDate(){
		    	var startDate = document.getElementsByName('startDate')[0].value;
		    	var endDate = document.getElementsByName('endDate')[0].value;
		    	if(startDate == '' || endDate == ''){
		    		alert('Date cannot be blank');
		    		return false;
		    	}
		    	return true;
		    }
		    
	    </script>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>