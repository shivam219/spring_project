<%@ include file="menu.jsp" %>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Employee Wise Leave Report</title>
    </head>
    <style>
        tbody,
        td,
        td a tfoot,
        th,
        thead,
        tr {
            border-width: 0px;
            border-collapse: collapse;
            font-size:14px;
        }
    </style>
 
    <body>
        <div class="container"> 
            <h1 class=" h4 m-0 my-3 py-2 fw-normal  dashboard-headling ">Approved Leave Report </h1>
            <div class="row align-items-center mt-3 bg-white p-0 m-0 rounded-top  ">
                <div class="col-2"></div> 
                <div class="col-md-8">
                    <div class="d-flex flex-wrap align-items-center justify-content-center gap-2 me-2 mb-1 ">
                        <div>
                            <label for="year" class="starlabel" style="color: #124265;">&nbsp;&nbsp;Year</label>
                            <select class="form-select" aria-label="Default select example" name="Year"
                                id="leaveYearSelect" onchange="getAllLeave()">
                                <option value="">-------select------</option>
                                <option value="2020">2020</option>
                                <option value="2021">2021</option>
                                <option value="2022">2022</option>
                            </select>
                        </div>
                        <div>
                            <label for="Month" class="starlabel" style="color: #124265;">&nbsp;&nbsp;Month</label>
                            <select class="form-select" aria-label="Default select example" name="Month"
                                id="leaveMonthSelect" onchange="getAllLeave()">
                                <option value="">-------select------</option>
                                <option value="01">January</option>
                                <option value="02">February</option>
                                <option value="03">March</option>
                                <option value="04">April</option>
                                <option value="05">May</option>
                                <option value="06">June</option>
                                <option value="07">July</option>
                                <option value="08">August</option>
                                <option value="09">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                            </select>
                        </div>
                        <div>
                            <label for="empId" class="starlabel" style="color: #124265;">&nbsp;&nbsp;Employee</label>
                            <select class="form-select" aria-label="Default select example" id="empId"
                                onchange="getAllLeave()">
                                <option value="">--------Select-------</option>
                                <c:forEach items="${employeeList}" var="l">
                                    <option value="${l.getEmpId()}">${l.getFirstName()} ${l.getLastName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <label for="statusSelect" class="starlabel" style="color: #124265;">&nbsp;&nbsp;Status</label>
                            <select class="form-select" aria-label="Default select example" name="leaveStatus"
                                id="statusSelect" onchange="getAllLeave()">
                                <option value="">--------Select-------</option>
                                <option value="Approved">Approved</option>
                                <option value="Rejected">Rejected</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row"> 
                <div class="col-lg-12">
                    <div class="">
                        <div class="table-responsive" style="border-radius: 8px;">
                            <table 
                                class="table project-list-table table-hover table-nowrap align-middle table-borderless ">
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
                                    <c:forEach items="${leaveList}" var="l" varStatus="i">
                                        <tr>
                                            <td style="font-size:14px;">${l.getLeaveId()}</td>
                                            <td style="font-size:14px;">${l.getEmpId()}</td>
                                            <td style="font-size:14px;">${l.getEmpName()}</td>
                                            <td style="font-size:14px;">${l.getManagerName()}</td>
                                            <td style="font-size:14px;">${l.getLeaveType()}</td>
                                            <td style="font-size:14px;">${l.getStartDate()}</td>
                                            <td style="font-size:14px;">${l.getEndDate()}</td>
                                            <td style="font-size:14px;">${l.getDayMode()}</td>
                                            <td style="font-size:14px;">${l.getDays()}</td>
                                        </tr> 
                                    </c:forEach>
                                    <c:if test='${leaveList.size()== 0}'>
                                        <tr class="border">
                                            <td colspan="9" class="bg-white text-center fw-normal h5 p-2 "> No Data</td>
                                        </tr>
                                    </c:if>
                                    <c:if test='${ leaveList == null}'>
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
        </div>
        </div>
        <div class="row align-items-center mt-2">
            <div class="col">
                <div class="d-flex flex-wrap align-items-center justify-content-center gap-2 mb-1 ">
                    <div>
                        <a href="/employee/leave.xlsx?month=${month}&year=${year}&empId=${empId}&status=${status}" class="btn px-3 btn-sm btn-primary" onclick="this.blur()">Export</a>
                    </div>
                    <div>
                        <a href="home" data-bs-target=".add-new" onclick="this.blur()" class="btn px-3 btn-sm btn-secondary">Back</a>
                    </div>
                </div>
            </div>
        </div>
        <form action="/leave-employee-wise-report" method="post" id="leaveMonthReport">
            <input type="hidden" name="leaveEmployee" id="leaveEmployee">
            <input type="hidden" name="leaveStatus" id="leaveStatus">
            <input type="hidden" name="leaveYear" id="leaveYear">
            <input type="hidden" name="leaveMonth" id="leaveMonth">
        </form>
        <form action="/leave-employee-wise-report">
            <input type="hidden" name="userleaveEmpId" value="${empId}" id="userleaveEmpId">
            <input type="hidden" name="userleaveStatus" value="${status}" id="userleaveStatus">
            <input type="hidden" name="userleaveYear" value="${year}" id="userleaveYear">
            <input type="hidden" name="userleaveMonth" value="${month}" id="userleaveMonth">
        </form>

        <script>
            $(document).ready(function () {
                if ($("#userleaveMonth").val() === "no") {
                } else {
                    $("#empId").val($("#userleaveEmpId").val());
                    $("#statusSelect").val($("#userleaveStatus").val());
                    $("#leaveYearSelect").val($("#userleaveYear").val());
                    $("#leaveMonthSelect").val($("#userleaveMonth").val());
                }
            })
            function getAllLeave() {
                if ($("#empId").val() && $("#statusSelect").val() && $("#leaveMonthSelect").val() && $("#leaveYearSelect").val()) {
                    $("#leaveEmployee").val($("#empId").val());
                    $("#leaveStatus").val($("#statusSelect").val());
                    $("#leaveYear").val($("#leaveYearSelect").val());
                    $("#leaveMonth").val($("#leaveMonthSelect").val());
                    $("#leaveMonthReport").submit();
                }
            }
        </script>
    </body>

    </html>