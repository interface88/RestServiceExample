<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.btn-circle {
  width: 45px;
  height: 45px;
  line-height: 45px;
  text-align: center;
  padding: 0;
  border-radius: 50%;
}

.btn-circle i {
  position: relative;
  top: -1px;
}

.btn-circle-sm {
  width: 35px;
  height: 35px;
  line-height: 35px;
  font-size: 0.9rem;
}

.btn-circle-lg {
  width: 55px;
  height: 55px;
  line-height: 55px;
  font-size: 1.1rem;
}

.btn-circle-xl {
  width: 70px;
  height: 70px;
  line-height: 70px;
  font-size: 1.3rem;
}
</style>
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
    <style>
    	.current-inning-score{
    		font-size:30px;
    	}
    	.current-inning-over{
    		font-size:20px;
    	}
    	
    	.current-over span{
    		height: 40px;
			width: 40px;
			border-radius: 50%;
			border: 1px solid #333;
			display: inline-block;
			text-align: center;
			line-height: 40px;
			font-size: 14px;
    	}
    	
    	tr.striker span:after{
    		content:" *";
    	}
    	
    </style>
 	<div class="col-12 grid-margin">
       <div class="card">
         <div class="card-body">
           <h1 class="card-title">${match.team1.name} vs ${match.team2.name}</h1>
           <div class="row">
           		<div class="col-lg-9">
	           		<h4>${battingteam} 1st Inning</h4>
	           		<span class="current-inning-score">0-0</span><span class="current-inning-over">(0)</span>
	           		<button type="button" data-toggle="modal" data-target="#youtube-modal" class="btn btn-danger btn-rounded btn-fw"><i class="mdi mdi-video"></i> Youtube</button>
           		</div>
           </div>
           
           <div class="row">
           		<div class="col-lg-9">
	           		<table class="table" id="batsman-stats-panel">
	           			<thead class="thead-light">
		           			<tr>
		           				<th style="width: 10px;"></th>
		           				<th>Batsman</th>
		           				<th>R</th>
		           				<th>B</th>
		           				<th>4s</th>
		           				<th>6s</th>
		           				<th>SR</th>
		           			</tr>
	           			</thead>
	           			<tbody>
	           				<tr>
	           					<td><input type="radio" checked name="striker-radio" class="striker-radio-klass"></td>
	           					<td><span class="striker"></span>
	           						<button type="button" class="btn btn-light batsman-selector-modal_opener registery_elem" id="batsman-selector-modal_opener-1" data-batsman_type="striker">Add batsman</button>
	           					</td>
	           					<td>0</td>
	           					<td>0</td>
	           					<td>0</td>
	           					<td>0</td>
	           					<td>0.00</td>
	           				</tr>
	           				<tr>
	           					<td><input type="radio" name="striker-radio" class="striker-radio-klass"></td>
	           					<td><span class="non-striker">
	           					</span>
		           					<button type="button" class="btn btn-light batsman-selector-modal_opener registery_elem" id="batsman-selector-modal_opener-2" data-batsman_type="non-striker">Add batsman</button>
	           					</td>
	           					<td>0</td>
	           					<td>0</td>
	           					<td>0</td>
	           					<td>0</td>
	           					<td>0.00</td>
	           				</tr>
	           			</tbody>
	           		</table>
           		</div>
           </div>
           <div class="row">
           		<div class="col-lg-9">
	           		<table class="table" id="bowler-stats-panel">
	           			<thead class="thead-light">
		           			<tr>
		           				<th>Bowler</th>
		           				<th>0</th>
		           				<th>M</th>
		           				<th>R</th>
		           				<th>W</th>
		           				<th>ER</th>
		           			</tr>
	           			</thead>
	           			<tbody>
	           				<tr>
	           					<td><span class="bowler"></span><button type="button" class="btn btn-light registery_elem bowler-selection-modal_opener" id="bowler-selection-modal_opener">Add Bowler</button></td>
	           					<td>0</td>
	           					<td>0</td>
	           					<td>o</td>
	           					<td>0</td>
	           					<td>0</td>
	           				</tr>
	           			</tbody>
	           		</table>
           		</div>
           </div>
            <div class="row">
           		<div class="col-lg-9">
           			<hr>
           			<div>
	           			This over : <span class="current-over"></span>
           			</div>
           		</div>
     	      </div>
           <div class="row">
           		<div class="col-lg-9">
           			<label><input type="checkbox" class="ballType group1" name="wide" value="W" data-run="1" > Wide</label>
           			<label><input type="checkbox" class="ballType group1" name="no_ball" value="NB" data-run="1"> No Ball</label>
           			<label><input type="checkbox" class="ballType group2" name="bye" value="B" data-run="1"> Byes</label>
           			<label><input type="checkbox" class="ballType group2" name="legbye" value="LB" data-run="1"> Leg Byes</label>
           			<label><input type="checkbox" class="wicket" name="wicket" value="wkt" data-run="1"> Wicket</label>
           		</div>
           </div>
           <div class="row">
           		<div class="col-lg-9">
           			<div class="runPanel">
                       	<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                        	<div class="btn-groupq scorePanel"  role="group" aria-label="">
							  <button type="button" class="btn btn-primary btn-circle" data-run="0">0</button>
							  <button type="button" class="btn btn-primary btn-circle" data-run="1">1</button>
							  <button type="button" class="btn btn-primary btn-circle" data-run="2">2</button>
							  <button type="button" class="btn btn-primary btn-circle" data-run="3">3</button>
							  <button type="button" class="btn btn-primary btn-circle" data-run="4">4</button>
							  <button type="button" class="btn btn-primary btn-circle" data-run="5">5</button>
							  <button type="button" class="btn btn-primary btn-circle" data-run="6">6</button>
							</div>
						</div>
                      </div>
           		</div>
           </div>
         </div>
       </div>
   </div>
   <button type="button" onclick="submitScore();">Test score submit</button>

