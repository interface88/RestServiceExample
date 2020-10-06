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
    <style>
    	.current-inning-score{
    		font-size:30px;
    	}
    	.current-inning-over{
    		font-size:20px;
    	}
    	
    	.current-over span{
    		height: 30px;
			width: 30px;
			border-radius: 15px;
			border: 1px solid #333;
			display: inline-block;
			text-align: center;
			line-height: 30px;
    	}
    	
    </style>
 	<div class="col-12 grid-margin">
       <div class="card">
         <div class="card-body">
           <h1 class="card-title">Australia vs India</h1>
           <div class="row">
           		<div class="col-lg-9">
	           		<h4>Australia 1st Inning</h4>
	           		<span class="current-inning-score">5-0</span><span class="current-inning-over">(0.5)</span>
           		</div>
           </div>
           
           <div class="row">
           		<div class="col-lg-9">
	           		<table class="table">
	           			<thead>
		           			<tr>
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
	           					<td><span class="striker">Steve waugh</span></td>
	           					<td>0</td>
	           					<td>5</td>
	           					<td>4</td>
	           					<td>6</td>
	           					<td>0.00</td>
	           				</tr>
	           				<tr>
	           					<td><span class="non-striker">Mark waugh</span></td>
	           					<td>0</td>
	           					<td>5</td>
	           					<td>4</td>
	           					<td>6</td>
	           					<td>0.00</td>
	           				</tr>
	           			</tbody>
	           		</table>
           		</div>
           </div>
           <div class="row">
           		<div class="col-lg-9">
	           		<table class="table">
	           			<thead>
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
	           					<td>Donald</td>
	           					<td>0.2</td>
	           					<td>0</td>
	           					<td>5</td>
	           					<td>0</td>
	           					<td>6.00</td>
	           				</tr>
	           			</tbody>
	           		</table>
           		</div>
           </div>
            <div class="row">
           		<div class="col-lg-9">
           			<div class="current-over">
	           			This over : <span>0</span> <span>4</span> <span>4</span> <span>4</span>
           			</div>
           		</div>
           </div>
           <div class="row">
           		<div class="col-lg-9">
           			<label><input type="checkbox" class="ballType group1" name="wide" value="W" data-run="1" > Wide</label>
           			<label><input type="checkbox" class="ballType group1" name="no_ball" value="NB" data-run="1"> No Ball</label>
           			<label><input type="checkbox" class="ballType group2" name="bye" value="B" data-run="1"> Byes</label>
           			<label><input type="checkbox" class="ballType group2" name="legbye" value="LB" data-run="1"> Leg Byes</label>
           			<label><input type="checkbox" class="wicket" name="wicket" value="WKT" data-run="1"> Wicket</label>
           		</div>
           </div>
           <div class="row">
           		<div class="col-lg-9">
           			<div class="runPanel">
                       	<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                        	<div class="btn-groupq scorePanel"  role="group" aria-label="">
							  <button type="button" class="btn btn-primary" data-run="0">0</button>
							  <button type="button" class="btn btn-primary" data-run="1">1</button>
							  <button type="button" class="btn btn-primary" data-run="2">2</button>
							  <button type="button" class="btn btn-primary" data-run="3">3</button>
							  <button type="button" class="btn btn-primary" data-run="4">4</button>
							  <button type="button" class="btn btn-primary" data-run="5">5</button>
							  <button type="button" class="btn btn-primary" data-run="6">6</button>
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
MATH ID <input type="text" name="matchId" id="matchId" value="1"><BR/>
INNIN<input type="text" name="innings" id="innings"  value="1"><BR/>
BATTING TEAM<input type="text" name="battingTeam" id="battingTeam" value="Australia"><BR/>
BOWLING<input type="text" name="bowlingTeam" id="bowlingTeam" value="India"><BR/>
BATSMAN<input type="text" name="batsman" id="batsman" value="Steve waugh"><BR/>
NON STRIKE<input type="text" name="nonStriker" id="nonStriker"  value="Mark waugh"><BR/>
BOWLER<input type="text" name="bowler" id="bowler" value="Zaheer Khan"><BR/>
OVER<input type="text" name="over" id="over" value="1"><BR/>
BALL<input type="text" name="ball" id="ball" value="0"><BR/>
BATSMAN<input type="text" name="batsmanRun" id="batsmanRun"><BR/>
EXTRA TYPE<input type="text" name="extraType" id="extraType"><BR/>
EXTRA RUN<input type="text" name="extraRuns" id="extraRuns"><BR/>
TOTAL RUN<input type="text" name="totalRuns" id="totalRuns"><BR/>
IS WIKET<input type="text" name="isWicket" id="isWicket"><BR/>
WIKET TYPE<input type="text" name="wicketType" id="wicketType"><BR/>
FIELDER<input type="text" name="fielder" id="fielder"><BR/>
PLAYEROUT<input type="text" name="playerOut" id="playerOut">

