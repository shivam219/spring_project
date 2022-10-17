<%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create User  </title>
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
                    <div class="card-header text-center">Edit User</div>
                    <div class="card-body">
                        <form method="post" action="EditUser" id="EditUserForm"  >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-4">
                                <table>
                                    <tr>
                                        <label class="small mb-1" for="empName">Employee Name</label>
                                        <input class="form-control" id="empId" type="text" placeholder="Choose Employee Name" value="${empId}" readonly>    
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="empId">Employee Id</label>
                                            <input class="form-control" id="empId" type="text" placeholder="Choose Employee Name" value="${empId}" readonly>    
                                        </div>
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="password"> User Password</label>
                                            <input class="form-control" id="password" type="text" placeholder="Enter User Password" value="${password}">
                                            <span class="form-text small text-danger ms-2  d-none"  >Specify User Password</span>     
                                        </div>
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="active">Status</label>
                                            <select id="active" class="form-control form-select">
                                                    <option value="1" <c:if test='${active eq "1"}'>selected="selected"</c:if> > Active</option>
                                                    <option value="0" <c:if test='${active eq "0"}'>selected="selected"</c:if>  >In-Active</option>
                                            </select>
                                            <span class="form-text small text-danger ms-2  d-none"  >Specify Status</span>     
                                        </div>
                                    </tr>
                                    <tr>
                                        <label class="small mb-1" for="manager">Reporting Manger</label>
                                        <select id="manager" class="form-control form-select">
                                            <option value="" ><-- Select Manger --></option>
                                                <c:forEach items="${empList}" var="emp">
                                                    <option value="${emp.getEmpId()}"  <c:if test="${emp.getEmpId() eq managerId}">selected="selected"</c:if> >${emp.getFirstName()} ${emp.getLastName()} </option>
                                                </c:forEach>         
                                        </select>
                                        <span class="form-text small text-danger ms-2  d-none"  >Specify Reporting Manager</span>     
                                    </tr>
                                </table>
                            </div>
                            <!-- Save changes button-->
                            <div class="row justify-content-center mt-3 ">
                                <button class="btn btn-primary px-3 w-auto" type="submit" id="btnSave"  >
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
        function setEmployeeId(){
            $('#empId').val($('#empName').val());
        }
    function isValid() {
        let flag = true;
        if(!($("#empName").val())){
            $("#empName").addClass("is-invalid");
            $("#empName").siblings("span").removeClass("d-none");
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
        return flag;
    }
    $("#EditUserForm").on("submit",function (event) {
        event.preventDefault();
        if(isValid()){     
            $("#loadingBtn").addClass("spinner-border spinner-border-sm"); 
            let data = {
                empId:$("#empId").val(),
                password:$("#password").val(),
                managerId:$("#manager").val(),
                active: $("#active").val()
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
                        text: "User Created Successfully",
                        icon: "success",
                    }).
                    then(function (isOkay) {
                        if (isOkay) {
                            location.replace('/user-master');
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