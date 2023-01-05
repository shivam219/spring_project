 <%@ include file="menu.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create Financial Year  </title>

    <link rel="stylesheet" href="css/form-style.css">
</head>
<body>    
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <div class="card mb-4">
                    <div class="card-header text-center">Create Holidays</div>
                    <div class="card-body">
                        <form id="EditHolidayForm"  >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-sm-6">
                                <label class="small mb-1" for="state">Year</label>
                                <select id="yearCode" class="form-control form-select" name="yearCode">
					                <option value="">&lt;------Select-----&gt;</option>
                                    <c:forEach items="${listYear}" var="l">
							            <option value="${l.getYearCode()}">${l.getYearCode()} </option>
						            </c:forEach> 
						            </select>
                                </div>
                                <div class="col-sm-6">
                                    <label class="small mb-1" for="hDate">Date</label>
                                    <input class="form-control" id="hDate" type="date" >
                                    <span class="form-text small text-danger ms-2  d-none" >Specify date</span>      
                                </div>
                                <div class="col-sm-6">
                                        <label class="small mb-1" for="description">Holiday Description</label>
                                        <input class="form-control" id="description" type="text" placeholder="Enter Holiday" value="">
                                        <span class="form-text small text-danger ms-2  d-none"  >Specify Holiday Description</span>
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
                            
                          
                            <!-- Save changes button-->
                            <div class="row justify-content-center mt-3 gap-2 ">
                                <a class="btn      btn-sm  btn-secondary px-5   w-auto order-md-1  order-2 " type="button" href="holiday-master" > Back  </a> 
                                <button class="btn btn-sm btn-primary px-3 w-auto order-md-2  order-1" type="submit" id="btnSave"  >
                                    <span id="loadingBtn"> </span> &nbsp; Create Holiday&nbsp;
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
                yearCode:$("#yearCode").val(),
                hDate:$("#hDate").val(),
                description:$("#description").val(),
                optional:$("input[name=optional]:checked").val(),
            }
            $.ajax({
                async:false,
                type: 'POST',
                url: 'holiday-master-add-process',
                data:JSON.stringify(data),
                contentType :'application/json',
                success: function (data,msg,xh) {
                    $("#btnSave").blur();
                    $("#loadingBtn").removeClass("spinner-border spinner-border-sm");					
                    swal({
                        title:"Success",
                        text: "Holiday Created Successfully",
                        icon: "success",
                        button: false,
                    })
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