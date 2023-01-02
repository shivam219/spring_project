<%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create User  </title>
    <link rel="stylesheet" href="css/form-style.css">
</head> 
<body>
    
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <!-- Edit User Details card-->
                <div class="card mb-4">
                    <div class="card-header text-center">Edit User</div>
                    <div class="card-body">
                        <form method="post" action="EditUser" id="EditUserForm"  >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-4">
                                <table>
                                    <tr>
                                        <div class="row justify-content-center">
                                            <div class="col-md-6 text-center"> 
                                                <label class="small mb-1" for="empName">Employee Name</label>
                                                <h6>${user.getEmployee().getFullName()}</h6>   
                                                <input id="empId" type="hidden" placeholder="Choose Employee Name" value="${user.getEmpId()}" readonly>        
                                            </div>
                                            <div class="col-md-6 text-center">
                                                <label class="small mb-1" for="empName">Employee Code</label>
                                                <h6>${user.getEmpId()}</h6>  
                                            </div>
                                        </div> 
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="password"> User Password</label>
                                            <input class="form-control" id="password" type="text" placeholder="Enter User Password" value="${user.getPassword()}">
                                            <span class="form-text small text-danger ms-2  d-none"  >Specify User Password</span>     
                                        </div>
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="active">Status</label>
                                            <select id="active" class="form-control form-select">
                                                    <option value="1" <c:if test='${user.getActive() eq 1 }'>selected="selected"</c:if> > Active</option>
                                                    <option value="0" <c:if test='${user.getActive() eq 0 }'>selected="selected"</c:if>  >In-Active</option>
                                            </select>
                                            <span class="form-text small text-danger ms-2  d-none"  >Specify Status</span>     
                                        </div>
                                    </tr>
                                    <tr>
                                        <label class="small mb-1" for="manager">Manager</label>
                                        <select id="manager" class="form-control form-select">
                                            <option value="" ><-- Select Manager --></option>
                                                <c:forEach items="${managerList}" var="emp">
                                                    <option value="${emp.getEmpId()}"  <c:if test="${emp.getEmpId() eq user.getManagerId()}">selected="selected"</c:if> >${emp.getFirstName()} ${emp.getLastName()} </option>
                                                </c:forEach>         
                                        </select>
                                        <span class="form-text small text-danger ms-2  d-none"  >Specify Reporting Manager</span>     
                                    </tr>
                                    <tr>
                                        <label class="small mb-1" for="leaveManager">Leave Manager</label>
                                        <select id="leaveManager" class="form-control form-select">
                                            <option value="" ><-- Select Manager --></option>
                                                <c:forEach items="${managerList}" var="emp">
                                                    <option value="${emp.getEmpId()}"  <c:if test="${emp.getEmpId() eq user.getLeaveReportingManager()}">selected="selected"</c:if> >${emp.getFirstName()} ${emp.getLastName()} </option>
                                                </c:forEach>         
                                        </select>
                                        <span class="form-text small text-danger ms-2  d-none"  >Specify Reporting Manager</span>     
                                    </tr>
                                    <tr>
                                        <label class="small mb-1" for="leaveApproveManager">Leave Approve Manager</label>
                                        <select id="leaveApproveManager" class="form-control form-select">
                                            <option value="" ><-- Select Manager --></option>
                                                <c:forEach items="${managerList}" var="emp">
                                                    <option value="${emp.getEmpId()}"  <c:if test="${emp.getEmpId() eq user.getLeaveManager()}">selected="selected"</c:if> >${emp.getFirstName()} ${emp.getLastName()} </option>
                                                </c:forEach>         
                                        </select> 
                                        <span class="form-text small text-danger ms-2  d-none"  >Specify Leave Approve Manager</span>     
                                    </tr>
                                </table>
                            </div>
                            <div class="row justify-content-center mt-3 gap-2 "> 
                                <button class="btn btn-secondary btn-sm px-5   w-auto order-md-1  order-2 " type="button" onclick="history.back()" > Back  </button> 
                                <button class="btn btn-primary btn-sm px-3 w-auto order-md-2 order-1" type="submit" id="btnSave"  >
                                    <span id="loadingBtn"> </span> &nbsp; Save Changes &nbsp;
                                </button>
                            </div>
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
            flag = false;
        }
        if(!($("#password").val())){
            $("#password").addClass("is-invalid");
            $("#password").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#active").val())){
            $("#active").addClass("is-invalid");
            $("#active").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#manager").val())){
            $("#manager").addClass("is-invalid");
            $("#manager").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#leaveManager").val())){
            $("#leaveManager").addClass("is-invalid");
            $("#leaveManager").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#leaveApproveManager").val())){
            $("#leaveApproveManager").addClass("is-invalid");
            $("#leaveApproveManager").siblings("span").removeClass("d-none");
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
                password:$("#password").val(),
                active: $("#active").val(),
                managerId:$("#manager").val(),
                leaveReportingManager:$("#leaveManager").val(),
                leaveManager:$("#leaveApproveManager").val(),
            }
            $.ajax({
                type: 'POST',
                url: 'user-master-edit-process',
                data:JSON.stringify(data),
                contentType :'application/json',
                success: function (data,msg,xh) {
                    $("#btnSave").blur();
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                    swal({
                        title:"Success",
                        text: "User Details Updated Successfully",
                        icon: "success",
                    }).
                    then(function (isOkay) {
                        if (isOkay) {
                            location.replace('user-master');
                        }
                    });
                },error : function(data,msg,xh){
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                }
            }); 
        }else{
            $("#btnSave").blur();
        }
    });
    $("input, select").on("input",function(){
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