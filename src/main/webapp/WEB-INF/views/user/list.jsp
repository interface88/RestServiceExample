<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@include file="../includes/header.jsp"%>

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
			<a class="btn btn-primary btn-sm" href="<spring:url value="/mvc/user/view" htmlEscape="true"/>"><b>Add New</b></a>
		</div> 
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"style="background-color:#B0DAF8;"><center><b>User Management</b></center></div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-user">
					<thead>
						<tr>
							<th><center>Sr. No.</center></th>
							<th><center>Name</center></th>
							<th><center>E-Mail Id</center></th>
							<th><center>Employee ID</center></th>
							<th><center>Role</center></th>
							<th><center>City</center></th>
							<th><center>State</center></th>
							<th><center>Onboarded</center></th>
							<th><center>Status</center></th>
							<th><center>Action</center></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userList}" var="user" varStatus="cnt">
							<tr>
								<td class="align-middle"><center>${cnt.index}</center></td>
								<td class="align-middle">${user.name}</td>
								<td class="align-middle">${user.email}</td>
								<td class="align-middle">${user.employeeId}</td>
								<td class="align-middle">${user.role}</td>
								<td class="align-middle">${user.city.cityName}</td>
								<td class="align-middle">${user.city.state.stateName}</td>
								<td class="align-middle">
								<c:if test="${empty user.password}"> &nbsp;</c:if>
								<c:if test="${not empty user.password}">Onboarded</c:if>
								</td>
								<td class="align-middle">  <center>
									<c:if test="${user.status == true}">
										
											<i class="fa fa-check-circle" style="font-size:20px;color:green"></i>
			                         
									</c:if>
									<c:if test="${user.status == false}">
										
											<i class="fa fa-times-circle" style="font-size:20px;color:red"></i>
			                           
									</c:if></center>
								</td>
                                <td><center>
                                	<a href="<spring:url value="/mvc/user/view?id=${user.id}" />" class="btn btn-primary btn-sm"style="font-size:11px;"><b> Edit</b></a>
                                	<a href="<spring:url value="/mvc/user/delete?id=${user.id}" />" onclick="return confirm('Are you sure you want to delete [${user.name}] user ?')" class="btn btn-danger btn-sm"style="font-size:11px;"><b>Delete</b></a>
                               </center> </td>
                               
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- /.panel-body -->
		</div>
	    <script>
	    $(document).ready(function() {
	        $('#dataTables-user').DataTable({
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
                       exportOptions: {columns: [ 0, 1, 2, 3, 4,5,6,7] }
                    },
                    {
                        extend: 'csv',
                        exportOptions: {columns: [ 0, 1, 2, 3, 4,5,6,7] }
                    },
                    {
                        extend: 'excel',
                        exportOptions: {columns: [ 0, 1, 2, 3, 4,5,6,7] }
                    },
                    {
                        extend: 'pdf',
                        exportOptions: {columns: [ 0, 1, 2, 3, 4,5,6,7] }
                    },
                    {
                        extend: 'print',
                        exportOptions: {columns: [ 0, 1, 2, 3, 4,5,6,7] }
                    }
                         
                ]
	        });
	        table.buttons().container()
	        .appendTo( $('div.eight.column:eq(0)', table.table().container()) );
	    });
	    
	       
	    </script>
	</div>
</div></div>
<%@include file="../includes/footer.jsp"%>