<%@ include file="menu-login-register.jsp" %>

	<head>
		<title>ESS Login</title>
		<style>
			.divider:after,
			.divider:before {
				content: "";
				flex: 1;
				height: 1px;
				background: #eee;
			}
		</style>
	</head>

	<body>

		<div class="container-fluid  mt-5">
			<!-- Body -->
			<div class="row d-none">
				<!-- <h2 class="text-center text-secondary ">Ess Login</h2> -->
			</div>
			<div class="row  ">
				<div class="col-sm-4 m-auto ">
					<form method="post" action="loginprocess" id="loginForm">
						<div class="card p-3">
							<div class="card-header mb-1">
								<h2 class="text-center text-secondary">Login</h2>
							</div>
							<div class="form-floating mb-3">
								<input type="text" class="form-control input-sm" id="empId" name="empId"
									placeholder="Emp Id">
								<label for="floatingInput">User ID</label>
								<span class="form-text  small text-muted  d-none text-danger " id="empIdWar">Specified
									Employee Id doesn't meet </span>
							</div>
							<div class="form-floating">
								<input type="password" class="form-control input-sm" id="password" name="password"
									placeholder="Password">
								<label for="password">Password</label>
								<span class="form-text  small text-muted d-none text-danger " id="empPassWar">Specified
									Employee Password doesn't meet </span>
							</div>

							<div class="text-center mt-3">
								<button class="btn btn-primary px-4  " type="submit" id="btnSubmit">
									<span id="loadingBtn"> </span> &nbsp; Login &nbsp;
								</button>
							</div>
							<a href="forget-password" class="card-link m-auto ">Forget Password</a>
							<a href="register" class="card-link m-auto ">Register</a> <br>
							<!-- <a href="#" class="card-link">Another link</a> -->
						</div>
					</form>
				</div>
			</div>
			<div class="d-none row justify-content-center>
				<div class="col-8">
					<section class="vh-100">
						<div class="container py-5 h-100">
							<div class="row d-flex align-items-center justify-content-center h-100">
								<div class="col-md-8 col-lg-7 col-xl-6">
									<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
										class="img-fluid" alt="Phone image">
								</div>
								<div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
									<form>
										<div class="form-floating mb-3">
											<input type="text" class="form-control input-sm" id="empId" name="empId"
												placeholder="Emp Id">
											<label for="floatingInput">User ID</label>
											<span class="form-text  small text-muted  d-none text-danger " id="empIdWar">Specified
												Employee Id doesn't meet </span>
										</div>
										<div class="form-floating">
											<input type="password" class="form-control input-sm" id="empPassword" name="empPassword"
												placeholder="Password">
											<label for="empPassword">Password</label>
											<span class="form-text  small text-muted d-none text-danger " id="empPassWar">Specified
												Employee Password doesn't meet </span>
										</div>
										<div class="d-flex justify-content-around align-items-center mb-4">
											<!-- Checkbox -->
											<div class="form-check">
												<input class="form-check-input" type="checkbox" value=""
													id="form1Example3" checked />
												<label class="form-check-label" for="form1Example3"> Remember me
												</label>
											</div>
											<!-- <div class="text-center mt-3">
												<button class="btn btn-primary px-4  " type="submit" id="btnSubmit">
													<span id="loadingBtn"> </span> &nbsp; Login &nbsp;
												</button>
											</div> -->
											<a href="forget-password" class="card-link m-auto ">Forget Password</a>
											<!-- <a href="#!">Forgot password?</a> -->
										</div>
										<a href="register" class="card-link m-auto ">Register</a> <br>

										<!-- Submit button -->
										<button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>

										<div class="divider d-flex align-items-center my-4">
											<p class="text-center fw-bold mx-3 mb-0 text-muted">OR</p>
										</div>

										<a class="btn btn-primary btn-lg btn-block" style="background-color: #3b5998"
											href="#!" role="button">
											<i class="fab fa-facebook-f me-2"></i>Continue with Facebook
										</a>
										<a class="btn btn-primary btn-lg btn-block" style="background-color: #55acee"
											href="#!" role="button">
											<i class="fab fa-twitter me-2"></i>Continue with Twitter</a>

									</form>
								</div>
							</div>

						</div>
				</div>
				</section>
			</div>
		</div>
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