<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Employee Month Report</title>
    <link rel="stylesheet" href="css/form-style.css">
</head>

<body>

    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <!-- Edit User Details card-->
                <div class="card mb-4">
                    <div class="card-header text-center">Employee Month Report</div>
                    <div class="card-body">
                        <form method="post" action="report-month-employee-data" id="reportMonthEmloyee">
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-4">
                                    <table>
                                        <tr>
                                            <label class="small mb-1" for="empId">Employee</label>
                                            <select id="empId" name="empId" name="empId" required autofocus
                                                class="form-control form-select">
                                                <option value="">
                                                    <-- Select Employee -->
                                                </option>
                                                <c:forEach items="${employeeName}" var="emp">
                                                    <option value="${emp.getEmpId()}">${emp.getEmployeeName()}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <span class="form-text small text-danger ms-2  d-none">Employee</span>
                                        </tr>
                                        <tr>
                                            <label class="small mb-1" for="yearCode">Emplyee Year</label>
                                            <select id="yearCode" class="form-control form-select" required >
                                                <option value="">
                                                    <-- Choose Year -->
                                                </option>
                                            </select>
                                            <span class="form-text small text-danger ms-2  d-none">Specify
                                                Year</span>
                                        </tr>
                                        <tr>
                                            <label class="small mb-1" for="monthSheetId">Month</label>
                                            <select id="monthSheetId" name="monthSheetId" required class="form-control form-select">
                                                <option value="">
                                                    <-- Choose Month -->
                                                </option>

                                            </select>
                                            <span class="form-text small text-danger ms-2  d-none">Specify Month</span>
                                        </tr>
                                    </table>
                                </div> 
                                <div class="row justify-content-center gap-2  mt-3">
                                    <a class="btn btn-secondary px-5 btn-sm  w-auto" href="home"> Back </a>
                                    <button class="btn btn-primary px-5   btn-sm  w-auto   order-md-2 order-1 " type="submit"> Show </button>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        console.log("hii");
        $("#reportMonthEmloyee").on("submit", function (e) {
            e.preventDefault();
            if ($("#empId").val() && $("#monthSheetId").val()) {
                document.forms[0].submit();
            }
        });

        $("#empId").on("change", function () {
            let empId = $("#empId").val();
            if (empId) {
                let fetchRes = fetch('fetch-employee-year?empId=' + empId + '');
                fetchRes.then(res =>
                    res.json()).then(d => {
                        let str = '<option value=""> <-- Choose Year --> </option>';
                        for (let i = 0; i < d.length; i++) { 
                            let ss = (d[i]);
                            str = str + '<option value=' + d[i] + '>' + ss + '  </option>';
                        }
                        $("#yearCode").html(str);
                        $("#monthSheetId").html('<option value=""> <-- Choose Month --> </option>');
                    })  
            }
        });

        $("#yearCode").on("change", function () {
            let empId = $("#empId").val();
            let yearCode = $("#yearCode").val();
            if (empId) {
                let fetchRes = fetch('fetch-employee-month?empId=' + empId + '&yearCode=' + yearCode + '');
                fetchRes.then(res =>
                    res.json()).then(d => {
                        let str = '';
                        for (let i = 0; i < d.length; i++) {
                            let ss = (d[i][1]);
                            str = str + '<option value=' + d[i][0] + '>' + ss + '  </option>';
                        }
                        $("#monthSheetId").html(str);
                        if (d.length == 0) {
                            $("#monthSheetId").html('<option value=""> <-- No Month --> </option>');
                        }
                    })
            }
        });

    // function isValid() {
    //     let flag = true;
    //     if(!($("#empId").val())){
    //         flag = false;
    //     }
    //     if(!($("#password").val())){
    //         $("#password").addClass("is-invalid");
    //         $("#password").siblings("span").removeClass("d-none");
    //         flag = false;
    //     }
    //     if(!($("#active").val())){
    //         $("#active").addClass("is-invalid");
    //         $("#active").siblings("span").removeClass("d-none");
    //         flag = false;
    //     }
    //     if(!($("#manager").val())){
    //         $("#manager").addClass("is-invalid");
    //         $("#manager").siblings("span").removeClass("d-none");
    //         flag = false;
    //     }
    //     if(!($("#leaveManager").val())){
    //         $("#leaveManager").addClass("is-invalid");
    //         $("#leaveManager").siblings("span").removeClass("d-none");
    //         flag = false;
    //     }
    //     if(!($("#leaveApproveManager").val())){
    //         $("#leaveApproveManager").addClass("is-invalid");
    //         $("#leaveApproveManager").siblings("span").removeClass("d-none");
    //         flag = false;
    //     }
    //     return flag;
    // }
    // $("#EditUserForm").on("submit",function (event) {
    //     event.preventDefault();
    //     if(isValid()){
    //         $("#loadingBtn").addClass("spinner-border spinner-border-sm");
    //         let data = {
    //             empId:$("#empId").val(),
    //             password:$("#password").val(),
    //             active: $("#active").val(),
    //             managerId:$("#manager").val(),
    //             leaveReportingManager:$("#leaveManager").val(),
    //             leaveManager:$("#leaveApproveManager").val(),
    //         }
    //         $.ajax({
    //             type: 'POST',
    //             url: 'user-master-edit-process',
    //             data:JSON.stringify(data),
    //             contentType :'application/json',
    //             success: function (data,msg,xh) {
    //                 $("#btnSave").blur();
    //                 $("#loadingBtn").removeClass("spinner-border spinner-border-sm");
    //                 swal({
    //                     title:"Success",
    //                     text: "User Details Updated Successfully",
    //                     icon: "success",
    //                 }).
    //                 then(function (isOkay) {
    //                     if (isOkay) {
    //                         location.replace('/user-master');
    //                     }
    //                 });
    //             },error : function(data,msg,xh){
    //                 $("#loadingBtn").removeClass("spinner-border spinner-border-sm");
    //             }
    //         });
    //     }else{
    //         $("#btnSave").blur();
    //     }
    // });
    // $("input, select").on("input",function(){
    //     $(this).removeClass("is-invalid");
    //     if(!$(this).val()){
    //         $(this).siblings("span").removeClass("d-none");
    //     }else{
    //         $(this).siblings("span").addClass("d-none");
    //     }
    // }); 
    </script>
</body>

</html>