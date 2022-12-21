<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;400;500;600;700&family=Tai+Heritage+Pro:wght@700&display=swap"
		rel="stylesheet">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="https://kit.fontawesome.com/70c55b67fa.js" crossorigin="anonymous"></script>
	<link rel='icon' type='image/ico' href='images/esslogo.png' />
	<title>Forget Password</title>
	<style>
		.card {
			margin-bottom: 30px;
			border: none;
			border-radius: 5px;
			box-shadow: 0px 0 30px rgba(1, 41, 112, 0.1);
		}

		.card-header,
		.card-footer {
			border-color: #ebeef4;
			background-color: #fff;
			color: #798eb3;
			padding: 15px;
		}

		.card-title {
			padding: 20px 0 15px 0;
			font-size: 18px;
			font-weight: 500;
			color: #012970;
			font-family: "Poppins", sans-serif;
		}

		.card-title span {
			color: #899bbd;
			font-size: 14px;
			font-weight: 400;
		}

		.card-body {
			padding: 0 20px 20px 20px;
		}

		.card-img-overlay {
			background-color: rgba(255, 255, 255, 0.6);
		}

		body {
			background-color: #f6f9ff;
		}
	</style>

</head>

<body>
	<main>
		<div class="container">
			<section
				class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
							<div class="d-flex justify-content-center py-4">
								<img src="images/esslogo.png" alt="" height="80px" width="160px">
								<span class="d-none d-lg-block"></span>
								</a>
							</div>
							<div class="card mb-3">
								<div class="card-body">
									<div class="pt-4 pb-2">
										<h5 class="card-title text-center pb-0 fs-4">Forget Password</h5>
										<p class="text-center small">Enter your OTP </p>
									</div>
									<form class="row g-3" id="forgetpass" method="post" action="forget-pass-get-otp"
										enctype="multipart/form-data">
										<div class="col-12">
											<label for="yourUsername" class="form-label">OTP</label>

											<div class="input-group has-validation">
												<span class="input-group-text"> <i
														class="fa fa-light fa-key"></i></span>
												<input type="number" name="otp" class="form-control d-block" id="otp"
													required>
											</div>
											<label class="form-text  text-danger" id="invalidOTPWar">
												${error}
											</label>
										</div>
										<div class="col-12">
											<button class="btn btn-success w-100" type="submit" id="btnSubmit">
												<span id="loadingBtn"> </span> &nbsp; Verify OTP &nbsp;
											</button>
										</div>
										<div class="col-12">
											<p class="small mb-0">have account? <a href="login">Login to account</a></p>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>

			</section>

		</div>
	</main>

	<script>
		$("#forgetpass").on("submit", function (event) { 
			$("#loadingBtn").addClass("spinner-border spinner-border-sm");
		});
		$("input").on("input", function () {
			$("#invalidOTPWar").addClass("d-none");
		});
	</script>

</body>

</html>