<%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Project  </title>
    <link rel="stylesheet" href="css/form-style.css">
</head>
<body>
    
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <div class="card mb-4">
                    <div class="card-header text-center">Add Project</div>
                    <div class="card-body">
                        <form method="post" action="project-process" id="addProjectForm"  >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-6 col-lg-4">
                                <table>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="projectId"> Project Id</label>
                                            <input class="form-control" id="projectId" type="text" placeholder="Enter Project Id" value="">
                                            <span class="form-text small text-danger ms-2  d-none"  >Specify Project Id</span>     
                                        </div>
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="projectName"> Project Name</label>
                                            <input class="form-control" id="projectName" type="text" placeholder="Enter Project Name" value="">
                                            <span class="form-text small text-danger ms-2  d-none"  >Specify Project Name</span>     
                                        </div>
                                    </tr>
                                    <tr>
                                        <div>
                                            <label class="small mb-1" for="projectStatus">Status</label>
                                            <select id="projectStatus" class="form-control form-select">
                                                <option value="" ><-- Select Status --></option>
                                                <option value="1" >Active</option>
                                                <option value="0">In-Active</option>
                                            </select>
                                            <span class="form-text small text-danger ms-2  d-none"  >Specify Status</span>     
                                        </div>
                                    </tr>
                                    <tr>
                                        <label class="small mb-1" for="customerId">Choose Customer</label>
                                        <select id="customerId" class="form-control form-select">
                                            <c:if test = "${customerList.size() ==  0}">
                                                <option value="-1">No Customer Availble</option>
                                             </c:if>
                                             <option value="" ><-- Select Status --></option>
                                            <c:forEach items="${customerList}" var="c" varStatus="loop">
                                                <option value="${c.getCustomerId()}">${c.getCustomerName()}</option>
                                            </c:forEach>        
                                        </select>
                                        <span class="form-text small text-danger ms-2  d-none"  >Specify Reporting Manager</span>     
                                    </tr>
                                    <tr>
                                        <div >
                                            <label class="small mb-1" for="durationType" >Project Timeline</label>
                                            <select id="durationType" class="form-control form-select"> 
                                                <option value="1"   >Day</option>
                                                <option value="7"   >Week</option>
                                                <option value="30"  >Month</option>
                                                <option value="365" >Year</option>
                                            </select>
                                            <span class="form-text small text-danger ms-2  d-none"  >Specify Status</span>     
                                        </div>
                                        <div >
                                            <label class="small mb-1 d-block" for="projectTime"> Curresponding Duration in number</label>
                                            <input type="hidden" id="projectDay" min="1" >
                                            <input class="form-control form-input form-input-sm w-50   d-inline " id="projectTime" type="number" placeholder="Duration" value="" min="1">
                                            <label class="badge-soft-primary py-2 px-2 fw-normal mb-1 mx-2 d-inline-block   " style="width: 40%;" id="DayCount"> Day :  </label>
                                            <span class="form-text small text-danger ms-2 d-block  d-none"  >Specify Duration </span>     

                                        </div>
                                    </tr>
                                </table>
                            </div> 
                            <div class="row justify-content-center gap-2 mt-3">
                                <button class="btn btn-secondary px-5  w-auto   order-md-1 order-2" type="button" onclick="location='project-master'" > Back  </button> 
                                <button class="btn btn-primary px-3 w-auto order-md-2 order-1" type="submit" id="btnSave"  >
                                    <span id="loadingBtn"> </span> &nbsp; Add Project &nbsp;
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        
    $("#projectTime , #durationType").on('input',function () {
        let count = parseInt($("#projectTime").val());
        let durationType = parseInt($("#durationType").val());
        $("#DayCount").html("Days : " + (isNaN(count*durationType)?  " " :count*durationType == 0  ? " ":count*durationType ));
        $("#projectDay").val( (isNaN(count*durationType)?  " " :count*durationType == 0  ? " ":count*durationType ));
    });

    
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
    $("#addProjectForm").on("submit",function (event) {
        event.preventDefault();
        if(isValid()){     
            $("#loadingBtn").addClass("spinner-border spinner-border-sm"); 
            let data = {
                projectId:$("#projectId").val(),
                projectName:$("#projectName").val(),
                projectStatus:$("#projectStatus").val(),
                projectDay:$("#projectDay").val(),
                customer:{
                    customerId: $("#customerId").val()
                }
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
                            location.replace('/project-master');
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