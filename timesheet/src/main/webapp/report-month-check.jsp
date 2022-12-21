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
                        <div class="row justify-content-center"> 
                            <div class="col-7 d-flex justify-content-between  align-middle mb-2">
                                    <label for="year" class="mt-2 fw-bold me-2">Year</label>
                                    <select id="year" class="form-control form-select  w-75  me-2">
                                        <option value="2002">Choose</option>             
                                        <c:forEach items="${years}" var="year">
                                            <option value="${year}">${year}</option>
                                        </c:forEach>        
                                    </select>
                                    <label for="month"class="mt-2 fw-bold me-2">Month</label>
                                    <select id="month" class="form-control form-select  w-75   me-2">
                                        <option value="">Choose</option>             
                                        <option value="1">January</option>             
                                        <option value="2">Febuary</option>             
                                        <option value="3">March</option>             
                                        <option value="4">April</option>             
                                        <option value="5">May</option>             
                                        <option value="6">June</option>             
                                        <option value="7">July</option>             
                                        <option value="8">August</option>             
                                        <option value="9">September</option>             
                                        <option value="10">October</option>             
                                        <option value="11">November</option>             
                                        <option value="12">December</option>             
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
                                        <c:forEach items="${userGroupList}" var="group" varStatus="loop">
                                            <tr>
                                                <td class="overflow-auto">${group.getUgrpDesc()} </td>
                                                <td class="overflow-auto">${group.getModifiedBy()} </td>
                                                <td class="overflow-auto">${group.getModifiedTime()} </td>
                                                <td class="overflow-auto">
                                                    <ul class="list-inline mb-0">
                                                        <a href="/program-edit?ugrpCode=${group.getUgrpCode()}" data-bs-toggle="tooltip"
                                                            data-bs-placement="top" title="Edit" class="px-2 text-primary"><i class="bx bx-pencil font-size-18"></i></a>
                                                    </ul>
                                                </td> 
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td colspan="4" class="text-center">No data</td>
                                        </tr>
                                    </table>
                                </div>
                                    <div class="card-body  holiday-leave-card">
                                    <ul class="list-group list-group-flush ms-3" id="weekHoliday">
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <script>
            $("#p_code").on("change", function () {
                let uri = '/program-link?prgPrnt=' + $("#p_code").val();
                $.ajax({
                    async: false,
                    type: 'GET',
                    url: uri,
                    contentType: 'application/json',
                    success: function (da) {
                        let str = '';
                        for (let i = 0; i < da.length; i++) {
                            let ss = (da[i]);
                            str = str + '<li>' + ss + '  </li>';
                        }
                        $("#weekHoliday").html(str);
                    }
                });
            });
        </script>
</body>

</html>