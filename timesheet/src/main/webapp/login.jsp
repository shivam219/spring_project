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
	<link rel='icon' type='image/ico' href='images/esslogo.jpg' />
	<link rel='icon' type='image/ico' href='images/esslogo.png' />
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
body{
background-color: #f6f9ff;	
}
	</style>
 
</head>

<body >
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
										<h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
										<p class="text-center small">Enter your username & password to login</p>
									</div>

									<form class="row g-3" id="loginForm" action="loginprocess">
										<div class="col-12">
											<label for="yourUsername" class="form-label">Username</label>
											<div class="input-group has-validation">
												<span class="input-group-text" id="inputGroupPrepend">@</span>
												<input type="text" name="empId" class="form-control" id="empId"
													name="empId" required>
												<span class="form-text    d-none text-danger " id="empIdWar">Specified
													Employee Id doesn't meet </span>
											</div>
										</div>

										<div class="col-12">
											<label for="yourPassword" class="form-label">Password</label>
											<input type="password" name="password" class="form-control" id="password"
												name="password" required>
											<span class="form-text  d-none text-danger " id="empPassWar">Specified
												Employee Password doesn't meet </span>
										</div>

										<div class="col-12">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" name="remember"
													value="true" id="rememberMe">
												<label class="form-check-label" for="rememberMe">Remember me</label>

											</div>
										</div>
										<div class="col-12">
											<button class="btn btn-primary w-100" type="submit" id="btnSubmit">
												<span id="loadingBtn"> </span> &nbsp; Login &nbsp;
											</button>
										</div>
										<div class="col-12">
											<p class="small mb-0">Don't have account? <a href="register">Create an
													account</a></p>
											<p class="small mb-0">Don't remember pass <a href="forget-password">Forget
													Password</a></p>
										</div>
									</form>

								</div>
							</div>

							<div class="credits">
								Designed by <a href="https://www.linkedin.com/in/shivam-choudhary-b58205193/">Shivam</a>
							</div>
						</div>
					</div>
				</div>

			</section>

		</div>
	</main><!-- End #main -->

	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
			class="bi bi-arrow-up-short"></i></a>

	<script>
		$("#loginForm").on("submit", function (event) {
			event.preventDefault();
			$("#loadingBtn").addClass("spinner-border spinner-border-sm");
			let data = {
				empId: $("#empId").val(),
				password: $("#password").val()
			}
			console.log(data);
			console.log(JSON.stringify(data));
			$.ajax({
				type: 'POST',
				url: 'loginprocess',
				data: JSON.stringify(data),
				contentType: 'application/json',
				success: function (data, msg, xh) {
					location.replace('/home');
				}, error: function (data, msg, xh) {
					$("#btnSubmit").blur();
					$("#empId").addClass("is-invalid");
					$("#password").addClass("is-invalid");
					$("#empPassWar").removeClass("d-none");
					$("#empIdWar").removeClass("d-none");
					$("#loadingBtn").removeClass("spinner-border spinner-border-sm");
				}
			});
		});
		$("input").on("input", function () {
			$(this).removeClass("is-invalid");
			$("#empPassWar").addClass("d-none");
			$("#empIdWar").addClass("d-none");
		});
	</script>
</body>

</html>