<form:form  method = "POST" action ="${pageContext.request.contextPath}/mvc/scorebook/saveScorebook" id="scoreBookForm" modelAttribute = "scorebook" >
MATH ID <input type="text" name="matchId" id="matchId" value="${match.uuid}"><BR/>
INNIN<input type="text" name="innings" id="innings"  value="${match.currentInning}"><BR/>
BATTING TEAM<input type="text" name="battingTeam" id="battingTeam" value="${battingteam}"><BR/>
BOWLING<input type="text" name="bowlingTeam" id="bowlingTeam" value="${bowlingteam}"><BR/>
BATSMAN<input type="text" name="batsman" id="batsman" value=""><BR/>
NON STRIKE<input type="text" name="nonStriker" id="nonStriker"  value=""><BR/>
BOWLER<input type="text" name="bowler" id="bowler" value=""><BR/>
OVER<input type="text" name="overs" id="overs" value="1"><BR/>
BALL<input type="text" name="ball" id="ball" value="0"><BR/>
BATSMAN<input type="text" name="batsmanRun" id="batsmanRun"><BR/>
EXTRA TYPE<input type="text" name="extraType" id="extraType"><BR/>
EXTRA RUN<input type="text" name="extraRuns" id="extraRuns"><BR/>
TOTAL RUN<input type="text" name="totalRuns" id="totalRuns"><BR/>
IS WIKET<input type="text" name="isWicket" id="isWicket"><BR/>
WIKET TYPE<input type="text" name="wicketType" id="wicketType"><BR/>
FIELDER<input type="text" name="fielder" id="fielder"><BR/>
PLAYEROUT<input type="text" name="playerOut" id="playerOut">
batsmanUuid<input type="text" name="batsmanUuid" id="batsmanUuid">
nonStrikerUuid<input type="text" name="nonStrikerUuid" id="nonStrikerUuid">
bolwerUuid<input type="text" name="bolwerUuid" id="bolwerUuid">
bolwerUuid<input type="text" name="ballCount" id="ballCount" value="0">

</form:form>


<script>


// version 2.0 code for scorebook
/*
 * Code to be re-wrote with simple logic and maintainable code. coz current javascript code is difficult to understand and maintain.
 @rajesh 
 */

// UI -> MODEL
 



var score_a_ball = function(){


	
var striker_span = $('span.striker')
var non_striker_span = $('span.non-striker');
var bowler_span = $('span.bowler');


	

// 	$('#batsmanInput').val(striker_span.text());
// 	$('#batsmanUuidInput').val(striker_span.data('uuid'));

// 	$('#nonStrikerUuidInput').val(non_striker_span.data('uuid'));
// 	$('#nonStrikerInput').val(non_striker_span.text());
	
// 	$('#bowlerInput').val(bowler_span.text());
// 	$('#bolwerUuidInput').val(bowler_span.data('uuid'));
}


// MODEL



// MODEL -> UI level code




// ------- OLD _CODE ------
/*---- UTIL FUNCTION --*/
var create_option_for_player = function(playerJsonObj){
	var option = '';
	for (var key in playerJsonObj) {
		  if (playerJsonObj.hasOwnProperty(key)) {
			  option = option + '<option value="'+key+'">'+playerJsonObj[key]+'</option>';
		  }
		} 
	return option;
}


// this will be batting team line up
var team_1 = ${team1PlayerListJson};

//this will be fielding team line up
var team_2 = ${team2PlayerListJson};

