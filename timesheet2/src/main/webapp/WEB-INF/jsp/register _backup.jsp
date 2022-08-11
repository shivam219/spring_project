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
	<div class="fixed-top  m-0 p-0">
		<div class="container-fluid">
			<!-- Nav -->
			<div class="row bg-nav-foot ">
				<span class="text-center text-white py-3 h3  "> Timesheet &
					Leave Application</span>
			</div>
			<!-- End Nav -->
			<!-- Body -->

			<div class="m-4">
				<form action="" method="post">
					<div class="mb-3">
						<label class="form-label" for="inputEmail">Email</label>
						<input type="email" class="form-control" id="inputEmail" placeholder="Email" required>
					</div>
					<div class="mb-3">
						<label class="form-label" for="inputPassword">Password</label>
						<input type="password" class="form-control" id="inputPassword" placeholder="Password" required>
					</div>
					<div class="mb-3">
						<label class="form-label" for="inputPassword">Password</label>
						<input type="password" class="form-control" id="inputPassword" placeholder="Password" required>
					</div>
					<div class="mb-3">
						<label class="form-label" for="inputPassword">Password</label>
						<input type="password" class="form-control" id="inputPassword" placeholder="Password" required>
					</div>
					<div class="mb-3">
						<label class="form-label" for="inputPassword">Password</label>
						<input type="password" class="form-control" id="inputPassword" placeholder="Password" required>
					</div>
					<div class="mb-3">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="checkRemember">
							<label class="form-check-label" for="checkRemember">Remember me</label>
						</div>
					</div>
					<button type="submit" class="btn btn-primary">Sign in</button>
				</form>
			</div>

	<!-- Footer -->
	<%@ include file="footer.jsp" %>
	<!-- End Footer -->
</body>
</html>