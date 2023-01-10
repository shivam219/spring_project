 <%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create User  </title>
    <link rel="stylesheet" href="css/form-style.css">
    <link href="css/select@2.4.1.0.min.css" rel="stylesheet" /> 
</head>
<body>
    
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <!-- Edit User Details card-->
                <div class="card mb-4">
                    <div class="card-header text-center">Create User</div>
                    <div class="card-body">
                        <form method="post" action="EditUser" id="EditUserForm"  >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-4">
                                <table>
                                    <tr class="overflow-hidden">
                                        <label class="small mb-1" for="empId">Employee Name</label>
                                        <select id="empId" class="form-control form-select"  >
                                            <option value=""> <-- Select Employee -- ></option>
                                            <c:forEach items="${empList}" var="emp">
                                                <option value="${emp.getEmpId()}">${emp.getFullName()} </option>
                                            </c:forEach>
                                        </select>
                                        <span class="form-text small text-danger ms-2  d-none"  >Specify Employee Name</span>
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="password"> User Password</label>
                                            <input class="form-control" id="password" type="text" placeholder="Enter User Password" value="">
                                        </div>
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="active">Status</label>
                                            <select id="active" class="form-control form-select">
                                                <option value="" ><-- Select Status --></option>
                                                <option value="1" >Active</option>
                                                <option value="0">In-Active</option>
                                            </select>
                                        </div>
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="manager">Manger</label>
                                            <select id="manager" class="form-control form-select">
                                                <option value="" ><-- Select Manger --></option>
                                                <c:forEach items="${managerList}" var="emp">
                                                    <option value="${emp.getEmpId()}">${emp.getFullName()} </option>
                                                </c:forEach>         
                                            </select>
                                        </div>
                                        </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="leaveManager">Leave Manger</label>
                                            <select id="leaveManager" class="form-control form-select">
                                                <option value="" ><-- Leave Manger --></option>
                                                <c:forEach items="${managerList}" var="emp">
                                                    <option value="${emp.getEmpId()}">${emp.getFullName()} </option>
                                                </c:forEach>        
                                            </select>
                                        </div>
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="leaveApproveManager">Leave Approve Manger</label>
                                            <select id="leaveApproveManager" class="form-control form-select">
                                                <option value="" ><-- Leave Approve Manger --></option>
                                                <c:forEach items="${managerList}" var="emp">
                                                    <option value="${emp.getEmpId()}">${emp.getFullName()} </option>
                                                </c:forEach>         
                                            </select>
                                         </div>
                                    </tr>
                                    <tr>  
                                        <label class="small mb-1" for="ugrpCode"> User Designation</label>
                                        <select name="ugrpCode" id="ugrpCode" class="form-control form-select">
                                            <option value="" ><-- Select Designation --></option>
                                                <c:forEach items="${userGroupList}" var="group" varStatus="loop">
                                                    <option value="${group.getUgrpCode()}"  <c:if test="${group.getUgrpCode() eq empUgrpCode}">selected="selected"</c:if> >${group.getUgrpDesc()}</option>
                                                </c:forEach>         
                                        </select>
                                    </tr>
                                </table>
                            </div>
                            <div class="row justify-content-center mt-3 gap-2">
                                <button class="btn btn-secondary btn-sm px-5 w-auto order-md-1 order-2" type="button" onclick="history.back()" > Back  </button> 
                                <button class="btn btn-primary btn-sm px-3 w-auto   order-md-2 order-1" type="submit" id="btnSave"  >
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
            $("#empId").addClass("is-invalid");
            $("#empId").siblings("span").removeClass("d-none");
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
                roles:$("#ugrpCode").val(),
                leaveReportingManager:$("#leaveManager").val(),
                leaveManager:$("#leaveApproveManager").val(),
            }
            $.ajax({
                type: 'POST',
                url: 'user-master-add-process',
                data:JSON.stringify(data),
                contentType :'application/json',
                success: function (data,msg,xh) {
                    $("#btnSave").blur();
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                    swal({
                        title:"Success",
                        text: "User Created Successfully",
                        icon: "success",
                        button: false,
                    });
                    location.replace('user-master');
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