var nanToNumber = function (value) {
    var value = Number(value);
    return isNaN(value) ? 0 : value;
};

var overCalc = 0;


var resetBatsman = function(batsmanPos){
	if(batsmanPos == 'striker'){
		$('.striker').html('<button type="button" class="btn btn-light batsman-selector-modal_opener" data-batsman_type="striker">Add batsman</button>');
		$('#batsman').val('');
	}else{
		$('.non-striker').html('<button type="button" class="btn btn-light batsman-selector-modal_opener" data-batsman_type="striker">Add batsman</button>');
		$('#nonStriker').val('');
	
	}
};

var checkMatchPlayableCondition = function(){
	//TODO : check striker present or not
	if($('span.striker').text() == '' || $('span.non-striker').text() == ''){
		alert('select batsman');
		return false;
	}
	
	//TODO : check bolwer present or not

	if($('#bowler').val() == ''){
		alert('select bowler');
		return false;
	}

	return true;
	
}




$(function(){

	// ----- MODAL JQUERY OBJECT --
	var $batsman_selection_modal = $("#batsman-selection-modal");
	var $bowler_selection_modal = $("#bowler-selection-modal");
	var $wicket_modal = $("#wicket-modal");

	// ----- HELPER FUNCTION ---
	
	
	$('#wicket_type_combo').on('change', function() {
		if(fielder_applicable_wicket.indexOf(this.value) > -1){
			$('#fielder-panel').show();
		}else{
			$('#fielder-panel').hide();
		}
	
		if(batsman_choosing_applicable_wicket.indexOf(this.value) > -1){
			$('#choose-out-batsman-panel').show();
		}else{
			$('#choose-out-batsman-panel').hide();
		}
		refresh_batsman_out_combo();
	});
	
	function refresh_batsman_out_combo(){
		var option = '<option selected value="'+$('.striker').text()+'">'+$('.striker').text()+'</option>';
		option = option + '<option value="'+$('.non-striker').text()+'">'+$('.non-striker').text()+'</option>';
		$('#batsman-out-combo').html(option);
	}
	
	function resetScorePanel(){
		$('.ballType, .wicket').each(function() {
			this.checked = false;
		});
	}
});
	

</script>


<!-- ******** BATSMAN SELECTION MODAL ******* -->
<div class="modal fade" id="batsman-selection-modal" tabindex="-1" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="batsman-selection-modal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="batsman-selection-modal-label">Batsman selection</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
			  <div class="form-group">
			    <label for="exampleInputEmail1">Select Batsman</label>
			    <select class="form-control" id="batsman-to-batting-combo">
			    </select>
			  </div>
			  
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="add-batsman-to-batting">Done</button>
      </div>
    </div>
  </div>
</div>

<!-- ******** BOWLER SELECTION MODAL ******* -->
<div class="modal fade" id="bowler-selection-modal" tabindex="-1" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="bowler-selection-modal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bowler-selection-modal-label">Bolwer selection</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
			  <div class="form-group">
			    <label for="exampleInputEmail1">Selection Bolwer</label>
			    <select class="form-control" id="bowler-to-bowling-combo">
			    </select>
			  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="add-bowler-to-bowling">Done</button>
      </div>
    </div>
  </div>
</div>

