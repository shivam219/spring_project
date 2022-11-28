<%@ include file="menu.jsp" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <title>Edit User </title>
    </head>
    <style>
        body {
            background-color: #f2f6fc;
            color: #69707a;
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

        .form-control,
        .dataTable-input {
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
        }
    </style>

    <body>

        <div class="container-xl px-4 mt-4">
            <div class="row px-4 ">
                <div class="col col-xl-12">
                    <!-- Edit User Details card-->
                    <div class="card mb-4">
                        <div class="card-header text-center">Edit Employee Details</div>
                        <div class="card-body">
                            <form method="post" action="EditUser" id="EditUserForm">
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (username)-->
                                    <div class="col-md-4">
                                        <label class="small mb-1" for="empId">Employee Code </label>
                                        <input class="form-control" id="empId" type="text" placeholder="Enter  Code"
                                            value="${emp.getEmpId()}" readonly>
                                        <span class="form-text  small  text-danger ms-2 d-none ">Specified Employee
                                            Code</span>
                                    </div>
                                </div>
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (first name)-->
                                    <div class="col-md-4">
                                        <label class="small mb-1" for="firstName">First name</label>
                                        <input class="form-control" id="firstName" type="text"
                                            placeholder="Enter  first name" value="${emp.getFirstName()}">
                                        <span class="form-text small text-danger ms-2  d-none">Specify First Name</span>
                                    </div>
                                    <!-- Form Group (middle name)-->
                                    <div class="col-md-4">
                                        <label class="small mb-1" for="middleName">Middle name</label>
                                        <input class="form-control" id="middleName" type="text"
                                            placeholder="Enter middle name" value="${emp.getMiddleName()}">
                                        <span class="form-text small text-danger ms-2  d-none">Specify Middle
                                            Name</span>
                                    </div>
                                    <!-- Form Group (last name)-->
                                    <div class="col-md-4">
                                        <label class="small mb-1" for="lastName">Last name</label>
                                        <input class="form-control" id="lastName" type="text"
                                            placeholder="Enter last name" value="${emp.getLastName()}">
                                        <span class="form-text small text-danger ms-2  d-none">Specify Last Name</span>
                                    </div>
                                </div>

                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (birthday)-->
                                    <div class="col-md-4">
                                        <label class="small mb-1" for="birthDate">Birthday</label>
                                        <input class="form-control" id="birthDate" type="date" name="birthday"
                                            placeholder="Enter  birthday" value="${emp.getBirthDate()}">
                                        <span class="form-text small text-danger ms-2  d-none">Specify Birthday</span>
                                    </div>
                                    <div class="col-md-4 ">
                                        <label class="small  mt-2 " for="birthDate">Gender</label><br>
                                        <div class="border p-2 rounded " style="border: 3px;">
                                            <c:if test='${emp.getGender().equals("M")}'>
                                                <div class="form-check d-inline-flex mt-1 ">
                                                    <input class="form-check-input" type="radio" value="M"
                                                        id="flexCheckDefault" name="gender" checked>
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        &nbsp;Male
                                                    </label>
                                                </div>
                                                <div class="form-check d-inline-flex ms-2">
                                                    <input class="form-check-input" type="radio" value="F"
                                                        id="flexCheckChecked" name="gender">
                                                    <label class="form-check-label" for="flexCheckChecked">
                                                        &nbsp; Female
                                                    </label>
                                                </div>
                                            </c:if>
                                            <c:if test='${!emp.getGender().equals("M")}'>
                                                <div class="form-check d-inline-flex mt-1 ">
                                                    <input class="form-check-input" type="radio" value="M"
                                                        id="flexCheckDefault" name="gender">
                                                    <label class="form-check-label" for="flexCheckDefault">
                                                        &nbsp;Male
                                                    </label>
                                                </div>
                                                <div class="form-check d-inline-flex ms-2">
                                                    <input class="form-check-input" type="radio" value="F"
                                                        id="flexCheckChecked" name="gender" checked>
                                                    <label class="form-check-label" for="flexCheckChecked">
                                                        &nbsp; Female
                                                    </label>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    <!-- Form Group (phone number)-->
                                    <div class="col-md-4">
                                        <label class="small mb-1" for="empPhone">Phone number</label>
                                        <input class="form-control" id="empPhone" type="text"
                                            placeholder="Enter  phone number" value="${emp.getEmpPhone()}">
                                        <span class="form-text small text-danger ms-2  d-none">Specify Phone
                                            number</span>
                                    </div>

                                </div>
                                <div class="row gx-3 ">
                                    <!-- Form Group (email address)-->
                                    <div class="col-md-4 mb-3">
                                        <label class="small mb-1" for="empEmail">Email address</label>
                                        <input class="form-control" id="empEmail" type="email"
                                            placeholder="Enter  email address" value="${emp.getEmpEmail()}">
                                        <span class="form-text small text-danger ms-2  d-none">Specify Email
                                            address</span>
                                    </div>
                                    <div class="col-md-4 ">
                                        <label class="small mb-1" for="country">Choose Country</label>
                                        <select id="country" class="form-control form-select" name="country">
                                            <c:forEach items="${countryList}" var="c">   
                                                <option value="${c.getLocDesc()}" <c:if test="${c.getLocDesc() eq emp.getCountry() }">selected="selected" </c:if> >${c.getLocDesc()}</option>
                                            </c:forEach>
                                        </select>
                                    </div> 
                                    <div class="col-md-4 ">    
                                        <label class="small mb-1" for="state">Choose State</label>
                                        <select id="state" class="form-control form-select" name="state">
                                            <c:forEach items="${stateList}" var="s">
                                                <option value="${s.getLocDesc()}" <c:if test="${s.getLocDesc() eq emp.getState() }">selected="selected" </c:if> >${s.getLocDesc()}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (City)-->
                                    <div class="col-md-4">
                                        <label class="small mb-1" for="empCity">City</label>
                                        <input class="form-control" id="empCity" type="text" placeholder="Enter City"
                                            value="${emp.getEmpCity()}">
                                        <span class="form-text small text-danger ms-2  d-none">Specify City</span>

                                    </div>
                                    <!-- Form Group (birthday)-->
                                    <div class="col-md-4">
                                        <label class="small mb-1" for="empPincode">Pincode</label>
                                        <input class="form-control  input-sm" id="empPincode" type="number"
                                            name="birthday" placeholder="Enter Pincode" value="${emp.getEmpPincode()}">
                                        <span class="form-text small text-danger ms-2  d-none">Specify Pincode</span>

                                    </div>
                                    <!-- Form Group (Active)-->
                                    <div class="col-md-4">
                                        <label class="small mb-1" for="empAddress">Address</label>
                                        <textarea class="form-control" id="empAddress" type="text"
                                            placeholder="Enter Address" value="">${emp.getEmpAddress()}</textarea>
                                        <span class="form-text small text-danger ms-2  d-none">Specify Address</span>
                                    </div>
                                </div>
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (dataOfJoin)-->
                                    <div class="col-md-4">
                                        <label class="small mb-1" for="dateOfJoin">Date of join</label>
                                        <input class="form-control" id="dateOfJoin" type="date"
                                            value="${emp.getDateOfJoin()}" readonly>
                                        <span class="form-text small text-danger ms-2  d-none">Specify joining
                                            date</span>

                                    </div>
                                    <!-- Form Group (dataOfResign)-->
                                    <div class="col-md-4">
                                        <label class="small mb-1" for="dateOfResign">Date of Resign</label>
                                        <input class="form-control" id="dateOfResign" type="date"
                                            value="${emp.getDateOfResign()}">
                                        <span class="form-text small text-muted ms-2 ">Optional For Now</span>
                                    </div>
                                </div>
                                <!-- Save changes button-->
                                <div class="row justify-content-center ">
                                    <button class="btn btn-secondary px-5  mt-2 mt-sm-0 me-3 w-auto " type="button"
                                        onclick="history.back()"> Back </button>
                                    <button class="btn btn-primary px-3 w-auto" type="submit" id="btnSave">
                                        <span id="loadingBtn"> </span> &nbsp; Save Changes &nbsp;
                                    </button>
                                    <button class="btn btn-danger px-5  mt-2 mt-sm-0 ms-sm-3 w-auto " type="reset"
                                        onclick="this.blur()"> Reset </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            console.log(document.baseURI);
            console.log(location.host);//localhost:8080
            console.log(location.hostname); //hostname
            console.log(location.href);//http://localhost:8080/employee-edit?empId=10
            console.log(location.origin);//http://localhost:8080
            console.log(location.pathname);// /employee-edit
            console.log(location.port);// 8080
            console.log(location.protocol);// http
            console.log(location.search);// ?empId=10
            console.log(location);// ?empId=10
            console.log(history);
            console.log(screen);
            console.log(document.referrer);
            console.log(document.referrer.replace(location.origin, ''));


            function isValid() {
                let flag = true;
                if (!($("#empId").val())) {
                    $("#empId").addClass("is-invalid");
                    $("#empId").siblings("span").removeClass("d-none");
                    flag = false;
                }
                if (!($("#firstName").val())) {
                    $("#firstName").addClass("is-invalid");
                    $("#firstName").siblings("span").removeClass("d-none");
                    flag = false;
                }
                if (!($("#lastName").val())) {
                    $("#lastName").addClass("is-invalid");
                    $("#lastName").siblings("span").removeClass("d-none");
                    flag = false;
                }
                if (!($("#empEmail").val())) {
                    $("#empEmail").addClass("is-invalid");
                    $("#empEmail").siblings("span").removeClass("d-none");
                    flag = false;
                }
                if (!($("#empPhone").val())) {
                    $("#empPhone").addClass("is-invalid");
                    $("#empPhone").siblings("span").removeClass("d-none");
                    flag = false;
                }
                if (!($("#birthDate").val())) {
                    $("#birthDate").addClass("is-invalid");
                    $("#birthDate").siblings("span").removeClass("d-none");
                    flag = false;
                }
                if (!($("#empCity").val())) {
                    $("#empCity").addClass("is-invalid");
                    $("#empCity").siblings("span").removeClass("d-none");
                    flag = false;
                }
                if (!($("#empPincode").val())) {
                    $("#empPincode").addClass("is-invalid");
                    $("#empPincode").siblings("span").removeClass("d-none");
                    flag = false;
                }
                if (!($("#empAddress").val())) {
                    $("#empAddress").addClass("is-invalid");
                    $("#empAddress").siblings("span").removeClass("d-none");
                    flag = false;
                }
                return flag;
            }
            function getCurrentDate() {
                let date = new Date();
                let day = date.getDate().toString().length == 1 ? '0' + date.getDate().toString() : date.getDate().toString();
                let month = date.getMonth().toString().length == 1 ? '0' + date.getMonth().toString() : date.getMonth().toString();
                let year = date.getFullYear().toString();
                return year + '-' + month + '-' + day;
            }
            $("#EditUserForm").on("submit", function (event) {
                event.preventDefault();
                if (isValid()) {
                    $("#loadingBtn").addClass("spinner-border spinner-border-sm");
                    let date = getCurrentDate();
                    let data = {
                        empId: $("#empId").val(),
                        firstName: $("#firstName").val(),
                        middleName: $("#middleName").val(),
                        lastName: $("#lastName").val(),
                        empCity: $("#empCity").val(),
                        empPincode: $("#empPincode").val(),
                        empAddress: $("#empAddress").val(),
                        birthDate: $("#birthDate").val(),
                        empEmail: $("#empEmail").val(),
                        empPhone: $("#empPhone").val(),
                        state: $("#state").val(),
                        country: $("#country").val(),
                        gender: $("input[name=gender]:checked").val(),
                        dateOfJoin: $("#dateOfJoin").val(),
                        dateOfResign: $("#dateOfResign").val(),
                        modifiedTime: date,
                    }
                    $.ajax({
                        type: 'POST',
                        url: 'employee-edit-process',
                        data: JSON.stringify(data),
                        contentType: 'application/json',
                        success: function (data, msg, xh) {
                            $("#btnSave").blur();
                            $("#loadingBtn").removeClass("spinner-border spinner-border-sm");
                            swal({
                                title: "Success",
                                text: "Employee Updated Successfully",
                                icon: "success",
                            }).
                                then(function (isOkay) {
                                    if (isOkay) {
                                        // console.log(document.referrer.replace(location.origin,''));
                                        // http://localhost:8080/employee-master?page=2
                                        location.replace(document.referrer.replace(location.origin, ''));
                                    }
                                });
                            console.log(data);
                        }, error: function (data, msg, xh) {
                            // $("#empId").addClass("is-invalid");
                            // $("#empPassword").addClass("is-invalid");
                            // $("#empPassWar").removeClass("d-none");
                            // $("#empIdWar").  removeClass("d-none");
                            $("#loadingBtn").removeClass("spinner-border spinner-border-sm");
                        }
                    });
                } else {
                    $("#btnSave").blur();
                }
            });
            $("input, textarea ").on("input", function () {
                $(this).removeClass("is-invalid");
                if (!$(this).val()) {
                    $(this).siblings("span").removeClass("d-none");
                } else {
                    $(this).siblings("span").addClass("d-none");
                }
            });

        </script>
        </script>
    </body>

    </html>