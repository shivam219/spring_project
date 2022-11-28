<%@ include file="menu.jsp" %>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Monthly Pending Leave Report</title>
    </head>
    <style>
        table {
            table-layout: auto;
        }

        .project-list-table {
            border-collapse: separate;
            /* border-spacing: 0 12px */
        }

        .project-list-table tr {
            background-color: #fff
        }

        .table-nowrap td,
        .table-nowrap th {
            white-space: nowrap;
        }

        .table-borderless>:not(caption)>*>* {
            border-bottom-width: 0;
        }

        .table>:not(caption)>*>* {
            padding: 0.75rem 0.75rem;
            background-color: var(--bs-table-bg);
            border-bottom-width: 1px;
            box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
        }

        .starlabel:after {
            content: " *";
            color: red;
        }

        tbody,
        td,
        td a tfoot,
        th,
        thead,
        tr {
            border-width: 0px;
        }
    </style>

    <body>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css"
            integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css"
            integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />

        <div class="container">
            <div class="row align-items-center mt-5">
                <div class="col-md-6">
                    <div>
                        <h5 class="card-title ms-2" style="color: #124265;">Pending Leave Report</h5>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="d-flex flex-wrap align-items-center justify-content-end gap-2 me-2 mb-1 ">
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
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="">
                        <div class="table-responsive">
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
                                            <td style="font-size:14px;">${days[i.index]}</td>
                                        </tr>
                                    </c:forEach>
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
                        <a href="/download1/leave.xlsx?month=09&year=2022" class="btn btn-primary">Export</a>
                        <a href="home" data-bs-target=".add-new" onclick="this.blur()" class="btn btn-danger">Back</a>
                    </div>
                </div>
            </div>
        </div>
        <form action="/pending-leave-report" method="post" id="leaveMonthReport">
            <input type="hidden" name="leaveMonth" id="leaveMonth">
            <input type="hidden" name="leaveYear" id="leaveYear">
        </form>
        <form action="/pending-leave-report">
            <input type="hidden" name="userleaveYear" value="${year}" id="userleaveYear">
            <input type="hidden" name="userleaveMonth" value="${month}" id="userleaveMonth">
        </form>

        <script>
            $(document).ready(function () {
                if ($("#userleaveMonth").val() === "no") {
                } else {
                    $("#leaveYearSelect").val($("#userleaveYear").val());
                    $("#leaveMonthSelect").val($("#userleaveMonth").val());
                }
            })
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