 <%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create Financial Year  </title>
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
                    <div class="card-header text-center">Create Financial Year</div>
                    <div class="card-body">
                        <form method="post" action="EditYear" id="EditYearForm"  >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-4">
                                <table>
                                    <tr>
                                        <label class="small mb-1" for="groupDesc">Year Description</label>
                                        <input class="form-control" id="groupDesc" type="text" placeholder="Enter Year" value="">
                                        <span class="form-text small text-danger ms-2  d-none"  >Specify Year Description</span>     
                                    </tr>
                                </table>
                            </div>
                            <!-- Save changes button-->
                            <div class="row justify-content-center mt-3 ">
                                <button class="btn btn-primary px-3 w-auto" type="submit" id="btnSave"  >
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
                yearCode:$("#yearCode").val()
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
                        text: "User Created Successfully",
                        icon: "success",
                    }).
                    then(function (isOkay) {
                        if (isOkay) {
                            location.replace('/year-master');
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