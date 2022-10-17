<%@ include file="menu.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Monthly Leave Report</title>
</head>
<style>
.container {
	box-shadow: 0px 0px 15px rgb(0 0 0/ 49%), inset -2px -2px 3px
		rgb(0 0 0/ 25%);
}

.buttons {
	text-align: center;
}

.h2 {
	font-family: 'PT Sans', sans-serif;
	font-size: 25px;
}

.starlabel:after {
	content: " *";
	color: red;
}

table {
	table-layout: fixed;
}

body {
	background-color: #eee;
	/* background-color:#f2f6fc; */
}

.project-list-table {
	border-collapse: separate;
	border-spacing: 0 12px
}

.project-list-table tr {
	background-color: #fff
}

.table-nowrap td, .table-nowrap th {
	white-space: nowrap;
}

.table-borderless>:not(caption)>*>* {
	border-bottom-width: 0;
}

.table>:not(caption)>*>* {
	padding: 0.75rem 0.75rem;
	background-color: var(- -bs-table-bg);
	border-bottom-width: 1px;
	box-shadow: inset 0 0 0 9999px var(- -bs-table-accent-bg);
}

.rounded-circle {
	border-radius: 30% !important;
}

.me-2 {
	margin-right: 0.5rem !important;
}

a {
	color: #3b76e1;
	text-decoration: none;
}

.badge-soft-danger {
	color: #f56e6e !important;
	background-color: rgba(245, 110, 110, .1);
}

.badge-soft-success {
	color: #63ad6f !important;
	background-color: rgba(99, 173, 111, .1);
}

.badge-soft-primary {
	color: #3b76e1 !important;
	background-color: rgba(59, 118, 225, .1);
}

.badge-soft-info {
	color: #57c9eb !important;
	background-color: rgba(87, 201, 235, .1);
}

.avatar-title {
	align-items: center;
	background-color: #3b76e1;
	color: #fff;
	display: flex;
	font-weight: 500;
	height: 100%;
	justify-content: center;
	width: 100%;
}

.bg-soft-primary {
	background-color: rgba(59, 118, 225, .25) !important;
}
</style>
<body>
	<div class="container mt-3">
		<div class="row text-center">
			<div class="col">
                <div class="form-group row mt-4 justify-content-center">
                    <label for="year" class="col-sm-1 col-form-label starlabel">Year</label>
                    <div class="col-sm-2">
                 <select class="form-select" aria-label="Default select example" name="Year" id="leaveYearSelect" onchange="getAllLeave()">
					<option value="">-------select------</option>
                        <option value="2020">2020</option>
						<option value="2021">2021</option>
                        <option value="2022">2022</option>
                    </select>
                    </div>

                <label for="month" class="col-sm-1 col-form-label starlabel">Month</label>
                 <div class="col-sm-2"> 
                   <select class="form-select" aria-label="Default select example" name="Month" id="leaveMonthSelect" onchange="getAllLeave()">
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
		    <div class="table-responsive mt-2">
				<table class="table project-list-table table-nowrap align-middle table-borderless">
					<thead>
						<tr class="table-dark">
						<td scope="col">Leave Id</td>
						<td scope="col">Employee Id</td>
						<td scope="col">Employee Name</td>
						<td scope="col">Manager Name</td>
						<td scope="col">Leave Type</td>
						<td scope="col">Starting Date</td>
						<td scope="col">Ending Date</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${leaveList}" var="l">
							<tr>
								<td>${l.getLeaveId()}</td>
								<td>${l.getEmpId()}</td>
								<td>${l.getEmpName()}</td>
								<td>${l.getManagerName()}</td>
								<td>${l.getLeaveType()}</td>
								<td>${l.getStartDate()}</td>
								<td>${l.getEndDate()}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
 	</div>
 </div>
		<div class="buttons mt-2">
			<a href="/download/leave.xlsx?month=09&year=2022" class="btn btn-primary btn-sm ps-4 pe-4">Export</a>
			<a href="home"><button type="button" class="btn btn-secondary btn-sm ps-4 pe-4 ">Exit</button> </a>
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
	
		<script>
			$(document).ready(function() {
				if ($("#userleaveMonth").val() === "no") {
				} else {
					$("#leaveYearSelect").val($("#userleaveYear").val());
					$("#leaveMonthSelect").val($("#userleaveMonth").val());
				}
			})
			function getAllLeave() {
				var ly = $("#leaveYearSelect").val();
				var lm = $("#leaveMonthSelect").val();
				if($("#leaveYearSelect").val()&& $("#leaveMonthSelect").val()){
					console.log("both has");
						$("#leaveMonth").val(lm);
						$("#leaveYear").val(ly);
						$("#leaveMonthReport").submit();
				}
				// if (lm != "no" && ly != "no") {
				// }
			}
		</script>
</body>
</html>