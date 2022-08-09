<!DOCTYPE html>
<html>
	
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://kit.fontawesome.com/70c55b67fa.js" crossorigin="anonymous"></script>

	<title>ESS Register</title>
	<link rel='icon' type='image/ico' href='ESSLogo.png' />
	<style>
		.bg-nav-foot {
			background-color: #333;
		}
	</style>
</head>

<body>
	<div class="container-fluid">
		<!-- Nav -->
		<div class="row bg-nav-foot ">
			<span class="text-center text-white py-3 h3  "> Timesheet &
				Leave Application</span>
		</div>
		<!-- End Nav -->
		<!-- Body -->
		<div class="row  mt-5">
			<h2 class="text-center text-secondary ">Sign up</h2>
		</div>
		<form>
			<div class="row justify-content-center">
				<div class="col-md-3  py-2 ">
					<div class="input-group mb-3">
						<span class="input-group-text"> <i class="fa-solid fa-user"></i> </span>
						<div class="form-floating">
							<input type="text" class="form-control" id="empId" name="empId" placeholder="Username">
							<label for="empId">Employee Code</label>
						</div>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text"> <i class="fa-solid fa-user"></i> </span>
						<div class="form-floating">
							<input type="text" class="form-control" id="empName" name="empName" placeholder="Username">
							<label for="empId">Name</label>
						</div>
					</div>
					
					<div class="form-floating">
						<input type="password" class="form-control" id="empEmail" name="empEmail"
							placeholder="Password"> <label for="empEmail">Password</label>
					</div>
				</div>
				<div class="col-md-3     p-2  ">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="no" name="no" placeholder="name@example.com">
						<label for="no">Mobile</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="Address" name="Address"
							placeholder="name@example.com">
						<label for="Address">Address</label>
					</div>
					<div class="form-floating">
						<input type="password" class="form-control" id="City" name="City" placeholder="Password">
						<label for="City">City</label>
					</div>

					<div class="input-group mb-3 mt-3">
						<span class="input-group-text"> <i class="fa-solid fa-envelope"></i> </span>
						<div class="form-floating">
							<input type="text" class="form-control" id="floatingInputGroup1" placeholder="Username">
							<label for="floatingInputGroup1">Username</label>
						</div>
					</div>
				</div>
			</div>
			<form method="get" action="register">
				<div class="text-center mt-3">
					<input class=" btn btn-primary px-4   " type="submit" value="Register" />
				</div>
			</form>
		</form>


		<i class="fa-solid fa-thumbs-up fa-5x"></i>


	</div>
	<!-- <div class="text-center mt-3">
					<input class="btn-primary px-4 rounded  " type="submit" value="Register" />
				</div> -->
	<!-- Footer -->
	<%@ include file="footer-fixed-bottom.jsp" %>
		<!-- End Footer -->
</body>

</html>