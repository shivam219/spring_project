 <%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit User  </title>
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
                    <div class="card-header">Edit User Details</div>
                    <div class="card-body">
                        <form method="post" action="EditUser" id="EditUserForm"  >
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (username)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="empId">Employee Id </label>
                                    <input class="form-control" id="empId" type="text" placeholder="Enter your username" value="${emp.getEmpId()}">
                                    <span class="form-text  small  text-danger ms-2 d-none "  >Specified Employee Id</span>
                                </div>
                                <!-- Form Group (Password)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="empPassword">Employee Password </label>
                                    <input class="form-control" id="empPassword" type="text" placeholder="Enter your username" value="${emp.getEmpPassword()}">
                                    <span class="form-text  small  text-danger ms-2  d-none"  >Specify Employee Password</span>
                                </div>
                            </div>
                            <!-- Form Row-->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (first name)-->
                                <div class="col-md-4">
                                    <label class="small mb-1" for="firstName">First name</label>
                                    <input class="form-control" id="firstName" type="text" placeholder="Enter your first name" value="${emp.getFirstName()}">
                                    <span class="form-text small text-danger ms-2  d-none"  >Specify First Name</span>
                                </div>
                                 <!-- Form Group (middle name)-->
                                 <div class="col-md-4">
                                    <label class="small mb-1" for="middleName">Middle name</label>
                                    <input class="form-control" id="middleName" type="text" placeholder="Enter middle name" value="${emp.getMiddleName()}">
                                    <span class="form-text small text-danger ms-2  d-none"  >Specify Middle Name</span>
                                </div>
                                <!-- Form Group (last name)-->
                                <div class="col-md-4">
                                    <label class="small mb-1" for="lastName">Last name</label>
                                    <input class="form-control" id="lastName" type="text" placeholder="Enter last name" value="${emp.getLastName()}">
                                    <span class="form-text small text-danger ms-2  d-none" >Specify Last Name</span>
                                </div>
                            </div>
                            <!-- Form Row        -->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (organization name)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="Organization">Organization name</label>
                                    <input class="form-control" id="Organization" type="text" placeholder="Enter your organization name" value="Enhanced Software Solution PVT LTD." readonly>
                                </div>
                                <!-- Form Group (location)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="active">Status</label>
                                    <select name="active" id="active" class="form-control form-select">
                                        <option value="1">Active</option>
                                        <option value="0">In-Active</option>
                                    </select>
                                </div>
                            </div>
                            <!-- Form Group (email address)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="empEmail">Email address</label>
                                <input class="form-control" id="empEmail" type="email" placeholder="Enter your email address" value="${emp.getEmpEmail()}">
                                <span class="form-text small text-danger ms-2  d-none"  >Specify Email address</span>
                            </div>
                            <!-- Form Row-->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (phone number)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="empPhone">Phone number</label>
                                    <input class="form-control" id="empPhone" type="text" placeholder="Enter your phone number" value="${emp.getEmpPhone()}">
                                    <span class="form-text small text-danger ms-2  d-none" >Specify Phone number</span>
                                </div>
                                <!-- Form Group (birthday)-->
                                <div class="col-md-6">
                                    <label class="small mb-1" for="birthDate">Birthday</label>
                                    <input class="form-control" id="birthDate" type="date" name="birthday" placeholder="Enter your birthday" value="${emp.getBirthDate()}">
                                    <span class="form-text small text-danger ms-2  d-none"  >Specify Birthday</span>

                                </div> 
                            </div>
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (phone number)-->
                                <div class="col-md-4">
                                    <label class="small mb-1" for="empCity">City</label>
                                    <input class="form-control" id="empCity" type="text" placeholder="Enter your phone number" value="${emp.getEmpCity()}">
                                    <span class="form-text small text-danger ms-2  d-none" >Specify City</span>

                                </div>
                                <!-- Form Group (birthday)-->
                                <div class="col-md-4">
                                    <label class="small mb-1" for="empPincode">Pincode</label>
                                    <input class="form-control" id="empPincode" type="text" name="birthday" placeholder="Enter your birthday" value="${emp.getEmpPincode()}">
                                    <span class="form-text small text-danger ms-2  d-none"  >Specify Pincode</span>
                                    
                                </div> 
                                <!-- Form Group (Active)-->
                                <div class="col-md-4">
                                    <label class="small mb-1" for="empAddress">Address</label>
                                    <textarea class="form-control" id="empAddress" type="text" placeholder="Enter your location" value="">${emp.getEmpAddress()}</textarea>
                                    <span class="form-text small text-danger ms-2  d-none"  >Specify Address</span>
                                </div>
                            </div>
                            <!-- Save changes button-->
                            <button class="btn btn-primary px-4  " type="submit" id="btnSave"  >
                                <span id="loadingBtn"> </span> &nbsp; Save Changes &nbsp;
                            </button>
                            <button class="btn btn-danger px-4 ms-4 " type="submit" id="btnDelete"   >
                                <span id="loadingBtn"> </span> &nbsp; Delete &nbsp;
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
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
        return flag;
    }
    $("#EditUserForm").on("submit",function (event) {
        event.preventDefault();
        if(isValid()){     
            $("#loadingBtn").addClass("spinner-border spinner-border-sm"); 
            let data = {
                empId:$("#empId").val(),
                empPassword:$("#empPassword").val(),
                empName:$("#empName").val(),
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
            }
            $.ajax({
                type: 'POST',
                url: 'edit-user-process',
                data:JSON.stringify(data),
                contentType :'application/json',
                success: function (data,msg,xh) {
                    // location.replace('/home');
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                    console.log(data);
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
    $("input, textarea ").on("input",function(){
        $(this).removeClass("is-invalid");
        if(!$(this).val()){
            $(this).siblings("span").removeClass("d-none");
        }else{
            $(this).siblings("span").addClass("d-none");
        }
    });

</script>
</script>
</body>

</html>