 <%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit User Group Mapping  </title>
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
                    <div class="card-header text-center"> User Group Mapping Edit</div>
                    <div class="card-body">
                        <form id="MapUserGroup"  >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-4">
                                <table>
                                    <tr>
                                        <label class="small mb-1" for="empName">Employee Name</label>
                                        <input class="form-control" id="empName" type="text" value="${empName}" readonly>
                                    </tr>
                                    <tr>
                                        <label class="small mb-1" for="empId">Employee Id</label>
                                        <input class="form-control" id="empId" type="text" value="${empId}" readonly>
                                        <input id="id" type="hidden" value="${id}" readonly>
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
                            <!-- Save changes button-->
                            <div class="row justify-content-center mt-3 ">
                                <button class="btn btn-secondary  mt-2 mt-sm-0 me-2 w-auto " type="button" onclick="history.back()" > Back  </button> 
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
    function isValid() {
        let flag = true;
        if(!($("#ugrpCode").val())){
            $("#ugrpCode").addClass("is-invalid");
            $("#ugrpCode").siblings("span").removeClass("d-none");
            flag = false;
        }
        return flag;
    }
    $("#MapUserGroup").on("submit",function (event) {
        event.preventDefault();
        if(isValid()){     
            $("#loadingBtn").addClass("spinner-border spinner-border-sm"); 
            let data = {
                id :$("#id").val() ,
                empId :$("#empId").val() ,
                ugrpCode:$("#ugrpCode").val()
            }
            $.ajax({
                type: 'POST',
                url: 'user-group-mapping-edit-process',
                data:JSON.stringify(data),
                contentType :'application/json',
                success: function (data,msg,xh) {
                    $("#btnSave").blur();
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                    swal({
                        title:"Success",
                        text: "Employee Group Updated Successfully",
                        icon: "success",
                    }).
                    then(function (isOkay) {
                        if (isOkay) {
                            location.replace('user-group-mapping-master');
                        }
                    });
                },error : function(data,msg,xh){
                    swal({
                        title:"Error",
                        text: "User is already mapped",
                        icon: "error",
                    }).
                    then(function (isOkay) {
                        if (isOkay) {
                            // location.replace('/user-master');
                        }
                    });
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