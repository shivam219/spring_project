<%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Customer  </title>
    <link rel="stylesheet" href="css/form-style.css">
</head>
<body>
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <div class="card mb-4">
                    <div class="card-header text-center">Add Customer</div>
                    <div class="card-body">
                        <form method="post" id="addCustomerForm"  >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-6 col-lg-4">
                                <table>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="customerId"> Customer Id</label>
                                            <input class="form-control" id="customerId" type="text" placeholder="Enter id" value="">
                                            <span class="form-text small text-danger ms-2  d-none"  >Specify Customer Id</span>     
                                        </div>
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="Name"> Customer Name</label>
                                            <input class="form-control" id="Name" type="text" placeholder="Enter name" value="">
                                            <span class="form-text small text-danger ms-2  d-none"  >Specify Customer Name</span>     
                                        </div>
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="domain"> Customer Domain</label>
                                            <input class="form-control" id="domain" type="text" placeholder="Enter domain" value="">
                                            <span class="form-text small text-danger ms-2  d-none"  >Specify Customer Domain</span>     
                                        </div>
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="essRepresentative">ESS IT Representative</label>
                                            <input class="form-control" id="essRepresentative" type="text" placeholder="Enter representative" value="">
                                            <span class="form-text small text-danger ms-2  d-none"  >Specify Customer representative</span>     
                                        </div>
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="customerRepresentative">Customer Representative</label>
                                            <input class="form-control" id="customerRepresentative" type="text" placeholder="Enter representative" value="">
                                            <span class="form-text small text-danger ms-2  d-none"  >Specify Customer representative</span>     
                                        </div>
                                    </tr>
                                </table>
                            </div>
                            <div class="row justify-content-center mt-3 ">
                                <button class="btn btn-secondary px-5  mt-2 mt-sm-0 me-2 w-auto " type="button" onclick="history.back()" > Back  </button> 
                                <button class="btn btn-primary px-3 w-auto" type="submit" id="btnSave"  >
                                    <span id="loadingBtn"> </span> &nbsp; Add Customer &nbsp;
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
        if(!($("#projectId").val())){
            $("#projectId").addClass("is-invalid");
            $("#projectId").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#projectName").val())){
            $("#projectName").addClass("is-invalid");
            $("#projectName").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#projectStatus").val())){
            $("#projectStatus").addClass("is-invalid");
            $("#projectStatus").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#customerId").val())){
            $("#customerId").addClass("is-invalid");
            $("#customerId").siblings("span").removeClass("d-none");
            flag = false;
        }
        return flag;
    }
    $("#addCustomerForm").on("submit",function (event) {
        event.preventDefault();
        if(isValid()){     
            $("#loadingBtn").addClass("spinner-border spinner-border-sm"); 
            let data = {
                projectId:$("#projectId").val(),
                projectName:$("#projectName").val(),
                projectStatus:$("#projectStatus").val(),
                customerId: $("#customerId").val()
            }
            $.ajax({
                type: 'POST',
                url: 'project-add-process',
                data:JSON.stringify(data),
                contentType :'application/json',
                success: function (data,msg,xh) {
                    $("#btnSave").blur();
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                    swal({
                        title:"Success",
                        text: "Project Added Successfully",
                        icon: "success",
                    }).
                    then(function (isOkay) {
                        if (isOkay) {
                            location.replace('/project-dashboard');
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