<%@ include file="menu.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Master </title>
</head>
<style> 
table {
    table-layout: fixed;
}
</style>
<body>   
    <div class="container">
        <h1 class=" h4 m-0 my-3 py-2 fw-normal  dashboard-headling ">Edit User Group  </h1>
        <div class="row align-items-center mt-3">
            <div class="col-md-4 col-lg-6">
                <div>
                    <h6 class=" badge-soft-success d-inline px-2 py-2 rounded">No of Group <span class="text-muted fw-normal ms-1">(${userGroupList.size()})</span></h6>
               </div>
            </div>
            <div class="col-md-8 col-lg-6">
                <div class="d-flex flex-wrap align-items-center justify-content-md-end w-auto mb-2 me-2">    
                    <div>
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
                                    <th scope="col" class="overflow-auto" >Employee</th>
                                    <th scope="col" class="overflow-auto" >Position </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${userGroupList}" var="group" varStatus="loop">
                                    <tr>
                                        <td  class="overflow-auto">
                                            <ul class="list-inline mb-0">
                                                <a href="user-group-mapping-edit?id=${group[0]}" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit" class="px-2 text-primary"><i class="bx bx-pencil font-size-18"></i></a>${group[1]}       
                                            </ul>      
                                        </td>
                                        <td  class="overflow-auto" ><span class="badge badge-soft-success mb-0 fw-bold">${group[2]}</span></td>
                                       </tr>
                                   </c:forEach>
                            </tbody>
                        </table>
                    </div>
            </div>
        </div>
        <div class="row g-0 align-items-center pb-4 d-none">
            <div class="col-sm-6">
                <div><p class="mb-sm-0">Showing 1 to 10 of 57 entries</p></div>
            </div>
            <div class="col-sm-6">
                <div class="float-sm-end">
                    <ul class="pagination mb-sm-0">
                        <li class="page-item disabled">
                            <a href="#" class="page-link"><i class="mdi mdi-chevron-left"></i></a>
                        </li>
                        <li class="page-item active"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item"><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item">
                            <a href="#" class="page-link"><i class="mdi mdi-chevron-right"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
 

