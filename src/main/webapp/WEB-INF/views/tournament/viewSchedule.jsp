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
           <h4 class="card-title">Team information</h4>
           <form:form id="scheduleForm" method = "POST" action ="${pageContext.request.contextPath}/mvc/tournament/saveSchedule" modelAttribute="scheduleVO">
           		<form:hidden path="tournamentUuid"/>
           		<p class="card-description">Tournament info</p>
                 <div class="row">
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "tournamentName" cssClass="col-sm-3 col-form-label">Name</form:label>
                       <div class="col-sm-9">
                         <form:input path = "tournamentName" cssClass="form-control"/>
                       </div>
                     </div>
                   </div>
                 </div>
                 <p class="card-description">Schedule info</p>
                 <div class="well text-left">
	                 <div class="row">
	                   <div class="col-md-12">
	                   		<div class="form-group row">
	                   			<div class="col-sm-12">
				                 <ul class="list-group" id="matchInScheduleList">
				                 	<c:forEach var="matchVO" items="${scheduleVO.matchVOList}" varStatus="matchStatus">
				                 		<li class="list-group-item" data-index="${matchStatus.index}"> 
						                 	<div class="row">
						                 		
						                 		<div class="col-md-4">
						                 			<div class="col-md-4">
	                   									Match No : ${matchVO.matchNo}
							                 			<form:input type="hidden" path="matchVOList[${matchStatus.index}].matchNo" class="form-control" value="${matchVO.matchNo}"/>
                   									</div>
                   								
	                   								<div class="col-md-4">
	                   									Group : ${matchVO.teamGroupName}
														<form:input type="hidden" path="matchVOList[${matchStatus.index}].teamGroupName" class="form-control" value="${matchVO.teamGroupName}"/>
	                   								</div>
						                 		</div>
						                 		<div class="col-md-4">
						                 			<div class="col-md-9">
	                   									${matchVO.matchTitle}
							                 			<form:input type="hidden" path="matchVOList[${matchStatus.index}].matchTitle" class="form-control" value="${matchVO.matchTitle}"/>
	                   								</div>
						                 			<div class="col-md-9">
							                 			<h3 class="mb-0 font-weight-semibold">${matchVO.team1Name} Vs ${matchVO.team2Name}</h3>
							                 		</div>	
						                 		</div>
						                 		<div class="col-md-3"> 
						                 			From : ${matchVO.estStartDatetime} - ${matchVO.estEndDatetime}
                   								</div>
                   								 <div class="input-group-append"> 
														<button class="btn btn-danger btn-sm matchRemover" type="button"><i class="mdi mdi-close-circle"></i></button> 
													</div> 
                   							</div>	
                   								<form:input type="hidden" path="matchVOList[${matchStatus.index}].uuid" class="form-control" value="${matchVO.uuid}"/>
											  	<form:input type="hidden" path="matchVOList[${matchStatus.index}].team1Uuid" class="form-control" value="${matchVO.team1Uuid}"/>
											  	<form:input type="hidden" path="matchVOList[${matchStatus.index}].team2Uuid" class="form-control" value="${matchVO.team2Uuid}"/>
											  	<form:input type="hidden" path="matchVOList[${matchStatus.index}].estStartDatetime" class="form-control" value="${matchVO.estStartDatetime}"/>
											  	<form:input type="hidden" path="matchVOList[${matchStatus.index}].estEndDatetime" class="form-control" value="${matchVO.estEndDatetime}"/>
											  	<%-- <input type="hidden" name="playerIdList" value="${player.uuid}"/> --%>
											 	
									  	</li>
									  
									  
									  </c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="row">
						<!-- <div class="col-md-4">
                     		<div class="form-group row">
                     			<label class="col-sm-3 col-form-label"> Match No</label>
	                     		<div class="col-sm-9 ">
	                     			<input type="text" readonly="readonly" id="initMatchNo" name="initMatchNo"/>
	                     		</div>
	                     	</div>	
                     	</div> -->	
                     	<div class="col-md-6">
                     		<div class="form-group row">
                     			<input type="hidden" readonly="readonly" id="initMatchNo" name="initMatchNo"/>
                     			<label class="col-sm-3 col-form-label"> Match Title</label>
	                     		<div class="col-sm-9 ">
	                     			<select id="matchTitle" class="matchTitle custom-select"> 
											<option value="Group Match">Group Match</option>
											<option value="Series Match">Series Match</option>
											<option value="Knockout">Knockout</option>
											<option value="Qualifier">Qualifier</option>
											<option value="Eliminator">Eliminator</option>
											<option value="Quarter Final">Quarter Final</option>
											<option value="Semi Final">Semi Final</option>
											<option value="Final">Final</option>
									</select>
	                     		</div>
	                     	</div>	
                     	</div>
                     	<div class="col-md-6">
                     		<div class="form-group row">
                     			<label class="col-sm-3 col-form-label"> Group</label>
	                     		<div class="col-sm-9 ">
	                     			<select id="teamGroup" class="teamGroup custom-select"> 
																<c:forEach var="teamGroup" items="${teamGroupList}"> 
																	<option value="${teamGroup.name}">${teamGroup.name}</option> 
																</c:forEach> 
									</select>
	                     		</div>
	                     	</div>
	                    </div> 		
					</div>
					<div class="row">
						<div class="col-md-6">
                     		<div class="form-group row">
                     			<label class="col-sm-3 col-form-label">Team 1</label>
	                     		<div class="col-sm-9 ">
	                     			<select id="team1Selector" class="team1Selector custom-select"> 
																<c:forEach var="team" items="${teamList}"> 
																	<option value="${team.uuid}">${team.name}</option> 
																</c:forEach> 
									</select> 
	                     		</div>
	                     	</div>	
						</div>
						<div class="col-md-6">
                     		<div class="form-group row">
                     			<label class="col-sm-3 col-form-label">Team 2</label>
	                     		<div class="col-sm-9 ">
	                     			<select id="team2Selector" class="team2Selector custom-select"> 
																<c:forEach var="team" items="${teamList}"> 
																	<option value="${team.uuid}">${team.name}</option> 
																</c:forEach> 
									</select> 
	                     		</div>
	                     	</div>	
						</div>
					</div>	
					<div class="row">
						<div class="col-md-6">
							<div class="form-group row">
									<label class="col-sm-3 col-form-label">Match Start Time</label>
								<div class="col-sm-9 ">
									<div id="datepicker-popup" class="input-group date datepicker">
										<input type="time" id="estStarttime" name="estStarttime" class="form-control"/>
										<!-- <span class="mdi mdi-calendar input-group-text"></span> -->
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group row">
									<label class="col-sm-3 col-form-label">Match End Time</label>
								<div class="col-sm-9 ">
									<div id="datepicker-popup" class="input-group date datepicker">
										<input type="time" id="estEndtime" name="estStarttime" class="form-control"/>
										<!-- <span class="mdi mdi-calendar input-group-text"></span> -->
									</div>
								</div>
							</div>
						</div>
						
					</div>
				
                 <div class="row">
                 	<div class="col-md-6">
                 		<input type="hidden" name="matchSize" id="matchSize" value="${scheduleVO.matchVOList.size()}"/>
                 		<button type="button" style="margin-top: 10px;" id="matchAdder" class="btn btn-primary btn-icon-text">Add</button>
                     	<button type="submit" class="btn btn-primary btn-icon-text"><i class="mdi mdi-file-check btn-icon-prepend"></i>Submit</button>
                    </div>
                 </div>
           		</div>
           </form:form>
         </div>
       </div>
	</div>
	</div>	