</form:form>


<script>
var batting_team = ['Rick Ponting', 'Hayden', 'Gilchrist' , 'steve waugh' , 'bevan'];
var bowling_team = ['Flintoff', 'Anderson', 'Naseer hussain' , 'Ashle giles' , 'Darren gough'];
var nanToNumber = function (value) {
    var value = Number(value);
    return isNaN(value) ? 0 : value;
};

$(function(){
	// onload initilizer
	
	// select batsman
	
	var fielder_applicable_wicket = ['Run Out' , 'Catch' , 'Stumping'];
	var batsman_choosing_applicable_wicket = ['Run Out'];
	
	
	$('.scorePanel button').click(function(){
		var run = nanToNumber($(this).data('run'));
	
		var extra_runs = 0;
		var total_runs = 0;
		var extra_type = '';
		var is_wicket = 0;
	
		var over = 0;
		var ball = nanToNumber($('#ball').val());
	
		var batsmanRun = 0;
	
		if($('input.wicket:checkbox:checked').length > 0){
			$('#exampleModal').modal('show');
		}else{
			if($('input.ballType:checkbox:checked').length > 0){
				//TODO: need to open modal for wicket
				$('input.ballType:checkbox:checked').each(function () {
					var $this = $(this);
			
					var val = $this.val();
					if(val == 'W'){
						extra_runs = 1 + run;
						extra_type = val;
					}else if(val == 'NB'){
						extra_runs = 1 + run;
						extra_type = val;
						batsmanRun = run;
						
					}else if(val == 'B' || val == 'LB'){
						extra_runs = run;
						extra_type = val;
						ball = ball + 0.1
					}
				});
			}else{
				ball = nanToNumber(ball) + 0.1;
				batsmanRun = run;
			}
			
		
			//$('#batsman').val(batsman);
			//$('#nonStriker').val(nonStriker);
		
			$('#over').val(over);
			$("#ball").val(ball);
			
			$('#batsmanRun').val(batsmanRun);
			$('#extraRuns').val(extra_runs);
			$('#extraType').val(extra_type);
			$('#totalRuns').val(extra_runs + batsmanRun);
			$("#isWicket").val(0);
		}
		resetScorePanel();
		
	 });
	
	$('#newBatsman').click(function(){
		
		$('#exampleModal').modal('hide');
		
		var wicket_type_combo = $('#wicket_type_combo').val();
		
		var next_batsman = $('#next_batsman_combo').val();
		
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
				}else if(val == 'NB'){
					extra_runs = 1 + run;
					extra_type = val;
					batsmanRun = run;
					
				}else if(val == 'B' || val == 'LB'){
					extra_runs = run;
					extra_type = val;
					ball = ball + 0.1
				}
			});
		}else{
			ball = nanToNumber(ball) + 0.1;
			batsmanRun = run;
		}
			
		
		//$('#batsman').val(batsman);
		//$('#nonStriker').val(nonStriker);
		
		if(fielder_applicable_wicket.indexOf(wicket_type_combo) > -1){
			var fielder_combo = $('#fielder_combo').val();
			$("#fielder").val(fielder_combo);
		}else{
			$("#fielder").val('');
		}
	
	
		$('#over').val(over);
		$("#ball").val(ball);
		$("#isWicket").val(1);
		$("#wicketType").val(wicket_type_combo);
		$("#playerOut").val($('#batsman_out_combo').val());
		
		
		
		$('#batsmanRun').val(batsmanRun);
		$('#extraRuns').val(extra_runs);
		$('#extraType').val(extra_type);
		$('#totalRuns').val(extra_runs + batsmanRun);
		resetScorePanel();
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
		$('#batsman_out_combo').html(option);
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
	
});
function submitScore(){
	$.ajax({
          type: "POST",
          url: "${pageContext.request.contextPath}/mvc/scorer/saveScorebook",
          data: $('#scoreBookForm').serialize(), // serializes the form's elements.
          success: function(data)
          {
              alert(data); // show response from the php script.
          }
        });
}
</script>

