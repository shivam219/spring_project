<%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Financial Year Edit </title> 
    <link rel="stylesheet" href="css/form-style.css">
</head>
<body>
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <div class="card mb-4">
                    <div class="card-header text-center">Edit Year</div>
                    <div class="card-body">
                        <form method="post" action="EditYear" id="EditYearForm"  >
                            <input type="hidden" id="yearDesc" value="${year.getYearCode()}">
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-4">
                                <table>
                                    <tr>
                                        <label class="small mb-1" for="year">Year Description</label>
                                        <input class="form-control" id="yearCode" type="text" placeholder="Edit Year" value="${year.getYearCode()}" required>    
                                        <span class="form-text small text-danger ms-2  d-none">Specify Year Description</span>
                                    </tr>
                                    <tr>
                                </table>
                            </div>
                            <div class="row justify-content-center mt-3 gap-2 "> 
                                <a class="btn      btn-sm  btn-secondary px-3   w-auto  order-md-1 order-2" type="button" href="year-master" > Back  </a>                               
                                <button class="btn btn-sm btn-primary px-3 w-auto  order-md-2 order-1" type="submit" id="btnSave"  >
                                    <span id="loadingBtn"> </span> &nbsp; Save &nbsp;
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
        return flag;
    }
    $("#EditYearForm").on("submit",function (event) {
        event.preventDefault();
        if(isValid()){     
            $("#loadingBtn").addClass("spinner-border spinner-border-sm"); 
            let data = {
                yearCode:$("#yearCode").val(),
                yearDesc:$("#yearDesc").val()
            }
            $.ajax({
                type: 'POST',
                url: 'year-master-edit-process',
                data:JSON.stringify(data),
                contentType :'application/json',
                success: function (data,msg,xh) {
                    $("#btnSave").blur();
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                    swal({
                        title:"Success",
                        text: "Year Updated Successfully",
                        icon: "success",
                        button: false,
                    });
                    location.replace('year-master');
                },error : function(data,msg,xh){
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                }
            }); 
        }else{
            $("#btnSave").blur();
        }
    });
</script>
</body>

</html>