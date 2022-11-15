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
        <h1 class="text-secondary h4 m-0 my-3 py-2 fw-normal  dashboard-headling ">User Group </h1>
        <div class="row align-items-center mt-3">
            <div class="col-md-4 col-lg-6 mb-2">
                    <h6 class=" badge-soft-success d-inline px-3 py-2 rounded"> No of Group <span class="text-muted fw-normal ms-1">(${userGroupList.size()})</span></h6>
            </div>
            <!-- if have parent dive class jusitify-content-center so inner content showld have div for center-->
            <!-- d-grid -->
            <!-- inner content will be on single line  -->
            <div class="col-md-8 col-lg-6">
                <div class="d-flex flex-wrap align-items-center justify-content-md-end w-auto mb-2 me-2">   
                    <div>
                        <a href="user-group-add"        onclick="this.blur()" class="btn btn-primary w-auto d-inline "><i class="bx bx-plus me-1"></i> Create Group</a>
                        <!-- <a href="user-group-mapping" data-bs-target=".add-new" onclick="this.blur()" class="btn btn-primary w-auto d-inline"><i class="bx bx-plus me-1"></i> User Group Mapping</a> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <!-- <div class=""> -->
                    <div class="table-responsive">
                        <table class="table project-list-table table-nowrap align-middle table-borderless">
                            <thead>
                                <tr>
                                    <th scope="col" class="overflow-auto" >Description </th>
                                    <th scope="col" class="overflow-auto" >Created BY</th>
                                    <th scope="col" class="overflow-auto"  >Create Time</th>
                                    <th scope="col" class="overflow-auto" >Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${userGroupList}" var="group" varStatus="loop">
                                    <tr>
                                        <td  class="overflow-auto" ><a href="/user-group-edit?ugrpCode=${group.getUgrpCode()}" class="text-body"> <span class="badge badge-soft-success mb-0 fw-bold"> ${group.getUgrpDesc()}</span></a></td>
                                        <td  class="overflow-auto" >${group.getCreatedBy()}</a></td>
                                        <td  class="overflow-auto" >${group.getCreatedTime()} </td>
                                        <td  class="overflow-auto">
                                            <ul class="list-inline mb-0">
                                                <a href="/user-group-edit?ugrpCode=${group.getUgrpCode()}" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit" class="px-2 text-primary"><i class="bx bx-pencil font-size-18"></i></a>       
                                            </ul>      
                                        </td>
                                    </tr>
                                   </c:forEach>

                            </tbody>
                        </table>
                    </div>
                <!-- </div> -->
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
 

