<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="page-header">
   <h3 class="page-title">Team</h3>
   <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
       <li class="breadcrumb-item"><a href="<spring:url value="/mvc/team/teamList" htmlEscape="true"/>">Team List</a></li>
       <li class="breadcrumb-item active" aria-current="page"> Add new team </li>
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
           <h4 class="card-title">Team information</h4>
           <form:form id="teamForm" method = "POST" action ="${pageContext.request.contextPath}/mvc/team/save" modelAttribute="teamVO">
           		<form:hidden path="uuid"/>
           		<p class="card-description">Personal info</p>
                 <div class="row">
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "name" cssClass="col-sm-3 col-form-label">Name</form:label>
                       <div class="col-sm-9">
                         <form:input path = "name" cssClass="form-control"/>
                       </div>
                     </div>
                   </div>
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path="place" cssClass="col-sm-3 col-form-label">Place</form:label>
                       <div class="col-sm-9">
                         <form:input path = "place" cssClass="form-control"/>
                       </div>
                     </div>
                   </div>
                 </div>
                 <p class="card-description">Player info</p>
                 <div class="well text-left">
	                 <div class="row">
	                   <div class="col-md-12">
	                   		<div class="form-group row">
	                   			<div class="col-sm-9">
				                 <ul class="list-group" id="playerInTeamList">
				                 	<c:forEach var="player" items="${teamVO.playerList}">
									  <li class="list-group-item">  <img src="http://via.placeholder.com/50x50" /> ${player.playerName} - ${player.adhaarNumber}<span class="playerRemover mdi mdi-close-circle pull-right" style="cursor:pointer;" ></span>
									  	<input type="hidden" name="playerIdList" value="${player.uuid}"/>
									  </li>
									  </c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
	                   <div class="col-md-12">
	                   		<div class="form-group row">
	                   			<div class="col-sm-9">
		                   			<select id="playerSelector"  multi="true">
		                   				<c:forEach var="player" items="${playerList}">
										    <option value="${player.uuid}">${player.playerName} - ${player.adhaarNumber}</option>
								        </c:forEach>
									</select>
                	                 <button type="button" style="margin-top: 10px;" id="playerAdder" class="btn btn-primary btn-block">Add</button>
								</div>
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
	$('.playerRemover').click(function(){
		$(this).parent().remove();
	});
	
	$('#playerAdder').click(function(){
		$("div input[value='hello']")
		var player_id = $('#playerSelector').select2('data')[0].id;
		
		if($("div input[value='"+player_id+"']").length == 0){
			var ul = '<li class="list-group-item">'+$('#playerSelector').select2('data')[0].text
			+' <span class="playerRemover mdi mdi-close-circle pull-right" style="cursor:pointer;"  ></span><input type="hidden" name="playerIdList" value="'+player_id+'"/></li>';
			$('#playerInTeamList').append(ul);
		}else{
			bootbox.alert("Player already present in team!");
		}
		
	});
	
	$("#playerSelector").select2();
	
    $("#teamForm").validate({
        rules: {
            name: "required",
            place: "required"
        },
        messages: {
            name: "Please enter team name",
            place: "Please enter adhaar number"
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