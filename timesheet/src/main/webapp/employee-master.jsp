<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Employee Details </title>
</head>
<body>
    <div class="container">
        <h1 class="text-secondary h4 m-0 my-3 py-2 fw-normal  dashboard-headling ">Employee Dashboard </h1>
        <div class="row align-items-center mt-3">
            <div class="col-md-6  mb-2 mb-md-0 "> 
                <h6 class=" badge-soft-success d-inline px-2 py-2 rounded"> No of Employee  <span class="text-muted fw-normal ms-1">(${empListSize})</span></h6>
            </div> 
            <div class="col-md-6">
                <div class="d-flex flex-wrap align-items-center justify-content-md-end gap-2 ">    
                    <div>
                        <a href="employee-add" data-bs-target=".add-new" onclick="this.blur()" class="btn btn-primary me-1 mb-1"><i class="bx bx-plus me-1"></i> Add New</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table project-list-table table-nowrap align-middle table-borderless">
                        <thead>
                            <tr>
                                <th scope="col" class="overflow-auto" >Employee ID</th>
                                <th scope="col" class="overflow-auto" >Name</th>
                                <th scope="col">Email</th>
                                <th scope="col" class="overflow-auto" >Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${empList}" var="emp" varStatus="loop"> 
                                <tr> 
                                    <td  class="overflow-auto">${emp.getEmpId()}</td> 
                                    <td  class="overflow-auto" ><a href="/report-user?empId=${emp.getEmpId()}" class="text-body ">${emp.getFullName()}</a></td>
                                    <td> ${emp.getEmpEmail()}</td>
                                    <td  class="overflow-auto" >
                                        <ul class="list-inline mb-0">
                                                <a href="/employee-edit?empId=${emp.getEmpId()}" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit" class="px-2 text-primary"><i class="bx bx-pencil font-size-18"></i></a>                                           
                                        </ul>
                                    </td>
                                </tr>
                                </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- hide need add from backend -->
        <!-- align-items-center vertical center -->
        <div class="row g-0 align-items-center pb-4">
            <div class="col-sm-6">
                <div><p class="mb-sm-0">Showing ${currentPage} to ${totalPages} of (${empListSize}) entries</p></div>
            </div>
            <div class="col-sm-6">
                <div class="float-sm-end">
                    <ul class="pagination mb-sm-0">
                        <li class="page-item  <c:if test='${currentPage eq 1 }'> disabled</c:if> ">
                            <a class="page-link"  href="employee-master?page=${currentPage-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach var = "i" begin = "1" end = "${totalPages}"> 
                            <li class="page-item <c:if test='${currentPage eq i }'>active</c:if>" ><a href ="employee-master?page=${i}"  class="page-link">${i}</a></li>
                         </c:forEach>
                        <li class="page-item  <c:if test='${currentPage eq totalPages }'> disabled</c:if> ">
                            <a class="page-link" href="employee-master?page=${currentPage+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                              </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
 

