 <%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Group Edit  </title>
    <link rel="stylesheet" href="css/form-style.css">
</head>
<body>
    
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <!-- Edit User Details card-->
                <div class="card mb-4">
                    <div class="card-header text-center"> User Group Edit</div>
                    <div class="card-body">
                        <form id="EditUserForm"  >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-4">
                                <table>
                                    <tr>
                                        <label class="small mb-1" for="groupDesc"> Group Description</label>
                                        <input  id="ugrpCode" type="hidden"  value="${ug.getUgrpCode()}" >
                                        <input class="form-control" id="groupDesc" type="text" placeholder="Enter Group Description" value="${ug.getUgrpDesc()}">
                                        <span class="form-text small text-danger ms-2  d-none"  >Specify Group Description</span>     
                                    </tr>
                                </table>
                            </div>
                            <div class="row justify-content-center mt-3 gap-2 ">
                                <button class="btn btn-secondary btn-sm px-5   w-auto  order-md-1 order-2" type="button" onclick="history.back()" > Back  </button> 
                                <button class="btn btn-primary btn-sm px-3 w-auto order-md-2 order-1" type="submit" id="btnSave"  >
                                    <span id="loadingBtn"> </span> &nbsp; Save Change&nbsp;
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
        if(!($("#groupDesc").val())){
            $("#groupDesc").addClass("is-invalid");
            $("#groupDesc").siblings("span").removeClass("d-none");
            flag = false;
        }
        return flag;
    }
    $("#EditUserForm").on("submit",function (event) {
        event.preventDefault();
        if(isValid()){     
            $("#loadingBtn").addClass("spinner-border spinner-border-sm"); 
            let data = {
                ugrpCode:  $("#ugrpCode").val(),
                ugrpDesc : $("#groupDesc").val()
            }
            $.ajax({
                type: 'POST',
                url: 'user-group-edit-process',
                data:JSON.stringify(data),
                contentType :'application/json',
                success: function (data,msg,xh) {
                    $("#btnSave").blur();
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                    swal({
                        title:"Success",
                        text: "Group Created Successfully",
                        icon: "success",
                        button: false,
                    });
                    location.replace('user-group-master');
                },error : function(data,msg,xh){
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