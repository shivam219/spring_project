 <%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/form-style.css">
    <title>Edit User Group Mapping  </title>
</head> 
<body>
     
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
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
                            <div class="row justify-content-center mt-3 gap-2 ">
                                <button class="btn btn-secondary px-5   w-auto  order-md-1 order-2" type="button" onclick="history.back()" > Back  </button> 
                                <button class="btn btn-primary px-3 w-auto order-md-2 order-1" type="submit" id="btnSave"  >
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
                        showConfirmButton: false,
                        timer: 1000
                    });
                    location.replace('user-group-mapping-master');
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