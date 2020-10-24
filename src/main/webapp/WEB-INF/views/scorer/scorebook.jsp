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
    	
    	span.striker:after{
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
	           		<button type="button" onclick="openNav()" class="btn btn-danger btn-rounded btn-fw"><i class="mdi mdi-video"></i> Youtube</button>
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
	           						<button type="button" class="btn btn-light batsman-selector-modal_opener" data-batsman_type="striker">Add batsman</button>
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
		           					<button type="button" class="btn btn-light batsman-selector-modal_opener" data-batsman_type="non-striker">Add batsman</button>
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
	           					<td><span class="bowler"></span><button type="button" class="btn btn-light bowler-selection-modal_opener">Add Bowler</button></td>
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
   </div><button type="button" onclick="submitScore();">Test score submit</button>
   
</div>

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

</form:form>


<script>


// version 2.0 code for scorebook
/*
 * Code to be re-wrote with simple logic and maintainable code. coz current javascript code is difficult to understand and maintain.
 @rajesh 
 */

// UI -> MODEL
 

// MODEL



// MODEL -> UI level code

$(document).on("click", ".striker-radio-klass", function(){
//$('.striker-radio-klass').on('click', function(){
	$('.striker-radio-klass').each(function(){
		debugger;
		if(this.checked){
			var $span = $(this).parent().next().find('span');
			$span.removeClass();
			$span.addClass('striker');
		}else{
			var $span = $(this).parent().next().find('span');
			$span.removeClass();
			$span.addClass('non-striker');
		}
	});
})


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

var addBowltoOverPanel = function(bowlType, isValidDelivery){
	if(isValidDelivery){
		var ballSpan = '<span class="valid">'+bowlType+'</span>';
		$('.current-over').append(ballSpan);
	}else{
		var ballSpan = '<span>'+bowlType+'</span>';
		$('.current-over').append(ballSpan);
	
	}
}

var resetOver = function(){
	$('.current-over').html('');
};

var resetBowler = function(){
	$('.bowler').html('<button type="button" class="btn btn-light bowler-selection-modal_opener">Add Bowler</button>');
	$('#bowler').val('');
};

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
	// initializing batsman, bowler & fielder dropdown
	$('#batsman-to-batting-combo').html(create_option_for_player(team_1)); // combo for selecting batsman
	$('#batsman-out-combo').html(create_option_for_player(team_1)); // combo for selecting batsman who is out
	$('#next-batsman-combo').html(create_option_for_player(team_1)); // combo for selecting next batsman after wicker fall
	$('#fielder-combo').html(create_option_for_player(team_2)); // combo for selecting fielder
	$('#bowler-to-bowling-combo').html(create_option_for_player(team_2)); // combo for selecting next batsman after wicker fall
	

	// ----- MODAL JQUERY OBJECT --
	var $batsman_selection_modal = $("#batsman-selection-modal");
	var $bowler_selection_modal = $("#bowler-selection-modal");
	var $wicket_modal = $("#wicket-modal");

	// ----- HELPER FUNCTION ---
	var isOverCompleted = function(){
		var noOfDeliveries = $('.current-over span.valid').length;
		if(noOfDeliveries == 6){
			$bowler_selection_modal.modal('show');
			return true;
		}
		return false;
	}
	
	// onload initilizer
	
	// select batsman
	
	var fielder_applicable_wicket = ['Run Out' , 'Catch' , 'Stumping'];
	var batsman_choosing_applicable_wicket = ['Run Out'];
	
	
	$('.scorePanel button').click(function(event){

		//TOOD: Add validation if bowler and batsman are all selected or not
		// if over is completed than force user to select new bowler
		if(checkMatchPlayableCondition() == false){
			event.stopPropagation();
			return '';
		}
		
		// setting batsman , non striker , bowler 
		var striker_span = $('span.striker')
		var non_striker_span = $('span.non-striker');
		var bowler_span = $('span.bowler');

		$('#batsman').val(striker_span.text());
		$('#batsmanUuid').val(striker_span.data('uuid'));

		$('#nonStrikerUuid').val(non_striker_span.data('uuid'));
		$('#nonStriker').val(non_striker_span.text());
		
		$('#bowler').val(bowler_span.text());
		$('#bolwerUuid').val(bowler_span.data('uuid'));

		
		var run = nanToNumber($(this).data('run'));
	
		var extra_runs = 0;
		var total_runs = 0;
		var extra_type = '';
		var is_wicket = 0;
	
		var over = 0;
		var ball = nanToNumber($('#ball').val());
	
		var batsmanRun = 0;
	
		if($('input.wicket:checkbox:checked').length > 0){
			$('#wicket-modal').modal('show');
		}else{
			if($('input.ballType:checkbox:checked').length > 0){
				//TODO: need to open modal for wicket
				$('input.ballType:checkbox:checked').each(function () {
					var $this = $(this);
			
					var val = $this.val();
					alert(val);
					if(val == 'W'){
						extra_runs = 1 + run;
						extra_type = val;
						addBowltoOverPanel(run + 'Wd', false);
					}else if(val == 'NB'){
						extra_runs = 1 + run;
						extra_type = val;
						batsmanRun = run;
						addBowltoOverPanel(run + 'NB', false);
						
					}else if(val == 'B' || val == 'LB'){
						extra_runs = run;
						extra_type = val;
						ball = ball + 0.1
						addBowltoOverPanel(run + val, true);
					}
				});
			}else{
				ball = nanToNumber(ball) + 0.1;
				batsmanRun = run;
				addBowltoOverPanel(run, true);
			}
			
		
			//$('#batsman').val(batsman);
			//$('#nonStriker').val(nonStriker);
		
			$('#overs').val(over);
			$("#ball").val(ball);
			
			$('#batsmanRun').val(batsmanRun);
			$('#extraRuns').val(extra_runs);
			$('#extraType').val(extra_type);
			$('#totalRuns').val(extra_runs + batsmanRun);
			$("#isWicket").val(0);
		}
		submitScore();
		resetScorePanel();

		//TODO : check whether over completed or not 
		isOverCompleted();		
	 });
	
	$('#newBatsman').click(function(){
		
		$('#wicket-modal').modal('hide');
		
		var wicket_type_combo = $('#wicket_type_combo').val();
		
		var next_batsman = $('#next-batsman-combo').val();
		
		var run = nanToNumber($(this).data('run'));
		
		var extra_runs = 0;
		var total_runs = 0;
		var extra_type = '';
		var is_wicket = 0;
	
		var over = 0;
		var ball = $('#ball').val();
	
		var batsmanRun = 0;
	
		if($('input.ballType:checkbox:checked').length > 0){
			//TODO: need to open modal for wicket
			$('input.ballType:checkbox:checked').each(function () {
				var $this = $(this);
		
				var val = $this.val();
				if(val == 'W'){
					extra_runs = 1 + run;
					extra_type = val;
					addBowltoOverPanel(run + 'Wd', false);
				}else if(val == 'NB'){
					extra_runs = 1 + run;
					extra_type = val;
					batsmanRun = run;
					addBowltoOverPanel(run + 'NB', false); // even wicket fall no ball is not counted
					
				}else if(val == 'B' || val == 'LB'){
					extra_runs = run;
					extra_type = val;
					ball = ball + 0.1;
					addBowltoOverPanel(run + val, true);
				}
			});
		}else{
			ball = nanToNumber(ball) + 0.1;
			batsmanRun = run;
			addBowltoOverPanel(run + 'W', true);
		}
			
		
		//$('#batsman').val(batsman);
		//$('#nonStriker').val(nonStriker);
		
		if(fielder_applicable_wicket.indexOf(wicket_type_combo) > -1){
			var fielder_combo = $('#fielder-combo').val();
			$("#fielder").val(fielder_combo);
		}else{
			$("#fielder").val('');
		}
	
		$("#ball").val(ball);
		$('#overs').val(over);
		$("#isWicket").val(1);
		$("#wicketType").val(wicket_type_combo);
		$("#playerOut").val($('#batsman-out-combo option:selected').text());
		 		
		
		$('#batsmanRun').val(batsmanRun);
		$('#extraRuns').val(extra_runs);
		$('#extraType').val(extra_type);
		$('#totalRuns').val(extra_runs + batsmanRun);
		submitScore();
		resetScorePanel();

		// CODE TO ADD NEXT BATSMAN
		//@rajesh
		$('#batsman-stats-panel tbody tr').each(function(){
			if($(this).find('span').text() == $("#playerOut").val()){
				$(this).find('span').text($('#next-batsman-combo option:selected').text()); 
				$(this).find('span').data('uuid', $('#next-batsman-combo').val());
			}
		});

		
		//TODO : check whether over completed or not 
		isOverCompleted();
		
	});
	
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
	
	$('.ballType ').on('change', function(){
		var $this = $(this);
		
		// toggling of WIDE & NO-BALL
		if($this.hasClass('group1')){
			$('.group1').each(function() {
				this.checked = false;
			});
			
			//if ball is wide then uncheck 	LEG-BYE & BYE
			if(this.value == 'W'){
				$('.group2').each(function() {
					this.checked = false;
				});
			}
		}
		
		// toggling of LEG-BYE & BYE
		if($this.hasClass('group2')){
			$('.group2').each(function() {
				this.checked = false;
			});
			// also add WIDE BALL FOR THIS
			$('.group1').each(function() {
				if(this.value == 'W'){
					this.checked = false;
				}
			});
		}
		
		$this[0].checked = true;
	});

	// ------- BUTTON CLICK EVENT -----

	// code to show batsman selection panel
	$('.batsman-selector-modal_opener').click(function(){
		// storing value body level show it can be access from anywhere
		$('body').data('batsman_type',$(this).data('batsman_type'));
		$batsman_selection_modal.modal('show');
	});

	$('#add-batsman-to-batting').click(function(){

		var klass = $('body').data('batsman_type');
		var $span = $('span.'+ klass);
		var batsman_uuid = $('#batsman-to-batting-combo').val();
		var batsman_name = $('#batsman-to-batting-combo option:selected' ).text();

		//TODO : add ID for batsman
		
		/*
		Below code is not required because it will set when ball is bolwed not intially
		if(klass == 'striker'){
			$('#batsman').val(batsman_name);
			$('#batsmanUuid').val(batsman_uuid);
		}else{
			$('#nonStriker').val(batsman_name);
			$('#nonStrikerUuid').val(batsman_uuid);
		}
		*/
		//batsman
		$span.text(batsman_name);
		$span.data('uuid', batsman_uuid);

		// removing the button
		$span.next().remove();

		//$span.next().
		//alert($('body').data('batsman_type'));
		$batsman_selection_modal.modal('hide');
	});

	// code to show bowler selection panel
	$('.bowler-selection-modal_opener').click(function(){
		$bowler_selection_modal.modal('show');
	});

	$('#add-bowler-to-bowling').click(function(){

		var $span = $('span.bowler');
		var bowling_uuid = $('#bowler-to-bowling-combo').val();
		var bowler_name = $('#bowler-to-bowling-combo option:selected').text();
		$span.text(bowler_name);
		$span.data('uuid',bowling_uuid);

		// TODO : add bowler id
		$('#bolwerUuid').val(bowling_uuid);
		$('#bowler').val(bowler_name);

		// remcving the button
		$span.next().remove();

		$bowler_selection_modal.modal('hide');

		// TODO : reseting the over
		resetOver(); 
	});
	
	
});
function submitScore(){
	$.ajax({
         type: "POST",
         url: "${pageContext.request.contextPath}/mvc/scorer/saveScorebook",
         data: $('#scoreBookForm').serialize(), // serializes the form's elements.
         success: function(scorebookObj)
         {
             console.log(scorebookObj);
             $('#batsman-stats-panel tbody').html('');
             var batsman = scorebookObj.batsman;
	         var tr = '<tr><td><input type="radio" name="striker-radio" class="striker-radio-klass"></td>' +  
		         '<td><span class="striker" data-uuid="'+batsman.playerUuid+'">'+batsman.playerName+'</span></td>'+
				'<td>'+batsman.runs+'</td>'+
				'<td>'+batsman.balls+'</td>'+
				'<td>'+batsman.fours+'</td>'+
				'<td>'+batsman.sixes+'</td>'+
				'<td>'+batsman.strikeRate+'</td></tr>';
         	$('#batsman-stats-panel tbody').append(tr);
    		var nonStriker = scorebookObj.nonStriker;
    		if(nonStriker.playerUuid != null){
    			var tr = '<tr><td><input type="radio" name="striker-radio" class="striker-radio-klass"></td>' +  
        		'<td><span class="non-striker" data-uuid="'+nonStriker.playerUuid+'">'+nonStriker.playerName+'</span></td>'+
				'<td>'+nonStriker.runs+'</td>'+
				'<td>'+nonStriker.balls+'</td>'+
				'<td>'+nonStriker.fours+'</td>'+
				'<td>'+nonStriker.sixes+'</td>'+
				'<td>'+nonStriker.strikeRate+'</td></tr>';
    			$('#batsman-stats-panel tbody').append(tr);
	         }

			var bowler = scorebookObj.bowler;
			if(bowler.playerUuid != null){
				var tr = '<tr><td><span class="bowler" data-uuid="'+bowler.playerUuid+'">'+bowler.playerName+'</span></td>'+
				'<td>'+bowler.overs+'</td>'+
				'<td>'+bowler.maiden+'</td>'+
				'<td>'+bowler.runs+'</td>'+
				'<td>'+bowler.wickets+'</td>'+
				'<td>'+bowler.economyRate+'</td></tr>';
				$('#bowler-stats-panel tbody').html(tr);
		     }

			var match = scorebookObj.match;
			if(match.currentInning ==  1){
				$('.current-inning-score').text(match.firstInningsRuns + '-' + match.firstInningsWickets);
				$('.current-inning-over').text('('+match.firstInningsOvers+')');
			}else{
				$('.current-inning-score').text(match.secondInningsRuns + '-' + match.secondInningsWickets);
				$('.current-inning-over').text('('+match.secondInningsOvers+')');
			}
         }
      });
}
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



