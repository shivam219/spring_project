<!DOCTYPE html>
<html>

<head>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;400;500;600;700&family=Tai+Heritage+Pro:wght@700&display=swap"
		rel="stylesheet">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

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
		<div class="row ">
			<form method="post" action="home">
				<div class="justify-content-between">
					<div class="col">
						<div class="col-sm-3 m-auto  ">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="floatingInput" name="empId"
									placeholder="name@example.com"> <label for="floatingInput">Your Name</label>
							</div>
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="floatingInput" name="empId"
									placeholder="name@example.com"> <label for="floatingInput">Your Email</label>
							</div>
							<div class="form-floating">
								<input type="password" class="form-control" id="floatingPassword" name="empPwd"
									placeholder="Password"> <label for="floatingPassword">Password</label>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-3 m-auto  ">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="floatingInput" name="empId"
									placeholder="name@example.com"> <label for="floatingInput">Mobile</label>
							</div>
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="floatingInput" name="empId"
									placeholder="name@example.com"> <label for="floatingInput">Address</label>
							</div>
							<div class="form-floating">
								<input type="password" class="form-control" id="floatingPassword" name="empPwd"
									placeholder="Password"> <label for="floatingPassword">City</label>
							</div>
						</div>
					</div>


				</div>

				<div class="text-center mt-3">
					<input class="btn-primary px-4 rounded  " type="submit" value="Register" />
				</div>
			</form>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="footer-fixed-bottom.jsp" %>
		<!-- End Footer -->
</body>

</html>