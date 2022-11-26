<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Request Project</title>
    <link rel="stylesheet" href="css/form-style.css">

</head>

<body>
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <div class="card mb-4">
                    <div class="card-header text-center">Project Request</div>
                    <div class="card-body">
                        <div class="row gx-3 mb-3 justify-content-center">
                            <div class="col-sm-8 col-md-4">
                                <table>
                                    <tr>
                                        <label class="small mb-1" for="customerId"> Choose Customer</label>
                                        <select id="customerId" class="form-control form-select">
                                            <option value="">
                                                <--select-->
                                            </option>
                                            <c:forEach items="${customerList}" var="c" varStatus="loop">
                                                <option value="${c.getCustomerId()}">${c.getCustomerName()}</option>
                                            </c:forEach>
                                        </select>
                                    </tr>
                                </table>
                                <div class="card-body  holiday-leave-card">
                                    <ul class="list-group list-group-flush ms-3" id="projects">
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center mt-3 mb-4">
                            <button class="btn btn-secondary px-5  mt-2 mt-sm-0 me-2 w-auto " type="button" onclick="history.back()" > Back  </button> 
                            <button class="btn btn-primary w-auto" id="btnRequestProject"  >
                                <span id="load"> </span> &nbsp; Reqest Project &nbsp;
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $("#customerId").on("change", function () {
            let uri = '/customer-projects?customerId=' + $("#customerId").val();
            $.ajax({
                async: false,
                type: 'GET',
                url: uri,
                contentType: 'application/json',
                success: function (da) {
                    let str = '';
                    for (let i = 0; i < da.length; i++) {
                        let cur =da[i];
                        let ss = '<div class="form-check"> ' 
                                +'    <input class="form-check-input  " type="checkbox" value="'+ cur +'" id="'+ cur +'">'
                                +'    <label class="form-check-label" for="'+ cur +'">'
                                +'        <span class="d-block w-100">'+ cur +'<span>'
                                +'    </label>'
                                +' </div>';
                        str = str +ss;
                    }
                    $("#projects").html(str.length==0?"<span class='text-center'> No Project available </span>":str);
                }
            });
        });
        function isValid() {
            if($("#customerId").val()){}else{return false;}
            let projects=new Array();
            $("#projects").find("div input:checkbox:checked").each(function (i,elem) {
                let project =  ($(elem).val());
                projects[i] = project;
            })
            return projects.length>=1;
        }
        function getProjects(){
            let projects=new Array();
            $("#projects").find("div input:checkbox:checked").each(function (i,elem) {
                let project =  ($(elem).val());
                projects[i] = project;
            })
            return projects.join(',');
        }

    $("#btnRequestProject").on("click",function (event) {
        if(isValid()){     
            let data = {
                customerId:parseInt($("#customerId").val()),
                projects:getProjects()
            }
            $("#load").addClass("spinner-border spinner-border-sm"); 
            $("#btnRequestProject").attr('disabled',true)
            $.ajax({
                async:true,
                type: 'POST',
                url: 'project-request-process',
                data:JSON.stringify(data),
                contentType :'application/json',
                success: function (data,msg,xh) {	
                    $("#load").removeClass("spinner-border spinner-border-sm");					
                    $("#btnRequestProject").attr('disabled',false);		
                    swal({
                        title:"Success",
                        text: "Request Send Successfully",
                        icon: "success",
                    }).
                    then(function (isOkay) {
                        if (isOkay) {
                            // location.replace('/work2');
                        }
                    });
                },error : function(data,msg,xh){
                    $("#load").removeClass("spinner-border spinner-border-sm");					
                    $("#btnRequestProject").attr('disabled',false);	
                    swal({
                        title:"Same Request",
                        text: "You have already apply for same projects",
                        icon: "error",
                    });
                }
            }); 
        }else{
            swal({
                title:"Error",
                text: "Please check project",
                icon: "error",
            });
            $("#btnRequestProject").blur();
        }
    });
    </script>
</body>

</html>