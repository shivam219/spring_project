<%if(session.getAttribute("empId")==null){
	response.sendRedirect("login");
} %>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- CSS-5.0.2  | JS-5.0.2 | -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">

	<!--Google Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;400;500;600;700&family=Tai+Heritage+Pro:wght@700&display=swap" rel="stylesheet">
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="js/select2.min.js"></script>
	<!--Font awesome icon -->
	<script src="https://kit.fontawesome.com/70c55b67fa.js" crossorigin="anonymous"></script>
	<link rel='icon' type='image/ico' href='images/esslogo.jpg' />
	<script src="css/sweetalert.min.js"></script>

</head>

<body>
	<div class="  bg-nav-foot m-0 py-2" >
	<!--  Nav -->
	<nav class="navbar navbar-expand-lg bg-nav-foot " >
		<div class="container-fluid">
			<a class="navbar-brand  d-lg-none d-block" href="#"> <img
					src="images/esslogo.jpg" alt="" width="100" height="40"
					class="d-inline-block align-text-top">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<i class="fas fa-sliders-h"></i>
				<!-- <span class="navbar-toggler-icon">	</span> -->
			</button>
			<div class="collapse navbar-collapse  " id="navbarNavDropdown">
				<ul class="navbar-nav ">
					<li class="nav-item d-none d-lg-block "><a class="navbar-brand" href="#"> <img
								src="images/esslogo.jpg" alt="" width="70" height="40"
								class="d-inline-block align-text-top">

						</a></li>

						<li class="nav-item  me-2"><a class="nav-link active" aria-current="page" href="home">Home</a>
						</li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="dropdown-menu" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
							Master </a>
						<ul class="dropdown-menu" id="dropdown-menu">
							<li><a class="dropdown-item" href="#">Project</a></li>
							<li><a class="dropdown-item" href="employee-master?page=1">Employee</a></li>
							<li><a class="dropdown-item" href="year-master">Year Master</a></li>
							<li><a class="dropdown-item" href="holiday-master">Holiday Master</a></li>
						</ul>
					</li>


					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="dropdown-menu" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
							Create Timesheet </a>
						<ul class="dropdown-menu" id="dropdown-menu">
							<li><a class="dropdown-item" href="work">Create Timesheet</a></li>
							<li><a class="dropdown-item" href="work-approve">Approve Timesheet</a></li>
							<li><a class="dropdown-item" href="#">Change Status</a></li>
						</ul>
					</li>

					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="dropdown-menu" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
							Leave Application </a>
						<ul class="dropdown-menu" id="dropdown-menu">
							<li><a class="dropdown-item" href="apply-leave">Apply Leave</a></li>
							<li><a class="dropdown-item" href="approve-leave">Approve Leave</a></li>
							<li><a class="dropdown-item" href="cancle-leave">Cancel Leave</a></li>
						</ul>
					</li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="dropdown-menu" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
							Reports </a>
						<ul class="dropdown-menu" id="dropdown-menu">
							<li><a class="dropdown-item" href="#">Employee Month
									Backup</a></li>
							<li><a class="dropdown-item" href="#">Month Wise Summary
									Reports</a></li>
							<li><a class="dropdown-item" href="leave-report">Monthly Leave Reports
							</a></li>
							<li><a class="dropdown-item" href="#">Check Approve
									Status</a></li>
							<li><a class="dropdown-item" href="#">Project Summary
									Report</a></li>
							<li><a class="dropdown-item" href="#">Project Overshot
									Report</a></li>
							<li><a class="dropdown-item" href="#">Project Wish
									Overshot Report</a></li>
							<li><a class="dropdown-item" href="#">Project Employee
									Breakdown</a></li>
							<li><a class="dropdown-item" href="#">Employee Details
									Breakdown</a></li>

						</ul>
					</li>
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="dropdown-menu" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">
							Admin </a>
						<ul class="dropdown-menu" id="dropdown-menu">
							<li><a class="dropdown-item" href="#">Program Master</a></li>
							<li><a class="dropdown-item" href="projectmap">Project Mapping</a></li>
							<li><a class="dropdown-item" href="#">Program Wise
								Master</a></li>
								<li><a class="dropdown-item" href="project-dashboard">Project Dashboard</a></li>
								<li><a class="dropdown-item" href="customer-dashboard">Customer Dashboard</a></li>		
								<li><a class="dropdown-item" href="change-password">Change Password </a></li>
								<li><a class="dropdown-item" href="user-master">User Details Master</a></li>
								<li><a class="dropdown-item" href="user-group-master">User Group Master</a></li>
								<li><a class="dropdown-item" href="user-group-mapping-master">User Group Mapping</a></li>
						</ul>
					</li>
					<li class="nav-item" style="margin-left:360px;"><a class="nav-link active" aria-current="page" href="logout"><i class="fa fa-user-o"></i>&nbsp;Sandeep Kumar Gupta&nbsp;&nbsp;<i class="fa fa-sign-out"></i></a>
					</li>
					<li class="nav-item  me-2"><a class="nav-link active" aria-current="page" href="logout"></a></li>
				</ul>
			</div>
		</div>
	</nav>
</div>
</body>

</html>