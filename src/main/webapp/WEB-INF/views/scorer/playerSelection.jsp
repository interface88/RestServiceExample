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
					    	<option value="Ricky Ponting">Ricky Ponting</option>
					    	<option value="Michael Bevan">Michael Bevan</option>
					    	<option  value="Nathan Bracken">Nathan Bracken</option>
					    	<option value="Glenn McGrath">Glenn McGrath</option>
					    </select>
					  </div>
					  <div class="form-group">
					    <label for="exampleInputEmail1">Non Striker</label>
					    <select class="form-control"  id="select_non_striker_batsman">
					    	<option value="Ricky Ponting">Ricky Ponting</option>
					    	<option value="Michael Bevan">Michael Bevan</option>
					    	<option  value="Nathan Bracken">Nathan Bracken</option>
					    	<option value="Glenn McGrath">Glenn McGrath</option>
					    </select>
					  </div>
					  <div class="form-group">
					    <label for="exampleInputEmail1">Opening Bowler</label>
					    <select class="form-control"  id="select_opening_bowler">
					    	<option value="James Anderson">James Anderson</option>
					    	<option value="Ian Blackwell">Ian Blackwell</option>
					    	<option  value="Paul Collingwood">Paul Collingwood</option>
					    	<option value="Ashley Giles">Ashley Giles</option>
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
