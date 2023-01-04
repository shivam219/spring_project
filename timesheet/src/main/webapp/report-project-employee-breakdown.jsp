<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Project Employee Breakdown report</title>
    <link rel="stylesheet" href="css/form-style.css">
</head>

<body>
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12"> 
                <div class="card mb-4">
                    <div class="card-header text-center">Project Employee Breakdown</div>
                    <div class="card-body">
                        <form method="post" action="report-project-employee-breakdown-details" >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-4">
                                    <table> 
                                        <tr>
                                            <label class="small mb-1" for="projectId">Project</label>
                                            <select id="projectId" name="projectId" name="projectId" required autofocus
                                                class="form-control form-select">
                                                <option value="">
                                                    choose Project 
                                                </option>
                                                <c:forEach items="${pjtList}" var="p">
                                                    <option value="${p.getProjectId()}">${p.getProjectName()}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                           
                                        </tr>
                                        <tr>
                                            <label class="small mb-1" for="year">Year</label>
                                            <select id="year" name="year" required class="form-control form-select">
                                                <option value="">choose year</option>
                                                <c:forEach items="${years}" var="year">
                                                    <option value="${year.getYearDesc()}" >${year.getYearDesc()}</option>
                                                </c:forEach>   
                                            </select>
                                        </tr>  
                                        <tr>
                                              <label class="small mb-1" for="month">Month</label>
                                            <select id="month" name="month"  required  class="form-control form-select">
                                                <option value="">choose month </option>
                                                    <c:forEach items="${months}" var="month">
                                                        <option value="${month[0]}" >${month[1]}</option>
                                                    </c:forEach>          
                                            </select>
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