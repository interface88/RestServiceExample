<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="page-header">
   <h3 class="page-title">Tournament</h3>
   <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
       <li class="breadcrumb-item"><a href="<spring:url value="/mvc/tournament/tournamentList" htmlEscape="true"/>">Tournament List</a></li>
       <li class="breadcrumb-item active" aria-current="page"> Add new tournament </li>
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
           <h4 class="card-title">Tournament information</h4>
           <form:form id="tournamentForm" method = "POST" action ="${pageContext.request.contextPath}/mvc/tournament/save" modelAttribute="tournament">
                 <div class="row">
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "tournamentName" cssClass="col-sm-3 col-form-label">Name</form:label>
                       <div class="col-sm-9">
                         <form:input path = "tournamentName" cssClass="form-control"/>
                       </div>
                     </div>
                   </div>
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "organiser" cssClass="col-sm-3 col-form-label">Organiser</form:label>
                       <div class="col-sm-9">
                         <form:input path = "organiser" cssClass="form-control"/>
                       </div>
                     </div>
                   </div>
                 </div>
                 <div class="row">
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "startDate" cssClass="col-sm-3 col-form-label">From Date</form:label>
                       <div class="col-sm-9 ">
                       <div id="datepicker-popup" class="input-group date datepicker">
	                         <form:input path = "startDate" cssClass="form-control"/>
                            <span class="mdi mdi-calendar input-group-text"></span>
                        </div>
                       </div>
                     </div>
                   </div>
                    <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "endDate" cssClass="col-sm-3 col-form-label">To Date</form:label>
                       <div class="col-sm-9 ">
                       <div id="datepicker-popup" class="input-group date datepicker">
	                         <form:input path = "endDate" cssClass="form-control"/>
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
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "tournamentType" cssClass="col-sm-3 col-form-label">Tournament Type</form:label>
                       <div class="col-sm-9">
                         <form:input path = "tournamentType" cssClass="form-control"/>
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
	//$('#adhaarNumber').attr('data-inputmask-alias', "9999-9999-9999");
	//$("#adhaarNumber").inputmask();
	
	$('#datepicker-popup input').datepicker({
	    format: "dd-mm-yyyy",
	    todayHighlight: true
	});
	
    $("#tournamentForm").validate({
        rules: {
            tournamentName: "required",
            organiser: "required"
        },
        messages: {
            tournamentName: "Please enter tournament name",
            organiser: "Please enter organiser name"
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