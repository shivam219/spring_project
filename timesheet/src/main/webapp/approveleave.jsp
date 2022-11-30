<%@ include file="menu.jsp" %>
	<html lang="en">

	<head>
		<script src="https://kit.fontawesome.com/70c55b67fa.js" crossorigin="anonymous"></script>
		<title>Approve Leave</title>

		<style>
			.approve-reason-pop,
			.reject-reason-pop,
			.leave-reason-pop {
				position: absolute;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				width: 455px;
				text-align: center;
				background-color: white;
				padding: 10px;
				z-index: 100;
				display: none;
				border-radius: 5px;
				border: 2px solid rgb(219, 218, 218);
			}

			/* th{
 background-color: #124265;
 } */

			table thead tr th {
				text-align: center;
				padding: 1rem 1rem;
				font-weight: 500;
				font-size: 15px;
				font-family: Verdana, Geneva, Tahoma, sans-serif;
			}

			.table thead th {
				background-color: #124265;
			}


			table tr td {
				font-size: 14px;
				text-align: center;
				color: rgb(88, 88, 88);
				border-collapse: collapse;
				font-family: Verdana, Geneva, Tahoma, sans-serif;
			}

			table {
				border-bottom: 1px solid #ff000d;
			}

			tbody,
			td,
			td a tfoot,
			th,
			thead,
			tr {
				border-style: solid;
				border-top-width: thin;
				border-right-width: 0px;
				border-bottom-width: 0px;
				border-left-width: 0px;
			}

			.table>:not(caption)>*>* {
				padding: 0.25rem 0.25rem;
			}

			.badge-soft-success-button {
				font-size: 12px;
				font-weight: 700;
				color: #63ad6f !important;
				background-color: rgba(99, 173, 111, .1);
			}

			.badge-soft-danger {
				font-size: 12px;
				font-weight: 700;
				color: #f56e6e !important;
				background-color: rgba(245, 110, 110, .1);
			}
		</style>


	</head>

	<body>
		<form action="">
			<input type="hidden" name="LeaveId" id="LeaveId">
		</form>
		<div class="leave-reason-pop ">
			<div class=" d-flex justify-content-between">
				<label class="badge-soft-primary py-2 px-2 fw-normal mx-2 d-inline-block " style="width: 40%;"
					id="DayCount"> Leave Reason </label>
				<button onclick="leaveReasonPopHide('')" class="btn badge-soft-primary text-secondary me-0"><i
						class="fa fa-duotone fa-circle-xmark"></i></button>
			</div>
			<hr>
			<p id="msgLeaveReason" style="font-family: Lato-Regular; font-size: 16px;"></p>
		</div>

		<div class="approve-reason-pop ">
			<div class=" d-flex justify-content-between">
				<label class="badge-soft-primary py-2 px-2 fw-normal mx-2 d-inline-block " style="width: 40%;"
					id="DayCount"> Approve Reason </label>
				<button onclick="approveReasonPopHide()" class="btn badge-soft-primary text-secondary me-0"><i
						class="fa fa-duotone fa-circle-xmark"></i></button>
			</div>
			<hr>
			<div class="form-group">
				<textarea class="form-control" style="font-family: Lato-Regular; font-size: 16px;" id="msgApproveReason"
					name="leaveReason" rows="3" placeholder="Approve reason here....."></textarea>
			</div>
			<button class="btn btn-sm btn-primary mt-2" type="submit" id="btnLeaveApprove" onclick="approveLeave()">
				<span id="loadingBtn"> </span> &nbsp; Submit &nbsp;
			</button>
		</div>

		<div class="reject-reason-pop ">

			<div class=" d-flex justify-content-between">
				<label class="badge-soft-primary py-2 px-2 fw-normal mx-2 d-inline-block " style="width: 40%;"
					id="DayCount"> Reject Reason </label>
				<button onclick="rejectReasonPopHide()" class="btn badge-soft-danger text-secondary me-0"><i
						class="fa fa-duotone fa-circle-xmark"></i></button>
			</div>

			<hr>
			<div class="form-group">
				<textarea class="form-control" style="font-family: Lato-Regular; font-size: 16px;" id="msgRejectReason"
					name="leaveReason" rows="3" placeholder="Reject reason here....." required></textarea>
			</div>
			<button class="btn btn-sm btn-primary mt-2" type="submit" id="btnLeaveReject">
				<span id="loadingBtnR"> </span> &nbsp; Submit &nbsp;
			</button>

		</div>
		<div class="container mt-5">
			<!-- <h1 class=" h4 m-0 my-3 py-2 fw-normal dashboard-headling ">Employee Leaves </h1> -->
			<div class="row">
				<div class="col-lg-12">
					<div class="table-responsive" style="border-radius: 8px;">
						<table class="table table-hover project-list-table table-nowrap align-middle table-borderless">
							<thead>
								<tr>
									<th class="text-white py-2 fw-normal ">Leave ID</th>
									<th class="text-white py-2 fw-normal ">Employee Name</th>
									<th class="text-white py-2 fw-normal ">Leave Type</th>
									<th class="text-white py-2 fw-normal ">Start Date</th>
									<th class="text-white py-2 fw-normal ">End Date</th>
									<th class="text-white py-2 fw-normal ">Leave Reason</th>
									<th class="text-white py-2 fw-normal ">Documents</th>
									<th class="text-white btn-leave-approve " colspan="2">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${leaveList}" var="l">
									<tr class="" id="${l.getLeaveId()}">
										<td class="">${l.getLeaveId()}</td>
										<td class="">${l.getEmpName()}</td>
										<td class="">${l.getLeaveType()}</td>
										<td class="">${l.getStartDate()}</td>
										<td class="">${l.getEndDate()}</td>
										<td class="text-center ">

											<button class="btn btn-sm badge-soft-primary w-50 py-1 " type="button"
												onclick='leaveReasonPopShow(` <c:out value="${l.getLeaveReason()}" /> `);this.blur()'>
												<i class="fa fa-duotone fa-comments"></i>
											</button>

										</td>
										<td class="text-center">
											<!-- this work when file will there -->
											<c:if test='${!l.getAttachment().equals("")}'>
												<button class="btn btn-sm badge-soft-primary w-75 py-2" type="button"
													disabled>
													<i class="fa fa-sharp fa-solid fa-ban"></i>
												</button>
											</c:if>
											<!-- change for check if file attact -->
											<!-- this work when no file will there -->
											<c:if test='${l.getAttachment().equals("")}'>
												<a href='${l.getAttachment()}'
													class='btn btn-sm badge-soft-primary px-3 ' target='_blank"}'>
													<i class="fa fa-duotone fa-eye"></i> view
												</a>
											</c:if>


										</td>
										<td class="text-center">
											<button class="btn btn-sm badge-soft-success-button px-3" id="btnApprove"
												onclick="approveLeaveApplication('${l.getLeaveId()}');this.blur();">
												<i class="fa fa-duotone fa-check-double"></i> Approve
											</button>
											<button class="btn btn-sm badge-soft-danger px-3 ms-0" type="button"
												id="btnReject"
												onclick="rejectLeaveApplication('${l.getLeaveId()}');this.blur();">
												<i class="fa fa-duotone fa-thumbs-down"></i> Reject
											</button>
										</td>
									</tr>
								</c:forEach>
								<c:if test='${leaveList.size()== 0}'>
									<tr>
										<td colspan="8" class="bg-white text-center fw-normal h5 p-2 "> No Data</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(document).ready(function () {
				$("#btnLeaveReject").on('click',
					function (event) {
						event.preventDefault();
						if (new String($('#msgRejectReason').val()).replace(/\s/g, '').length > 4) {
							$("#loadingBtnR").addClass("spinner-border spinner-border-sm");
							$('#btnLeaveReject').attr("disabled", true);
							let data = {
								leaveId: $('#LeaveId').val(),
								rejectReason: $('#msgRejectReason').val()
							}
							console.log(data);
							let uri = 'reject-leave-process'
							$.ajax({
								type: 'POST',
								url: uri,
								data: JSON.stringify(data),
								contentType: 'application/json',
								success: function (data, msg, xh) {
									$("#msgRejectReason").val('');
									$("#loadingBtnR").removeClass("spinner-border spinner-border-sm");
									$('#btnLeaveReject').attr("disabled", false);
									rejectReasonPopHide();
									let trId = '#' + $("#LeaveId").val();
									$(trId).closest('tr').remove();
									let rowCount = $('table tr').length;
									if (rowCount == 1) {
										location.replace('/home');
									}
								},
								error: function (data, msg, xh) {

								}
							});
						}
						else if (new String($('#msgRejectReason').val()).replace(/\s/g, '').length == 0) {
							alert("Please enter reason");
							$('#msgRejectReason').focus();
						}
						else {
							alert("Please enter valid reason");
							$('#msgRejectReason').focus();
						}
					});
			});
			function approveLeave() {
				if (new String($('#msgApproveReason').val()).replace(/\s/g, '').length >= 0) {
					$("#loadingBtn").addClass("spinner-border spinner-border-sm");
					$('#btnLeaveApprove').attr("disabled", true);
					let data = {
						leaveId: $('#LeaveId').val(),
						approveReason: $('#msgApproveReason').val()
					}
					console.log(data);
					let uri = 'approve-leave-process'
					$.ajax({
						type: 'POST',
						url: uri,
						data: JSON.stringify(data),
						contentType: 'application/json',
						success: function (data, msg, xhr) {
							$("#msgApproveReason").val('');
							$("#loadingBtn").removeClass("spinner-border spinner-border-sm");
							$('#btnLeaveApprove').attr("disabled", false);
							approveReasonPopHide();
							let trId = '#' + $("#LeaveId").val();
							$(trId).closest('tr').remove();
							let rowCount = $('table tr').length;
							if (rowCount == 1) {
								location.replace('/home');
							}
						},
						error: function (data, msg, xhr) {
							console.log(data);
							console.log(msg);
							console.log(xhr);
						}
					});
				}
				else if (new String($('#msgApproveReason').val()).replace(/\s/g, '').length == 0) {
					alert("Please enter reason");
					$('#msgApproveReason').focus();
				}
				else {
					alert("Please enter valid reason");
					$('#msgApproveReason').focus();
				}
			}

			function approveReasonPopShow() {
				$(".approve-reason-pop").show();
			}
			function approveReasonPopHide() {
				$(".approve-reason-pop").hide();
			}
			function rejectReasonPopShow() {
				$(".reject-reason-pop").show();
			}
			function rejectReasonPopHide() {
				$(".reject-reason-pop").hide();
			}
			function leaveReasonPopShow(msg) {
				$("#msgLeaveReason").html(msg);
				$(".leave-reason-pop").show();
			}
			function leaveReasonPopHide(msg) {
				$("#msgLeaveReason").html(msg);
				$(".leave-reason-pop").hide();
			}
			function rejectLeaveApplication(LeaveId) {
				$('#LeaveId').val(LeaveId);
				console.log($('#LeaveId').val());
				rejectReasonPopShow();
			}
			function approveLeaveApplication(LeaveId) {
				$('#LeaveId').val(LeaveId);
				console.log($('#LeaveId').val());
				approveReasonPopShow();
			}
		</script>
	</body>

	</html>