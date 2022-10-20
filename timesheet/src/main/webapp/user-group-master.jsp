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
table tr td p {
            overflow: hidden;
       }
body{
background-color:#eee;
}
.project-list-table {
    border-collapse: separate;
}

.project-list-table tr {
    background-color: #fff
}

.table-nowrap td, .table-nowrap th {
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

.avatar-sm {
    height: 2rem;
    width: 2rem;
}
.rounded-circle {
    border-radius: 50%!important;
}
.me-2 {
    margin-right: 0.5rem!important;
}
img, svg {
    vertical-align: middle;
}

a {
    color: #3b76e1;
    text-decoration: none;
}
.badge-soft-danger {
    color: #f56e6e !important;
    background-color: rgba(245,110,110,.1);
}
.badge-soft-success {
    color: #63ad6f !important;
    background-color: rgba(99,173,111,.1);
}

.badge-soft-primary {
    color: #3b76e1 !important;
    background-color: rgba(59,118,225,.1);
}

.badge-soft-info {
    color: #57c9eb !important;
    background-color: rgba(87,201,235,.1);
}

.avatar-title {
    align-items: center;
    background-color: #3b76e1;
    color: #fff;
    display: flex;
    font-weight: 500;
    height: 100%;
    justify-content: center;
    width: 100%;
}
.bg-soft-primary {
    background-color: rgba(59,118,225,.25)!important;
}

@media only screen and (max-width: 600px) {
    td,th:not(ul) {
        font-size:  x-small;
    }
}
.badge{
    font-size: inherit;
}
 

</style>

<body>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
    
    <div class="container">
        <div class="row align-items-center mt-3">
            <div class="col-md-4 col-lg-6">
                <div>
                    <h5 class="card-title ms-2">No of Group <span class="text-muted fw-normal ms-3">(${userGroupList.size()})</span></h5>
                </div>
            </div>
            <!-- if have parent dive class jusitify-content-center so inner content showld have div for center-->
            <!-- d-grid -->
            <!-- inner content will be on single line  -->
            <div class="col-md-8 col-lg-6">
                <div class="d-flex flex-wrap align-items-center justify-content-md-end w-auto mb-2 me-2">    
                    <div>
                        <a href="user-group-add" data-bs-target=".add-new" onclick="this.blur()" class="btn btn-primary w-auto d-inline "><i class="bx bx-plus me-1"></i> Create Group</a>
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
                                    <th scope="col" class="overflow-auto" >Group ID</th>
                                    <th scope="col" class="overflow-auto" >Description </th>
                                    <th scope="col" class="overflow-auto" >Created BY</th>
                                    <th scope="col" class="overflow-auto"  >Create Time</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${userGroupList}" var="group" varStatus="loop">
                                    <tr>
                                        <td  class="overflow-auto">
                                            <ul class="list-inline mb-0">
                                                <a href="/user-group-edit?ugrpCode=${group.getUgrpCode()}" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit" class="px-2 text-primary"><i class="bx bx-pencil font-size-18"></i></a>${group.getUgrpCode()}       
                                            </ul>      
                                        </td>
                                        <td  class="overflow-auto" ><span class="badge badge-soft-success mb-0 fw-bold">${group.getUgrpDesc()}</span></td>
                                        <td  class="overflow-auto" ><a href="/user-group-edit?ugrpCode=${group.getUgrpCode()}" class="text-body">${group.getCreatedBy()}</a></td>
                                        <td  class="overflow-auto" >${group.getCreatedTime()} </td>
                                    </tr>
                                   </c:forEach>
                                   <!-- <td><span class="badge badge-soft-primary mb-0">Backend Developer</span></td> -->

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
 

