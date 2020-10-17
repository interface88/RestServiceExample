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
    <div class="col-12 grid-margin" id="step2">
       <div class="card">
         <div class="card-body">
           <h1 class="card-title">Select Opening Player</h1>
           <div class="row">
           		<div class="col-lg-9">
	           		<form>
					  <div class="form-group">
					    <label for="exampleInputEmail1">Striker</label>
					    <select class="form-control" id="select_striker_batsman">
					    	<c:if test="${(match.team1.uuid == match.tossWinnerTeam.uuid)  && (match.tossDecision == 'BAT')}">
							   <c:forEach items="${match.team1.players}" var="player" varStatus="cnt">
						    	<option value="${player.uuid}">${player.playerName}</option>
						      </c:forEach>
							</c:if>
					    </select>
					  </div>
					  <div class="form-group">
					    <label for="exampleInputEmail1">Non Striker</label>
					    <select class="form-control"  id="select_non_striker_batsman">
					    	<c:if test="${(match.team1.uuid == match.tossWinnerTeam.uuid)  && (match.tossDecision == 'BAT')}">
							   <c:forEach items="${match.team1.players}" var="player" varStatus="cnt">
						    	<option value="${player.uuid}">${player.playerName}</option>
						      </c:forEach>
							</c:if>
					    </select>
					  </div>
					  <div class="form-group">
						    <label for="exampleInputEmail1">Opening Bowler</label>
					    <select class="form-control"  id="select_opening_bowler">
					    	<c:if test="${(match.team1.uuid == match.tossWinnerTeam.uuid)  && (match.tossDecision == 'BAT')}">
							   <c:forEach items="${match.team2.players}" var="player" varStatus="cnt">
						    	<option value="${player.uuid}">${player.playerName}</option>
						      </c:forEach>
							</c:if>
					    </select>
					  </div>
		           	</form>
		           	<button type="button" id="match_starter">Start Match</button>
           		</div>
           </div>
           </div>
         </div>
    </div>
 	
</div>
