<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@include file="../includes/header.jsp"%>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color:#B0DAF8;"><center><b> Add City</b></center></div>
			<div class="panel-body">
			<form:form id="cityForm" method = "POST" action ="${pageContext.request.contextPath}/mvc/city/save" modelAttribute="city">
				<div class="row">
					<div class="col-lg-6">
						
							<form:hidden path="id"/>
							<div class="form-group">
								<form:label path = "cityName">City</form:label>
								<form:input path = "cityName" cssClass="form-control" />
							</div>
							<div class="form-group">
								<form:label path = "state.id">State</form:label>
								<form:select path="state.id" items="${stateList}" itemLabel="stateName" itemValue="id" cssClass="form-control"/>
							</div>
							<div class="form-group" style="display: none;">
								<form:label path = "status">Status</form:label>
								<label class="radio-inline">
									<form:radiobutton path="status" value="true" checked="checked"/>Enable 
								</label>
								<label class="radio-inline">
									<form:radiobutton path="status" value="false"/>Disable
								</label> 
							</div>
							</div>							
							<!-- <button type="submit" class="btn btn-default">Save</button> -->
						
					</div>
				</div>
			
			<div class="panel-heading"><center><button type="submit" class="btn btn-primary"><b>Save</b></button></center></div>
		
		</form:form>
		</div>
		</div>
	</div>
</div>

<script>

$(function() {
	  $("#cityForm").validate({
	    rules: {
	    	cityName: "required",
	    	status: "required"
	    },
	    messages: {
	    	cityName: "Please enter city name",
	    	status: "Please select status"
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


 