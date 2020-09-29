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
                    <div id="batting_panel">
	                    <div class="row">
	                        <div class="col-lg-6">
	                        	<label><input type="radio" name="striker" value="Mark Waugh"><span>Mark waugh</span></label>
	                        </div>
	                        <div class="col-lg-6">
	                        	<span>0 Runs in 0 ball</span>
	                        </div>
	                    </div>
	                    <div class="row">
	                        <div class="col-lg-6">
	                        	<label><input type="radio" name="striker" value="Steve Waugh"><span>Steve waugh</span></label>
	                        </div>
	                        <div class="col-lg-6">
	                        	<span>0 Runs in 0 ball</span>
	                        </div>
	                    </div>
                    
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-lg-6">Bowler</div>
                        <div class="col-lg-6">Over Info</div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            
                           <button type="button" class="btn btn-primary">+ Add new Bowler</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                        	<div class="runPanel">
	                        	<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
		                        	<div class="btn-group noramBalllScore"  role="group" aria-label="">
									  <button type="button" class="btn btn-primary">0</button>
									  <button type="button" class="btn btn-primary">1</button>
									  <button type="button" class="btn btn-primary">2</button>
									  <button type="button" class="btn btn-primary">3</button>
									  <button type="button" class="btn btn-primary">4</button>
									  <button type="button" class="btn btn-primary">5</button>
									  <button type="button" class="btn btn-primary">6</button>
									</div>
									<div class="btn-group noBallScore" role="group" aria-label="Basic example">
									  <button type="button" class="btn btn-primary">NB</button>
									  <button type="button" class="btn btn-primary">NB + 1</button>
									  <button type="button" class="btn btn-primary">NB + 2</button>
									  <button type="button" class="btn btn-primary">NB + 3</button>
									  <button type="button" class="btn btn-primary">NB + 4</button>
									  <button type="button" class="btn btn-primary">NB + 5</button>
									  <button type="button" class="btn btn-primary">NB + 6</button>
									</div>
	  
							</div>
                        	</div>
                    		<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                    			<div class="runPanel">
									<div class="btn-group wideBallScore" role="group" aria-label="Basic example">
									  <button type="button" value="0" class="btn btn-primary">W</button>
									  <button type="button" class="btn btn-primary">W + 1</button>
									  <button type="button" class="btn btn-primary">W + 2</button>
									  <button type="button" class="btn btn-primary">W + 3</button>
									  <button type="button" class="btn btn-primary">W + 4</button>
									  <button type="button" class="btn btn-primary">W + 5</button>
									</div>
								</div>
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
<style>
	.runPanel {
		margin:10px 0;
	}
</style>
<script id="batsmanPanel" type="text/x-jsrender">

</script>
	