<!-- ******** WICKET MODAL ******* -->
<div class="modal fade" id="wicket-modal" tabindex="-1" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="wicket-modal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="wicket-modal-label">Fall of Wicket</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
			  <div class="form-group">
			    <label for="exampleInputEmail1">How wicket fall ?</label>
			    <select class="form-control" id="wicket_type_combo">
			    	<option value="Bowled">Bowled</option>
			    	<option value="Caught">Caught</option>
			    	<option value="Run Out">Run Out</option>
			    	<option value="Stumping">Stumping</option>
			    	<option value="LBW">LBW</option>
			    	<option value="Hit Wicket">Hit Wicket</option>
			    </select>
			  </div>
			  <div class="form-group" id="choose-out-batsman-panel" style="display:none;">
			    <label for="exampleInputPassword1">Who got out?</label>
			    <select class="form-control" id="batsman-out-combo">
			    </select>
			  </div>
			  <div class="form-group" id="fielder-panel"  style="display:none;">
			    <label for="exampleInputPassword1">Who helped?</label>
			    <select class="form-control" id="fielder-combo">
			    </select>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Next batsman</label>
			    <select class="form-control" id="next-batsman-combo">
			    </select>
			  </div>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="newBatsman">Done</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="youtube-modal" tabindex="-1" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="youtube-modal" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="youtube-modall-label">Youtube Panel</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	<div class="row">
	    		<div class="col-6">
		    		<div class="card">
					  <h5 class="card-header">Flash Screen</h5>
					  <div class="card-body">
					  		<div class="btn-group text-center" role="group" aria-label="Basic example">
							  <button type="button" class="btn btn-secondary panel_selector" data-panel_name="fours_card">4</button>
							  <button type="button" class="btn btn-secondary panel_selector" data-panel_name="sixes_card">6</button>
							  <button type="button" class="btn btn-secondary panel_selector" data-panel_name="duck_card">Duck</button>
							  <button type="button" class="btn btn-secondary panel_selector" data-panel_name="free_hit_card">Free Hit</button>
							  <button type="button" class="btn btn-secondary panel_selector" data-panel_name="wide_ball_card">Wide ball</button>
							  <button type="button" class="btn btn-secondary panel_selector" data-panel_name="wicket_card">Wicket</button>
							  <button type="button" class="btn btn-secondary panel_selector" data-panel_name="out_card">Out</button>
							  <button type="button" class="btn btn-secondary panel_selector" data-panel_name="not_out_card">Not Out</button>
					  		</div>
					  </div>
					</div>
	    		</div>
	    		<div class="col-6">
		    		<div class="card">
					  <h5 class="card-header">Statistics</h5>
					  <div class="card-body">
					    <div class="btn-group text-center" role="group" aria-label="Basic example">
						  <button type="button" class="btn btn-secondary">Most runs</button>
						  <button type="button" class="btn btn-secondary">Most Wicket</button>
						  <button type="button" class="btn btn-secondary">Most 4s</button>
						  <button type="button" class="btn btn-secondary">Most 6s</button>
						</div>
					  </div>
					</div>
	    		</div>
	   		</div>
	   		<div class="row">
	    		<div class="col-12">
		    		<div class="card">
					  <h5 class="card-header">Team 1</h5>
					  <div class="card-body">
				  			<c:forEach var="player" items="${match.team1.players}">
						  		<div class="btn-group">
								  <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								    ${player.playerName}
								  </button>
								  <div class="dropdown-menu">
								    <a class="dropdown-item panel_selector" href="#" data-panel_name="batsman_card" data-player_id="${player.uuid}">Batsman Card</a>
								    <a class="dropdown-item panel_selector" href="#" data-panel_name="batsman_match_card" data-player_id="${player.uuid}">Batsman Match Card</a>
								    <a class="dropdown-item panel_selector" href="#" data-panel_name="batsman_series_card" data-player_id="${player.uuid}">Batsman Series Card</a>
								  </div>
								</div>
						      </c:forEach>
					  </div>
					</div>
	    		</div>
	   		</div>
	   		<div class="row">
	    		<div class="col-12">
		    		<div class="card">
					  <h5 class="card-header">Team 2</h5>
  						  <div class="card-body">
							<c:forEach var="player" items="${match.team2.players}">
					  		<div class="btn-group">
							  <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							    ${player.playerName}
							  </button>
							  <div class="dropdown-menu">
							    <a class="dropdown-item panel_selector" href="#" data-panel_name="bowler_card" data-player_id="${player.uuid}">Bowler Card</a>
							    <a class="dropdown-item panel_selector" href="#" data-panel_name="bowler_match_card" data-player_id="${player.uuid}">Bowler Match Card</a>
							    <a class="dropdown-item panel_selector" href="#" data-panel_name="bowler_series_card" data-player_id="${player.uuid}">Bowler Series Card</a>
							  </div>
							</div>
					      </c:forEach>
					  </div>

					</div>
	    		</div>
	   		</div>
	   		<div class="row">
	    		<div class="col-12">
		    		<div class="card">
					  <h5 class="card-header">Match</h5>
					  <div class="card-body">
					  		<div class="btn-group text-center" role="group" aria-label="Basic example">
							  <button type="button" class="btn btn-secondary panel_selector" data-panel_name="point_table_card">Points Table</button>
							  <button type="button" class="btn btn-secondary panel_selector" data-panel_name="score_card">Score Card</button>
							  <button type="button" class="btn btn-secondary panel_selector" data-panel_name="squad_card">Squad Card</button>
							  <button type="button" class="btn btn-secondary panel_selector" data-panel_name="toss_card">Toss Card</button>
					  		</div>
					  </div>
					</div>
	    		</div>
	   		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Done</button>
      </div>
    </div>
  </div>
</div>
<script>
//--- fucntion to support older browser
if (!String.prototype.includes) {
  String.prototype.includes = function(search, start) {
    'use strict';

    if (search instanceof RegExp) {
      throw TypeError('first argument must not be a RegExp');
    } 
    if (start === undefined) { start = 0; }
    return this.indexOf(search, start) !== -1;
  };
}

