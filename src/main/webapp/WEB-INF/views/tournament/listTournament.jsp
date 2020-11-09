<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="page-header">
   <h3 class="page-title">Tournament</h3>
   <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
       <li class="breadcrumb-item active" aria-current="page">Tournament List</li>
       <li class="breadcrumb-item active"> <a href="<spring:url value="/mvc/tournament/viewTournament" htmlEscape="true"/>">Add new tournament</a></li>
     </ol>
   </nav>
 </div>

       <div class="card">
         <div class="card-body">
           <h4 class="card-title">Tournament List</h4>
           <div class="row">
 	<div class="col-12 grid-margin">
           <div class="table-responsive">
           <table class="table table-striped table-bordered table-hover" id="tournamentList">
           		<thead>
           			<tr>
           				<th>Tournament Name</th>
           				<th>Oragniser</th>
           				<th>place</th>
           				<th>Actions</th>
           			</tr>
           		</thead>
           		<tbody>
           			<c:forEach var="tournament" items="${tournamentList}">
						<tr>
	           				<td>${tournament.tournamentName}</td>
	           				<td>${tournament.organiser}</td>
	           				<td>${tournament.place}</td>
	           				<td>
	           				<a class="btn btn-outline-primary" href="<spring:url value="/mvc/tournament/viewTournament?uuid=${tournament.uuid}" htmlEscape="true"/>">View</a>
	           				<a class="btn btn-outline-primary" href="<spring:url value="/mvc/tournament/viewSchedule?uuid=${tournament.uuid}" htmlEscape="true"/>">Add Match</a>
	           				</td>
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
		$('#tournamentList').DataTable({
		      "aLengthMenu": [
		        [5, 10, 15, -1],
		        [5, 10, 15, "All"]
		      ],
		      "iDisplayLength": 10,
		      "language": { 
		        search: ""
		      }
		    });
		    $('#tournamentList').each(function() {
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