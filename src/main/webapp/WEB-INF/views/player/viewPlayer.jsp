<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="page-header">
   <h3 class="page-title">Player</h3>
   <nav aria-label="breadcrumb">
     <ol class="breadcrumb">
       <li class="breadcrumb-item"><a href="<spring:url value="/mvc/player/playerList" htmlEscape="true"/>">Player List</a></li>
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
           <form:form id="playerForm" method="POST" action="${pageContext.request.contextPath}/mvc/player/save" modelAttribute="player">
           		<form:hidden path="uuid"/>
           		<p class="card-description">Personal info</p>
				<div class="row">
					<div class="col-md-3">
                       <label>
							<figure>
								<img src="https://user.gadjian.com/static/images/personnel_boy.png" class="gambar img-responsive img-thumbnail" id="item-img-output" />
								<figcaption><i class="fa fa-camera"></i></figcaption>
						    </figure>
							<input type="file" style="display: none;" class="item-img file center-block" name="file_photo"/>
						</label>	
                     </div>
                     <div class="col-md-9">
	                     <div class="row">
		                   <div class="col-md-12">
		                     <div class="form-group row">
		                       <form:label path = "playerName" cssClass="col-sm-3 col-form-label">Name</form:label>
		                       <div class="col-sm-9">
		                         <form:input path = "playerName" cssClass="form-control"/>
		                       </div>
		                     </div>
		                   </div>
	                 	</div>
		                 <div class="row">
		                    <div class="col-md-12">
		                     <div class="form-group row">
		                       <form:label path="mobile" cssClass="col-sm-3 col-form-label">Mobile</form:label>
		                       <div class="col-sm-9">
		                         <form:input path = "mobile" cssClass="form-control"/>
		                       </div>
		                     </div>
		                   </div>
		                 </div>
		                 <div class="row">
			                 <div class="col-md-12">
			                     <div class="form-group row">
			                       <form:label path = "adhaarNumber" cssClass="col-sm-3 col-form-label">Adhaar Number</form:label>
			                       <div class="col-sm-9">
			                         <form:input path = "adhaarNumber" cssClass="form-control"/>
			                       </div>
			                     </div>
			                 </div>
                  	   </div>
                 	</div>
                 </div>
                 <div class="row">
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "dob" cssClass="col-sm-3 col-form-label">Born</form:label>
                       <div class="col-sm-9 ">
                       <div id="datepicker-popup" class="input-group date datepicker">
	                         <form:input path = "dob" cssClass="form-control"/>
                            <span class="mdi mdi-calendar input-group-text"></span>
                        </div>
                       </div>
                     </div>
                   </div>
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "place" cssClass="col-sm-3 col-form-label">Place</form:label>
                       <div class="col-sm-9">
                         <form:input path = "place" cssClass="form-control"/>
                       </div>
                     </div>
                   </div>
                 </div>
                 <p class="card-description">Sport info</p>
                 <div class="row">
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "playerRole" cssClass="col-sm-3 col-form-label">Role</form:label>
                       <div class="col-sm-9">
                         <form:select path="playerRole" items="${playerRoleList}" cssClass="form-control"/>
                       </div>
                     </div>
                   </div>
                 </div>
                 <div class="row">
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "battingStyle" cssClass="col-sm-3 col-form-label">Batting Style</form:label>
                       <div class="col-sm-9">
                         <form:select path="battingStyle" items="${battingStyleList}" cssClass="form-control"/>
                       </div>
                     </div>
                   </div>
                   <div class="col-md-6">
                     <div class="form-group row">
                       <form:label path = "bowlingStyle" cssClass="col-sm-3 col-form-label">Bowling	 Style</form:label>
                       <div class="col-sm-9">
                         <form:select path="bowlingStyle" items="${bowlingStyleList}" cssClass="form-control"/>
                       </div>
                     </div>
                   </div>
                 </div>
                 <div class="row">
                   <div class="col-md-6">
                     <button type="submit" class="btn btn-primary btn-icon-text"><i class="mdi mdi-file-check btn-icon-prepend"></i>Submit</button>
                   </div>
                 </div>
           </form:form>
         </div>
       </div>
   </div>
</div>

<!-- Modal -->
<div class="modal fade" id="cropImagePop" tabindex="-1" role="dialog" aria-labelledby="cropImagePop" aria-hidden="true">
  <div class="modal-dialog modal-md" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"	>Crop Image</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
       <div class="col-lg-6 text-center">
        <div id="upload-demo" style="width: 250px;height: 250px; padding-bottom:25px;" class="center-block"></div>
       </div>
    </div>
           </div>
      <div class="modal-footer">
         <button type="button" id="cropImageBtn" class="btn btn-primary">Crop</button>	 <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
		
<script>
	
$(function() {
    // Start upload preview image
    var $uploadCrop,
        tempFilename,
        rawImg,
        imageId;

    function readFile(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('.upload-demo').addClass('ready');
                $('#cropImagePop').modal('show');
                rawImg = e.target.result;
            }
            reader.readAsDataURL(input.files[0]);
        } else {
            swal("Sorry - you're browser doesn't support the FileReader API");
        }
    }

    $uploadCrop = $('#upload-demo').croppie({
        viewport: {
            width: 150,
            height: 200,
        },
        enforceBoundary: false,
        enableExif: true
    });
    $('#cropImagePop').on('shown.bs.modal', function() {
        // alert('Shown pop');
        $uploadCrop.croppie('bind', {
            url: rawImg
        }).then(function() {
            console.log('jQuery bind complete');
        });
    });

    $('.item-img').on('change', function() {
        imageId = $(this).data('id');
        tempFilename = $(this).val();
        $('#cancelCropBtn').data('id', imageId);
        readFile(this);
    });
    $('#cropImageBtn').on('click', function(ev) {
        $uploadCrop.croppie('result', {
            type: 'base64',
            format: 'jpeg',
            size: {
                width: 200,
                height: 300
            }
        }).then(function(resp) {
            $('#item-img-output').attr('src', resp);
            $('#cropImagePop').modal('hide');
        });
    });
    // End upload preview image
    $('#adhaarNumber').attr('data-inputmask-alias', "9999-9999-9999");
    $("#adhaarNumber").inputmask();

    $('#datepicker-popup input').datepicker({
        format: "dd-mm-yyyy",
        todayHighlight: true
    });

    $("#playerForm").validate({
        rules: {
            playerName: "required",
            adhaarNumber: "required"
        },
        messages: {
            playerName: "Please enter player name",
            adhaarNumber: "Please enter adhaar number"
        },
        submitHandler: function(form) {
            form.submit();
        },
        errorElement: "label",
        errorPlacement: function(error, element) {
            error.addClass("error mt-2 text-danger	");
            if (element.prop("type") === "checkbox" || element.prop("type") === "radio") {
                error.insertAfter(element.parent("label"));
            } else {
                error.insertAfter(element);
            }
        },
        highlight: function(element, errorClass, validClass) {
            $(element).parents(".form-group").addClass("has-danger");
            $(element).addClass("form-control-danger");
        },
        unhighlight: function(element, errorClass, validClass) {
            $(element).parents(".form-group").removeClass("has-danger");
        }
    });
});
</script>	