<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page-header">
   <h3 class="page-title">Player</h3>
   <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
       <li class="breadcrumb-item"><a href="#">Player List</a></li>
       <li class="breadcrumb-item active" aria-current="page"> Add new player </li>
     </ol>
   </nav>
 </div>
<div class="row">
	<div class="col-lg-12">
		<c:if test="${not empty message}">
			<div class="alert alert-info">
				${message}
	        </div>
        </c:if>
    </div>
 	<div class="col-12 grid-margin">
       <div class="card">
         <div class="card-body">
           <h4 class="card-title">Player information</h4>
           <form:form id="playerForm" method = "POST" action ="${pageContext.request.contextPath}/mvc/player/save" modelAttribute="player">
           		<p class="card-description">Personal info</p>
                 <div class="row">
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "playerName" cssClass="col-sm-3 col-form-label">Name</form:label>
                       <div class="col-sm-9">
                         <form:input path = "playerName" cssClass="form-control"/>
                       </div>
                     </div>
                   </div>
                 </div>
                 <div class="row">
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "adhaarNumber" cssClass="col-sm-3 col-form-label">Adhaar Number</form:label>
                       <div class="col-sm-9">
                         <form:input path = "adhaarNumber" cssClass="form-control"/>
                       </div>
                     </div>
                   </div>
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "dob" cssClass="col-sm-2 col-form-label">Born</form:label>
                       <div class="col-sm-10 ">
                       <div id="datepicker-popup" class="input-group date datepicker">
	                         <form:input path = "dob" cssClass="form-control"/>
                            <span class="mdi mdi-calendar input-group-text"></span>
                        </div>
                       </div>
                     </div>
                   </div>
                 </div>
                 <div class="row">
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "place" cssClass="col-sm-3 col-form-label">Place</form:label>
                       <div class="col-sm-9">
                         <form:input path = "place" cssClass="form-control"/>
                       </div>
                     </div>
                   </div>
                 </div>
                 <p class="card-description">Sport info</p>
                 <div class="row">
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "playerRole.uuid" cssClass="col-sm-3 col-form-label">Role</form:label>
                       <div class="col-sm-9">
                         <form:select path="playerRole.uuid" items="${playerRoleList}" itemLabel="playerRoleName" itemValue="uuid" cssClass="form-control"/>
                       </div>
                     </div>
                   </div>
                 </div>
                 <div class="row">
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "battingStyle.uuid" cssClass="col-sm-3 col-form-label">Batting Style</form:label>
                       <div class="col-sm-9">
                         <form:select path="battingStyle.uuid" items="${battingStyleList}" itemLabel="battingStyleName" itemValue="uuid" cssClass="form-control"/>
                       </div>
                     </div>
                   </div>
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "bowlingStyle.uuid" cssClass="col-sm-3 col-form-label">Bowling	 Style</form:label>
                       <div class="col-sm-9">
                         <form:select path="bowlingStyle.uuid" items="${bowlingStyleList}" itemLabel="bowlingStyleName" itemValue="uuid" cssClass="form-control"/>
                       </div>
                     </div>
                   </div>
                 </div>
                 <div class="row">
                   <div class="col-md-6">
                     <button type="submit" class="btn btn-primary btn-icon-text"><i class="mdi mdi-file-check btn-icon-prepend"></i>Submit</button>
                   </div>
                 </div>
           </form:form>
         </div>
       </div>
   </div>
</div>
		
<script>
	
$(function() {
	$('#adhaarNumber').attr('data-inputmask-alias', "9999-9999-9999");
	$("#adhaarNumber").inputmask();
	
	$('#datepicker-popup input').datepicker({
	    format: "dd-mm-yyyy",
	    todayHighlight: true
	});
	
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
        errorElement: "label",
        errorPlacement: function(error, element) {
            error.addClass("error mt-2 text-danger	");
            if (element.prop("type") === "checkbox" || element.prop("type") === "radio") {
                error.insertAfter(element.parent("label"));
            } else {
                error.insertAfter(element);
            }
        },
        highlight: function(element, errorClass, validClass) {
            $(element).parents(".form-group").addClass("has-danger");
            $(element).addClass("form-control-danger");
        },
        unhighlight: function(element, errorClass, validClass) {
            $(element).parents(".form-group").removeClass("has-danger");
        }
    });
});
</script>	