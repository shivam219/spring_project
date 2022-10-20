<%@ include file="menu.jsp"%>
<head>
<title>ESS Home</title>
<link rel='icon' type='image/ico' href='ESSLogo.png' />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

</head>
<style>
body {
	background-color: #e2e2e2;
}

.order-card {
	color: #fff;
}

.bg-c-blue {

	background: linear-gradient(45deg,  #373b44, #4286f4);
}

.bg-c-green {
	 background: linear-gradient(45deg,   #5a2f2f,   #C70D39); 
}


.bg-c-yellow {
	background: linear-gradient(45deg, #FFB64D, #FFB64D);
}
/* .bg-c-blue {
    background: linear-gradient(45deg,#4099ff,#73b4ff);
}

.bg-c-green {
    background: linear-gradient(45deg,#2ed8b6,#59e0c5);
}

.bg-c-yellow {
    background: linear-gradient(45deg,#FFB64D,#ffcb80);
}

.bg-c-pink {
	background: linear-gradient(45deg, #a86008, #ffba56);
} */

.card {
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2.94px 0.06px rgba(4, 26, 55, 0.16);
	box-shadow: 0 1px 2.94px 0.06px rgba(4, 26, 55, 0.16);
	border: none;
	margin-bottom: 50px;
	-webkit-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.example {
  height: 160px;
  overflow-y: scroll;
}
.example::-webkit-scrollbar {
    display: none;
}
.example {
  -ms-overflow-style: none; 
  scrollbar-width: none;  
}
.card .card-block {
	padding: 25px;
}

.order-card i {
	font-size: 26px;
}

.f-left {
	float: left;
}

.f-right {
	float: right;
}
.table {
  border-spacing: 3em 2em;
  padding: 0 2em 1em 0;
  /* border: 1px solid orange; */
}
</style>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-4 col-xl-4 mt-5">
				<div class="card bg-c-blue order-card">
					<div class="card-block" style="height: 350px; ">
						<h6 class="text-center text-white" style="font-size: 18px;">Current Month Holidays&nbsp;<i class="fa-solid fa-calendar-days"></i></h6>

						<table class=" table text-white m-0 p-0 m-0 p-0 m-0 p-0 mt-4 " style="font-size: 15px;">
							<thead>
								<tr>
									<th scope="col" class="text-center">Holiday's</th>
								</tr>
							</thead>
						</table>
							<div class="example">
								<table class=" table table-border text-white">
							<tbody>
								<c:forEach items="${holidayList}" var="l">
							        <tr>
										<td class="text-center">${l}</td>
							        </tr>
							    </c:forEach>	
							</tbody>
						</table>
					</div>
					</div>
				</div>
			</div>
			<div class="col-4 col-xl-4 mt-5">
				<div class="card bg-c-blue order-card">
					<div class="card-block" style="height: 350px;">
						<h6 class="text-center text-white" style="font-size: 18px;">Birthday's for this month&nbsp;<i class="fa fa-birthday-cake" aria-hidden="true"></i></h6>

						<table class="table table-border text-white m-0 p-0 mt-4 " style="font-size: 15px;">
							<thead>
								<tr >
									<th scope="col" class="text-center">Birthday's</th>
								</tr>
							</thead>
							</table>
							<div class="example">
								<table class="table table-border text-white">
							<tbody class="text-center">
								<c:forEach items="${empList}" var="l">
							        <tr>
										<td class="text-center">${l}</td>
							        </tr>
							    </c:forEach>	
							</tbody>
						</table>
						</div>
					</div>
				</div>
			</div>

			<div class="col-4 col-xl-4 mt-5">
				<div class="card bg-c-blue  order-card">
					<div class="card-block" style="height: 350px;">
						<h6 class="text-center text-white" style="font-size: 18px;">Your Leave Balance Details&nbsp;<i class="fa-solid fa-user"></i></h6>
						<table class="table table-border text-white m-0 p-0 mt-4"
							style="font-size: 15px;">
							<thead>
								<tr>
								   <th scope="col"></th>
									<th scope="col">Approved</th>
									<th scope="col">Reject</th>
									<th scope="col">Cancelled</th>
									<th scope="col">Pending</th>
								</tr>
							</thead>
							<tbody class="text-center">
								<tr>
									<td id="yearmonth"></td>
									<td>${ac}</td>
									<td>${rc}</td>
									<td>${cc}</td>
									<td>${pc}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>

		const date = new Date();
		const month = date.toLocaleString('default', { month: 'long' });
		$("#yearmonth").html(month);
	</script>
</body>
</html>