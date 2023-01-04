<%@ include file="menu.jsp" %>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Monthly Pending Leave Report</title>
    </head>
    <style>
          
	tbody,
	td,
	td a tfoot,
	th,
	thead,
	tr {
		border-width: 0px;
		border-collapse: collapse; }
    </style>

    <body>
        <div class="container">
            <h1 class=" h4 m-0 my-3 py-2 fw-normal  dashboard-headling ">Pending Leave Report </h1>
            <div class="row align-items-center  bg-white   mt-3 pt-1 rounded-top  ">
                <div class="col-3"> 
                </div> 
                <div class="col-md-6">
                    <div class="col d-flex justify-content-between  align-middle gap-2 my-1 ">
                            <span class="text-center align-middle mt-1 "> Year</span>
                            <select class="form-control form-select" aria-label="Default select example" name="year" id="leaveYearSelect" onchange="getAllLeave()">
                                <option value="">Choose</option>
                                <c:forEach items="${years}" var="y">
                                    <option value="${y.getYearDesc()}" <c:if test="${y.getYearDesc() eq year }">selected="selected" </c:if>>${y.getYearDesc()}</option>
                                </c:forEach>    
                            </select>
                            <span class="text-center align-middle mt-1 "> Month</span>
                            <select class="form-select" aria-label="Default select example" name="month" id="leaveMonthSelect" onchange="getAllLeave()">
                            <option value="">Choose</option>
                                <c:forEach items="${months}" var="m">
                                    <option value="${m[0]}" <c:if test="${m[0] eq month }">selected="selected" </c:if>>${m[1]}</option>
                                </c:forEach>    
                            </select>
                    </div>
                </div>
            </div>
            <div class="row">  
                <div class="col-lg-12">
                    <div class="">
                        <div class="table-responsive" style="border-radius: 8px;">
                            <table 
                                class="table project-list-table table-hover table-nowrap align-middle table-borderless"
                                id="tableholiday">
                                <thead> 
                                    <tr class="text-white" style="font-size:15px; background-color:#124265;">
                                        <td scope="col" class="text-white">Leave Id</td>
                                        <td scope="col" class="text-white">Employee Id</td>
                                        <td scope="col" class="text-white">Employee Name</td>
                                        <td scope="col" class="text-white">Manager Name</td>
                                        <td scope="col" class="text-white">Leave Type</td>
                                        <td scope="col" class="text-white">Start Date</td>
                                        <td scope="col" class="text-white">End Date</td>
                                        <td scope="col" class="text-white">Day Mode</td>
                                        <td scope="col" class="text-white">Day Count</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${pendingList}" var="pl" varStatus="i">
                                        <tr>
                                            <td style="font-size:14px;">${pl.getLeaveId()}</td>
                                            <td style="font-size:14px;">${pl.getEmpId()}</td>
                                            <td style="font-size:14px;">${pl.getEmpName()}</td>
                                            <td style="font-size:14px;">${pl.getManagerName()}</td>
                                            <td style="font-size:14px;">${pl.getLeaveType()}</td>
                                            <td style="font-size:14px;">${pl.getStartDate()}</td>
                                            <td style="font-size:14px;">${pl.getEndDate()}</td>
                                            <td style="font-size:14px;">${pl.getDayMode()}</td>
                                            <td style="font-size:14px;">${pl.getDays()}</td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test='${pendingList.size()== 0}'> 
                                        <tr class="border">
                                            <td colspan="9" class="bg-white text-center fw-normal h5 p-2 "> No Data</td>
                                        </tr>
                                    </c:if> 
                                    <c:if test='${pendingList == null}'> 
                                        <tr class="border">
                                            <td colspan="9" class="bg-white text-center fw-normal h5 p-2 "> No Data</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row align-items-center mt-2">
            <div class="col">
                <div class="d-flex flex-wrap align-items-center justify-content-center gap-2 mb-1 ">
                    <div>
                        <a href="pending/leave.xlsx?month=${month}&year=${year}" class="btn px-3 btn-sm btn-primary" onclick="this.blur()">Export</a>
                    </div>
                    <div>
                        <a href="home" data-bs-target=".add-new" onclick="this.blur()" class="btn px-3 btn-sm btn-secondary">Back</a>
                    </div>
                </div>
            </div>
        </div>
        <form action="leave-pending-report" method="post" id="leaveMonthReport">
            <input type="hidden" name="leaveMonth" id="leaveMonth">
            <input type="hidden" name="leaveYear" id="leaveYear">
        </form> 
        <script>
            function getAllLeave() {
                var ly = $("#leaveYearSelect").val();
                var lm = $("#leaveMonthSelect").val();
                if ($("#leaveYearSelect").val() && $("#leaveMonthSelect").val()) {
                    $("#leaveMonth").val(lm);
                    $("#leaveYear").val(ly);
                    $("#leaveMonthReport").submit();
                }
            }
        </script>
    </body>

    </html>