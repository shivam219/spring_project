<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>User Master </title>
</head>
<style>
 
</style>

<body>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
    
    <div class="container">
        <h1 class="text-secondary h4 m-0 my-3 py-2 fw-normal  dashboard-headling ">User Dashboard </h1>
        <div class="row align-items-center mt-3">
            <div class="col-md-6 mb-2">
                <div>
                    <h6 class="badge-soft-success d-inline px-3 py-2 rounded"> No of User <span class="text-muted fw-normal ms-1">(${userList.size()})</span></h6>
                </div>
            </div>
            <div class="col-md-6">
                <div class="d-flex flex-wrap align-items-center justify-content-end gap-2 me-2 mb-1 ">    
                    <div>
                        <a href="user-group-mapping-add"  onclick="this.blur()" class="btn btn-primary"><i class="bx bx-plus me-1"></i> User Group Mapping</a>
                        <a href="user-group-mapping-master"  onclick="this.blur()" class="btn btn-primary"><i class="bx bx-pencil me-1"></i> Edit User Group</a>
                        <a href="user-master-add"  onclick="this.blur()" class="btn btn-primary"><i class="bx bx-plus me-1"></i> Create User</a>
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
                                    <th scope="col" class="overflow-auto">Name</th>
                                    <th scope="col" class="overflow-auto">Position</th>
                                    <th scope="col" class="overflow-auto">Manager</th>
                                    <th scope="col" class="overflow-auto">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${userList}" var="emp" varStatus="loop">
                                    <tr>
                                        <td class="overflow-auto"><a href="/user-master-edit?empId=${emp[0]}" class="text-body overflow-auto">${emp[1]} </a></td>
                                        <td class="overflow-auto"><span class="badge badge-soft-success mb-0">${emp[2]}</span></td>
                                        <td class="overflow-auto">Vigneswari Mam</td>
                                        <td class="overflow-auto">
                                            <ul class="list-inline mb-0">
                                                <li class="list-inline-item">
                                                    <a href="/user-master-edit?empId=${emp[0]}" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit" class="px-2 text-primary"><i class="bx bx-pencil font-size-18"></i></a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <!-- <a href="javascript:void(0);" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete" class="px-2 text-danger"><i class="bx bx-trash-alt font-size-18"></i></a> -->
                                                </li>  
                                                <c:if test='${emp[3].equals("1")}'>
                                                    <li class="list-inline-item">
                                                        <a href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Active" class="px-2 text-success">  <i class="fa-solid fa-circle"> </i>  </a>
                                                    </li>
                                                </c:if>
                                                <c:if test='${!emp[3].equals("1")}'>
                                                    <li class="list-inline-item">
                                                        <a href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="In-Active" class="px-2 text-danger">  <i class="fa-solid fa-circle"> </i>  </a>
                                                    </li>
                                                </c:if>                                           
                                            </ul>
                                        </td>
                                    </tr>
                                   </c:forEach>
                                   <!-- <td><span class="badge badge-soft-primary mb-0">Backend Developer</span></td> -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- hide need add from backend -->
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