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
	background: linear-gradient(45deg,  #6699cc,  #6699cc);
}

.bg-c-green {
	background: linear-gradient(45deg,   #6699cc,   #6699cc);
}

.bg-c-yellow {
	background: linear-gradient(45deg, #d49a48, #d49a48);
}

.bg-c-pink {
	background: linear-gradient(45deg, #fd476c, #fd476c);
}

.card {
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2.94px 0.06px rgba(4, 26, 55, 0.16);
	box-shadow: 0 1px 2.94px 0.06px rgba(4, 26, 55, 0.16);
	border: none;
	margin-bottom: 50px;
	-webkit-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}
.scrollit {
	overflow-y: auto;
	overflow-x:inherit ;
	height: 100px
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
	<div class="container">
		<div class="row">
			<div class="col-6 col-xl-6 mt-4">
				<div class="card bg-c-blue order-card">
					<div class="card-block" style="height: 300px;">
						<h6 class="text-center text-white" style="font-size: 18px;">Current Month Holidays&nbsp;<i class="bi bi-calendar"></i></h6>
						<br>
						<table class="table table-border text-white"
							style="font-size: 15px;">
							<thead>
								<tr>
									<th scope="col">Date</th>
									<th scope="col">Day</th>
									<th scope="col">Holiday</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>5 Oct</td>
									<td>Wednesday</td>
									<td>Dussera</td>
								</tr>
								<tr>
									<td>24 Oct</td>
									<td>Monday</td>
									<td>Diwali</td>
								  </tr>
								  <tr>
									<td>25 Oct</td>
									<td>Tuesday</td>
									<td>Diwali</td>
								  </tr>
								  <tr>
									<td>26 Oct</td>
									<td>Wednesday</td>
									<td>Diwali</td>
								  </tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-6 col-xl-6 mt-4">
				<div class="card bg-c-green  order-card">
					<div class="card-block" style="height: 300px;">
						<h6 class="text-center text-white" style="font-size: 18px;">Your Leave Balance Details&nbsp;<i class="bi bi-person"></i></h6>
						<br>
						<br>
						<table class="table table-border text-white"
							style="font-size: 15px;">
							<thead>
								<tr >
								   <th scope="col"></th>
									<th scope="col">Approved</th>
									<th scope="col">Reject</th>
									<th scope="col">Total</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">Oct 2022</th>
									<td>6</td>
									<td>3</td>
									<td>9</td>
								</tr>
								<tr>
									<th scope="row">Nov 2022</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								  </tr>
								  <tr>
									<th scope="row">Dec 2022</th>
									<td>6</td>
									<td>6</td>
									<td>12</td>
								  </tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>