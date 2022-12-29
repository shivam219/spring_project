<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Report Month Check </title>
    <link rel="stylesheet" href="css/form-style.css">
</head>
<body>
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <div class="card mb-4">
                    <div class="card-header text-center">Check Montly Timesheet</div>
                    <div class="card-body">  
                        <form action="report-month-check" method="post"> 
                            <div class="row justify-content-center"> 
                                <div class="col-7 d-flex justify-content-between  align-middle mb-2">
                                        <label for="year" class="mt-2 fw-bold me-2">Year</label>
                                        <select id="year" name="year" class="form-control form-select  w-75  me-2  form-select-sm"  onchange="dateChange()" >
                                            <option value="2002">Choose</option>             
                                            <c:forEach items="${years}" var="year">
                                                <option value="${year}" <c:if test="${year eq userYear }">selected="selected" </c:if>>${year}</option>
                                            </c:forEach>        
                                        </select>  
                                        <label for="month"class="mt-2 fw-bold me-2">Month</label>
                                        <select id="month" name="month" class="form-control form-select  w-75   me-2"  onchange="dateChange()">
                                            <option value="">Choose</option>               
                                            <c:forEach items="${months}" var="month">
                                                <option value="${month[0]}" <c:if test="${month[0] eq userMonth }">selected="selected" </c:if>>${month[1]}</option>
                                            </c:forEach>            
                                        </select>
                                </div> 
                                <div class="col-md-12">  
                                    <div class="table-responsive">
                                        <table class="table project-list-table table-nowrap ">
                                            <tr>
                                                <th class="overflow-auto">Employee</th>
                                                <th class="overflow-auto">Manager</th>
                                                <th class="overflow-auto">Status</th> 
                                                <th class="overflow-auto">Submited On</th>
                                            </tr>
                                            <c:forEach items="${data}" var="d" varStatus="loop">
                                                <tr> 
                                                    <td >${d[0]} </td>
                                                    <td >${d[3]} </td>
                                                    <td >${d[1]}</td>  
                                                    <td >${d[2]} </td>
                                                </tr>
                                            </c:forEach>
                                            <c:if test='${data.size()==0}'>   
                                                <tr class="border"> 
                                                    <td colspan="4" class="text-center "> No Data</td>
                                                </tr> 
                                            </c:if>
                                        </table>
                                    </div>
                                        <div class="card-body  holiday-leave-card">
                                        <ul class="list-group list-group-flush ms-3" id="weekHoliday">
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <script>
            // $("#p_code").on("change", function () {
            //     let uri = '/program-link?prgPrnt=' + $("#p_code").val();
            //     $.ajax({
            //         async: false,
            //         type: 'GET',
            //         url: uri,
            //         contentType: 'application/json',
            //         success: function (da) {
            //             let str = '';
            //             for (let i = 0; i < da.length; i++) {
            //                 let ss = (da[i]);
            //                 str = str + '<li>' + ss + '  </li>';
            //             }
            //             $("#weekHoliday").html(str);
            //         }
            //     });
            // });  
            function dateChange() {
                if($("#year").val() && $("#month").val()){
                    document.forms[0].submit();
                }   
            }  
        </script>
</body>

</html>