<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="page-header">
   <h3 class="page-title">Player</h3>
   <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
       <li class="breadcrumb-item"><a href="#">Toss</a></li>
       <li class="breadcrumb-item active" aria-current="page"> Match toss </li>
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
           <h1 class="card-title">Australia vs England</h1>
           <div class="row">
           		<div class="col-lg-9">
	           		<form:form method = "post" action ="${pageContext.request.contextPath}/mvc/scorer/saveToss" id="matchForm" modelAttribute="match" >
	           		<form:hidden path="tournament.uuid"/>
	           		<form:hidden path="team1.uuid"/>
	           		<form:hidden path="team2.uuid"/>
	           		<form:hidden path="groupName"/>
	           		<form:hidden path="matchNo"/>
	           		<form:hidden path="umpire1"/>
	           		<form:hidden path="umpire2"/>
	           		<form:hidden path="umpire3"/>
	           		<form:hidden path="estStartDatetime"/>
	           		<form:hidden path="estEndDatetime"/>
	           		<form:hidden path="matchTitle"/>
	           		<form:hidden path="scorerId"/>
	           		<form:hidden path="playerOfMatch"/>
	           		<form:input path="uuid"/>
					  <div class="form-group">
					    <label for="tossWinnerTeam">Toss Won By</label>${match.team1.name}	
					    <form:select path="tossWinnerTeam.uuid" cssClass="form-control">
						   <form:option value="${match.team1.uuid}" label="${match.team1.name}"/>
						   <form:option value="${match.team2.uuid}" label="${match.team2.name}"/>
						</form:select>
					  </div>
					  <div class="form-group">
					    <label for="tossDecision">Opted to</label>
					    <form:select path="tossDecision" cssClass="form-control">
						   <form:option value="BAT" label="Bat"/>
						   <form:option value="BOWL" label="Bowl"/>
						</form:select>
					  </div>
					  <div class="form-group">
					    <label for="overs">Overs</label>
					    <form:input path="overs" cssClass="form-control"/>
					  </div>
		           	<button type="submit" class="btn btn-primary"><b>Start Match</b></button>
		           	</form:form>
           		</div>
           </div>
           </div>
         </div>
    </div>
</div>




