<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@include file="../includes/header.jsp"%>
<div class="row">

	
	<!-- /.col-lg-12 -->
</div>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"style="background-color:#B0DAF8;"><center><b>Product Management</b></center></div>
			<div class="panel-body">
				<form:form method = "POST" action ="${pageContext.request.contextPath}/mvc/product/save" id="productForm" modelAttribute = "productVO" >
						<div class="row">
						 <div class="col-lg-8">
							<form:hidden path="id"/>
							<form:hidden path="productNo"/>
							<form:hidden path="productType"/>
							<form:hidden path="productcode"/>
							<div class="form-group">
							
								<form:label path = "productName">Name</form:label>
								<form:input path = "productName" cssClass="form-control" style="font-size:14px;"/>
							</div>
							
							
							
					
							
							<div class="form-group">
								<form:label path = "productName">State</form:label>
								<table>
									 <tr>
										<c:forEach items="${stateList}" var="state" varStatus="loop">
											<c:if test="${not loop.first and loop.index % 7== 0}">
								                </tr>
								                <tr>
								            </c:if>
								            <td>
											<label class="checkbox-inline">
								               <form:checkbox path="stateList" data-city_class="state_${state.id}" id="${state.id}" cssClass="stateChkBx" value="${state.id}"/>       
							               		${state.stateName} &nbsp;&nbsp;
											</label>
								            </td>
										</c:forEach>
									</tr>
								</table>
				            </div>
							<div class="form-group">
								<form:label path = "productName">City</form:label>
								<table>
									 <tr>
										<c:forEach items="${cityList}" var="city" varStatus="loop">
											<c:if test="${not loop.first and loop.index % 4 == 0}">
								                </tr><tr>
								            </c:if>
								            <td style="padding:10px;">
											<label class="checkbox-inline">
								               <form:checkbox path="cityList" value="${city.id}" id=""  data-state_id="${city.state.id}" cssClass="state_${city.state.id} cityChkBx"/>       
							               		${city.cityName} 
											</label>
								            </td>
										</c:forEach>
									</tr>
								</table>
				            </div>
				            <div class="form-group">
								<form:label path = "productName">Scenario</form:label>
								<table>
									 <tr>
										<c:forEach items="${scenarioList}" var="scenario" varStatus="loop">
											<c:if test="${not loop.first and loop.index % 7 == 0}">
								                </tr><tr>
								            </c:if>
								            <td style="padding:2px;">
											<label class="checkbox-inline">
								               <form:checkbox path="scenarioList" value="${scenario.id}"/>       
							               		${scenario.name}&nbsp;&nbsp;
											</label>
								            </td>
										</c:forEach>
									</tr>
								</table>
				            </div>   
							<div class="form-group">
								<form:label path = "status">Status &nbsp; &nbsp;</form:label>
								<label class="radio-inline">
									<form:radiobutton path="status" value="true" checked="checked"/>Enable 
								</label>
								<label class="radio-inline">
									<form:radiobutton path="status" value="false"/>Disable
								</label> 
							</div>
							</div>
							
						
						 <div class="col-lg-2" >
							<div class="form-group">
									<form:label path = "productImage">Product Image ${productImage}</form:label>
									<form:hidden path="productImage"/>
									<c:if test="productImage"></c:if>
									<c:if test="${empty productVO.productImage}">
										<img src="${pageContext.request.contextPath}/static/images/block.gif" width="200" class="img-thumbnail" />
									</c:if>
									<c:if test="${not empty productVO.productImage}">
									  	<img src="${pageContext.request.contextPath}/static/product/${productVO.productImage}" width="400" class="img-thumbnail" style="float:left;"/>
									</c:if>
							</div>							
						</div>
						 <div class="col-lg-2" >
						 	
						 </div> 
						</div>
					</div>
					<div class="panel-heading"><center><button type="submit" class="btn btn-primary"><b>Save</b></button></center></div>
				
				</form:form>
			</div>
		</div>
	</div>
</div>

<script>
	$(function(){
		$('.stateChkBx').on( "click",function(){
			var checkBxKlass = $(this).data('city_class');
			if(this.checked){
				$('.' + checkBxKlass).prop('checked', true);
			}else{
				$('.' + checkBxKlass).prop('checked', false);
			}
		});
		$('.cityChkBx').on( "click",function(){
			debugger;
			var isCityChkBxCheck = this.checked;
			var state_id = $(this).data('state_id');
			var chkBoxKlass = '.' + $(this).attr('class').split(' ').join('.');
			
			if(this.checked){
				$('#' + state_id).prop('checked', true);
			}else{
				if($(chkBoxKlass + ':checked').length > 0){
					// nothing to do	
				}else{
					$('#' + state_id).prop('checked', false);
				}
			}
		});
		
	  $("#productForm").validate({
	    rules: {
	    	productName: "required"
	    },
	    messages: {
	    	productName: "Please enter product name"
	    },
	    submitHandler: function(form) {
	      form.submit();
	    },
	    errorElement: "em",
		errorPlacement: function ( error, element ) {
			error.addClass( "help-block" );
			if ( element.prop( "type" ) === "checkbox" || element.prop( "type" ) === "radio" ) {
				error.insertAfter( element.parent( "label" ) );
			} else {
				error.insertAfter( element );
			}
		},
		highlight: function ( element, errorClass, validClass ) {
			$( element ).parents( ".form-group" ).addClass( "has-error" ).removeClass( "has-success" );
		},
		unhighlight: function (element, errorClass, validClass) {
			$( element ).parents( ".form-group" ).addClass( "has-success" ).removeClass( "has-error" );
		}
	  });
		
	});
	
</script>

<%@include file="../includes/footer.jsp"%>


 