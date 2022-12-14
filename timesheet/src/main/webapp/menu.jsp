<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>  
<c:if test="${empId == null}">
	<c:redirect url="login"/>  
</c:if>
<!DOCTYPE html>
<html> 
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- CSS-5.0.2  | JS-5.0.2 | -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<!--Google Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=nihilPoppins:wght@100;200;400;500;600;700&family=Tai+Heritage+Pro:wght@700&display=swap" rel="stylesheet">
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.6.0.min.js"></script>
	<!-- <script src="js/select2.min.js"></script> -->
	<!--Font awesome icon -->
	<script src="https://kit.fontawesome.com/70c55b67fa.js" crossorigin="anonymous"></script>
	<link rel='icon' type='image/ico' href='images/esslogo.png' />
	<script src="css/sweetalert.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<style>
		.navbar-light .navbar-nav .navbar-link{
		color: #02121f;
		} 
	</style> 
</head>

<body> 
	<div class="container-fluid">
		<div class="row">

		<nav class="navbar navbar-expand-lg navbar-light d-none" style="background-color: #fff;border-bottom: 2px solid #e6f2fb;">
		<div class="container-fluid"> 
			<a class="navbar-brand" href="home"> <img 
					src="images/esslogo.png" width="100" height="40" class="d-inline-block align-text-top">
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				 <span class="navbar-toggler-icon">	</span>
			</button> 	
			<div class="collapse navbar-collapse justify-content-md-end " id="navbarNavDropdown">
				<div class="justify-content-md-end">
					<ul class="navbar-nav">
						<li	 class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="dropdown-menu" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Master </a>
							<ul class="dropdown-menu" id="dropdown-menu">
								<li><a class="dropdown-item" href="project-master">Project</a></li>
								<li><a class="dropdown-item" href="customer-master">Customer</a></li>		
								<li><a class="dropdown-item" href="employee-master?page=1">Employee</a></li>
								<li><a class="dropdown-item" href="year-master">Year</a></li>
								<li><a class="dropdown-item" href="holiday-master">Holiday</a></li>
								<li>
									<a class="dropdown-item" href="#">  Submenu &raquo; 	</a>
									<ul class="dropdown-menu dropdown-submenu">
									  <li> <a class="dropdown-item" href="#">Submenu item 1</a>  </li>
									  <li> <a class="dropdown-item" href="#">Submenu item 2</a>   </li>
									</ul>
								</li>
							</ul>
						</li>	 
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="dropdown-menu" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Create Timesheet </a>
							<ul class="dropdown-menu" id="dropdown-menu">
								<li><a class="dropdown-item" href="day-sheet">Create Timesheet </a></li>  
								<li><a class="dropdown-item" href="month-sheet">Approve Timesheet </a></li>
								<li><a class="dropdown-item" href="#">Change Status</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle -2" href="dropdown-menu" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Leave Application </a>
							<ul class="dropdown-menu" id="dropdown-menu"> 
								<li><a class="dropdown-item" href="leave-console">Leave Console</a></li>
								<li><a class="dropdown-item" href="apply-leave">Apply Leave</a></li>
								<li><a class="dropdown-item" href="approve-leave">Approve Leave</a></li>
								<li><a class="dropdown-item" href="cancle-leave">Cancel Leave</a></li>
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle -2" href="dropdown-menu" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Reports </a>
							<ul class="dropdown-menu" id="dropdown-menu">    
								<li><a class="dropdown-item" href="report-month-employee">Employee Monthly Report</a></li>
								<li><a class="dropdown-item" href="#">Month Wise Summary Reports</a></li>
								<li><a class="dropdown-item" href="leave-report">Monthly Approve Leave Reports </a></li>
								<li><a class="dropdown-item" href="employee-wise-report">Employee Wise Leave Reports </a></li>
								<li><a class="dropdown-item" href="pending-leave-report">Monthly Pending Leave Reports </a></li>
								<li><a class="dropdown-item" href="report-month-check">Check Approve Status</a></li> 
								<li><a class="dropdown-item" href="#">Project Summary Report</a></li>
								<li><a class="dropdown-item" href="#">Project Overshot Report</a></li>
								<li><a class="dropdown-item" href="#">Project Wish Overshot Report</a></li>
								<li><a class="dropdown-item" href="#">Project Employee Breakdown</a></li>
								<li><a class="dropdown-item" href="#">Employee Details Breakdown</a></li>			
							</ul>
						</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle -3" href="dropdown-menu" role="button" data-bs-toggle="dropdown" aria-expanded="false"> Admin </a>
							<ul class="dropdown-menu" id="dropdown-menu">
								<li><a class="dropdown-item" href="program-master">Program Master</a></li>
								<li><a class="dropdown-item" href="user-master">User Details Master</a></li>
								<li><a class="dropdown-item" href="user-group-master">User Group Master</a></li>
							</ul>
						</li> 
						<li class="nav-item dropdown justify-content-end">
							<a class="nav-link dropdown-toggle " href="dropdown-menu" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-circle-user ms-me-1"></i> ${empName} </a>
							<div class="justify-content-end">
								<ul class="dropdown-menu text-center" id="dropdown-menu">
									<li><a class="dropdown-item" href="change-password">Change Password </a></li>
									<li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt fa-sm fa-fw text-dark-400"></i> Logout</a></li>
								</ul>
							</div>
						</li>								
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #fff;border-bottom: 2px solid #e6f2fb;">
	<div class="container-fluid"> 
		<a class="navbar-brand" href="home"> <img src="images/esslogo.png" width="100" height="40" class="d-inline-block align-text-top"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">	 <span class="navbar-toggler-icon">	</span></button> 	
		<div class="collapse navbar-collapse justify-content-md-end " id="navbarNavDropdown">
			<div class="justify-content-md-end">
				<ul class="navbar-nav">
					<sql:setDataSource 
						var="db" 
						driver="com.mysql.cj.jdbc.Driver" 
						url="jdbc:mysql://localhost/ess"  
						user="root"  
						password="Shivam@219@"
					/>  
					<sql:query dataSource="${db}" var="rs">  
						SELECT a.prg_code prg_code, a.prg_desc prg_desc, a.prg_order from timesheet_program_master a,  timesheet_program_groupwise b
						WHERE a.PRG_PRNT is null
						and a.prg_code = b.prg_code
						and b.ugrp_code = ${ugrpCode}
						order by a.prg_order,prg_code;
					</sql:query>  
					<c:forEach var="table" items="${rs.rows}">  
						<li	 class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="dropdown-menu" role="button" data-bs-toggle="dropdown" aria-expanded="false"> ${table.prg_desc} </a>
							<ul class="dropdown-menu" id="dropdown-menu">
								<sql:query dataSource="${db}" var="rs2">  
									SELECT a.prg_code prg_code, a.prg_name prg_name, a.prg_desc prg_desc, a.prg_order
									from timesheet_program_master a, timesheet_program_groupwise b
									WHERE a.PRG_PRNT = ${table.prg_code} 
									and a.prg_code=b.prg_code
									and b.ugrp_code= ${ugrpCode}
									order by a.prg_order;
								</sql:query>  
								<c:forEach var="table2" items="${rs2.rows}"> 
									<sql:query dataSource="${db}" var="rs3">  
										SELECT a.prg_code prg_code, a.prg_name prg_name, a.prg_desc prg_desc, a.prg_order
										from timesheet_program_master a, timesheet_program_groupwise b
										WHERE a.PRG_PRNT = ${table2.prg_code} 
										and a.prg_code=b.prg_code
										and b.ugrp_code= ${ugrpCode}
										order by a.prg_order;
									</sql:query>  
									<c:if test="${ rs3.getRowCount() > 1 }">
										<li>
											<a class="dropdown-item" href="${table2.prg_name}">${table2.prg_desc}&raquo;</a>
											<ul class="dropdown-menu dropdown-submenu">
												<c:forEach var="table3" items="${rs3.rows}"> 
													<li> <a class="dropdown-item" href="${table3.prg_name}">${table3.prg_desc}</a>  </li>
												</c:forEach>	   
											</ul>
										</li>			 
									</c:if>
									<c:if test="${rs3.getRowCount() eq 0 }">
										<li><a class="dropdown-item" href="${table2.prg_name}">${table2.prg_desc} </a></li>
									</c:if>
								</c:forEach>
							</ul>
						</li>	 
					</c:forEach>  

					<li class="nav-item dropdown justify-content-end">
						<a class="nav-link dropdown-toggle " href="dropdown-menu" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-circle-user ms-me-1"></i> ${empName} </a>
						<ul class="dropdown-menu text-center" id="dropdown-menu">
							<li><a class="dropdown-item" href="change-password">Change Password </a></li>
							<li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt fa-sm fa-fw text-dark-400"></i> Logout</a></li>
						</ul>
					</li>		 						
				</ul>
			</div>
		</div>
	</div>
</nav>
</div>
</div>

</body>

</html>