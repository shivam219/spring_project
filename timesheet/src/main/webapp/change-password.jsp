<%@ include file="menu.jsp" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map.*"%>
<%@page import="java.util.Arrays"%> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/form-style.css">
</head>
<body>
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <div class="card mb-4">
                    <div class="card-header text-center">Change Password</div>
                        <div class="card-body">
                            <div class="row justify-content-center"> 
                                <div class="col-md-5"> 
                                    <form class="form" role="form" id="changePassword" >
                                        <div class="form-group">
                                            <label for="empPasswordOld">Current Password</label>
                                            <input type="password" class="form-control "  id="empPasswordOld" autocomplete=""  required="">
                                            <span class="form-text  small d-none text-danger " id="oldPwdWar">
                                                The password doesn't match with old one.
                                            </span>
                                        </div>
                                        <div class="form-group">
                                            <label for="empPassword">New Password</label>
                                            <input type="password" class="form-control " id="empPassword"  autocomplete=""  required="">
                                            <span class="form-text small text-muted ">
                                                The password must be 8-20 characters, and must <em>not</em> contain spaces.
                                            </span>
                                            <span class="form-text  small d-none text-danger " id="pwdWar1">
                                                <br>  The password doesn't match with below.
                                            </span>
                                        </div>
                                        <div class="form-group">
                                            <label for="empPassword2">Confirm password</label>
                                            <input type="password" class="form-control " id="empPassword2"  autocomplete=""  required="">
                                            <span class="form-text small text-muted">
                                                To confirm, type the new password again.
                                            </span>
                                            <span class="form-text  small d-none text-danger " id="pwdWar2">
                                            <br>  The password doesn't match with above.
                                            </span>
                                        </div>
                                        <div class="form-group m-3">
                                            <button type="submit" class="btn btn-primary" id="btnSubmit">
                                                <span id="loadingBtn"> </span> &nbsp; Update &nbsp;
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        $("#changePassword").on("submit",function (event) {
            event.preventDefault();
            let flag = false;
            if(this.empPassword.value && this.empPassword2.value  ){
                let pass1 = new String(this.empPassword.value);
                let pass2 = new String(this.empPassword2.value);
                if (pass1.length == pass2.length){
                    if (pass2.normalize()==pass1.normalize()) {
                        flag = true;
                        $("#empPassword"). removeClass("is-invalid");
                        $("#empPassword2").removeClass("is-invalid");
                        $("#pwdWar2").addClass("d-none");
                        $("#pwdWar1").addClass("d-none");
                    } else {     
                        $("#empPassword").addClass("is-invalid");
                        $("#empPassword2").addClass("is-invalid");
                        $("#pwdWar1").removeClass("d-none");
                        $("#pwdWar2").removeClass("d-none");
                    }
                } else{
                    $("#empPassword").addClass("is-invalid");
                    $("#empPassword2").addClass("is-invalid");
                    $("#pwdWar2").removeClass("d-none");
                    $("#pwdWar1").removeClass("d-none");
                }
            }
            if(flag){
                $("#btnSubmit").removeClass("is-valid");
                $("#loadingBtn").addClass("spinner-border spinner-border-sm");
                let oldPass = new String(this.empPasswordOld.value);
                let newPass = new String(this.empPassword.value);
                let uri =  'change-password?oldPass='+oldPass+'&newPass='+newPass;
				$.ajax({
					type: 'POST',
					url: uri,
					contentType: false,
					success: function (data,msg,xh) {
                        swal({
                        title:"Success",
                        text: "Password Updated Successfully",
                        icon: "success",
                    });
                    location.href="home";
                    
                        $("#loadingBtn").removeClass("spinner-border spinner-border-sm");
                        $("#btnSubmit").addClass("is-valid");
                  	},error : function(data,msg,xh){
                        $("#empPasswordOld").addClass("is-invalid");
                        $("#oldPwdWar").removeClass("d-none");
                        $("#loadingBtn").removeClass("spinner-border spinner-border-sm");
          
                    }
                }); 
            }
            $("#btnSubmit").blur();
        });
        
        $("input").on("input",function(){
            $("#oldPwdWar").addClass("d-none");
            $(this).removeClass("is-invalid");
            $("#pwdWar2").addClass("d-none");
            $("#pwdWar1").addClass("d-none");
        });
    </script>
</body>
</html>
