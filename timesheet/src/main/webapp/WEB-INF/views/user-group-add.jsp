 <%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Group Create  </title>
</head>
<style>
body{
    background-color:#f2f6fc;
    color:#69707a;
    }
    .img-account-profile {
        height: 10rem;
    }
    .rounded-circle {
        border-radius: 50% !important;
    }
    .card {
        box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
    }
    .card .card-header {
        font-weight: 500;
    }
    .card-header:first-child {
        border-radius: 0.35rem 0.35rem 0 0;
    }
    .card-header {
        padding: 1rem 1.35rem;
        margin-bottom: 0;
        background-color: rgba(33, 40, 50, 0.03);
        border-bottom: 1px solid rgba(33, 40, 50, 0.125);
    }
    .form-control, .dataTable-input {
        display: block;
        width: 100%;
        padding: 0.875rem 1.125rem;
        font-size: 0.875rem;
        font-weight: 400;
        line-height: 1;
        color: #69707a;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #c5ccd6;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        border-radius: 0.35rem;
        transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    }
    
    .nav-borders .nav-link.active {
        color: #0061f2;
        border-bottom-color: #0061f2;
    }
    .nav-borders .nav-link {
        color: #69707a;
        border-bottom-width: 0.125rem;
        border-bottom-style: solid;
        border-bottom-color: transparent;
        padding-top: 0.5rem;
        padding-bottom: 0.5rem;
        padding-left: 0;
        padding-right: 0;
        margin-left: 1rem;
        margin-right: 1rem;
    }</style>
<body>
    
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <!-- Edit User Details card-->
                <div class="card mb-4">
                    <div class="card-header text-center"> User Group Create</div>
                    <div class="card-body">
                        <form method="post" action="EditUser" id="EditUserForm"  >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-4">
                                <table>
                                    <tr>
                                        <label class="small mb-1" for="groupDesc"> Group Description</label>
                                        <input class="form-control" id="groupDesc" type="text" placeholder="Enter Group Description" value="">
                                        <span class="form-text small text-danger ms-2  d-none"  >Specify Group Description</span>     
                                    </tr>
                                </table>
                            </div>
                            <!-- Save changes button-->
                            <div class="row justify-content-center mt-3 ">
                                <button class="btn btn-primary px-3 w-auto" type="submit" id="btnSave"  >
                                    <span id="loadingBtn"> </span> &nbsp; Create Group&nbsp;
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script>
        function setEmployeeId(){
            $('#empId').val($('#empName').val());
        }
    function isValid() {
        let flag = true;
        if(!($("#empId").val())){
            $("#empId").addClass("is-invalid");
            $("#empId").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#empPassword").val())){
            $("#empPassword").addClass("is-invalid");
            $("#empPassword").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#firstName").val())){
            $("#firstName").addClass("is-invalid");
            $("#firstName").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#middleName").val())){
            $("#middleName").addClass("is-invalid");
            $("#middleName").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#lastName").val())){
            $("#lastName").addClass("is-invalid");
            $("#lastName").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#empEmail").val())){
            $("#empEmail").addClass("is-invalid");
            $("#empEmail").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#empPhone").val())){
            $("#empPhone").addClass("is-invalid");
            $("#empPhone").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#birthDate").val())){
            $("#birthDate").addClass("is-invalid");
            $("#birthDate").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#empCity").val())){
            $("#empCity").addClass("is-invalid");
            $("#empCity").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#empPincode").val())){
            $("#empPincode").addClass("is-invalid");
            $("#empPincode").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#empAddress").val())){
            $("#empAddress").addClass("is-invalid");
            $("#empAddress").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#dateOfJoin").val())){
            $("#dateOfJoin").addClass("is-invalid");
            $("#dateOfJoin").siblings("span").removeClass("d-none");
            flag = false;
        }
        return flag;
    }
    $("#EditUserForm").on("submit",function (event) {
        event.preventDefault();
        if(isValid()){     
            $("#loadingBtn").addClass("spinner-border spinner-border-sm"); 
            let data = {
                empId:$("#empId").val(),
                empPassword:$("#empPassword").val(),
                firstName:$("#firstName").val(),
                middleName:$("#middleName").val(),
                lastName:$("#lastName").val(),
                empCity:$("#empCity").val(),
                empPincode:$("#empPincode").val(),
                empAddress:$("#empAddress").val(),
                birthDate:$("#birthDate").val(),
                active:$("#active").val(),
                empEmail:$("#empEmail").val(),
                empPhone:$("#empPhone").val(),
                mangerId:'12323423',
                state:$("#state").val(),
                gender:$("#gender").val(),
                dateOfJoin:$("#dateOfJoin").val(),
                dateOfResign:$("#dateOfResign").val(),
            }
            $.ajax({
                // type: 'POST',
                // url: 'add-user',
                data:JSON.stringify(data),
                contentType :'application/json',
                success: function (data,msg,xh) {
                    $("#btnSave").blur();
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                    swal({
                        title:"Success",
                        text: "Employee Created Successfully",
                        icon: "success",
                    }).
                    then(function (isOkay) {
                        if (isOkay) {
                            location.replace('/user-master');
                        }
                    });
                },error : function(data,msg,xh){
                    // $("#empId").addClass("is-invalid");
                    // $("#empPassword").addClass("is-invalid");
                    // $("#empPassWar").removeClass("d-none");
                    // $("#empIdWar").  removeClass("d-none");
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                }
            }); 
        }else{
            $("#btnSave").blur();
        }
    });
    $("input, textarea ,date").on("input",function(){
        $(this).removeClass("is-invalid");
        if(!$(this).val()){
            $(this).siblings("span").removeClass("d-none");
        }else{
            $(this).siblings("span").addClass("d-none");
        }
    });
</script>
</body>

</html>