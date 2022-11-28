<%@ include file="menu.jsp" %>
	<html lang="en">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://kit.fontawesome.com/70c55b67fa.js" crossorigin="anonymous"></script>
		<title>Cancle Leave</title>
		<style>
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
				color: #124265;
				border-style: solid;
				border-top-width: thin;
				border-right-width: 0px;
				border-bottom-width: 0px;
				border-left-width: 0px;
			}

			.table>:not(caption)>*>* {
				padding: 0.25rem 0.25rem;
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
		<div class="container mt-5">
			<!-- <h1 class="text-secondary h4 m-0 my-3 py-2 fw-normal dashboard-headling ">Employee Leaves </h1> -->
			<div class="row">
				<div class="col-lg-12">
					<div class="table-responsive" style="border-radius: 8px;">
						<table class="table table-hover project-list-table table-nowrap align-middle table-borderless">
							<thead>
								<tr>
									<th class="text-white py-2 fw-normal">LeaveId</th>
									<th class="text-white py-2 fw-normal">Leave Type</th>
									<th class="text-white py-2 fw-normal">Day Mode</th>
									<th class="text-white py-2 fw-normal">Starting Date</th>
									<th class="text-white py-2 fw-normal">Ending Date</th>
									<th class="text-white py-2 fw-normal" colspan="1">Status</th>
									<th class="text-white py-2 fw-normal" colspan="1">Action</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${getAllLeave}" var="l">
									<tr class="">
										<td class="">${l.getLeaveId()}</td>
										<td class="">${l.getLeaveType()}</td>
										<td class="">${l.getDayMode()}</td>
										<td class="">${l.getStartDate()}</td>
										<td class="">${l.getEndDate()}</td>
										<td class="">${l.getStatus()}</td>
										<td class="">
											<button class="btn btn-sm badge-soft-danger px-3 ms-0" id="btnCancle"
												onclick="cancelLeaveApplication('${l.getLeaveId()}');this.blur();">
												<i class="fa fa-duotone fa-trash"></i>&nbsp;&nbsp;Cancel Request
											</button>
										</td>
									</tr>
								</c:forEach>
								<c:if test='${getAllLeave.size()== 0}'>
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

		<i class="fa fa-thin fa-trash-can-xmark"></i>
		<i class="fa fa-duotone fa-trash-can-xmark"></i>
		<script>


			function cancelLeaveApplication(LeaveId) {
				console.log();
				$('#btnCancel').attr("disabled", true);
				let data = { leaveId: LeaveId }
				console.log(data);
				$.ajax({
					type: 'POST',
					url: 'cancle-leave-process',
					data: JSON.stringify(data),
					contentType: 'application/json',
					success: function (data, msg, xh) {
						// location.replace('/home');
						// location.reload();
						swal({
							title: "Success",
							text: "Cancel Leave Request successfully",
							icon: "success",
						}).
							then(function (isOkay) {
								if (isOkay) {
									location.reload();
								}
							});
						console.log(data);
					},
					error: function (data, msg, xh) {

					}
				});
			}
		</script>

		<script src="./assets/main.js"></script>


	</body>

	</html>