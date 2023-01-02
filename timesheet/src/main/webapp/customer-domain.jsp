 <%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Customer Domain Add </title>

    <link rel="stylesheet" href="css/form-style.css">
</head>
<body>
    
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <div class="card mb-4">
                    <div class="card-header text-center">Customer Domain</div>
                    <div class="card-body">
                        <form method="post" action="EditUser" id="EditUserForm"  >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-4">
                                <table>
                                    <tr>
                                        <label class="small mb-1" for="customerDomain">Add Customer Domain</label>
                                        <input class="form-control" id="customerDomain" type="text" placeholder="Enter Domain" value="">
                                        <span class="form-text small text-danger ms-2  d-none"  >Specify Domain</span>     
                                    </tr>
                                </table>
                            </div>
                            <div class="row justify-content-center mt-3 gap-2 ">
                                <button class="btn btn-secondary btn-sm px-3  w-auto " type="button" onclick="location='customer-master'" > Back  </button> 
                                <button class="btn btn-primary btn-sm px-3 w-auto" type="submit" id="btnSave"  >
                                    <span id="loadingBtn"> </span> &nbsp; Create Domain&nbsp;
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
    function isValid() {
        let flag = true;
        if(!($("#customerDomain").val())){
            $("#customerDomain").addClass("is-invalid");
            $("#customerDomain").siblings("span").removeClass("d-none");
            flag = false;
        }
        return flag;
    }
    $("#EditUserForm").on("submit",function (event) {
        event.preventDefault();
        if(isValid()){     
            $("#loadingBtn").addClass("spinner-border spinner-border-sm"); 
            let data = {customerDomain : $("#customerDomain").val()}
            $.ajax({
                type: 'POST',
                url: 'customer-domain-create',
                data:JSON.stringify(data),
                contentType :'application/json',
                success: function (data,msg,xh) {
                    $("#btnSave").blur();
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                    swal({
                        title:"Success",
                        text: "Domain Created Successfully",
                        icon: "success",
                    }).
                    then(function (isOkay) {
                        if (isOkay) {
                            location.href='customer-master';
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