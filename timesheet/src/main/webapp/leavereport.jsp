<%@ include file="menu.jsp" %>
<html>

<head>
	<meta charset="UTF-8">
	<title>Monthly Leave Report</title>

</head>
<style>
	tbody,
	td,
	td a tfoot,
	th,
	thead,
	tr {
		border-width: 0px;
		border-collapse: collapse;
	}
	td{
		/* font-size:14px; */
	}
</style>

<body>
	<div class="container">
		<h1 class=" h4 m-0 my-3 py-2 fw-normal  dashboard-headling ">Approved Leave Report </h1>
		<div class="row align-middle  pt-2 mx-0  rounded-top bg-white "   >
			<div class="col"></div>
			<div class="col d-flex justify-content-between  align-middle gap-2">   
				<span class="text-center align-middle mt-1 "> Year</span>
				<select class="form-control form-select  " name="Year" id="leaveYearSelect" onchange="getAllLeave()">
					<option value="">Choose</option>
					<option value="2020">2020</option>
					<option value="2021">2021</option> 
					<option value="2022">2022</option>
				</select>
				<span class="text-center align-middle mt-1 "> Month</span>
				<select class="form-control form-select "  name="Month" id="leaveMonthSelect" onchange="getAllLeave()">
					<option value="">Choose</option>
					<option value="01">January</option>
					<option value="02">February</option>
					<option value="03">March</option>
					<option value="04">April</option>
					<option value="05">May</option>
					<option value="06">June</option>
					<option value="07">July</option>
					<option value="08">August</option>
					<option value="09">September</option>
					<option value="10">October</option>
					<option value="11">November</option>
					<option value="12">December</option>
				</select>
			</div>
			<div class="col"></div>
		</div>
		<!-- no need of this -->
		<div class="row align-items-center mt-2 d-none"> 
			<!-- <div class="col-md-6">
				<div>
					<h5 class="card-title ms-2" style="color: #124265;">Approved Leave Report</h5>
				</div>  
			</div> -->
			<div class="col  ">
				<div class="d-flex flex-wrap align-items-center   gap-2  ">
					<div class="d-flex">
						<span for="year" class=" badge-soft-primary" >Year</span>
						<select class="form-control form-select d-flex " aria-label="Default select example" name="Year" id="leaveYearSelect"
							onchange="getAllLeave()">
							<option value="">Choose</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
						</select>
					</div>
					<div class="d-flex">
						<label for="Month" class="starlabel" style="color: #124265;">&nbsp;&nbsp;Month</label>
						<select class="form-select" aria-label="Default select example" name="Month" id="leaveMonthSelect" onchange="getAllLeave()">
							<option value="">Choose</option>
							<option value="01">January</option>
							<option value="02">February</option>
							<option value="03">March</option>
							<option value="04">April</option>
							<option value="05">May</option>
							<option value="06">June</option>
							<option value="07">July</option>
							<option value="08">August</option>
							<option value="09">September</option>
							<option value="10">October</option>
							<option value="11">November</option>
							<option value="12">December</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-1">
			<div class="col-lg-12">
				<div class="">
					<div class="table-responsive" style="border-radius: 8px;">
						<table class="table project-list-table table-hover table-nowrap align-middle table-borderless"
							id="tableholiday">
							<thead>
								<tr class="text-white" style="font-size:15px; background-color:#124265;">
									<th scope="col" class="text-white">Leave Id</th>
									<th scope="col" class="text-white">Employee Id</th>
									<th scope="col" class="text-white">Employee Name</th>
									<th scope="col" class="text-white">Manager Name</th>
									<th scope="col" class="text-white">Leave Type</th>
									<th scope="col" class="text-white">Start Date</th>
									<th scope="col" class="text-white">End Date</th>
									<th scope="col" class="text-white">Day Mode</th>
									<th scope="col" class="text-white">Day Count</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${leaveList}" var="l" varStatus="i">
									<tr>
										<td >${l.getLeaveId()}</td>
										<td >${l.getEmpId()}</td>
										<td >${l.getEmpName()}</td>
										<td >${l.getManagerName()}</td>
										<td >${l.getLeaveType()}</td>
										<td >${l.getStartDate()}</td>
										<td >${l.getEndDate()}</td>
										<td >${l.getDayMode()}</td>
										<td >${l.getDays()}</td>
									</tr>
								</c:forEach> 
								<c:if test='${leaveList.size()== 0}'>   
									<tr class="border">
										<td colspan="9" class="bg-white text-center fw-normal h5 p-2 "> No Data</td>
									</tr>
								</c:if>
								<c:if test='${leaveList == null}'>   
									<tr class="border">
										<td colspan="9" class="bg-white text-center fw-normal h5 p-2 "> No Data</td>
									</tr>
								</c:if>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="row align-items-center mt-2">
			<div class="col">
				<div class="d-flex flex-wrap align-items-center justify-content-center gap-2">
					<div>
						<a href="/download/leave.xlsx?month=09&year=2022" class="btn px-3 btn-sm btn-primary ">Export</a>
					</div>
					<div>
						<a href="home"  onclick="this.blur()" class="btn px-3 btn-sm btn-secondary">Back</a>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<form action="/leave-report" method="post" id="leaveMonthReport">
			<input type="hidden" name="leaveMonth" id="leaveMonth">
			<input type="hidden" name="leaveYear" id="leaveYear">
		</form>
		<form action="/leave-report">
			<input type="hidden" name="userleaveYear" value="${year}" id="userleaveYear">
			<input type="hidden" name="userleaveMonth" value="${month}" id="userleaveMonth">
		</form>
	</div>
	<script>
		$(document).ready(function () {
			if ($("#userleaveMonth").val() === "no") {
			} else {
				$("#leaveYearSelect").val($("#userleaveYear").val());
				$("#leaveMonthSelect").val($("#userleaveMonth").val());
			}
		})
		function getAllLeave() {
			var ly = $("#leaveYearSelect").val();
			var lm = $("#leaveMonthSelect").val();
			if ($("#leaveYearSelect").val() && $("#leaveMonthSelect").val()) {
				console.log("both has");
				$("#leaveMonth").val(lm);
				$("#leaveYear").val(ly);
				$("#leaveMonthReport").submit();
			}
		}
	</script>
</body>

</html>