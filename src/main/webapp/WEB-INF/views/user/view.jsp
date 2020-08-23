<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@include file="../includes/header.jsp"%>


<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"style="background-color:#B0DAF8;"><center><b>User detail</b></center></div>
			<div class="panel-body">
				<form:form id="userForm"  method = "POST" action ="${pageContext.request.contextPath}/mvc/user/save" commandName="user">
					<form:hidden path="id" id="id"/>
					<form:hidden path="password"/>
					<div class="row">
						<div class="col-lg-6">
							<div class="form-group">
								<form:label path = "name">Name</form:label>
								<form:input path = "name" cssClass="form-control" />
							</div>
							<div class="form-group">
								<form:label path = "email">E-Mail Id</form:label>
								<form:input path = "email" cssClass="form-control" />
							</div>
							<div class="form-group">
								<form:label path = "employeeId">Employee Id</form:label>
								<form:input path = "employeeId" cssClass="form-control" />
							</div>
							<div class="form-group">
								<form:label path = "city.state.id">State</form:label>
								<form:select path="city.state.id" items="${stateList}" id="stateCombo" itemLabel="stateName" itemValue="id" cssClass="form-control"/>
							</div>
							
							<div class="form-group">
								<form:label path = "city">Cities</form:label>
								<form:select path="city.id" cssClass="form-control" id="cityCombo">
									<form:option cssClass="allstate" value="" label="- Select city -"/>
									<c:forEach items="${cityList}" var="cit">
										   <form:option cssClass="state_${cit.state.id}" value="${cit.id}" label="${cit.cityName}"/>
									</c:forEach>
								</form:select>
								
							</div>
						</div>
						<div class="col-lg-6">
							<div class="form-group">
								<form:label path = "phone">Phone number</form:label>
								<form:input path = "phone" cssClass="form-control" />
							</div>
							<div class="form-group">
								<form:label path = "role">Role</form:label>
								<form:select path="role" cssClass="form-control">
								   <form:option value="" label="--- Select ---"/>
								   <form:options items="${roleList}" />
								</form:select>
							</div>
						</div>
						<div class="form-group">
							<form:label path = "status">Status &nbsp;&nbsp;</form:label>
							<label class="radio-inline">
								<form:radiobutton path="status" value="true"/>Enable 
							</label>
							<label class="radio-inline">
								<form:radiobutton path="status" checked="checked" value="false"/>Disable
							</label> 
						</div>
					</div>
					<!-- <div class="row">
						<div class="col-lg-6">
							<button type="submit" class="btn btn-default">Save</button>
						</div>
					</div> --></div>
						<div class="panel-heading"><center><button type="submit" class="btn btn-primary">Save</button></center></div>
				
				</form:form>
			
		</div>
	</div>
</div>

<script>
$(function() {
	  $("#userForm").validate({
	    rules: {
	    	name: {
			  required : true,
			  remote: { 
                    url:"isUserNameUnique", 
                    data: {'id':function(){return $('#id').val()}},
                    async:false 
                }
	    	},
	    	email: {
	    		required: true,
	            email: true,
            	remote: { 
	                    url:"isEmailUnique", 
	                    data: {'id':function(){return $('#id').val()}},
	                    async:false 
	                }
	    	},
	    	employeeId: {
				  required : true,
				  remote: { 
	                    url:"isEmployeeIdUnique", 
	                    data: {'id':function(){return $('#id').val()}},
	                    async:false 
	                }
		    	},
	    	role: "required",
	    	"city.id" : "required"
	    },
	    messages: {
	    	name: {
	    		required :"User name is required",
	    		remote: jQuery.validator.format("{0} is already in use")
	    	},
	    	email: {
	    		required: "Email address is required",
	            email: "Please enter valid email address",
	            remote: jQuery.validator.format("{0} is already in use")
	    	},
	    	employeeId: {
	    		required :"Employee Id is required",
	    		remote: jQuery.validator.format("{0} is already in use")
	    	},
	    	role: "Please select role",
	    	"city.id" : "required"
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
	 
	  
	  $('#stateCombo').on('change', function() {
		  loadCityCombo();
		  $('#cityCombo').find('.allstate').attr('selected', 'selected');
		  
	  });
	  
	 loadCityCombo();
	  
	});
	
	function loadCityCombo(){
		var stateId = $('#stateCombo').val();
		$('#cityCombo').children('option').hide();
		var klass = '.state_' + stateId + ',.allstate';
		$('#cityCombo').children(klass).show();
	}

</script>
<%@include file="../includes/footer.jsp"%>


