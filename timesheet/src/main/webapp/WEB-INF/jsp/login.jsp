<%@ include file="menu-login-register.jsp"%>
<head>
<title>ESS Login</title>
</head>

<body>

	<div class="container-fluid  mt-5">
		<!-- Body -->
		<div class="row   ">
			<h2 class="text-center text-secondary ">Login</h2>
		</div>
		<div class="row ">
			<div class="col-sm-4 m-auto  ">
				<form method="post" action="loginprocess">
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput"
							name="empId" placeholder="name@example.com"> <label
							for="floatingInput">User ID</label>
					</div>
					<div class="form-floating">
						<input type="password" class="form-control" id="floatingPassword"
							name="empPassword" placeholder="Password"> <label
							for="floatingPassword">Password</label>
					</div>

					<div class="text-center mt-3">
						<input class="btn btn-primary px-4   " type="submit" value="login" />
					</div>

				</form>

				<hr>
				<form method="get" action="register">
					<div class="text-center mt-3">
						<input class=" btn-primary px-4 rounded  " type="submit"
							value="Register" />
					</div>
				</form>
			</div>

		</div>
	</div>
	<h2 class="text-center text-danger py-3 h3">${errorMsg}</h2>


		<!-- Footer -->
		<%@ include file="footer-fixed-bottom.jsp"%>
		<!-- End Footer -->
</body>

</html>