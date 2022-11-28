<%@ include file="menu.jsp" %>
<html>

<head>
	<title>Apply Leave</title>
</head>

<body>
	<div class="container-xl mt-5"> 
		<div class="row px-4">
			<div class="col col-xl-12">
				<div class="card mb-4">
					<div class="card-header text-center text-white h6" style="background-color: #124265;">Leave Application</div>
					<div class="card-body">
						<input type="hidden" value='<%="M"%>' id="empGender">
						<form  id="applyLeaveForm">
							<div class="container">
								<div class="row justify-content-center">
									<div class="col-10">
										<div class="row gx-3 mb-3 justify-content-around">
											<div class="col-md-6">
												<label class="mb-1" for="empName">Employee:</label>
												<span class="h6">${emp.getFirstName()} ${emp.getLastName()}</span>
											</div>
											<div class="col-md-6">
												<label class="mb-1" for="manager">Manager:</label>
												<span class="h6">${manager.getFirstName()} ${manager.getLastName()}</span>
											</div>
										</div>
										<div class="row gx-3 mt-4">
											<div class="col w-75 text-start">
												<label class="mb-1 py-2 rounded text-white px-2 py-2" style="background-color: #124265">
													<i class="fa-solid fa-file-lines"></i>&nbsp;&nbsp;Leave Details</label>
											</div>
											<div class="col w-75 text-center ">
												<button type="button" onclick="showSingleDate()" id="btnSingle" class="btn me-1 mb-1 text-white " style="background-color: #124265">
													<i class="fa-solid fa-calendar-day"></i>&nbsp;&nbsp;Single</button>
												<button type="button" onclick="showMultipleDate()" id="btnMulti" class="btn me-1 mb-1 text-white " style="background-color: #124265">
													<i class="fa-solid fa-calendar-days"></i>&nbsp;&nbsp;Multiple</button>
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-md-6">
												<label class="mb-1" for="leaveType">Leave Type</label>
												<select name="leaveType" id="selectLeaveType" class="form-control form-select w-75">
													<option value="sickLeave">Sick Leave</option>
													<option value="CasualLeave">Casual Leave</option>
													<option value="PrivilageLeave">Privilage Leave</option>
												</select>
											</div>
											<div class="col-md-6" id="dayModeType">
												<label class="mb-1" for="dayMode">Day Mode</label><br>
												<div class="border p-1 rounded w-75 ">
													<div class="form-check d-inline-flex mt-1">
														<input class="form-check-input" type="radio"  name="dayMode" id="dayMode1" value="Half Day" checked="">
														<label class="form-check-label" for="dayMode"> &nbsp;Half Day </label>
													</div>
													<div class="form-check d-inline-flex ms-2">
														<input class="form-check-input" type="radio" name="dayMode" id="dayMode2" value="Full Day">
														<label class="form-check-label" for="dayMode"> &nbsp;Full Day </label>
													</div>
										 		</div>
											</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="mb-1" for="startDate">Start Date</label>
												<input class="form-control w-75" type="date"  onchange="startDateChange() "name="startDate" id="startDate" placeholder="Enter StartDate">
												<span class="form-text small text-danger ms-2 d-none">Specify StartDate</span>
											</div>
											<div class="col-md-6 endDateHide">
												<div class="row">
													<div class="col-md-7">
														<label class="mb-1" for="endDate">End Date</label>
														<input class="form-control" type="date" name="endDate" id="endDate" onchange="getNumberOfDays()" placeholder="Enter EndDate">
													</div>
													<div class="col-md-5 mt-4">
														<label class="badge-soft-primary py-2 px-2" id="dayCount"> 	Day : </label>
													</div>
												</div>
											</div>
										</div>
										<div class="row gx-3 mb-3">
											<div class="col-md-6">
												<label class="mb-1" for="attachment">Supporting Document 2MB PDF Only</label>
												<input class="form-control w-75" type="file" id="attachment" name="attachment" placeholder="Enter attachment">
												<span class="form-text small text-danger ms-2 d-none">Specify attachment</span>
											</div>
											<div class="col-md-6">  
												<label class="mb-1" for="leaveReason">Leave Reason</label>
												<textarea class="form-control w-75" id="leaveReason" name="leaveReason" type="text" placeholder="Enter Leave Reason" value=""></textarea>
												<span class="form-text small text-danger ms-2 d-none">Specify Leave Reason</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row justify-content-center mt-2">
								<button class="btn btn-primary btn-sm px-3 w-auto" type="submit" id="btnSubmit">
									<span id="loadingBtn"> </span> &nbsp; Submit &nbsp;
								</button>
								<button class="btn btn-danger btn-sm px-3 ms-2 w-auto " type="reset"
									onclick="this.blur()"> Reset</button>
								<a href="leave-console" class="btn btn-secondary btn-sm px-3 ms-2 w-auto " type="back"
									onclick="this.blur()"> Back</a>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script>
		$(document).ready(function () {
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
						year + '-' + month + '-' + day);
					$("input[name='endDate'] ").prop('disabled', true);
				} else {
					$("input[name='endDate'] ").prop('disabled', false);
				}
			}
		}

		function getNumberOfDays() {
			if ($('#startDate').val() && $('#endDate').val()) {
				let start = new Date($('#startDate').val());
				let end = new Date($('#endDate').val());
				$("#dayCount").html("&nbsp;&nbsp;Day Count : " + (parseInt(Math.round((end.getTime() - start.getTime()) / (1000 * 60 * 60 * 24))) + 1));
			}
		}


		function isValid() {
			let flag = true; 
			if(!($("#dayMode1").val())){
				$("#dayMode1").addClass("is-invalid");
				$("#dayMode1").siblings("span").removeClass("d-none");
				flag = false;
			}
			if(!($("#startDate").val())){
				$("#startDate").addClass("is-invalid");
				$("#startDate").siblings("span").removeClass("d-none");
				flag = false;
			}
			if(!($("#endDate").val())){
				$("#endDate").addClass("is-invalid");
				$("#endDate").siblings("span").removeClass("d-none");
				flag = false;
			}
			if(!($("#leaveReason").val())){
				$("#leaveReason").addClass("is-invalid");
				$("#leaveReason").siblings("span").removeClass("d-none");
				flag = false;
			}
			return flag; 
		}
		
		$("#applyLeaveForm").on("submit", function (event) {
			event.preventDefault();
			if (isValid()) {
				$("#loadingBtn").addClass("spinner-border spinner-border-sm");
				let data = {
					dayMode: $("input[name=dayMode]:checked").val(),
					leaveType: $("#selectLeaveType").val(),
					startDate: $("#startDate").val(),
					endDate: $("#endDate").val(),
					managerId: $("#manager").val(),
					leaveReason: $("#leaveReason").val()
				}
				$.ajax({
					type: 'POST',
					url: 'apply-leave-process',
					data: JSON.stringify(data),
					contentType: 'application/json',
					success: function (data, msg, xh) {
						$("#btnSave").blur();
						$("#loadingBtn").removeClass("spinner-border spinner-border-sm");
						swal({
							title: "Success",
							text: "Leave Applied Successfully",
							icon: "success",
						}).
							then(function (isOkay) {
								if (isOkay) { 
									location.replace('/home');
								}
							});
					}, error: function (data, msg, xh) {
						$("#loadingBtn").removeClass("spinner-border spinner-border-sm");
					}
				});
			} else {
				$("#btnSave").blur();
			}
		}); 


    $("input, select , textarea ").on("input",function(){
        $(this).removeClass("is-invalid");
        if(!$(this).val()){
            $(this).siblings("span").removeClass("d-none");
        }else{
            $(this).siblings("span").addClass("d-none");
        }
    });
	</script>
</body>

</html>