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
           <form:form id="tournamentForm" method = "POST" action ="${pageContext.request.contextPath}/mvc/tournament/save" modelAttribute="tournamentVO">
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
                 
                 <p class="card-description">Team info</p>
                 <div class="well text-left">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group row">
								<div class="col-sm-9">
									<ul class="list-group" id="groupInfo">
										<c:forEach var="teamGroup"
											items="${tournamentVO.teamGroupList}" varStatus="teamGroupStatus">
												<li class="list-group-item" data-index="${teamGroupStatus.index}">
													<div class="input-group "> 
														<form:input type="text" path="teamGroupList[${teamGroupStatus.index}].name" class="form-control groupName" value="${teamGroup.name}"/> 
															<div class="input-group-append"> 
																<button class="btn btn-danger btn-sm removeGroup" type="button"><i class="mdi mdi-close-circle"></i></button> 
															</div> 
													</div> 
													<c:set var="previousGroupName" value="${teamGroup.name}" />
													<form:input type="hidden" path="teamGroupList[${teamGroupStatus.index}].uuid" class="groupUuid" value="${teamGroup.uuid}"/>
													<ul class="list-group-item" id="teamsList">
														<c:forEach var="team" items="${teamGroup.teamList}" varStatus="teamStatus">
															<li class="list-group-item">${team.name}
															 	<span class="removeTeam mdi mdi-close-circle pull-right"	style="cursor: pointer;"></span> 
																<form:input type="hidden" path="teamGroupList[${teamGroupStatus.index}].teamList[${teamStatus.index}].uuid" value="${team.uuid}"/>
																<form:input type="hidden" path="teamGroupList[${teamGroupStatus.index}].teamList[${teamStatus.index}].groupUuid" class="teamGroupUuid" value="${team.groupUuid}"/>
															</li>
														</c:forEach>
													</ul>
													
													<div class="input-group"> 
										            	<select class="teamSelector custom-select"> 
															<c:forEach var="team" items="${teamList}"> 
																<option value="${team.uuid}">${team.name}</option> 
															</c:forEach> 
														</select> 
														<div class="input-group-append">
															<button class="btn btn btn-primary btn-icon-text addTeamToGroup" type="button">Add Team</button>
														</div> 
										            </div>
												</li>
											</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
                <%-- <div class="row">
                   <div class="col-md-6">
                   	<ul id="groupInfo" class="list-group">
                   		<li class="list-group-item" data-index="0">
                   			<div class="input-group ">
                   				<input type="text" name="teamGroupList[3].name" class="form-control groupName" placeholder="Group Name">
							  	<div class="input-group-append">
							    	<button class="btn btn-danger btn-sm removeGroup" type="button"><i class="mdi mdi-close-circle"></i></button>
							  	</div>
							</div>
                   			<ul style="margin-left:10px;" class="list-group"></ul>
                   			<div class="input-group">
	  							<select class="teamSelector custom-select">
	                   				<c:forEach var="team" items="${teamList}">
									    <option value="${team.uuid}">${team.name}</option>
							        </c:forEach>
								</select>
							  	<div class="input-group-append">
							    	<button class="btn btn btn-primary btn-icon-text addTeamToGroup" type="button">Add Team</button>
							  	</div>
							</div>
                   		</li>
                   </ul>
                  <input type="button" id="addNewGroup" class="btn btn-primary" value="Add new group">
                 </div>
              </div> --%>
                   <%-- <tr>
                        <td><form:input type="text" path="teamGroupList[0].name" value="Group AA"/></td>
                        <td><form:input type="text" path="teamGroupList[0].teamList[0].uuid" value="1"/></td>
                    </tr> --%>
                   
                   
                   <%-- <c:forEach varStatus="us" var="user" items="${tournament.teamGroupList}" >
                    <tr>
                        <td><form:input type="text" path="teamGroupList[${us.index}].name" value="Group AA"/>${user.name}</td>
                        <td><form:input type="text" path="teamGroupList[${us.index}].teamList[0].uuid" value="1"/> ${user.team.uuid}</td>
                    </tr>
                	</c:forEach> --%>
                
                   <div class="row">
                   <div class="col-md-6">
                		<form:input type="hidden" path="uuid" />
                		<input type="hidden" name="groupSize" id="groupSize" value="${tournamentVO.teamGroupList.size()}"/>
                		<input type="hidden" name="teamSize" id="teamSize" value=""/>
                		<input type="button" id="addNewGroup" class="btn btn btn-primary btn-icon-text " value="Add New Group">
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

    // Function needed to reset index if any item removed
    function resetElemIndexing() {
    	$('#groupInfo > li').each(function(k,v){
        	var newIndex = k;

        	$(v).attr('data-index', newIndex); // reseting index of li data-index attribute
        	$(v).find('.groupName').prop('name','teamGroupList['+newIndex+'].name'); // reseting the index of groupname textbox 
        	$(v).find('.groupUuid').prop('name','teamGroupList['+newIndex+'].uuid'); // reseting the index of groupname textbox 

        	// ReIndexing team list
        	var $teamList = $(v).find('ul');
        	$teamList.find('li').each(function(i,j){
        		$(j).find('input').prop('name','teamGroupList['+newIndex+'].teamList[' + i+'].uuid'); // reseting the index of team input in team list
        		$(j).find('.teamGroupUuid').prop('name','teamGroupList['+newIndex+'].teamList[' + i+'].groupUuid'); // reseting the index of team input in team list
            });
       	});
    }

    $('#groupInfo').on("click", ".removeGroup", function() {
    	$(this).closest('.list-group-item').remove();
    	resetElemIndexing();
    });

    $('#groupInfo').on("click", ".removeTeam", function() {
    	$(this).closest('.list-group-item').remove();
    	resetElemIndexing();	
    });
    
    /* $('#groupInfo').on("click", ".addTeam", function() {
        //debugger;
        var grp_index = $(this).closest('.list-group-item').data('index');
        var $teamSelector = $(this).closest('.list-group-item').find('.teamSelector'); // dropdown
        var $ul = $(this).closest('.list-group-item').find('ul'); // team list
        var team_index = $(this).closest('.list-group-item').find('ul li').length;
        var li = '<li class="list-group-item list-group-item-secondary">' + $teamSelector.text() + '<input type="text" name="teamGroupList[' + grp_index + '].teamList[' + team_index + '].uuid" id="teamSize" value="' + $teamSelector.val() + '"/>' +
            '<span class="removeTeam mdi mdi-close-circle pull-right" style="cursor:pointer;"></span></li>'
        var $this = $(this).next().add()
        $ul.append(li);
    });
 */
    $('#groupInfo').on("click", ".addTeamToGroup", function() {
        //debugger;
        var grp_index = $(this).closest('.list-group-item').data('index');
        var $teamSelector = $(this).closest('.list-group-item').find('.teamSelector'); // dropdown
        var $ul = $(this).closest('.list-group-item').find('ul'); // team list
        var team_index = $(this).closest('.list-group-item').find('ul li').length;
        var li = '<li class="list-group-item list-group-item-secondary">' + $teamSelector.find("option:selected").text() + '<input type="hidden" name="teamGroupList[' + grp_index + '].teamList[' + team_index + '].uuid" id="teamSize" value="' + $teamSelector.val() + '"/>' +
            '<span class="removeTeam mdi mdi-close-circle pull-right" style="cursor:pointer;"></span></li>'
        var $this = $(this).next().add()
        $ul.append(li);
    });

    $('#addNewGroup').click(function() {
        var grp_index = $('#groupInfo > li').length;
        var groupRow = '<li class="list-group-item" data-index="' + grp_index + '">' +
	         '<div class="input-group "> '+
			'	<input type="text" name="teamGroupList[' + grp_index + '].name" class="form-control groupName" placeholder="Group Name"> '+
		  	 '<div class="input-group-append"> '+
		    '	<button class="btn btn-danger btn-sm removeGroup" type="button"><i class="mdi mdi-close-circle"></i></button> '+
		  	 '</div> '+
			 '</div> '+
            //'<input type="text" name="teamGroupList[' + grp_index + '].name" class="form-control groupName" placeholder="Group Name">' +
            '<ul style="margin-left:10px;" class="list-group"></ul>' +
            '<div class="input-group">' +
            '	<select class="teamSelector custom-select">' +
            '	<c:forEach var="team" items="${teamList}">' +
            '	    <option value="${team.uuid}">${team.name}</option>' +
            '    </c:forEach>' +
            '</select>' +
            '<div class="input-group-append"><button class="btn btn btn-primary btn-icon-text addTeamToGroup" type="button">Add Team</button></div>' +
            '</div></li>';
        $('#groupInfo').append(groupRow);
    });


    $('#teamAdder').click(function() {
        $("div input[value='hello']");
        var team_id = $('#teamSelector').select2('data')[0].id;
        var groupIndex = parseInt($("#groupSize").val()) + 1;
        var teamIndex = parseInt($("#teamSize").val()) + 1;
        alert('index' + teamIndex);
        if ($("div input[value='" + team_id + "']").length == 0) {
            var ul = '<li class="list-group-item">' + $('#teamSelector').select2('data')[0].text +
                ' <span class="teamRemover mdi mdi-close-circle pull-right" style="cursor:pointer;"></span><input type="hidden" name="teamGroupList[' + groupIndex + '].teamList[' + teamIndex + '].uuid" value="' + team_id + '"/></li>';
            $('#teamInGroupList').append(ul);
            $("#teamSize").val(teamIndex);
        } else {
            bootbox.alert("Team already present in group!");
        }

    });

    $("#teamSelector").select2();


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
});</script>	