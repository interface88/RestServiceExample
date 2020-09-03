<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>

<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<c:if test="${not empty message}">
			<div class="alert alert-info">
				${message}
	        </div>
        </c:if>
    </div>
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"><center><b> Add Player</b></center></div>
			<div class="panel-body">
				<form:form id="playerForm" method = "POST" action ="${pageContext.request.contextPath}/mvc/player/save" modelAttribute="player">
					<div class="row">
						<div class="col-lg-12">
							<div class="form-group">
								<form:label path = "playerName">Name :</form:label>
								<form:input path = "playerName" cssClass="form-control"/>
							</div>
							
							<div class="form-group">
								<form:label path = "adhaarNumber">Adhaar Number :</form:label>
								<form:input path = "adhaarNumber" cssClass="form-control"/>
							</div>
							
							<%-- <div class="form-group">
							        <div class="input-daterange input-group" id="datepicker">
							        	<span class="input-group-addon">Date Filter</span>
							        	<form:label path = "dob">Born :</form:label>
								        <input type="text" class="form-control" name="dob" value="" />
								    </div>    
							</div> --%>
							<div class="form-group">
								<form:label path = "dob">Born :</form:label>
								<form:input path = "dob" cssClass="form-control"/>
							</div>
							
							<div class="form-group">
								<form:label path = "place">Place :</form:label>
								<form:input path = "place" cssClass="form-control"/>
							</div>
							
							<div class="form-group">
								<form:label path ="playerRole.uuid">Role :</form:label>
								<form:select path="playerRole.uuid" items="${playerRoleList}" itemLabel="playerRoleName" itemValue="uuid" cssClass="form-control"/>
							</div>
							
							<div class="form-group">
								<form:label path ="battingStyle.uuid">Batting Style :</form:label>
								<form:select path="battingStyle.uuid" items="${battingStyleList}" itemLabel="battingStyleName" itemValue="uuid" cssClass="form-control"/>
							</div>
							
							<div class="form-group">
								<form:label path ="bowlingStyle.uuid">Bowling Style :</form:label>
								<form:select path="bowlingStyle.uuid" items="${bowlingStyleList}" itemLabel="bowlingStyleName" itemValue="uuid" cssClass="form-control"/>
							</div>
							<%-- <form:radiobutton path="isdeleted" value="true" checked="checked"/> --%>
							
								<%-- <form:hidden path="isdeleted" id="isdeleted"/> --%>
								<form:hidden path="uuid" id="uuid" />
						</div>
					</div>
					
					
				<div class="panel-heading"><center><button type="submit" class="btn btn-primary btn-icon-text"><i class="mdi mdi-file-check btn-icon-prepend"></i>Submit</button></center></div>
				</form:form>	
			</div>
		</div>
	</div>
</div>
		
<script>

$(function() {
	  $("#playerForm").validate({
	    rules: {
	    	playerName: "required",
	    	adhaarNumber: "required"
	    },
	    messages: {
	    	playerName: "Please enter player name",
	    	adhaarNumber: "Please enter adhaar number"
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