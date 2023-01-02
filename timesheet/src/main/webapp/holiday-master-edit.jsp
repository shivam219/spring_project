 <%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Holiday  </title>
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
                <div class="card mb-4">
                    <div class="card-header text-center">Edit Holiday</div>
                    <div class="card-body">
                        <form id="EditHolidayForm"  >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-sm-6">
                                <label class="small mb-1" for="state">Year</label>
                                <input type="hidden" id="hCode" value="${holiday.gethCode()}">
                                 <input class="form-control" id="yearCode" type="text" value="${holiday.getYearCode()}">
                                 <span class="form-text small text-danger ms-2  d-none" >Specify Year</span>  
                               
                                </div>
                                <div class="col-sm-6">
                                    <label class="small mb-1" for="hDate">Date</label>
                                    <input class="form-control" id="hDate" type="date" value="${holiday.gethDate()}" >
                                    <span class="form-text small text-danger ms-2  d-none" >Specify date</span>      
                                </div>
                                <div class="col-sm-6">
                                        <label class="small mb-1" for="description">Holiday Description</label>
                                        <input class="form-control" id="description" type="text" placeholder="Enter Holiday" value="${holiday.getDescription()}">
                                        <span class="form-text small text-danger ms-2  d-none">Specify Holiday Description</span>
                                </div>
                                   <div class="col-sm-6 ">
                                    <label class="small  mt-2 " for="optional">Optional</label><br>
                                    <div class="border p-2 rounded " style="border: 3px;">
                                        <div class="form-check d-inline-flex mt-1 ">
                                            <input class="form-check-input" type="radio" value="Y" id="Yes" name="optional">
                                            <label class="form-check-label" for="Yes">
                                                &nbsp;Y       
                                            </label>
                                        </div>
                                        <div class="form-check d-inline-flex ms-2">
                                            <input class="form-check-input" type="radio" value="N" id="No"checked name="optional"  >
                                            <label class="form-check-label" for="No">
                                                &nbsp;N
                                            </label>
                                        </div>
                                    </div>
                                 </div>
                            </div>
                            <div class="row justify-content-center mt-3 gap-2 "> 
                                <a class="btn      btn-sm   btn-secondary px-3   w-auto  order-md-1 order-2 " type="button" href="holiday-master" > Back  </a> 
                                <button class="btn btn-sm btn-primary px-3 w-auto      order-md-2 order-1" type="submit" id="btnSave"  >
                                    <span id="loadingBtn"> </span> &nbsp; Save&nbsp;
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
            if(!($("#yearCode").val())){
                $("#yearCode").addClass("is-invalid");
                $("#yearCode").siblings("span").removeClass("d-none");
                flag = false;
            }
            if(!($("#hDate").val())){
                $("#hDate").addClass("is-invalid");
                $("#hDate").siblings("span").removeClass("d-none");
                flag = false;
            }
            if(!($("#description").val())){
                $("#description").addClass("is-invalid");
                $("#description").siblings("span").removeClass("d-none");
                flag = false;
            }
            return flag;
        }
    $("#EditHolidayForm").on("submit",function (event) {
        event.preventDefault();  
        if(isValid()){     
            $("#loadingBtn").addClass("spinner-border spinner-border-sm"); 
            let data = {
                hCode:$("#hCode").val(),
                yearCode:$("#yearCode").val(),
                hDate:$("#hDate").val(),
                description:$("#description").val(),
                optional:$("input[name=optional]:checked").val(),
            }
            $.ajax({
                async:false,
                type: 'POST',
                url: 'holiday-master-edit-process',
                data:JSON.stringify(data),
                contentType :'application/json',
                success: function (data,msg,xh) {
                    $("#btnSave").blur();
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                    swal({
                        title:"Success",
                        text: "Holiday Edit Successfully",
                        icon: "success",
                    });
                    location.replace('holiday-master');
                },error : function(data,msg,xh){
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                }
            }); 
        }
    });
    
    </script>
    
</body>

</html>