<script>

$(function() {
	$('.matchRemover').click(function(){
		//$(this).parent().remove();
		$(this).closest('.list-group-item').remove();
	});
	
	$('#matchAdder').click(function(){
		var match_index = $('#matchInScheduleList > li').length;
		$("div input[value='hello']")
		var team1_id = $('#team1Selector').select2('data')[0].id;
		var team2_id = $('#team2Selector').select2('data')[0].id;
		var matchTitle = $('#matchTitle').select2('data')[0].id;
		var estStartDatetime = $('#estStarttime').val();
		var estEndDatetime = $('#estEndtime').val();
		var initMatchNo = $("#initMatchNo").val();
		var teamGroupName =  $("#teamGroup").val();
		
		
		//if($("div input[value='"+team1_id+"']").length == 0 && $("div input[value='"+team2_id+"']").length == 0){
			var ul = '<li class="list-group-item">'
			+ ' Match No : <input type="text" name="matchVOList['+match_index+'].matchNo" value="'+parseInt(initMatchNo)+'"/>'
			+ ' Match Title : <input type="text" name="matchVOList['+match_index+'].matchTitle" value="'+matchTitle+'"/>'
			+ ' Group : <input type="text" name="matchVOList['+match_index+'].teamGroupName" value="'+teamGroupName+'"/>'
			+ ' <input type="hidden" name="matchVOList['+match_index+'].team1Uuid" value="'+team1_id+'"/>'+$('#team1Selector').select2('data')[0].text
			+ ' Vs <input type="hidden" name="matchVOList['+match_index+'].team2Uuid" value="'+team2_id+'"/>'+$('#team2Selector').select2('data')[0].text
			+ ' Start Time : <input type="text" name="matchVOList['+match_index+'].estStartDatetime" value="'+estStartDatetime+'"/>'
			+ ' End Time : <input type="text" name="matchVOList['+match_index+'].estEndDatetime" value="'+estEndDatetime+'"/>'
			+' <button class="btn btn-danger btn-sm matchRemover" type="button"><i class="mdi mdi-close-circle"></i></button> </li>';
			
			$('#matchInScheduleList').append(ul);
			$("#initMatchNo").val(parseInt(initMatchNo)+1);
		//}
		//else{
		//	bootbox.alert("Match already present in schedule!");
		//} This needs to be added
		
	});
	
	$("#matchTitle").select2();
	$("#team1Selector").select2();
	$("#team2Selector").select2();
	$("#initMatchNo").val(parseInt($("#matchSize").val())+1);
	
	/* $('#datepicker-popup input').datepicker({
        format: "dd-mm-yyyy",
        todayHighlight: true
    }); */
	 
	
    $("#scheduleForm").validate({
        rules: {
        	tournamentName: "required"
        },
        messages: {
        	tournamentName: "Please enter tournament name"
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