// ------------------- function for showing panel in video ----------
$('body').data('panel_name', 'score'); // TODO : need to set default panel

$('.panel_selector').click(function(){
	var panel = $(this).data('panel_name');
	var player_id = $(this).data('player_id');
	$('body').data('panel_name', panel);// for reference purpose which panel user selected.
	$('body').data('player_id', player_id);
	refreshMatchPanel(panel);
	
});

// code to call node application goes here
function refreshMatchPanel(panel_name){
	var url = 'http://localhost:3000/updateui';
	//TODO : 
    var obj = {};
    obj.panel_name = $('body').data('panel_name');
    obj.player_id = $('body').data('player_id');
    obj.match_id = ${match.uuid};
    obj.innings = ${match.currentInning};    
    obj.tournament_id = 36;
    
	 $.get( url, obj, function( data ) {
 		  //$( ".result" ).html( data );
 		  //TODO: need to do something if score refreshed successfully.
 		  //alert( "Load was performed." );
 	});
	
}
//-------------------end of  function for showing panel in video ----------
// function to register click event
$('.registery_elem').on('click',function(e) {
	var id = $(e.target).attr("id");
	console.log(e.target);
	if(typeof id != 'undefined'){
		$('body').data('element_id', id); // we are storing click element id if exist
	}
});


// function to check is over completed
var isOverCompleted = function(){
	var noOfDeliveries = $('#ballCount').val();
	if(noOfDeliveries == 6){
		$bowler_selection_modal.modal('show');

		//adding add bowler button back
		var template = $("#reset_bowler_template").html();
		var row = Mustache.render(template,{});
        $("#bowler-stats-panel tbody").html(row);
		$('#bowler').val('');
		$('.current-over').html('');
		$('#overs').val(nanToNumber($('#overs').val()) + 1);
		$('#ball').val(0);
		$('#ballCount').val(0);
		return true;
	}
	return false;
}

var isMatchPlayable = function(){
	// checking batsman present
	var message = "";
	var is_match_playable = true;
	$('#batsman-stats-panel tbody tr').each(function(){
		var id = $(this).data('batsman_id');
		if(typeof id == 'undefined'){
			is_match_playable = false;
		}
	});
	if(is_match_playable == false){
		message = message + 'select batsman \n';
	}
	
	// checking bowler present
	$('#bowler-stats-panel tbody tr').each(function(){
		var id = $(this).data('bowler_id');
		if(typeof id == 'undefined'){
			is_match_playable = false;
			message = message + 'select bowler \n';
		}
	});

	// checking the striker selected or not
	if($('.striker-radio-klass:checked').length == 0){
		is_match_playable = false;
		message = message + 'select striker \n';
	}
	if(is_match_playable == false){
		alert(message);
	}
	return is_match_playable;
}
$(document).on("click", ".striker-radio-klass", function(){
	//$('.striker-radio-klass').on('click', function(){
		$('.striker-radio-klass').each(function(){
			var $tr = $(this).closest('tr');
			$tr.removeClass();
			if(this.checked){
				$tr.addClass('striker');
			}else{
				$tr.addClass('non-striker');
			}
		});
	})

// global level
var fielder_applicable_wicket = ['Run Out' , 'Catch' , 'Stumping'];
var batsman_choosing_applicable_wicket = ['Run Out'];
//initializing batsman, bowler & fielder dropdown
$('#batsman-to-batting-combo').html(create_option_for_player(team_1)); // combo for selecting batsman
$('#batsman-out-combo').html(create_option_for_player(team_1)); // combo for selecting batsman who is out
$('#next-batsman-combo').html(create_option_for_player(team_1)); // combo for selecting next batsman after wicker fall
$('#fielder-combo').html(create_option_for_player(team_2)); // combo for selecting fielder
$('#bowler-to-bowling-combo').html(create_option_for_player(team_2)); // combo for selecting next batsman after wicker fall


/**
 * 
 * We will use  body element to store button clicked element ID
  so it can be fetch from any function to know click element
  body element will work as registory of click element
 */

// ----- MODAL JQUERY OBJECT --
var $batsman_selection_modal = $("#batsman-selection-modal");
var $bowler_selection_modal = $("#bowler-selection-modal");
var $wicket_modal = $("#wicket-modal");


// function to check logic of No-ball, wide ball & bye & leg bye logic check box
$('.ballType ').on('change', function() {
    var $this = $(this);

    // toggling of WIDE & NO-BALL
    if ($this.hasClass('group1')) {
        $('.group1').each(function() {
            this.checked = false;
        });

        //if ball is wide then uncheck 	LEG-BYE & BYE
        if (this.value == 'W') {
            $('.group2').each(function() {
                this.checked = false;
            });
        }
    }

    // toggling of LEG-BYE & BYE
    if ($this.hasClass('group2')) {
        $('.group2').each(function() {
            this.checked = false;
        });
        // also add WIDE BALL FOR THIS
        $('.group1').each(function() {
            if (this.value == 'W') {
                this.checked = false;
            }
        });
    }

    $this[0].checked = true;
});


