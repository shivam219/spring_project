 <%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/form-style.css">
    <title>Create Financial Year  </title>
</head>
<body>
     
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <!-- Edit User Details card-->
                <div class="card mb-4">
                    <div class="card-header text-center">Create Financial Year</div>
                    <div class="card-body">
                        <form method="post" action="EditYear" id="EditYearForm"  >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-4">
                                <table>
                                    <tr>
                                        <label class="small mb-1" for="yearCode">Year Description</label>
                                        <input class="form-control" id="yearCode" type="text" placeholder="Enter Year" value="">
                                        <span class="form-text small text-danger ms-2  d-none"  >Specify Year Description</span>     
                                    </tr>
                                </table>
                            </div> 
                            <div class="row justify-content-center mt-3 gap-2 ">
                                <a class="btn btn-secondary px-3   w-auto  order-md-1 order-2" type="button" href="year-master" > Back  </a>                               
                                <button class="btn btn-primary px-3 w-auto  order-md-2 order-1" type="submit" id="btnSave"  >
                                    <span id="loadingBtn"> </span> &nbsp; Create Year&nbsp;
                                </button>
                            </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script>
    $("#EditYearForm").on("submit",function (event) {
        event.preventDefault();  
            $("#loadingBtn").addClass("spinner-border spinner-border-sm"); 
            let data = {
                yearCode:$("#yearCode").val(),
                yearDesc:$("#yearCode").val()
            }
            $.ajax({
                type: 'POST',
                url: 'year-master-add-process',
                data:JSON.stringify(data),
                contentType :'application/json',
                success: function (data,msg,xh) {
                    $("#btnSave").blur();
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                    swal({
                        title:"Success",
                        text: "Year Created Successfully",
                        icon: "success",
                    }).
                    then(function (isOkay) {
                        if (isOkay) {
                            location.replace('year-master');
                        }
                    });
                },error : function(data,msg,xh){
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                }
            }); 
    });
    
    </script>
    
</body>

</html>