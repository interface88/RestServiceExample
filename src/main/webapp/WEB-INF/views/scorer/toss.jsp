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
	           		<form>
					  <div class="form-group">
					    <label for="exampleInputEmail1">Toss Won By</label>
					    <select class="form-control">
					    	<option value="Australia">Australia</option>
					    	<option value="England">England</option>
					    </select>
					  </div>
					  <div class="form-group">
					    <label for="exampleInputEmail1">Opted to</label>
					    <select class="form-control">
					    	<option value="Australia">Bat</option>
					    	<option value="England">Bowl</option>
					    </select>
					  </div>
					  <div class="form-group">
					    <label for="exampleInputEmail1">Overs</label>
					    <input class="form-control" type="number" name="over">
					  </div>
		           	</form>
		           	<button type="button">Start Match</button>
           		</div>
           </div>
           </div>
         </div>
    </div>
</div>