<div class="modal fade" id="exampleModal" tabindex="-1" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Fall of Wicket</h5>
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
			    	<option value="Catch">Catch</option>
			    	<option value="Run Out">Run Out</option>
			    	<option value="Stumping">Stumping</option>
			    	<option value="LBW">LBW</option>
			    	<option value="Hit Wicket">Hit Wicket</option>
			    </select>
			  </div>
			  <div class="form-group" id="choose-out-batsman-panel" style="display:none;">
			    <label for="exampleInputPassword1">Who got out?</label>
			    <select class="form-control" id="batsman_out_combo">
			    	<option value="Steve Waugh">Steve Waugh</option>
			    	<option value="Mark waugh">Mark Waugh</option>
			    </select>
			  </div>
			  <div class="form-group" id="fielder-panel"  style="display:none;">
			    <label for="exampleInputPassword1">Who helped?</label>
			    <select class="form-control" id="fielder_combo">
			    	<option value="James Anderson">James Anderson</option>
			    	<option value="Ian Blackwell">Ian Blackwell</option>
			    	<option  value="Paul Collingwood">Paul Collingwood</option>
			    	<option value="Ashley Giles">Ashley Giles</option>
			    </select>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Next batsman</label>
			    <select class="form-control" id="next_batsman_combo">
			    	<option value="Ricky Ponting">Ricky Ponting</option>
			    	<option value="Michael Bevan">Michael Bevan</option>
			    	<option  value="Nathan Bracken">Nathan Bracken</option>
			    	<option value="Glenn McGrath">Glenn McGrath</option>
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
<div class="modal fade" id="matchInitatorModal" tabindex="-1" data-backdrop="static" data-keyboard="false" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Fall of Wicket</h5>
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
			    	<option value="Catch">Catch</option>
			    	<option value="Run Out">Run Out</option>
			    	<option value="Stumping">Stumping</option>
			    	<option value="LBW">LBW</option>
			    	<option value="Hit Wicket">Hit Wicket</option>
			    </select>
			  </div>
			  <div class="form-group" id="choose-out-batsman-panel" style="display:none;">
			    <label for="exampleInputPassword1">Who got out?</label>
			    <select class="form-control" id="batsman_out_combo">
			    	<option value="Steve Waugh">Steve Waugh</option>
			    	<option value="Mark waugh">Mark Waugh</option>
			    </select>
			  </div>
			  <div class="form-group" id="fielder-panel"  style="display:none;">
			    <label for="exampleInputPassword1">Who helped?</label>
			    <select class="form-control" id="fielder_combo">
			    	<option value="James Anderson">James Anderson</option>
			    	<option value="Ian Blackwell">Ian Blackwell</option>
			    	<option  value="Paul Collingwood">Paul Collingwood</option>
			    	<option value="Ashley Giles">Ashley Giles</option>
			    </select>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Next batsman</label>
			    <select class="form-control" id="next_batsman_combo">
			    	<option value="Ricky Ponting">Ricky Ponting</option>
			    	<option value="Michael Bevan">Michael Bevan</option>
			    	<option  value="Nathan Bracken">Nathan Bracken</option>
			    	<option value="Glenn McGrath">Glenn McGrath</option>
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