// code 2.0
var Scorebook = function () {
     var self = this;
     self.batsman = '';
     self.bowler = '';
     self.striker = '';
     self.rough_run = 0; // rough run ie 
     self.extra_runs = 0;
     self.extra_type_arr = [];
     self.extra_type = '';
     self.ui_ball_label = '';
     self.count_this_ball = true;
     self.batsman_run = '';
     self.is_player_out = 0;
     self.over = 0;
     self.is_wicket = 0;
     self.fielder = '';
     self.player_out = '';
     self.total_run = 0;
     self.no_of_ball = 0;
     self.wicket_type = '';
     self.batsman_run = 0;
     self.rough_run = 0;
     self.applyBallLogic = function () {
    	 if(self.extra_type_arr.includes("W")){
    			self.extra_runs = 1 + self.rough_run;
    			self.extra_type = 'Wd';
    			self.ui_ball_label =  self.rough_run + 'Wd';
    			self.batsman_run = 0;
    			self.count_this_ball = false;
    		}else if(self.extra_type_arr.includes("NB")){
    			self.extra_runs = 1;
    			// if ball is no ball + (LB or Bye) then all run will be extra
    			if(self.extra_type_arr.includes("LB") || self.extra_type_arr.includes("B")){
    				self.extra_runs = 1 + self.rough_run ;
    				self.batsman_run = 0;
    			}else{
    				self.batsman_run = self.rough_run;
    				self.extra_type = 1;
    			}
    			self.extra_type = 'NB';
    			self.ui_ball_label =  self.rough_run + 'NB';
    			self.count_this_ball = false;
    			
    		}else if(self.extra_type_arr.includes("LB") || self.extra_type_arr.includes("B")){
    			self.extra_runs = self.rough_run;
    			self.extra_type = self.extra_type_arr.join('');
    			self.no_of_ball = self.no_of_ball + 0.1
    			self.ui_ball_label =  self.rough_run + self.extra_type_arr.join('');
    			self.batsman_run = 0;
    			self.count_this_ball = true;
    		}else{
    			self.extra_runs = 0;
    			self.extra_type = '';
    			self.no_of_ball = self.no_of_ball + 0.1
    			self.ui_ball_label =  self.rough_run;
    			self.batsman_run = self.rough_run;
    			self.count_this_ball = true;
    		}
    	 self.total_run = self.batsman_run + self.extra_runs;
    	 console.log('******************');
    	 console.log(self);
    	 console.log('******************');
    	 return self; // for chaining the object.
     };
     
     self.syncToForm = function(){
    	 
		// clearing html element
		$('.ballType, .wicket').each(function() {
			this.checked = false;
		});
		console.log('++++++++');
   	 	console.log(self);
   		console.log('++++++++');
    	 // setting value to form
    	$("#ball").val(self.no_of_ball);
 		$("#isWicket").val(self.is_wicket);
 		$("#wicketType").val(self.wicket_type);
 		$("#playerOut").val(self.player_out);
 		$('#batsmanRun').val(self.batsman_run);
 		$('#extraRuns').val(self.extra_runs);
 		$('#extraType').val(self.extra_type);
 		$('#totalRuns').val(self.total_run);
 		$('#fielder').val(self.fielder);

 		// setting other value to form
 		var $tr_striker = $('tr.striker');
 		document.getElementById('batsman').value = 	$tr_striker.data('batsman_name'	);
 		document.getElementById('batsmanUuid').value = 	$tr_striker.data('batsman_id');

 		var $tr_non_striker = $('tr.non-striker');
 		document.getElementById('nonStriker').value = 	$tr_non_striker.data('batsman_name');
 		document.getElementById('nonStrikerUuid').value = 	$tr_non_striker.data('batsman_id');

 		var $tr_bowler = $('tr.bowler');
 		document.getElementById('bowler').value = 	$tr_bowler.data('bowler_name');
 		document.getElementById('bolwerUuid').value = 	$tr_bowler.data('bowler_id');

 		// binding value with ui
 		self.bindWithUI();
     };
     
     self.syncToDB = function(){

    	 //need to add custom form value to database.
    	 // will call once over is completed and sync with db
    	 $.ajax({
             type: "POST",
             url: "${pageContext.request.contextPath}/mvc/scorer/saveScorebook",
             data: $('#scoreBookForm').serialize(), // serializes the form's elements.
             success: function(scorebookObj)
             {
             	var template = $("#batsman_template").html();
                $('#batsman-stats-panel tbody').html('');
                var batsman = scorebookObj.batsman;
            	var template_data = {};
            	template_data.batsman_name = batsman.playerName;
            	template_data.batsman_id = batsman.playerUuid;
            	template_data.runs = batsman.runs;
            	template_data.balls = batsman.balls;
            	template_data.fours = batsman.fours;
            	template_data.sixes = batsman.sixes;
            	template_data.strike_rate = batsman.strikeRate;
                var row = Mustache.render(template, template_data);
                $("#batsman-stats-panel tbody").append(row);

        		
       			var nonStriker = scorebookObj.nonStriker;
        		if(nonStriker.playerUuid != null){
            		var template_data_obj = {};
            		template_data_obj.batsman_name = nonStriker.playerName;
            		template_data_obj.batsman_id = nonStriker.playerUuid;
            		template_data_obj.runs = nonStriker.runs;
            		template_data_obj.balls = nonStriker.balls;
            		template_data_obj.fours = nonStriker.fours;
            		template_data_obj.sixes = nonStriker.sixes;
            		template_data_obj.strike_rate = nonStriker.strikeRate;
                    var row = Mustache.render(template, template_data_obj);
                    $("#batsman-stats-panel tbody").append(row);
    	         }

        		//-----OLD CODE------
    			var bowler = scorebookObj.bowler;
    			if(bowler.playerUuid != null){

    				var template_bowler = $("#bowler_template").html();
    				var template_bowler_data = {};
    				template_bowler_data.bowler_name = bowler.playerName;
    				template_bowler_data.bowler_id = bowler.playerUuid;
    				template_bowler_data.overs = bowler.overs;
    				template_bowler_data.maiden = bowler.maiden;
    				template_bowler_data.runs = bowler.runs;
    				template_bowler_data.wickets = bowler.wickets;
    				template_bowler_data.economy_rate = bowler.economyRate;

    				var row = Mustache.render(template_bowler, template_bowler_data);
    		        $("#bowler-stats-panel tbody").html(row);
    		     }

    			var match = scorebookObj.match;
    			if(match.currentInning ==  1){
    				$('.current-inning-score').text(match.firstInningsRuns + '-' + match.firstInningsWickets);
    				$('.current-inning-over').text('('+match.firstInningsOvers+')');
    			}else{
    				$('.current-inning-score').text(match.secondInningsRuns + '-' + match.secondInningsWickets);
    				$('.current-inning-over').text('('+match.secondInningsOvers+')');
    			}
    			isOverCompleted();
             }
          });
     };
     
     self.bindWithUI = function(){
         
    	 if(self.count_this_ball){
    		 var ballCount = nanToNumber($('#ballCount').val()) + 1;
    		 $('#ballCount').val(ballCount);
         }
    	 $('.current-over').append('<span>'+self.ui_ball_label+'</span>');


    	 
    	 // storing value to DB
    	 self.syncToDB();
     }

     // this function is to refresh live score
     self.refreshLiveScore = function(){
    	 $('body').data('panel_name'); // getting panel from body element
    	 refreshMatchPanel(panel_name);
     }

     return self;
};

