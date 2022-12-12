<%@ include file="menu.jsp" %>
	<html>

	<head>
		<title>Month Sheet </title>
		<style>
			tbody,
			td,
			td a tfoot,
			th,
			thead,
			tr {
				/* font-family: Verdana;
	border-width: 1px;
	border-collapse: collapse;
	font-style: normal;
	font-family: Verdana, Geneva, Tahoma, sans-serif;
	color: rgb(83, 83, 82); */
	white-space: normal;
}
		</style>
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
					<span class="  badge-soft-primary px-3 align-self-center pt-1 pb-2 me-2"> Day Sheet (${monthSheetDataList.size()})</span>
				</div>
				<div class="col-md-6 ">
					<div class="d-flex justify-content-md-end  mb-1">
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
						<!-- <table class=""> -->
						<table class="table  project-list-table align-middle table-borderless" id="monthTable">
							<thead class="thead-dark">
								<th class="text-center " scope="row">Date</th>
								<th class="text-center " scope="row">Project Name</th>
								<th class="text-center " scope="row">Description</th>
								<th class="text-center " scope="row">Hour</th>
							</thead>
							<tbody>

								<c:forEach items="${monthSheetDataList1}" var="md" varStatus="loop">
									<tr>
										<td class="text-center ">${md.getDate()}</td>
										<td class="text-center ">${md.getProjectName()}</td>
										<td class="text-center ">${md.getDescr()}</td>
										<td class="text-center ">${md.getHour()}</td>
									</tr>
								</c:forEach>
								<c:if test='${monthSheetDataList.size() eq 0 }'>
									<tr>
										<td colspan="4" class="text-center"> No data </td>
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

			$(document).ready(function () {
				$.ajax({
					type: 'GET',
					url: 'fetch-month-sheet-employee-approve?monthSheetId=' + $("#monthSheetId").val() + '',
					contentType: 'application/json',
					success: function (d, msg, xh) {

						let d2 = [];
						let set = new Set();
						if(d.length>0){
							set.add(d[0]['date']);
							d2.push(d[0]);
							for (let i = 1; i < d.length; i++) {
								if(set.has(d[i]['date'])){
									d2.push(d[i]);
								}else{
									let hour = parseInt(d2[0]['hour']);
									let hours = parseInt(d2[0]['hour']);
									let tr = 	'<tr>' 
												+'<td class="text-center " rowspan= '+ parseInt(d2.length)+' > ' + d2[0]['date'] + ' </td>'
												+'<td class="text-center " > ' + d2[0]['projectName'] + ' </td>'
												+'<td  > ' + d2[0]['descr'] + ' </td>'
												+'<td class="text-center " > ' + d2[0]['hour'] + ' </td>'
												+'</tr> ';
										$("#monthTable").append(tr);
										for (let j = 1; j < d2.length; j++) {
											hours = hours+ parseInt(d2[j]['hour']); 
											let tri = '<tr > '
														+'<td class="text-center" > ' + d2[j]['projectName'] + ' </td>'
														+'<td  > ' + d2[j]['descr'] + ' </td>'
														+'<td  class="text-center " > ' + d2[j]['hour'] + ' </td>'
														+'</tr> ';
										$("#monthTable").append(tri);
									}
									if(hour!=hours){
										$("#monthTable").append('<tr><td></td><td></td><td></td><td  class="text-center fw-bold">'+hours+'</td></tr>');
									}
									set.clear();
									set.add(d[i]['date']);
									d2=[];
									d2.push(d[i]);
								}
								if(i == d.length-1){
									let hour = parseInt(d2[0]['hour']);
									let hours = parseInt(d2[0]['hour']);
									let tr = 	'<tr>' 
												+'<td class="text-center " rowspan= '+ parseInt(d2.length)+' > ' + d2[0]['date'] + ' </td>'
												+'<td class="text-center " > ' + d2[0]['projectName'] + ' </td>'
												+'<td  > ' + d2[0]['descr'] + ' </td>'
												+'<td class="text-center " > ' + d2[0]['hour'] + ' </td>'
												+'</tr> ';
										$("#monthTable").append(tr);
										for (let j = 1; j < d2.length; j++) {
											hours = hours+ parseInt(d2[j]['hour']); 
											let tri = '<tr > '
														+'<td class="text-center" > ' + d2[j]['projectName'] + ' </td>'
														+'<td  > ' + d2[j]['descr'] + ' </td>'
														+'<td  class="text-center " > ' + d2[j]['hour'] + ' </td>'
														+'</tr> ';
										$("#monthTable").append(tri);
									}
									if(hour!=hours){
										$("#monthTable").append('<tr><td></td><td></td><td ></td><td  class="text-center fw-bold">'+hours+'</td></tr>');
									}
								}
							}
						}
					}
				})
			});
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