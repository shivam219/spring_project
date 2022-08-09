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

	<title>Timesheet Login</title>
	<link rel='icon' type='image/ico' href='ESSLogo.png' />
	<style>
		.bg-nav-foot {
			background-color: #333;
		}
	</style>
</head>

<body>
	<div class="fixed-top  m-0 p-0">
		<div class="container-fluid">
			<!-- Nav -->
			<div class="row bg-nav-foot ">
				<span class="text-center text-white py-3 h3  "> Timesheet &
					Leave Application</span>
			</div>
			<!-- End Nav -->
			<!-- Body -->
			<!-- justify-content-center -- align horizontal center (  no need us m-auto) align-items- vertital center -->
			<div class="row  mt-5">
				<h2 class="text-center text-secondary ">Login</h2>
			</div>
			<div class="row ">
				<div class="col-sm-4 m-auto  ">
					<form method="post" action="home">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput" name="empId"
								placeholder="name@example.com"> <label for="floatingInput">User ID</label>
						</div>
						<div class="form-floating">
							<input type="password" class="form-control" id="floatingPassword" name="empPwd"
								placeholder="Password"> <label for="floatingPassword">Password</label>
						</div>

						<div class="text-center mt-3">
							<input class="btn-primary px-4 rounded  " type="submit" value="login" />
						</div>

					</form>

					<hr>
					<form method="get" action="register">
						<div class="text-center mt-3">
							<input class="btn-primary px-4 rounded  " type="submit" value="Register" />
						</div>
					</form>
					
				</div>

			</div>
			<h2 class="text-center text-danger py-3 h3">${errorMsg}</h2>


	<!-- Footer -->
	<%@ include file="footer-fixed-bottom.jsp" %>
	<!-- End Footer -->
</body>

</html>