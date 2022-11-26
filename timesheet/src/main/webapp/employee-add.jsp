 <%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Employee  </title>
    <link rel="stylesheet" href="css/form-style.css">
</head>
<body>
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <!-- Edit User Details card-->
                <div class="card mb-4">
                    <div class="card-header text-center ">Add Employee</div>
                    <div class="card-body">
                        <form method="post" action="EditUser" id="EditUserForm"  >
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (username)-->
                                <div class="col-md-4">
                                    <label class="small mb-1" for="empId">Employee Code </label>
                                    <input class="form-control" id="empId" type="text" placeholder="Enter  Code" >
                                    <span class="form-text  small  text-danger ms-2 d-none "  >Specified Employee Code</span>
                                </div>
                            </div>
                            <!-- Form Row-->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (first name)-->
                                <div class="col-md-4">
                                    <label class="small mb-1" for="firstName">First name</label>
                                    <input class="form-control" id="firstName" type="text" placeholder="Enter  first name" >
                                    <span class="form-text small text-danger ms-2  d-none"  >Specify First Name</span>
                                </div>
                                 <!-- Form Group (middle name)-->
                                 <div class="col-md-4">
                                    <label class="small mb-1" for="middleName">Middle name</label>
                                    <input class="form-control" id="middleName" type="text" placeholder="Enter middle name" >
                                    <span class="form-text small text-danger ms-2  d-none"  >Specify Middle Name</span>
                                </div>
                                <!-- Form Group (last name)-->
                                <div class="col-md-4">
                                    <label class="small mb-1" for="lastName">Last name</label>
                                    <input class="form-control" id="lastName" type="text" placeholder="Enter last name" >
                                    <span class="form-text small text-danger ms-2  d-none" >Specify Last Name</span>
                                </div>
                            </div>
                          
                            <!-- Form Row-->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (birthday)-->
                                <div class="col-md-4">
                                    <label class="small mb-1" for="birthDate">Birthday</label>
                                    <input class="form-control" id="birthDate" type="date" name="birthday" placeholder="Enter  birthday" >
                                    <span class="form-text small text-danger ms-2  d-none"  >Specify Birthday</span>
                                </div> 
                                <div class="col-md-4 ">
                                    <label class="small  mt-2 " for="birthDate">Gender</label><br>
                                    <div class="border p-2 rounded " style="border: 3px;">
                                        <div class="form-check d-inline-flex mt-1 ">
                                            <input class="form-check-input" type="radio" value="" id="flexCheckDefault" name="gender">
                                            <label class="form-check-label" for="flexCheckDefault">
                                                &nbsp;Male        
                                            </label>
                                        </div>
                                        <div class="form-check d-inline-flex ms-2">
                                            <input class="form-check-input" type="radio" value="" id="flexCheckChecked" name="gender"  >
                                            <label class="form-check-label" for="flexCheckChecked">
                                                &nbsp; Female
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <!-- Form Group (phone number)-->
                                <div class="col-md-4">
                                    <label class="small mb-1" for="empPhone">Phone number</label>
                                    <input class="form-control" id="empPhone" type="text" placeholder="Enter  phone number" >
                                    <span class="form-text small text-danger ms-2  d-none" >Specify Phone number</span>
                                </div>
                                
                            </div>
                            <div class="row gx-3 ">
                                <!-- Form Group (email address)-->
                                <div class="col-md-4 mb-3">
                                    <label class="small mb-1" for="empEmail">Email address</label>
                                    <input class="form-control" id="empEmail" type="email" placeholder="Enter  email address"  >
                                    <span class="form-text small text-danger ms-2  d-none"  >Specify Email address</span>
                                </div>
                                <div class="col-md-4 ">
                                    <label class="small mb-1" for="state">Choose State</label>
                                    <select id="state" class="form-control form-select" name="state">
                                        <option value="AN">Andaman and Nicobar Islands</option>
                                        <option value="AP">Andhra Pradesh</option>
                                        <option value="AR">Arunachal Pradesh</option>
                                        <option value="AS">Assam</option>
                                        <option value="BR">Bihar</option>
                                        <option value="CH">Chandigarh</option>
                                        <option value="CT">Chhattisgarh</option>
                                        <option value="DN">Dadra and Nagar Haveli</option>
                                        <option value="DD">Daman and Diu</option>
                                        <option value="DL">Delhi</option>
                                        <option value="GA">Goa</option>
                                        <option value="GJ">Gujarat</option>
                                        <option value="HR">Haryana</option>
                                        <option value="HP">Himachal Pradesh</option>
                                        <option value="JK">Jammu and Kashmir</option>
                                        <option value="JH">Jharkhand</option>
                                        <option value="KA">Karnataka</option>
                                        <option value="KL">Kerala</option>
                                        <option value="LA">Ladakh</option>
                                        <option value="LD">Lakshadweep</option>
                                        <option value="MP">Madhya Pradesh</option>
                                        <option value="MH">Maharashtra</option>
                                        <option value="MN">Manipur</option>
                                        <option value="ML">Meghalaya</option>
                                        <option value="MZ">Mizoram</option>
                                        <option value="NL">Nagaland</option>
                                        <option value="OR">Odisha</option>
                                        <option value="PY">Puducherry</option>
                                        <option value="PB">Punjab</option>
                                        <option value="RJ">Rajasthan</option>
                                        <option value="SK">Sikkim</option>
                                        <option value="TN">Tamil Nadu</option>
                                        <option value="TG">Telangana</option>
                                        <option value="TR">Tripura</option>
                                        <option value="UP">Uttar Pradesh</option>
                                        <option value="UT">Uttarakhand</option>
                                        <option value="WB">West Bengal</option>
                                    </select>
                                </div>
                                 </div>
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (City)-->
                                <div class="col-md-4">
                                    <label class="small mb-1" for="empCity">City</label>
                                    <input class="form-control" id="empCity" type="text" placeholder="Enter City"   >
                                    <span class="form-text small text-danger ms-2  d-none" >Specify City</span>
                                    
                                </div>
                                <!-- Form Group (birthday)-->
                                <div class="col-md-4">
                                    <label class="small mb-1" for="empPincode">Pincode</label>
                                    <input class="form-control  input-sm" id="empPincode" type="number" name="birthday" placeholder="Enter Pincode"  >
                                    <span class="form-text small text-danger ms-2  d-none"  >Specify Pincode</span>
                                    
                                </div> 
                                <!-- Form Group (Active)-->
                                <div class="col-md-4">
                                    <label class="small mb-1" for="empAddress">Address</label>
                                    <textarea class="form-control" id="empAddress" type="text" placeholder="Enter Address" value=""> </textarea>
                                    <span class="form-text small text-danger ms-2  d-none"  >Specify Address</span>
                                </div>
                            </div>
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (dataOfJoin)-->
                                <div class="col-md-4">
                                    <label class="small mb-1" for="dateOfJoin">Date of join</label>
                                    <input class="form-control" id="dateOfJoin" type="date" >
                                    <span class="form-text small text-danger ms-2  d-none" >Specify joining date</span>
                                    
                                </div>
                                <!-- Form Group (dataOfResign)-->
                                <div class="col-md-4">
                                    <label class="small mb-1" for="dateOfResign">Date of Resign</label>
                                    <input class="form-control" id="dateOfResign" type="date" >
                                    <span class="form-text small text-muted ms-2 "  >Optional For Now</span>  
                                </div> 
                            </div>
                            <!-- Save changes button-->
                            <!-- <div class="row ms-3 "> -->
                                <div class="row justify-content-center ">
                                    <button class="btn btn-secondary px-5  mt-2 mt-sm-0 me-2 w-auto " type="button" onclick="history.back()" > Back  </button>
                                    <button class="btn btn-primary  px-3  ms-sm-3 w-auto" type="submit" id="btnSave"  >
                                    <span id="loadingBtn"> </span> &nbsp; Save Changes &nbsp;
                                </button>
                                <button class="btn btn-danger px-5  mt-2 mt-sm-0 ms-sm-3 w-auto " type="reset" onclick="this.blur()" > Reset  </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    <br><br><br>
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
        if(!($("#dateOfJoin").val())){
            $("#dateOfJoin").addClass("is-invalid");
            $("#dateOfJoin").siblings("span").removeClass("d-none");
            flag = false;
        }
        return flag;
    }
    function getCurrentDate(){
        let date = new Date();
        let day = date.getDate().toString().length == 1? '0'+date.getDate().toString() : date.getDate().toString() ;
        let month = date.getMonth().toString().length == 1? '0'+date.getMonth().toString() : date.getMonth().toString() ;
        let year =date.getFullYear().toString();   
        return year+'-'+month+'-'+day;
    }
            
    $("#EditUserForm").on("submit",function (event) {
        event.preventDefault();
        if(isValid()){     
            $("#loadingBtn").addClass("spinner-border spinner-border-sm"); 
            let date =getCurrentDate();
            let data = {
                empId:$("#empId").val(),
                firstName:$("#firstName").val(),
                middleName:$("#middleName").val(),
                lastName:$("#lastName").val(),
                empCity:$("#empCity").val(),
                empPincode:$("#empPincode").val(),
                empAddress:$("#empAddress").val(),
                birthDate:$("#birthDate").val(),
                empEmail:$("#empEmail").val(),
                empPhone:$("#empPhone").val(),
                state:$("#state").val(),
                gender:$("input[name=gender]").val(),
                dateOfJoin:$("#dateOfJoin").val(),
                dateOfResign:$("#dateOfResign").val(),
                createdTime:date,
            }
          
            $.ajax({
                type: 'POST',
                url: 'employee-add-process',
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
                            location.replace('/employee-master');
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