//function to need to run onload
$(function(){
	// initializing batsman, bowler & fielder dropdown
	$('#batsman-to-batting-combo').html(create_option_for_player(team_1)); // combo for selecting batsman
	$('#batsman-out-combo').html(create_option_for_player(team_1)); // combo for selecting batsman who is out
	$('#next-batsman-combo').html(create_option_for_player(team_1)); // combo for selecting next batsman after wicker fall
	$('#fielder-combo').html(create_option_for_player(team_2)); // combo for selecting fielder
	$('#bowler-to-bowling-combo').html(create_option_for_player(team_2)); // combo for selecting next batsman after wicker fall

});

var book = new Scorebook();

//  click event handling
$('.scorePanel button').click(function(event){

	if(isMatchPlayable() == false){
		event.stopPropagation();
		return '';
	}
	
	book = new Scorebook();
	$('input.ballType:checkbox:checked').each(function () {
		book.extra_type_arr.push(this.value);
	});
	
	book.rough_run = nanToNumber($(this).data('run')); // getting run
	book.is_player_out =  $('input.wicket:checkbox:checked').length > 0;
	//book.extra_type_arr = ballType;
	book.over = nanToNumber($('#overs').val());
	book.no_of_ball = nanToNumber($('#ball').val());

	// if any player is out then
	if($('input.wicket:checkbox:checked').length > 0){
		$('#wicket-modal').modal('show');
	}else{
		book.applyBallLogic(); // calculating all the stuff
		book.syncToForm();
	}
});


