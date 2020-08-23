<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@include file="../includes/header.jsp"%>
<div class="row">

	

	<!-- /.col-lg-12 -->
</div>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color:#B0DAF8;"> <center><b>Product wise Report</b></center></div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			<div class="table-panel">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-report">
					<thead>
						<tr>
							<th>Sr No</th>
							<th>Product</th>
							<th>Product Type</th>
							<th>State</th>
							<th>City</th>
							<th>SKU</th>
							<th>Total Interest</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reportVOList}" var="reportVO" varStatus="cnt">

							<tr>

								<td>${cnt.index + 1}</td>
								<td>${reportVO.product}</td>
								<td>${reportVO.productType}</td>
								<td>${reportVO.state}</td>
								<td>${reportVO.city}</td>
								<td>${reportVO.sku}</td>
								<td>${reportVO.totalInterest}</td>
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
	        $('#dataTables-report').DataTable({
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
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ]
	        });
	        table.buttons().container()
	        .appendTo( $('div.eight.column:eq(0)', table.table().container()) );
	    });
	    </script>
	</div>
</div>
<%@include file="../includes/footer.jsp"%>