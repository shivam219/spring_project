<%@ include file="menu-login-register.jsp"%>
<head>
<title>ESS Forget Password</title>
</head>

<body>

	<div class="container-fluid  mt-5">
		<!-- Body -->
		<div class="row ">
			<!-- <h2 class="text-center text-secondary ">Ess Login</h2> -->
		</div>
		<div class="row ">
			<div class="col-sm-4 m-auto ">
				<form method="post" id="ForgetForm" onsubmit="event.preventDefault()">
					<div class="card p-3">
						<div class="card-header"> 	<h2 class=" h3 text-center text-secondary">Forget Password</h2></div>
						<div class="form-floating mt-2 mb-2">
							<input type="text" class="form-control input-sm" id="empId" name="empId" placeholder="Emp Id"> 
							<label for="floatingInput">Enter User ID</label>
							<span class="form-text  small text-muted  d-none text-danger " id="empIdWar">Specified Employee Id doesn't meet </span>
						</div>
						<div class="form-floating " id="divOtp" >
							<input type="text" class="form-control input-sm " disabled id="otp" name="otp" placeholder="Enter OTP"> 
							<label for="otp">Enter OTP</label>
							<span class="form-text  small text-muted d-none text-danger " id="empPassWar">Specified Employee OTP </span>
						</div>
						<div class="form-floating d-none mt-2" id="divEmpPassword" >
							<input type="password" class="form-control input-sm " id="empPassword" name="empPassword" placeholder="Password"> 
							<label for="empPassword">Enter New Password</label>
							<span class="form-text  small text-muted d-none text-danger " id="empPassWar"> </span>
						</div>

						<div class="text-center mt-3">
							<button class="btn btn-success px-4 mb-1 " type="button" id="btnOtp"   >
								<span id="loadingBtnOtp" > </span> &nbsp; Get OTP &nbsp;
							</button>
						</div>
						<div class="text-center mt-3">
							<button class="btn btn-success px-4 mb-1  d-none" type="button" id="btnCheckOtp"   >
								<span id="loadingBtnCheckOtp"> </span> &nbsp; Validate OTP &nbsp;
							</button>
						</div>
						<div class="text-center mt-3">
							<button class="btn btn-primary px-4 mb-1  d-none" type="button" id="btnResetPassword"   >
								<span id="loadingBtnResetPwd"> </span> &nbsp; Reset Password &nbsp;
							</button>
						</div>
						<p class="card-text m-auto text-center">Click on Get OTP Button <br> OTP will be send to your Register email of ESS </p>
					</div> 
				</form>
			</div>

		</div>
	</div>
	<script>
		var OTP = "";
		$("#btnOtp").on("click",function (event) {
			$("#loadingBtnOtp").addClass("spinner-border spinner-border-sm");
			$("#btnOtp").blur();
			let uri = 'get-otp?empId='+$("#empId").val();
			$.ajax({
				type: 'GET',
				url: uri,
				contentType :false,
				async:false,
				success: function (data,msg,xh) {
					$("#btnOtp").addClass("d-none");
					$("#btnCheckOtp").removeClass("d-none");
					$("#empId").attr("disabled" ,true);
					$("#otp").removeAttr("disabled");
					OTP = data
				},error : function(data,msg,xh){
				}
            }); 
		});
		
		$("#btnCheckOtp").on("click",function (event) {
			$("#loadingBtnCheckOtp").addClass("spinner-border spinner-border-sm");
			$("#btnCheckOtp").blur();
			if(OTP==$("#otp").val()){
				$("#otp").attr("disabled",true);
				$("#btnCheckOtp").addClass("d-none");
				$("#btnResetPassword").removeClass("d-none");	
				$("#divEmpPassword").removeClass("d-none");	
			}
		});
		
		$("#btnResetPassword").on("click",function (event) {
			$("#loadingBtnResetPwd").addClass("spinner-border spinner-border-sm");
			$("#btnResetPassword").blur();
			let data = {
				empId:$("#empId").val(),
				empPassword:$("#empPassword").val()
			}
			$.ajax({
				type: 'POST',
				url: 'reset-password',
				data:JSON.stringify(data),
				contentType :'application/json',
				success: function (data,msg,xh) {
					// location.replace('/home');
					$("#btnResetPassword").text("Password Updated");
					$("#btnResetPassword").addClass("is-valid").attr("disabled",true);
					$("#loadingBtnResetPwd").removeClass("spinner-border spinner-border-sm");
		
				},error : function(data,msg,xh){
				}
			});
		});

		$("input").on("input",function(){
            $(this).removeClass("is-invalid");
			$("#empPassWar").addClass("d-none");
			$("#empIdWar"). addClass("d-none");
        });
	</script>
<%@ include file="footer-fixed-bottom.jsp"%>
</body>
</html>