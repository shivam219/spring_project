<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Project Summary</title>
    <link rel="stylesheet" href="css/form-style.css">
</head>

<body>
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <div class="card mb-4">
                    <div class="card-header text-center">Project Summary Report</div>
                    <div class="card-body">
                        <form method="post" action="report-project-summary-details" >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-4">
                                    <table> 
                                        <tr>
                                            <label class="small mb-1" for="projectId">Project</label>
                                            <select id="projectId" name="projectId" name="projectId" required
                                                class="form-control form-select">
                                                <option value="">
                                                    choose Project 
                                                </option>
                                                <c:forEach items="${pjtList}" var="p">
                                                    <option value="${p.getProjectId()}">${p.getProjectName()}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                            <span class="form-text small text-danger ms-2  d-none">Employee</span>
                                        </tr>
                                        <tr>
                                            <label class="small mb-1" for="startDate">From Date</label>
                                            <input class="form-control" id="startDate" name="startDate" type="date" required>
                                            <span class="form-text small text-danger ms-2  d-none">Specify Start date</span>
                                        </tr>  
                                        <tr>
                                            <label class="small mb-1" for="endDate">To Date</label>
                                            <input class="form-control" id="endDate" name="endDate" type="date" required>
                                            <span class="form-text small text-danger ms-2  d-none">Specify End date</span>
                                        </tr> 
                                    </table>
                                </div> 
                                <div class="row justify-content-center gap-2  mt-3">  
                                    <a class="btn btn-secondary btn-sm px-5  btn-sm w-auto  order-md-1 order-2 "   href="home"> Back </a>
                                    <button class="btn btn-primary btn-sm px-5    btn-sm w-auto   order-md-2 order-1 " type="submit"> Show </button>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    </script>
</body>

</html>