<%@ include file="menu-login-register.jsp"%>
<head>
<title>ESS Login</title>
</head>

<body>

	<div class="container-fluid  mt-5">
		<!-- Body -->
		<div class="row ">
			<!-- <h2 class="text-center text-secondary ">Ess Login</h2> -->
		</div>
		<div class="row ">
			<div class="col-sm-4 m-auto ">
				<form method="post" action="loginprocess" id="loginForm">
					<div class="card p-3">
						<div class="card-header mb-1"> 	<h2 class="text-center text-secondary">Login</h2></div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control input-sm" id="empId" name="empId" placeholder="Emp Id"> 
							<label for="floatingInput">User ID</label>
							<span class="form-text  small text-muted  d-none text-danger " id="empIdWar">Specified Employee Id doesn't meet </span>
						</div>
						<div class="form-floating">
							<input type="password" class="form-control input-sm" id="empPassword" name="empPassword" placeholder="Password"> 
							<label for="empPassword">Password</label>
							<span class="form-text  small text-muted d-none text-danger " id="empPassWar">Specified Employee Password doesn't meet </span>
						</div>
						
						<div class="text-center mt-3">
							<button class="btn btn-primary px-4  " type="submit" id="btnSubmit"   >
								<span id="loadingBtn"> </span> &nbsp; Login &nbsp;
							</button>
						</div>
						<a href="forget-password"  class="card-link m-auto mt-2">Forget Password</a> <br>
						<!-- <a href="#" class="card-link">Another link</a> -->
					</div> 
				</form>
			</div>

		</div>
	</div>
	<script>
		$("#loginForm").on("submit",function (event) {
            event.preventDefault();
			$("#loadingBtn").addClass("spinner-border spinner-border-sm"); 
			let data = {
				empId:$("#empId").val(),
				empPassword:$("#empPassword").val()
			}
			console.log(data);
			console.log(JSON.stringify(data));
			$.ajax({
				type: 'POST',
				url: 'loginprocess',
				data:JSON.stringify(data),
				contentType :'application/json',
				success: function (data,msg,xh) {
					location.replace('/home');
				},error : function(data,msg,xh){
					$("#btnSubmit").blur();
					$("#empId").addClass("is-invalid");
					$("#empPassword").addClass("is-invalid");
					$("#empPassWar").removeClass("d-none");
					$("#empIdWar").  removeClass("d-none");
					$("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
				}
            }); 
		});
		$("input").on("input",function(){
            $(this).removeClass("is-invalid");
			$("#empPassWar").addClass("d-none");
			$("#empIdWar"). addClass("d-none");
        });
	</script>
	
	<!-- Footer -->
		<%@ include file="footer-fixed-bottom.jsp"%>
		<!-- End Footer -->
</body>

</html>