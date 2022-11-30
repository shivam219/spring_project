<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Program master </title>
    <link rel="stylesheet" href="css/form-style.css">
</head>

<body>

    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <div class="card mb-4">
                    <div class="card-header text-center">Main menu</div>
                    <div class="card-body">
                        <div class="row gx-3 mb-3 justify-content-center">
                            <div class="col-sm-8 col-md-4">
                                <table>
                                    <tr>
                                        <label class="small mb-1" for="groupDesc"> Choose menu</label>
                                        <select id="p_code" class="form-control form-select">
                                            <option value="">
                                                Select Program
                                            </option>
                                            <c:forEach items="${programList}" var="c" varStatus="loop">
                                                <option value="${c[0]}">${c[1]}</option>
                                            </c:forEach>
                                        </select>
                                    </tr>
                                </table>
                                <div class="card-body  holiday-leave-card">
                                    <ul class="list-group list-group-flush ms-3" id="weekHoliday">
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <div class="card mb-4">
                    <div class="card-header text-center">Edit Program Group</div>
                    <div class="card-body">
                        <div class="row justify-content-center">
                            <div class="col-md-8"> 
                                <div class="row justify-content-end mb-1">
                                    <div class="col-md-6 mb-1 mb-md-0">
                                        <h6 class=" badge-soft-success d-inline px-3 py-2 rounded"> Program Group <span class="text-muted fw-normal ms-1">(${userGroupList.size()})</span></h6>
                                    </div>
                                    <div class="col-md-6 text-md-end">
                                        <a href="program-add" class="btn btn-primary btn-sm "><i class="bx bx-plus me-1"></i> Create Program</a>
                                    </div>
                                </div>
                                <div class="table-responsive">
          
                                    <table class="table project-list-table table-nowrap ">
                                        <tr>
                                            <th class="overflow-auto">Menu</th>
                                            <th class="overflow-auto">Modify By</th>
                                            <th class="overflow-auto">Last Modify</th> 
                                            <th class="overflow-auto">Action</th>
                                        </tr>
                                        <c:forEach items="${userGroupList}" var="group" varStatus="loop">
                                            <tr>
                                                <td class="overflow-auto">${group.getUgrpDesc()} </td>
                                                <td class="overflow-auto">${group.getModifiedBy()} </td>
                                                <td class="overflow-auto">${group.getModifiedTime()} </td>
                                                <td class="overflow-auto">
                                                    <ul class="list-inline mb-0">
                                                        <a href="/program-edit?ugrpCode=${group.getUgrpCode()}" data-bs-toggle="tooltip"
                                                            data-bs-placement="top" title="Edit"
                                                            class="px-2 text-primary"><i
                                                                class="bx bx-pencil font-size-18"></i></a>
                                                    </ul>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                                    <div class="card-body  holiday-leave-card">
                                    <ul class="list-group list-group-flush ms-3" id="weekHoliday">
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $("#p_code").on("change", function () {
                let uri = '/program-link?prgPrnt=' + $("#p_code").val();
                $.ajax({
                    async: false,
                    type: 'GET',
                    url: uri,
                    contentType: 'application/json',
                    success: function (da) {
                        let str = '';
                        for (let i = 0; i < da.length; i++) {
                            let ss = (da[i]);
                            str = str + '<li>' + ss + '  </li>';
                        }
                        $("#weekHoliday").html(str);
                    }
                });
            });
        </script>
</body>

</html>