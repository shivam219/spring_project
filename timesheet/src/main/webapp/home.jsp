<%@ include file="menu.jsp" %>

	<head>
		<title>ESS Home</title>
	</head>
	<style>
		.card {
			border-radius: 5px;
			-webkit-box-shadow: 0 1px 2.94px 0.06px rgba(4, 26, 55, 0.16);
			box-shadow: 0 1px 2.94px 0.06px rgba(4, 26, 55, 0.16);
			border: none;
			margin-bottom: 50px;
			-webkit-transition: all 0.3s ease-in-out;
			transition: all 0.3s ease-in-out;
			height: 250px;
		}

		.example {
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
			table-layout: fixed;
			font-size: 14px;
		}

		.table>:not(caption)>*>* {
			padding: 0px;
			background-color: var(--bs-table-bg);
			border-bottom-width: 0px;
			box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
		}

		a {
			color: #6c757d;
			text-decoration: none;
			padding-left: 6px;
		}
		tbody,
		td,
		td a tfoot,
		th,
		thead,
		tr {
			border-width: 0px;
		}
		::-webkit-scrollbar {
           width: 0px;
        }
	</style>

	<body>
		<div class="container-fluid">
			<div class="row mt-5">
				<div class="col-md-4">
					<div class="card ">
						<img class="" src="images/weatherbg.jpg" alt="Card image cap" style="max-height: 105px">
						<div class="card-img-overlay" style="height: 110px">
							<div class="d-flex align-items-center">
								<h4 class="card-title text-white mb-0">Holidays</h4>
								<div class="ms-auto">
									<h4><i class="fa-solid fa-calendar-days text-white"></i></h4>
								</div>
							</div>
						</div>
						<div class="card-body  overflow-scroll ">
							<div class="row"> 
								<div class="col align-self-center">
									<div class="d-flex">
										<div class="example"> 
											<div class="table-responsive">
												<table class="table text-secondary">
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
							</div>
						</div>
					</div>
				</div>

				<!-- leave balance -->
				<div class="col-md-4">
					<div class="card">
						<img class="" src="images/weatherbg.jpg" alt="Card image cap" style="max-height: 105px">
						<div class="card-img-overlay" style="height: 110px">
							<div class="d-flex align-items-center">
								<h4 class="card-title text-white mb-0">Leave Details</h4>
								<div class="ms-auto">
									<h4><i class="text-white fa fa-solid fa-user "></i></h4>
								</div>
							</div>
						</div>
						<div class="card-body ">
							<div class="row">
								<div class="col align-self-center">
									<div class="d-flex">
										<div class="example">
											<table class=" table text-secondary text-center">
												<tbody>
													<tr>
														<td class="text-center"></td>
														<td class="text-center"><a href="leave-console">Approve</a></td>
														<td class="text-center"><a href="leave-console">Reject</a></td>
														<td class="text-center"><a href="leave-console">Cancel</a></td>
														<td class="text-center"><a href="leave-console">Pending</a></td>
													</tr>
													<tr>
														<td class="text-center" id="yearmonth"></td>
														<td class="text-center">${ac}</td>
														<td class="text-center">${rc}</td>
														<td class="text-center">${cc}</td>
														<td class="text-center">${pc}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- Birthdays -->
				<div class="col-md-4">
					<div class="card">
						<img class="" src="images/weatherbg.jpg" alt="Card image cap" style="max-height: 105px">
						<div class="card-img-overlay" style="height: 110px">
							<div class="d-flex align-items-center">
								<h4 class="card-title text-white mb-0">Birthdays</h4>
								<div class="ms-auto">
									<h4><i class="fa fa-birthday-cake text-white"></i></h4>
								</div>
							</div>
						</div>
						<div class="card-body ">
							<div class="row">
								<div class="col align-self-center">
									<div class="d-flex">
										<div class="example">
											<table class="table text-secondary">
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
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			const date = new Date();
			const month = date.toLocaleString('default', { month: 'long' });
			$("#yearmonth").html(month.slice(0, 3));
		</script>
	</body>

	</html>