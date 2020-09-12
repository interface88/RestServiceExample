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
 	<div class="col-12 grid-margin">
       <div class="card">
         <div class="card-body">
           <h4 class="card-title">Player information</h4>
          	<div class="row">
                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-lg-3">
                            <h5>TEAM 1</h5>
                        </div>
                        <div class="col-lg-9">
                            Score 12/1
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3">
                            <h5>TEAM 2</h5>
                        </div>
                        <div class="col-lg-9">
                            Score 12/1
                        </div>
                    </div>
                     <hr/>
                    <div class="row">
                        <div class="col-lg-12">
                            <h5>First Innings</h5>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-lg-6">Batsman</div>
                        <div class="col-lg-6">Run</div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <input type="radio" name="strike"> <button type="button" class="btn btn-info btn-sm"> + Add new batsman</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <input type="radio" name="strike"> <button type="button" class="btn btn-info btn-sm "> + Add new batsman</button>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-lg-6">Bowler</div>
                        <div class="col-lg-6">Over Info</div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            Add new Bowler
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                        	<button type="button" class="btn btn-primary">0</button>
                        	<button type="button" class="btn btn-primary">2</button>
                        	<button type="button" class="btn btn-primary">3</button>
                        	<button type="button" class="btn btn-primary">4</button>
                        	<button type="button" class="btn btn-primary">5</button>
                        	<button type="button" class="btn btn-primary">6</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                        	<div class="btn-group">
							  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
							    No Ball
							    <span class="caret"></span>
							  </button>
							  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							    <li><a class="dropdown-item" href="#">+1</a></li>
							    <li><a class="dropdown-item" href="#">+2</a></li>
							    <li><a class="dropdown-item" href="#">+3</a></li>
							    <li><a class="dropdown-item" href="#">+4</a></li>
							    <li><a class="dropdown-item" href="#">+5</a></li>
							    <li><a class="dropdown-item" href="#">+6</a></li>					
							  </ul>
							</div>
							<div class="btn-group">
							  <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
							    Wide
							    <span class="caret"></span>
							  </button>
							  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							    <li><a class="dropdown-item" href="#">+1</a></li>
							    <li><a class="dropdown-item" href="#">+2</a></li>
							    <li><a class="dropdown-item" href="#">+3</a></li>
							    <li><a class="dropdown-item" href="#">+4</a></li>				
							  </ul>
							</div>
                        </div>
                    </div>
                    <div class="row">	
                        <div class="col-lg-12">
                        	<button type="button" class="btn btn-danger btn-fw">RunOut</button>
                        	<button type="button" class="btn btn-danger btn-fw">Bowled</button>
                        	<button type="button" class="btn btn-danger btn-fw">Catch</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    All score will come
                </div>
            </div>
         </div>
       </div>
   </div>
</div>
		
	