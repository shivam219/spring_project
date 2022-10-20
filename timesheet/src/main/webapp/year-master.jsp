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
  body{
background-color:#eee;
/* background-color:#f2f6fc; */
}
.project-list-table {
    border-collapse: separate;
    /* border-spacing: 0 12px */
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
    td {
        font-size:  x-small;
    }
}
 
</style>

<body>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
    
    <div class="container">
        <div class="row align-items-center mt-3">
            <div class="col-md-6">
                <div>
                    <h5 class="card-title ms-2">Financial Year <span class="text-muted fw-normal ms-1">(${userList.size()})</span></h5>
                </div>
            </div>
            <div class="col-md-6">
                <div class="d-flex flex-wrap align-items-center justify-content-end gap-2 me-2 mb-1 ">    
                    <div>
                        <a href="year-master-add" data-bs-target=".add-new" onclick="this.blur()" class="btn btn-primary"><i class="bx bx-plus me-1"></i> Create Year</a>
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
                                                <li class="list-inline-item">
                                                    <a href="javascript:void(0);" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete" class="px-2 text-danger"><i class="bx bx-trash-alt font-size-18"></i></a>
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
    <script>
    </script>
</body>
</html>