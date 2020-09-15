<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="page-header">
   <h3 class="page-title">Team</h3>
   <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
       <li class="breadcrumb-item active" aria-current="page">Team List</li>
       <li class="breadcrumb-item active"> <a href="<spring:url value="/mvc/team/viewTeam" htmlEscape="true"/>">Add new Team</a></li>
     </ol>
   </nav>
 </div>

       <div class="card">
         <div class="card-body">
           <h4 class="card-title">Team List</h4>
           <div class="row">
 	<div class="col-12 grid-margin">
           <div class="table-responsive">
           <table class="table table-striped table-bordered table-hover" id="teamList">
           		<thead>
           			<tr>
           				<th>Name</th>
           				<th>Place</th>
           				<th>Actions</th>
           			</tr>
           		</thead>
           		<tbody>
           			<c:forEach var="team" items="${teamList}">
						<tr>
	           				<td>${team.name}</td>
	           				<td>${team.place}</td>
	           				<td><a class="btn btn-outline-primary" href="<spring:url value="/mvc/team/viewTeam?uuid=${team.uuid}" htmlEscape="true"/>">View</a></td>
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
		$('#teamList').DataTable({
		      "aLengthMenu": [
		        [5, 10, 15, -1],
		        [5, 10, 15, "All"]
		      ],
		      "iDisplayLength": 10,
		      "language": { 
		        search: ""
		      }
		    });
		    $('#teamList').each(function() {
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