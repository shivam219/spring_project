<!DOCTYPE html>
<html>

<head>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;400;500;600;700&family=Tai+Heritage+Pro:wght@700&display=swap"
		rel="stylesheet">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<title>ESS Home </title>
	<link rel='icon' type='image/ico' href='ESSLogo.png' />
	<style>
		.bg-nav-foot {
			background-color: #333;
		}

		.dropdown:hover .dropdown-menu {
			display: block;
			margin-top: 2px;
		}


		.navbar-nav li {

			font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
			color: #e9e7e7;

		}

		.navbar-nav li a {
			font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
			color: #e9e7e7;
		}

		.navbar-nav li a:hover {
			font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
			color: #e9e7e7;
		}

		.dropdown-menu li a {
			font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
			color: #444141;
		}
	</style>
</head>

<body>
	<!-- <div class="fixed-top bg-nav-foot  m-0 p-0" > -->
	<!-- Nav -->
	<nav class="navbar navbar-expand-lg bg-nav-foot">
		<div class="container-fluid">
			<a class="navbar-brand  d-lg-none d-block" href="#">
				<img src="https://esstools.net.in/Timesheet/images/esslogo.png" alt="" width="70" height="40"
					class="d-inline-block align-text-top">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse  " id="navbarNavDropdown">
				<ul class="navbar-nav ">
					<li class="nav-item d-none d-lg-block ">
						<a class="navbar-brand" href="#">
							<img src="https://esstools.net.in/Timesheet/images/esslogo.png" alt="" width="70"
								height="40" class="d-inline-block align-text-top">

						</a>
					</li>

					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="dropdown-menu" role="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							Master
						</a>
						<ul class="dropdown-menu" id="dropdown-menu">
							<li><a class="dropdown-item" href="#">Project</a></li>
							<li><a class="dropdown-item" href="#">Employee</a></li>
							<li><a class="dropdown-item" href="#">Year Master</a></li>
							<li><a class="dropdown-item" href="#">Holiday Master</a></li>
						</ul>
					</li>


					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="dropdown-menu" role="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							Create Timesheet
						</a>
						<ul class="dropdown-menu" id="dropdown-menu">
							<li><a class="dropdown-item" href="#">Create Timesheet</a></li>
							<li><a class="dropdown-item" href="#">Approve Timesheet</a></li>
							<li><a class="dropdown-item" href="#">Change Status</a></li>
						</ul>
					</li>

					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="dropdown-menu" role="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							Leave Applicatin
						</a>
						<ul class="dropdown-menu" id="dropdown-menu">
							<li><a class="dropdown-item" href="#">Apply Leave</a></li>
							<li><a class="dropdown-item" href="#">Approve Leave</a></li>
							<li><a class="dropdown-item" href="#">Cancel Leave</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="dropdown-menu" role="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							Reports
						</a>
						<ul class="dropdown-menu" id="dropdown-menu">
							<li><a class="dropdown-item" href="#">Employee Month Backup</a></li>
							<li><a class="dropdown-item" href="#">Month Wise Summary Reports</a></li>
							<li><a class="dropdown-item" href="#">Check Approve Status</a></li>
							<li><a class="dropdown-item" href="#">Project Summary Report</a></li>
							<li><a class="dropdown-item" href="#">Project Overshot Report</a></li>
							<li><a class="dropdown-item" href="#">Project Wish Overshot Report</a></li>
							<li><a class="dropdown-item" href="#">Project Employee Breakdown</a></li>
							<li><a class="dropdown-item" href="#">Employee Details Breakdown</a></li>

						</ul>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="dropdown-menu" role="button" data-bs-toggle="dropdown"
							aria-expanded="false">
							Admin
						</a>
						<ul class="dropdown-menu" id="dropdown-menu">
							<li><a class="dropdown-item" href="#">Group Master</a></li>
							<li><a class="dropdown-item" href="#">Program Master</a></li>
							<li><a class="dropdown-item" href="#">User Mapping</a></li>
							<li><a class="dropdown-item" href="#">Program Wise Master</a></li>
							<li><a class="dropdown-item" href="#">Change Password </a></li>
							<li><a class="dropdown-item" href="#">User Details Master</a></li>
						</ul>
					</li>
					<li class="nav-item  me-2">
						<a class="nav-link active" aria-current="page" href="logout">Logout</a>
					</li>
					<li class="nav-item  me-2">
						<a class="nav-link active" aria-current="page" href="logout"></a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- End Nav -->
	<!-- </div> -->

	<!-- Footer -->
	<footer class="fixed-bottom  p-0">
		<div class="row">
			<div class="col m-0 p-0">
				<div class="text-center p-3 bg-nav-foot " style="color: #efe8e8;">
					&#169 2022 Copyright Enhanced Software Solution Pvt Ltd.</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer -->
</body>

</html>