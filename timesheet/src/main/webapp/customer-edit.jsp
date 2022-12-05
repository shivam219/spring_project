<%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Customer </title>
    <link rel="stylesheet" href="css/form-style.css">
</head>  
<body>
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <div class="card mb-4">
                    <div class="card-header text-center">Edit Customer</div>
                    <div class="card-body">
                        <form method="post" id="addCustomerForm"  >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-6 col-lg-4">
                                <table>
                                    <tr>
                                        <input type="hidden" value="${customer.getCustomerId()}" id="customerId">
                                        <div>
                                            <label class="small mb-1" for="customerName"> Customer Name</label>
                                            <input class="form-control" id="customerName" type="text" placeholder="Enter name" value="${customer.getCustomerName()}">
                                            <span class="form-text small text-danger ms-2  d-none"  >Specify Customer Name</span>     
                                        </div>
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="customerType"> Customer Domain</label>
                                            <select id="customerType" class="form-control form-select">
                                                <option value="" ><-- choose domain--></option>
                                                <c:forEach items="${customerDomains}" var="d">
                                                    <option value="${d.getId()}" <c:if test="${d.getId() eq customer.getCustomerDomain().getId()}">selected="selected"</c:if>  >${d.getCustomerDomain()} </option>
                                                </c:forEach>         
                                            </select>  
                                        </div>
                                    </tr>
                                    <tr>
                                          <label class="small mb-1" for="empId">ESS IT Representative</label>
                                            <select id="empId" class="form-control form-select">
                                                <option value="" ><-- choose representative --></option>
                                                <c:forEach items="${users}" var="user">
                                                    <option value="${user.getEmpId()}" <c:if test="${user.getEmpId() eq customer.getUser().getEmpId()}">selected="selected"</c:if>  >${user.getEmployee().getFullName()} </option>
                                                </c:forEach>         
                                            </select>
                                        </div>
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="cur">Customer Representative</label>
                                            <input class="form-control" id="cur" type="text" placeholder="Enter representative" value="${customer.getCustomerRepresentative()}">
                                            <span class="form-text small text-danger ms-2  d-none"  >Specify Customer representative</span>     
                                        </div>
                                    </tr>
                                </table>
                            </div>
                            <div class="row justify-content-center mt-3 gap-2 ">
                                <button class="btn btn-secondary px-5  w-auto  order-md-1 order-2" type="button" onclick="location='customer-master'" > Back  </button> 
                                <button class="btn btn-primary px-3 w-auto order-md-2 order-1" type="submit" id="btnSave"  >
                                    <span id="loadingBtn"> </span> &nbsp;  Save Changes &nbsp;
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
        if(!($("#customerId").val())){
            $("#customerId").addClass("is-invalid");
            $("#customerId").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#customerType").val())){
            $("#customerType").addClass("is-invalid");
            $("#customerType").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#customerName").val())){
            $("#customerName").addClass("is-invalid");
            $("#customerName").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#empId").val())){
            $("#empId").addClass("is-invalid");
            $("#empId").siblings("span").removeClass("d-none");
            flag = false;
        }
        if(!($("#cur").val())){
            $("#cur").addClass("is-invalid");
            $("#cur").siblings("span").removeClass("d-none");
            flag = false;
        }
        return flag;
    }
    $("#addCustomerForm").on("submit",function (event) {
        event.preventDefault();
        if(isValid()){     
            $("#loadingBtn").addClass("spinner-border spinner-border-sm"); 
            let data = {
                customerId: $("#customerId").val(),
                customerName:$("#customerName").val(),
                customerType:$("#customerType").val(),
                customerRepresentative:$("#cur").val(),
                user:{
                    empId:$("#empId").val(),
                },
                customerDomain:{
                    id:$("#customerType").val()
                }
            }
            console.log(data);
            $.ajax({
                type: 'POST',
                url: 'customer-edit-process',
                data:JSON.stringify(data),
                contentType :'application/json',
                success: function (data,msg,xh) {
                    $("#btnSave").blur();
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                    swal({
                        title:"Success",
                        text: "Customer Edited Successfully",
                        icon: "success",
                    }).
                    then(function (isOkay) {
                        if (isOkay) {
                            location.replace('/customer-master');
                        }
                    });
                },error : function(data,msg,xh){
                    $("#btnSave").blur();
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                    swal({
                        title:"Error",
                        text: "Unable to edit customer",
                        icon: "error",
                    }).
                    then(function (isOkay) {
                        if (isOkay) {
                            location.replace('/project-master');
                        }
                    });
                     					
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