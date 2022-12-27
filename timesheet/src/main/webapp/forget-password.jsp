<%@ include file="menu-login-register.jsp"%>
<head>
<title>ESS Forget Password</title>
</head>

<body>

	<div class="container-fluid  mt-5">
		<div class="row ">
			<div class="col-sm-4 m-auto ">
				<form method="post" id="ForgetForm" onsubmit="event.preventDefault()">
					<div class="card p-3">
						<div class="card-header"> 	<h2 class=" h3 text-center text-secondary">Forget Password</h2></div>
						<span class="badge bg-danger d-none mt-1 " id="empIdNotFoundWar">Specified Employee Id doesn't meet </span>
						<span class="badge bg-danger d-none  text-center" id="netWorkWar">Server internet not working </span>
						<div class="form-floating mt-2  "id="divEmpId">
							<input type="text" class="form-control input-sm" id="empId" name="empId" placeholder="Emp Id"> 
							<label for="floatingInput">Enter User ID</label>
							<span class="badge bg-danger d-none mt-1 ">Specified Employee Id </span>
						</div>
						<div class="form-floating mt-2 d-none" id="divOtp" >
							<input type="text" class="form-control input-sm " id="otp" name="otp" placeholder="Enter OTP"> 
							<label for="otp">Enter OTP</label>
							<span class="badge bg-danger d-none ">Specified OTP or OTP doesn't match </span>
						</div>
						<div class="form-floating d-none mt-2" id="divEmpPassword" > 
							<input type="password" class="form-control input-sm " id="empPassword" name="empPassword" autocomplete="new-password" placeholder="Password"> 
							<label for="empPassword">Enter New Password</label>
							<span class="badge bg-danger d-none" >Specified Employee password. Should not enter space </span>
						</div>

						<div class="text-center mt-3">
							<button class="btn btn-success px-4 mb-1 " type="button" id="btnOtp"   >
								<span id="loading" > </span> &nbsp; Get OTP &nbsp;
							</button>
						</div>
						<div class="text-center mt-3">
							<button class="btn btn-success px-4 mb-1  d-none" type="button" id="btnCheckOtp"   >
								<span id="loadingBtnCheckOtp"> </span> &nbsp; Validate OTP &nbsp;
							</button>
						</div>
						<div class="text-center mt-3">
							<button class="btn btn-primary px-4 mb-1  d-none" type="button" id="btnResetPassword"  >
								<span id="loadingBtnResetPwd"> </span> &nbsp; Reset Password &nbsp;
							</button>
						</div>
						<p class="card-text m-auto text-center"> OTP will be send to your Register email of ESS </p>
					</div> 
				
				</form>
			</div>

		</div>
	</div>
	<script>
		var OTP = "shivam";
		$("#btnOtp").on("click",function (event) {
			if(!(new String($("#empId").val()).replace(/\s+/g, ''))){
				$("#empId").addClass("is-invalid");
				$("#empId").siblings("span").removeClass("d-none");
			}else{
				$("#loading").addClass("spinner-border spinner-border-sm");
				$("#btnOtp").blur();
				let uri = 'get-otp?empId='+$("#empId").val();
				$.ajax({
					type: 'GET',
					url: uri,
					contentType :false,
					async:false,
					success: function (data,msg,xh) {
						// hiding empId div
						$("#divEmpId").addClass("d-none"); 
						// hiding get opt
						$("#btnOtp").addClass("d-none");
						// show validate opt 
						$("#btnCheckOtp").removeClass("d-none");
						// show enter opt
						$("#divOtp").removeClass("d-none");
						OTP = data;
					},error : function(xhr,data,msg){
						console.log(xhr);
						if(xhr.status==404){
							$("#empIdNotFoundWar").removeClass("d-none");
						}else{
							$("#netWorkWar").removeClass("d-none");
						}
						$("#loading").removeClass("spinner-border spinner-border-sm");
					}
				}); 
			}
		});
		
		$("#btnCheckOtp").on("click",function (event) {
			$("#loadingBtnCheckOtp").addClass("spinner-border spinner-border-sm");
			$("#btnCheckOtp").blur();
			if(OTP==$("#otp").val()){
				$("#divOtp").addClass("d-none");
				$("#btnCheckOtp").addClass("d-none");
				$("#btnResetPassword").removeClass("d-none");	
				$("#divEmpPassword").removeClass("d-none");	
			}else if(!(new String($("#otp").val()).replace(/\s+/g, ''))){
					$("#otp").addClass("is-invalid");
					$("#otp").siblings("span").removeClass("d-none");
					$("#loadingBtnCheckOtp").removeClass("spinner-border spinner-border-sm");
			}else{
				$("#otp").addClass("is-invalid");
				$("#otp").siblings("span").removeClass("d-none");
				$("#loadingBtnCheckOtp").removeClass("spinner-border spinner-border-sm");
			}
		}).blur();
		
		$("#btnResetPassword").on("click",function (event) {
			if(!(new String($("#empPassword").val()).replace(/\s+/g, ''))){
					$("#empPassword").addClass("is-invalid");
					$("#empPassword").siblings("span").removeClass("d-none");
			}else{
				$("#loadingBtnResetPwd").addClass("spinner-border spinner-border-sm");
				$("#btnResetPassword").blur();
				let data = {
					empId:$("#empId").val(),
					password:$("#empPassword").val()
				}
				$.ajax({
					type: 'POST',
					url: 'reset-password',
					data:JSON.stringify(data),
					contentType :'application/json',
					success: function (data,msg,xh) {
						$("#btnResetPassword").text("Password Updated");
						$("#btnResetPassword").addClass("is-valid").attr("disabled",true);
						$("#loadingBtnResetPwd").removeClass("spinner-border spinner-border-sm");
						swal({
							title:"Success",
							text: "Password is Updated Successfully",
							icon: "success",
						}).
						then(function (isOkay) {
							if (isOkay) {
								location.replace('login');
							}
						});
					},error : function(data,msg,xh){
					}
				});
			}
		}).blur();

		$("input").on("input",function(){
            $(this).removeClass("is-invalid");
			if(!$(this).val()){
           		$(this).siblings("span").removeClass("d-none");
			}else{
				$(this).siblings("span").addClass("d-none");
			}
			$("#empIdNotFoundWar").addClass("d-none");
			$("#netWorkWar").addClass("d-none");
        });
	</script>
<%@ include file="footer-fixed-bottom.jsp"%>
</body>
</html>