$('#newBatsman').click(function(){
	
	$('#wicket-modal').modal('hide'); // hiding the opened div
	var wicket_type_combo = $('#wicket_type_combo').val();
	var next_batsman = $('#next-batsman-combo').val();

	book.wicket_type = wicket_type_combo;

	if(fielder_applicable_wicket.includes(wicket_type_combo)){
		book.fielder = $('#fielder-combo').val();
		book.is_wicket = 1;
		book.player_out = $('#batsman-out-combo option:selected').text();
	} 

	var template = $("#batsman_template").html();
	var template_data = {};
	template_data.batsman_name = $('#next-batsman-combo option:selected' ).text()
	template_data.batsman_id = $('#next-batsman-combo').val();
	template_data.runs = 0;
	template_data.balls = 0;
	template_data.fours = 0;
	template_data.sixes = 0;
	template_data.strike_rate = 0;
    var row = Mustache.render(template, template_data);
    $("#batsman-stats-panel tbody").append(row);

    // removing out batsman
    var player_out_id = $('#batsman-out-combo option:selected').val();
    $("#batsman-stats-panel tbody").find("[data-batsman_id='" + player_out_id + "']").remove(); 

    book.applyBallLogic(); // calculating all the stuff
	book.syncToForm();
});

// ---- OLDER CODE -----
// code to show batsman selection panel
	$('.batsman-selector-modal_opener').click(function(){
		// storing value body level show it can be access from anywhere
		$('body').data('batsman_type',$(this).data('batsman_type'));
		$batsman_selection_modal.modal('show');
	});

	$('#add-batsman-to-batting').click(function(){
		
		var clicked_btn_id =  $('body').data('element_id');
		$('#' + clicked_btn_id).closest('tr').remove();// removing the row where button is present.

		var template = $("#batsman_template").html();
		var template_data = {};
		template_data.batsman_name = $('#batsman-to-batting-combo option:selected' ).text()
		template_data.batsman_id = $('#batsman-to-batting-combo').val();
    	template_data.runs = 0;
    	template_data.balls = 0;
    	template_data.fours = 0;
    	template_data.sixes = 0;
    	template_data.strike_rate = 0;
		
        var row = Mustache.render(template, template_data);
        $("#batsman-stats-panel tbody").append(row);
		$batsman_selection_modal.modal('hide');
	});

	// code to show bowler selection panel
	$(document).on('click', '.bowler-selection-modal_opener', function(){
		$bowler_selection_modal.modal('show');
	});

	$('#add-bowler-to-bowling').click(function(){

		var clicked_btn_id =  $('body').data('element_id');
		$('#' + clicked_btn_id).closest('tr').remove();// removing the row where button is present.
		

		var template = $("#bowler_template").html();
		var template_data = {};
		template_data.bowler_name = $('#bowler-to-bowling-combo option:selected').text()
		template_data.bowler_id = $('#bowler-to-bowling-combo').val();
		template_data.overs = 0;
		template_data.maiden = 0;
		template_data.runs = 0;
		template_data.wickets = 0;
		template_data.economy_rate = 0;

		var row = Mustache.render(template, template_data);
        $("#bowler-stats-panel tbody").html(row);
		$bowler_selection_modal.modal('hide');

		// TODO: implement reset over functionality
		//resetOver(); 
	});

</script>


<script id="batsman_template" type="text/template">
	<tr data-batsman_id="{{batsman_id}}" data-batsman_name="{{batsman_name}}">
		<td><input type="radio" name="striker-radio" class="striker-radio-klass"></td>
		<td><span>{{batsman_name}}</span></td>
		<td>{{runs}}</td>
		<td>{{balls}}</td>
		<td>{{fours}}</td>
		<td>{{sixes}}</td>
		<td>{{strike_rate}}</td>
	</tr>
</script>
<script id="reset_bowler_template" type="text/template">
	<tr>
		<td><span class="bowler"></span><button type="button" class="btn btn-light registery_elem bowler-selection-modal_opener" id="bowler-selection-modal_opener">Add Bowler</button></td>
		<td>0</td>
		<td>0</td>
		<td>o</td>
		<td>0</td>
		<td>0</td>
	</tr>
</script>

<script id="bowler_template" type="text/template">
	<tr class="bowler" data-bowler_id="{{bowler_id}}" data-bowler_name="{{bowler_name}}">
		<td>{{bowler_name}}</td>
		<td>{{overs}}</td>
		<td>{{maiden}}</td>
		<td>{{runs}}</td>
		<td>{{wickets}}</td>
		<td>{{economy_rate}}</td>
	</tr>
</script>

