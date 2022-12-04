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
</style>

<body>
	<div class="container">
		<div class="row align-items-center mt-5">
			<div class="col-md-6">
				<div>
					<h5 class="card-title ms-2" style="color: #124265;">Approved Leave Report</h5>
				</div>
			</div>
			<div class="col-md-6">
				<div class="d-flex flex-wrap align-items-center justify-content-end gap-2 me-2 mb-1 ">
					<div>
						<label for="year" class="starlabel" style="color: #124265;">&nbsp;&nbsp;Year</label>
						<select class="form-select" aria-label="Default select example" name="Year" id="leaveYearSelect"
							onchange="getAllLeave()">
							<option value="">-------select------</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
						</select>
					</div>
					<div>
						<label for="Month" class="starlabel" style="color: #124265;">&nbsp;&nbsp;Month</label>
						<select class="form-select" aria-label="Default select example" name="Month"
							id="leaveMonthSelect" onchange="getAllLeave()">
							<option value="">-------select------</option>
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
		<div class="row">
			<div class="col-lg-12">
				<div class="">
					<div class="table-responsive" style="border-radius: 8px;">
						<table class="table project-list-table table-hover table-nowrap align-middle table-borderless"
							id="tableholiday">
							<thead>
								<tr class="text-white" style="font-size:15px; background-color:#124265;">
									<td scope="col" class="text-white">Leave Id</td>
									<td scope="col" class="text-white">Employee Id</td>
									<td scope="col" class="text-white">Employee Name</td>
									<td scope="col" class="text-white">Manager Name</td>
									<td scope="col" class="text-white">Leave Type</td>
									<td scope="col" class="text-white">Start Date</td>
									<td scope="col" class="text-white">End Date</td>
									<td scope="col" class="text-white">Day Mode</td>
									<td scope="col" class="text-white">Day Count</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${leaveList}" var="l" varStatus="i">
									<tr>
										<td style="font-size:14px;">${l.getLeaveId()}</td>
										<td style="font-size:14px;">${l.getEmpId()}</td>
										<td style="font-size:14px;">${l.getEmpName()}</td>
										<td style="font-size:14px;">${l.getManagerName()}</td>
										<td style="font-size:14px;">${l.getLeaveType()}</td>
										<td style="font-size:14px;">${l.getStartDate()}</td>
										<td style="font-size:14px;">${l.getEndDate()}</td>
										<td style="font-size:14px;">${l.getDayMode()}</td>
										<td style="font-size:14px;">${days[ i.index]}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="row align-items-center mt-2">
			<div class="col">
				<div class="d-flex flex-wrap align-items-center justify-content-center gap-2 mb-1 ">
					<div>
						<a href="/download/leave.xlsx?month=09&year=2022" class="btn btn-primary">Export</a>
						<a href="home" data-bs-target=".add-new" onclick="this.blur()" class="btn btn-danger">Back</a>
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