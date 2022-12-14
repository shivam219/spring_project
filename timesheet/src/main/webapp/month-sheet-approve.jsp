<%@ include file="menu.jsp" %>
	<html>

	<head>
		<title>Month Sheet</title>
		<style>
			tbody,
			td,
			td a tfoot,
			th,
			thead,
			tr {white-space: normal;}
			td span:hover{
            cursor: pointer;
        }
        table{
            table-layout: fixed;
        }
        tbody, td, td a tfoot, th, thead, tr {
            white-space: normal;
        }
		.my-border{

			border-collapse: collapse;
		}
		</style>
	</head>


	<body>
		<input type="hidden" value="${empMonthSheet.getMonthSheetId()}" id="monthSheetId">
		<div class="container">
			<h1 class=" h4 m-0 my-3 py-2 fw-normal  dashboard-headling "> Approve Timesheet </h1>
			<div class="">
				<div class="row py-1 ">
					<div class="col">   
						<div class="card d-flex flex-row gap-3 justify-content-center py-1">
						 <div> <span class="card-title "> Employee Name : ${empMonthSheet.getEmployeeName()}</span></div>
						 <div> <span class="card-title ">Month : ${empMonthSheet.getMonth()}</span> </div>
						 <div> <span class="card-title ">	Year : ${empMonthSheet.getYear()}</span></div>
					</div>
				</div>  
			</div>
			<div class="row">
				<div class="col-md-6 mb-3 mb-md-0 ">
					<span class="  badge-soft-primary px-3 align-self-center pt-1 pb-2 me-2"> Day Sheet (${monthDto.size()})</span>
				</div>
				<div class="col-md-6 ">
					<div class="d-flex justify-content-md-end  mb-1">
						<button type="button" class="btn btn-primary btn-sm  btn-sm px-md-4  me-2 " id="btnApprove">
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
						<table class="table  project-list-table align-middle table-borderless" id="monthTable">
							<thead class="thead-dark">
								<th class="text-center" >Date</th>
								<th class="text-center" >Hour</th>
								<th class="text-center" colspan="6" >Description</th>
							</thead>
							<tbody>
								<c:forEach items="${monthDto}" var="d">
									<tr>
										<td class="text-center" >${d.getDate()}</td>
										<td class="text-center" >${d.getTotalHour()}</td> 
 										<td colspan="6">
											 <span style='font-size:28px;user-select: none;' >&#9656;</span>
											<c:forEach items="${d.getDataDtos()}" var="dd">
												<div style="display: none;"> 
													<div class="row  m-0 p-0 ">
														<div class="col-3 ">${dd.getProjectName()}</div> 
														<div class="col-8 "> <p>${dd.getDescr()}</p> </div>   
														<div class="col-1 ">${dd.getHour()}</div>
													</div>
												</div> 
											</c:forEach>
										</td>
									</tr> 
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div>
						<button class="btn btn-secondary btn-sm btn-sm px-5 py-1" type="button" onclick="history.back()"> Back
						</button>
					</div>
				</div>
			</div>
			<br><br><br>
		</div>
		<script>
			  $("td span").on("click",function(t1){
            $(this).siblings("div").toggle();
            if( $(this).siblings("div").css('display') == 'none'){
                $(this).html("&#9656;");
                $(this).css("color","#535352");
            }else{
                $(this).html("&#9662;"); 
                $(this).css("color","red");
            }
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
							button: false, 
						});
						// console.log(swal());
						location.replace('month-sheet');
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
							button: false, 
						})

						location.replace('month-sheet');
					}, error: function (data, msg, xh) {
						$("#btnRejectLd").removeClass("spinner-border spinner-border-sm");
					}

				});
			});
		</script>
	</body>

	</html>