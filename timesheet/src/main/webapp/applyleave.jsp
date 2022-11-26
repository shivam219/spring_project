<%@ include file="menu.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Apply Leave</title>
<style>
.gradient-custom {
	background:#e2e2e2; 
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	height: 200%;
}

.body {
	 font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		"Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"; 
		font-size:18px; 
}

.box2 {
	color: white;
	/* background-color: #6c757d; */
	
}
</style>
</head>

<body>
	<section class="h-100  body gradient-custom body">
		<div class="container py-4 h-10 ">
			<div class="row justify-content-center align-items-center h-100 p-0">
				<div class="col-12 p-0">
					<div class="card shadow-2-strong p-1 card-registration" style="border: 0px solid;">
						 <h3 class="ms-5 text-dark p-0 rounded-1" style="font-family: Lato-Regular; font-weight:bold;" >Leave Application</h3>
						<div class="card-body p-1 p-md-3" style="background-color: #f6f6f5 ;">
							<input type="hidden" value='<%="M"%>' id="empGender">
							<form method="post" action="applyleaveprocess" onsubmit="return validate(this)">
								<div class="row">
									<div class="col-sm-4">
										<div class="input-group ms-1 w-73">
											<span class="input-group-text" id="basic-addon1">Employee
												Name</span> <input type="text" class="form-control" 
												value="${emp.getFirstName()}" aria-label="employeeName" name="empName"
												aria-describedby="basic-addon1">
										</div>

									</div>
									<div class="col-sm-4">
										<div class="input-group ms-1 w-73">
											<span class="input-group-text" id="basic-addon1">Employee
												ID</span> <input type="text" class="form-control"  
												value="${emp.getEmpId()}" aria-label="employeeId" name="empId"
												aria-describedby="basic-addon1">
										</div>
									</div>

									<div class="col-sm-4">
										<div class="input-group ms-1 w-73">
											<span class="input-group-text" id="basic-addon1">Manager
												Name</span> <input type="hidden" name="managerId" id="managerId" value="${manager.getEmpId()}">
												<input type="text" class="form-control"  
												value="${manager.getFirstName()} ${manager.getLastName()}" aria-label="managerName" name="managerName"
												aria-describedby="basic-addon1">
										</div>
									</div>
								</div>
								<div class="row mt-3 justify-content-center">
									<div class="col col-sm-8">
									<h5 class="m-3 text-white  bg-secondary text-center body rounded-1 py-1" style="font-size:16px;">Leave Details</h5>
									</div> 
									<div class="row" style="margin-top: -5px;">
										<div class="col ms-3 mb-2 mb-md-3 col-sm-4">
											<button type="button" class="btn  btn-sm" onclick="showSingleDate()" id="btnSingle" style="margin-left: -10px;">Single</button>
											<button type="button" class="btn btn-sm" onclick="showMultipleDate()" id="btnMulti">Multiple</button>
										</div>
									</div>
								</div>
								<div class="row"> 
									
									<div class="col ms-3 col-sm-4">
										<div class="input-group m-1 w-73">
											<span class="input-group-text" id="" style="margin-left:-2px;">Leave Type<span style="color: red;">&nbsp;*</span></span> 
											<select class="form-select  w-50 d-inline " name="leaveType" id="selectLeaveType" >
												<option value="Sick Leave">Sick Leave</option>
												<option value="Casual Leave">Casual Leave</option>
												<option value="Privilege Leave">Privilege Leave</option>
											</select>
									</div>
									</div>
									<div class="col-6 " id="dayModeType">
										<label class="start" style="margin-left:50px;">Day Mode <span style="color: red;">&nbsp;*</span> </label>
										<div class="form-check form-check-inline">
											<input class="form-check-input mt-2" type="radio" name="dayMode" id="dayMode1" value="Half Day" checked=""> <span class="input-group-text d-inline" id="basic-addon1">Half Day</span></input>
										</div>
										<div class="form-check-inline">
											<input class="form-check-input mt-2" type="radio" name="dayMode" id="dayMode2" value="Full Day">	<span class="input-group-text d-inline" id="basic-addon1">Full Day</span> 
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-4 m-3">
										<div class="input-group ">
											<span class="input-group-text">Start Date <span style="color: red;">&nbsp;*</span></span>
											<input type="date" class="form-control" onchange="startDateChange()" name="startDate" id="startDate">
										</div>
									</div>
									<div class="col-sm-4 m-3 endDateHide">
										<div class="input-group date" style="margin-left:17px;">
											<span class="input-group-text">End Date <span style="color: red;">&nbsp;*</span></span>
											<input type="date" class="form-control" name="endDate" id="endDate" onchange="getNumberOfDays()">
											<span id="dayCount">&nbsp;&nbsp;Day Count : </span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col col-sm-4   ms-3 star">
										<span class="input-group-text">Supporting Document Only 2MB, PDF  </span> 
										<input type="file" class="form-control" id="attachment" name="attachment" />
									</div>
									<div class="col-6 ms-5">
										<div class="form-group" style="margin-right:-127px">
											<label for="leaveReason"  class="input-group-text star">Leave Reason <span style="color: red;">&nbsp;*</span> </label>
											<textarea class="form-control" id="leaveReason" name="leaveReason" rows="3" placeholder="type leave reason here....."></textarea>
										</div>
									</div>
								</div>
								<div class="row m-0 mt-3 mb-3 justify-content-center">
									<div class="col-sm-6 md-4 pe-5" style="margin-left: 400px;">
										<button type="submit"id="btnSubmit" class="btn btn-success btn-sm">Submit</button>
										<button type="reset" class="btn btn-danger px-3  mt-sm-0 mt-2 btn-sm">Reset</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<script>
		$(document).ready(function(){
			$(".endDateHide").hide();
			$('#btnSingle').toggleClass('btn-primary');
			$('#btnMulti').toggleClass('btn-secondary');
		})
		var optSelect = 1;
		function showSingleDate() {
			$("#dayCount").html("&nbsp;&nbsp;Day Count : ");
			$('#startDate').val('');
			$('#endDate').val('');
			$("#dayMode1").prop("checked", true);
			$("#dayModeType").show();
			$(".endDateHide").hide();
			$("#selectLeaveType option[value='Maternity Leave']").remove();
			$("#selectLeaveType option[value='Paternity Leave']").remove();
			optSelect = 1;
		}
		function showMultipleDate() {
			$("#dayCount").html("&nbsp;&nbsp;Day Count : ");
			$('#startDate').val('');
			$('#endDate').val('');
			$("#dayMode2").prop("checked", true);
			$("#dayModeType").hide();
			$(".endDateHide").show();

			if (optSelect == 1) {
				if ($("#empGender").val() == "M") {
					$('#selectLeaveType').append(
							$('<option>').val('Paternity Leave').text(
									'Paternity Leave'));
				} else {
					$('#selectLeaveType').append(
							$('<option>').val('Maternity Leave').text(
									'Maternity Leave'));
				}
				optSelect = 2;
				$("input[name='endDate'] ").prop('disabled', false);
			}
		}
		function changeEndDate() {
			$('#startDate').val('');
			$('#endDate').val('');
			if (optSelect == 2) {
				if ($("#selectLeaveType").val() == "Maternity Leave"
						|| $("#selectLeaveType").val() == "Paternity Leave") {
					$("input[name='endDate'] ").prop('disabled', true);
				} else {
					$("input[name='endDate'] ").prop('disabled', false);
				}
			}
		}
		function startDateChange() {
			getNumberOfDays();
			if (optSelect == 1) {
				$("#endDate").val($("#startDate").val());
			} else if (optSelect == 2) {
				if ($("#selectLeaveType").val() == "Maternity Leave") {
					$("input[name='endDate'] ").prop('disabled', false);
					let today = new Date($("input[name='startDate']").val());
					today.setDate((today.getDate() + 167));
					let day = today.getDate();
					let month = today.getMonth();
					let year = today.getFullYear();
					if (day.toString().length == 1) {
						if (day.toString() == "0") {
							day = "1";
						}
						day = "0" + day.toString();
					}
					let mmonth = (parseInt(month.toString()) + 1);
					month = mmonth.toString();
					if (month.toString().length == 1) {
						if (month.toString() == "0") {
							month = "1";
						}
						month = "0" + month.toString();
					}
					$("input[name='endDate'] ").val(
							year + '-' + month + '-' + day);
					$("input[name='endDate'] ").prop('disabled', true);

				} else if ($("#selectLeaveType").val() == "Paternity Leave") {
					$("input[name='endDate'] ").prop('disabled', false);
					let today = new Date($("input[name='startDate']").val());
					today.setDate((today.getDate() + 6));
					let day = today.getDate();
					let month = today.getMonth();
					let year = today.getFullYear();
					if (day.toString().length == 1) {
						if (day.toString() == "0") {
							day = "1";
						}
						day = "0" + day.toString();
					}
					let mmonth = (parseInt(month.toString()) + 1);
					month = mmonth.toString();
					if (month.toString().length == 1) {
						if (month.toString() == "0") {
							month = "1";
						}
						month = "0" + month.toString();
					}
					$("input[name='endDate'] ").val(
							year + '-' +month + '-' +day);
					$("input[name='endDate'] ").prop('disabled', true);
				} else {
					$("input[name='endDate'] ").prop('disabled', false);
				}
			}
		}
		
		function getNumberOfDays() {
			if($('#startDate').val() && $('#endDate').val()){
				let start = new Date($('#startDate').val());
				let end = new Date($('#endDate').val()); 
				$("#dayCount").html("&nbsp;&nbsp;Day Count : " + ( Math.round( (end.getTime() - start.getTime()) / (1000 * 60 * 60 * 24))));
			}
		}
		function validate(fm) {
			if (optSelect == 1) {
				if (fm.startDate.value == "") {
					alert("Start date is Empty");
					fm.startDate.focus();
					return false;
				}
			} else {
				if (fm.startDate.value == "") {
					fm.startDate.focus();
					alert("Start Date is Empty");
					return false;
				}
				if (fm.endDate.value == "") {
					fm.endDate.focus();
					alert("End Date is Empty");
					return false;
				}
				if (new Date(fm.startDate.value) > new Date(fm.endDate.value)) {
					alert("End date is greater then start date");
					return false;
				}
			}
			if (fm.leaveReason.value.replace(/\s/g, '').length == 0) {
				alert("please assigned leave reason");
				fm.leaveReason.focus();
				return false;
			}
			swal({
            title: "Success",
            text: "Leave Request Submitted successfully",
            icon: "success",
			}).
			then(function (isOkay) {
				if (isOkay) {
					fm.submit();
				}
			});
				return false;
		}

		
	</script>
</body>

</html>