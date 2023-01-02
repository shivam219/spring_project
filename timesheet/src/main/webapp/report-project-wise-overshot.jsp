<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head> 
    <title>Project Wise OverShot </title>
</head>
<body>
    <div class="container">
        <h1 class=" h4 m-0 my-3 py-2 fw-normal  dashboard-headling ">Project Wise OverShot Report </h1>
        <div class="row">
            <div class="col-lg-12"> 
                <div class="">
                    <div class="table-responsive">
                        <table class="table project-list-table table-nowrap align-middle table-borderless" id="tableholiday">
                            <thead>
                                <tr>
                                    <th scope="col">Project Name</th>
                                    <th scope="col">Working Hour</th>
                                    <th scope="col">Expected Hour</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${pjtList}" var="p" varStatus="loop">
                                    <tr>
                                        <td>${p.getProjectName()} </td>
                                        <td>${p.getProjectWorkingHour()}</td>
                                        <td>${p.getProjectExpectedHour()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-around ">
            <div class="col">  
                <a class="btn btn-secondary btn-sm btn-sm px-4 py-1" type="button" href="home" > Back  </a> 
            </div>
        </div>
        
    </div>
</body>
</html>