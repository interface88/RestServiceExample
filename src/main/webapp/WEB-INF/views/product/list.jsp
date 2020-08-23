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
    <!-- 
    <div class="col-lg-3">
			
		<div class="pull-right">
			<a class="btn btn-primary" href="<spring:url value="/mvc/product/view" htmlEscape="true"/>">Add new</a>
		</div> 
	</div>
     -->
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
	
		<div class="panel panel-default">
			<div class="panel-heading"style="background-color:#B0DAF8;"><center><b>Product Management</b></center></div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			<div class="table-panel">
			
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-product">
					<thead>
						<tr>
							<th><center>Sr. No.</center></th>
							<th><center>Name</center></th>
							<th><center>Product No.</center></th>
							<th><center>Product Type</center></th>
							<th><center>Image</center></th>
							<th><center>Status</center></th>
							<th><center>Action</center></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${productList}" var="product" varStatus="cnt">
							<tr>
								<td class="align-middle"><center>${cnt.index + 1}</center></td>
								<td class="align-middle">${product.productName}</td>
								<td class="align-middle">${product.productNo}</td>
								<td class="align-middle">${product.productType}</td>
								<td class="align-middle"><center>  <img src="${pageContext.request.contextPath}/static/product/${product.productImage}" width="100" height="100"  class="img-thumbnail" /></center>  </td>
								<td class="align-middle"><center>  
									<c:if test="${product.status == true}">
										<i class="fa fa-check-circle" style="font-size:20px;color:green"></i>
									</c:if>
									<c:if test="${product.status == false}">
										<i class="fa fa-times-circle" style="font-size:20px;color:red"></i>
									</c:if>
								</center></td>
 								 <td class="align-middle"><center>
                                	<a href="<spring:url value="/mvc/product/view?id=${product.id}" />" class="btn btn-primary btn-sm"style="font-size:11px;"><b> Edit</b></a>
                                	<a href="<spring:url value="/mvc/product/delete?id=${product.id}" />" onclick="return confirm('Are you sure you want to delete [${product.productName}] product ?')" class="btn btn-danger btn-sm"style="font-size:11px;"><b> Delete</b></a>
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
	        $('#dataTables-product').DataTable({
	            responsive: true,
	            /* "pagingType": "full_numbers" */
	           
	        });
	       
	    });
	    </script>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>