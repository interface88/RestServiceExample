<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="page-header">
   <h3 class="page-title">Player</h3>
   <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
       <li class="breadcrumb-item active" aria-current="page">Player List</li>
       <li class="breadcrumb-item active"> <a href="<spring:url value="/mvc/player/viewPlayer" htmlEscape="true"/>">Add new player</a></li>
     </ol>
   </nav>
 </div>

       <div class="card">
         <div class="card-body">
           <h4 class="card-title">Player List</h4>
           <div class="row">
 	<div class="col-12 grid-margin">
           <div class="table-responsive">
           <table class="table table-striped table-bordered table-hover" id="playerList">
           		<thead>
           			<tr>
           				<th>Name</th>
           				<th>Aadhar</th>
           				<th>Mobile</th>
           				<th>Actions</th>
           			</tr>
           		</thead>
           		<tbody>
           			<c:forEach var="player" items="${playerList}">
						<tr>
	           				<td>${player.playerName}</td>
	           				<td>${player.adhaarNumber}</td>
	           				<td>${player.mobile}</td>
	           				<td><a class="btn btn-outline-primary" href="<spring:url value="/mvc/player/viewPlayer?uuid=${player.uuid}" htmlEscape="true"/>">View</a></td>
           				</tr>
			        </c:forEach>
           			
           		</tbody>
           </table>
           </div>
         </div>
       </div>
   </div>
</div>
		
<script>
	$(function(){
		//$('#playerList').DataTable();
		$('#playerList').DataTable({
		      "aLengthMenu": [
		        [5, 10, 15, -1],
		        [5, 10, 15, "All"]
		      ],
		      "iDisplayLength": 10,
		      "language": { 
		        search: ""
		      }
		    });
		    $('#playerList').each(function() {
		      var datatable = $(this);
		      // SEARCH - Add the placeholder for Search and Turn this into in-line form control
		      var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
		      search_input.attr('placeholder', 'Search');
		      search_input.removeClass('form-control-sm');
		      // LENGTH - Inline-Form control
		      var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
		      length_sel.removeClass('form-control-sm');
		    });
	});
</script>	