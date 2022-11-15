<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Year Master </title>
</head>
<style>
table {
    table-layout: fixed;
}
</style>

<body>
    <div class="container">
        <h1 class="text-secondary h4 m-0 my-3 py-2 fw-normal  dashboard-headling ">Year Dashboard </h1>
        <div class="row align-items-center mt-3">
            <div class="col ms-1">
                <div class="mb-1 ">      
                    <div>
                        <a href="year-master-add" class="btn btn-primary"><i class="bx bx-plus me-1"></i> Create Year</a>
                    </div>
                </div>
            </div> 
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="">
                    <div class="table-responsive">
                        <table class="table project-list-table table-nowrap align-middle table-borderless">
                            <thead>
                                <tr>
                                    <th scope="col" class="overflow-auto">Year</th>
                                    <th scope="col" class="overflow-auto">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listYear}" var="year" varStatus="loop">
                                    <tr>
                                        <td class="overflow-auto"><a href="/year-master-edit?yearCode=${year.getYearCode()}" class="text-body overflow-auto">${year.getYearCode()} </a></td>
                                        <td class="overflow-auto">
                                            <ul class="list-inline mb-0">
                                                <li class="list-inline-item">
                                                    <a href="/year-master-edit?yearCode=${year.getYearCode()}" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit" class="px-2 text-primary"><i class="bx bx-pencil font-size-18"></i></a>
                                                </li>                                   
                                            </ul>
                                        </td>
                                    </tr>
                                   </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>