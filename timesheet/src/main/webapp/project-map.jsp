<%@ include file="menu.jsp" %>
<html lang="en">
<head>
	<title>Project Mapping</title>

	<link href="css/select@2.4.1.0.min.css" rel="stylesheet" />
	<style>
		.btn-util {
			margin-top: 3px;
			width: 100%;
			background-color: #fff;
			border-color: #ccc;
			display: block;
			cursor: pointer;
		}
	</style>
</head>

<body>
	<div class="container">
		<form action="projectassign" method="POST" id="project-mappingForm">
			<div class="row justify-content-center">
				<div class="col-md-8 offest-2">
					<div class="card-body">
						<div class="form-group mb-3">
							<label class="ms-1 fw-bold">Choose Employee</label>
							<select name="empList" id="empList" class="form-control sl-emp form-select"
								oninput="myFunction()" style="outline: none;border:none ;">
								<option value=""></option>
								<c:forEach items="${users}" var="user" varStatus="l">
									<option value="${user.getEmpId()}">${user.getEmployee().getFullName()}
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-3">
					<label class="ms-1 fw-bold">Non Assign Project </label>
					<select name="from" id="undo_redo" class="form-control" size="11" multiple="multiple">

					</select>
				</div>
				<div class="col-md-2 ">
					<button type="button" id="undo_redo_undo" class="btn btn-sm btn-primary btn-util  mt-4 "
						style="background-color: #0d6efd;border-color:#0d6efd; ">undo</button>
					<button type="button" id="undo_redo_rightAll" class="btn btn-sm btn-default btn-util  "><i
							class="fa-sharp fa-solid fa-forward"></i></button>
					<button type="button" id="undo_redo_rightSelected" class="btn btn-sm btn-default btn-util  "><i
							class="fa-solid fa-caret-right"></i></button>
					<button type="button" id="undo_redo_leftSelected" class="btn btn-sm btn-default btn-util  "><i
							class="fa-solid fa-caret-left"></i></button>
					<button type="button" id="undo_redo_leftAll" class="btn btn-sm btn-default btn-util  "><i
							class="fa-sharp fa-solid fa-backward"></i></button>
					<button type="button" id="undo_redo_redo" class="btn btn-sm btn-warning btn-util  "
						style="background-color: #ffca2c; border-color:#ffca2c; ">redo</button>
				</div>

				<div class="col-md-3">
					<label class="ms-1 fw-bold"> Assign Project</label>
					<select name="projectList" id="undo_redo_to" class="form-control" size="11"
						multiple="multiple"></select>
				</div>
			</div> 
			<div class="row justify-content-center gap-2 mt-2 ">
				<button class="btn btn-secondary btn-sm  w-auto "  onclick="location='project-master'" >Back </button>
				<button class="btn btn-success w-auto" id="btnSubmit">Assign Project</button> 
			</div>
		</form>
	</div>
	<script src="js/select2@4.1.0.min.js"></script>
	<script>
		$('#empList').select2({
			placeholder: "Search employee's",
			allowClear: true
		});
	</script>
	<script src="js/multiselect.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#undo_redo').multiselect();
		});
	</script>

	<script type="text/javascript">
		$("#btnSubmit").on("click", function (event) {
			event.preventDefault();
			// let empId = $("#empList").val();
			if ($("#empList").val()) {
				if ($("#undo_redo_to").children("option").val() == undefined) {
					// $.ajax({
					// 	    url: 'projectdelete?empId='+empId+'',
					// 	    type: 'post',
					// 	    success: function(obj, success,event){ 
					// 		},
					// 	error: function(er){
					// 		console.log(er);
					// 	}
					// 	});

					$("#project-mappingForm").attr("action", "projectassign").submit();
				} else {
					// let data = new FormData( $("#project-mappingForm"));
					// let data = new FormData(document.forms[0]);
					//  $.ajax({
					//     url: 'projectassign?empId='+empId+'',
					//     type: 'post',
					// 	data :data,
					// 	processData: false,
					// 	contentType: false,
					// 	cache: false,
					// 	enctype: 'multipart/form-data',
					//     success: function(obj, success,event){

					// 	 },
					// 	error: function(er){
					// 		console.log(er);
					// 	}
					// });
					$("#project-mappingForm").attr("action", "projectassign").submit();
				}
			} else {
				alert("please choose employee");
			}
			$("#empList").blur();

		});
		function myFunction() {
			if ($('.sl-emp').val() == "") {
				$('#undo_redo_to').find('option').remove().end();
				$('#undo_redo').find('option').remove().end();
			} else {
				let uri = "user-project?empId=" + $(".sl-emp").val();
				$.ajax({
					url: uri,
					type: 'GET',
					dataType: 'json',
					success: function (obj, successMSG, event) {
						console.log(obj);
						$('#undo_redo_to').find('option').remove().end();
						for (let i = 0; i < obj.length; i++) {
							$('#undo_redo_to').append("<option value='" + obj[i]['projectId'] + "' > " + obj[i]['projectName'] + " </option>");
						}
					}
				});
				let uri2 = "non-user-project?empId=" + $(".sl-emp").val();
				$.ajax({
					url: uri2,
					type: 'GET',
					dataType: 'json',
					success: function (obj, successMSG, event) {
						console.log(obj);
						$('#undo_redo').find('option').remove().end();
						for (let i = 0; i < obj.length; i++) {
							$('#undo_redo').append("<option value='" + obj[i]['projectId'] + "' > " + obj[i]['projectName'] + " </option>");
						}
					}
				});
			}
		}

	</script>



</body>

</html>