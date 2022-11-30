<%@ include file="menu.jsp" %>
	<html>

	<head>
		<title>Month Sheet </title>
	</head>

	<body>
		<input type="hidden" value="${empMonthSheet.getMonthSheetId()}" id="monthSheetId">
		<div class="container">
			<h1 class=" h4 m-0 my-3 py-2 fw-normal  dashboard-headling "> Approve Timesheet </h1>
			<div class="">
				<div class="row m-0 p-0 bg-white py-2 my-2 justify-content-center">
					<div class="col-md text-center">
						<span class="align-middle">
							Employee Name : ${empMonthSheet.getEmployeeName()}
						</span>
					</div>
					<div class="col-md text-center">
						<span class="align-middle">
							Month : ${empMonthSheet.getMonth()}
						</span>
					</div>
					<div class="col-md text-center">
						<span class="align-middle">
							Year : ${empMonthSheet.getYear()}
						</span>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 mb-3 mb-md-0 ">
					  
				</div>
				<div class="col-md-6 ">  
					<div class="d-flex justify-content-md-end  mb-1">  
						<span class="  badge-soft-primary px-3 align-self-center py-1 me-2">  Day Sheet (${monthSheetDataList.size()})</span>
						<button type="button" class="btn btn-primary  btn-sm px-md-4  me-2 " id="btnApprove">
							<span id="btnApproveLd"> </span> &nbsp; Approve &nbsp;
						</button> 

						<button type="button" class="btn btn-danger  btn-sm px-md-4  me-2 " id="btnReject">
							<span id="btnRejectLd"> </span> &nbsp; Reject &nbsp;
						</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="table-responsive">
						<table class="table table-fixed project-list-table table-nowrap align-middle table-borderless">
							<thead class="thead-dark">
								<th class="text-center overflow-auto" scope="row">Date</th>
								<th class="text-center overflow-auto" scope="row">Project Name</th>
								<th class="text-center overflow-auto" scope="row">Description</th>
								<th class="text-center overflow-auto" scope="row">Hour</th>
							</thead>
							<tbody>
							
								<c:forEach items="${monthSheetDataList}" var="md" varStatus="loop">
									<tr>
										<td class="text-center overflow-auto">${md.getDate()}</td>
										<td class="text-center overflow-auto">${md.getProjectName()}</td>
										<td class="text-center overflow-auto">${md.getDescr()}</td>
										<td class="text-center overflow-auto">${md.getHour()}</td>
									</tr>
								</c:forEach> 
								<c:if test='${monthSheetDataList.size() eq 0 }'> 
									<tr>
										<td colspan="4" class="text-center">  No data </td>
									</tr>
								</c:if>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div>
						<button class="btn btn-secondary btn-sm px-5 py-1" type="button" onclick="history.back()"> Back
						</button>
					</div>
				</div>
			</div>
			<br><br><br>
		</div>
		<script>

			$("#btnApprove").on("click", function () {
				$("#btnApproveLd").addClass("spinner-border spinner-border-sm");
				let data = {
					monthSheetId: $("#monthSheetId").val(),
					approved: true,
				}
				$.ajax({
					type: 'POST',
					url: 'month-sheet-change-status',
					data: JSON.stringify(data),
					contentType: 'application/json',
					success: function (data, msg, xh) {
						$("#btnSave").blur();
						$("#btnApproveLd").removeClass("spinner-border spinner-border-sm");
						swal({
							title: "Approve",
							text: "Approve timesheet",
							icon: "success",
						}).
							then(function (isOkay) {
								if (isOkay) {
									location.replace('/month-sheet');
								}
							});
					}, error: function (data, msg, xh) {
						$("#btnApproveLd").removeClass("spinner-border spinner-border-sm");
					}
				});
			});


			$("#btnReject").on("click", function () {
				console.log("hsivam");
				$("#btnRejectLd").addClass("spinner-border spinner-border-sm");
				let data = {
					monthSheetId: $("#monthSheetId").val(),
					approved: false,
				}
				$.ajax({
					type: 'POST',
					url: 'month-sheet-change-status',
					data: JSON.stringify(data),
					contentType: 'application/json',
					success: function (data, msg, xh) {
						$("#btnSave").blur();
						$("#btnRejectLd").removeClass("spinner-border spinner-border-sm");
						swal({
							title: "Reject",
							text: "Timeheet Reject",
							icon: "success",
						}).
							then(function (isOkay) {
								if (isOkay) {
									location.replace('/month-sheet');
								}
							});
					}, error: function (data, msg, xh) {
						$("#btnRejectLd").removeClass("spinner-border spinner-border-sm");
					}

				});
			});

		</script>
	</body>

	</html>