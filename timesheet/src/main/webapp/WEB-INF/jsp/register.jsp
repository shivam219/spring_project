<%@ include file="menu-login-register.jsp" %>
<head>
	<title>ESS Register</title>
</head>
<body>
		<div class="row mt-5 ">
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
		 		<div class="text-center mt-3">
					<input class=" btn btn-primary px-4  " type="submit" value="Register" />
				</div>
			 
		</form>

	 
 
	<%@ include file="footer-fixed-bottom.jsp" %>
	 
</body>

</html>