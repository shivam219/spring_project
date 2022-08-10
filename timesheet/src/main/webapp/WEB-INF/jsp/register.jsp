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
		<form method="post" action="registerprocess">
			<div class="row justify-content-center">
				<div class="col-md-3  py-2 ">
					<div class="input-group mb-3">
						<span class="input-group-text"> <i class="fa-solid fa-user"></i> </span>
						<div class="form-floating">
							<input type="text" class="form-control" id="empId" name="empId" placeholder="Username">
							<label for="empId">Employee Id</label>
						</div>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text"> <i class="fa-solid fa-user"></i> </span>
						<div class="form-floating">
							<input type="text" class="form-control" id="empName" name="empName" placeholder="Username">
							<label for="empId">Employee Name</label>
						</div>
					</div>
					
					<div class="input-group mb-3">
						<span class="input-group-text"> <i class="fa-solid fa-envelope"></i> </span>
						<div class="form-floating">
							<input type="text" class="form-control" id="empEmail" name="empEmail" placeholder="Username">
							<label for="empEmail">Employee Email</label>
						</div>
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text"> <i class="fa-solid fa-key"></i> </span>
						<div class="form-floating">
							<input type="password" class="form-control" id="empPassword" name="empPassword" placeholder="Username">
							<label for="empPassword">Employee Password</label>
						</div>
					</div>
				</div>

				<div class="col-md-3  p-2  ">
					<div class="input-group mb-3">
						<span class="input-group-text"> <i class="fa-solid fa-phone"></i></span>
						<div class="form-floating">
							<input type="text" class="form-control" id="empPhone" name="empPhone" placeholder="Username">
							<label for="empPhone">Mobile No </label>
						</div>
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text"> <i class="fa-regular fa-building"></i></span>
						<div class="form-floating">
							<input type="text" class="form-control" id="empCity" name="empCity" placeholder="Username">
							<label for="empCity">City </label>
						</div>
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text">  <i class="fa-solid fa-map-pin"></i> </span>
						<div class="form-floating">
							<input type="text" class="form-control" id="empPincode" name="empPincode" placeholder="Username">
							<label for="empPincode">Pincdoe </label>
						</div>
					</div>
					<div class="form-floating">
						<textarea class="form-control" placeholder="Address " id="empAddress" name="empAddress" style="height: 60px"></textarea>
						<label for="empAddress">Address</label>
					  </div>
				</div>
			</div>
			<form method="get" action="register">
				<div class="text-center mt-3">
					<input class=" btn btn-primary px-4  " type="submit" value="Register" />
				</div>
			</form>
		</form>

	</div>
		<!-- Footer -->
	<%@ include file="footer-fixed-bottom.jsp" %>
		<!-- End Footer -->
</body>

</html>