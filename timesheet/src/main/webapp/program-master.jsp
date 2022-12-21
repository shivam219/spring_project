<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Program master </title>
    <link rel="stylesheet" href="css/form-style.css">
    <style>       tr td input{
        text-align: center;
    }</style>
</head>

<body>

    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">

                <form action="program-menu-add" id="programMenuAdd" method="post" onsubmit="return validate(this)" >
                           
                    <div class="card mb-4">
                        <div class="card-header text-center">Main menu</div>
                        <div class="card-body">
                            <div class="row gx-3 mb-1 justify-content-center">
                                <div class="col-sm-8 col-md-4">
                                    <table>
                                        <tr>
                                            <label class="small mb-1" for="groupDesc"> Choose menu</label>
                                            <select id="p_code" name="prgPrnt" class="form-control form-select"  autocomplete="off"  >
                                                <option value="-1">
                                                    Select Program
                                                </option>
                                                <c:forEach items="${programList}" var="c" varStatus="loop">
                                                    <option value="${c[0]}">${c[1]}</option>
                                                </c:forEach>
                                            </select>
                                        </tr>
                                    </table>               
                                
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-md-8">
                                    <div class="table-responsive">
                                        <table class="table  project-list-table align-middle table-borderless" id="monthTable">
                                            <thead class="thead-dark">
                                                <th class="text-center" >No</th>
                                                <th class="text-center" >Display Name</th>
                                                <th class="text-center" >Link</th>
                                                <th class="text-center" >Order</th>
                                            </thead>
                                            <tbody>
                                                <tr><td colspan="4" class="text-center">No Data  </td></tr>
                                            </tbody>
                                        </table>
                                    </div> 
                                    <div class="row justify-content-center gap-2 pb-3  d-none " id="btnForm">
                                        <button class="btn btn-primary px-3   py-1 w-auto " type="submit" id="btnSave">
                                            <span id="loadingBtn"> </span> &nbsp; Add Link &nbsp;
                                        </button>
                                    </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <div class="card mb-4">
                    <div class="card-header text-center">Program Group</div>
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
    </div>
    
    <script>
        $("#p_code").on("change", function () {
            let uri = '/program-link?prgPrnt=' + $("#p_code").val();
            $.ajax({
                async: false,
                type: 'GET',
                url: uri,
                contentType: 'application/json',
                success: function (d2) {
                    for (let i = $('#monthTable tr').length -1 ; i > 0; i--) {
                            $('#monthTable tr').eq(i).remove();
                        }
                    let str = ''; 
                    if(d2.length==0){
                        $("#monthTable").append("<tr><td colspan='4'class='text-center'>No Data</td><tr>");									                        
                            $("#btnForm").addClass("d-none");
                    }else{
                        for (let i = 0; i < d2.length; i++) {
                            let tr ='<tr>' 
                                +'<td class="text-center"> ' + d2[i][0] + ' </td>'
                                +'<td class="text-center"> ' + d2[i][1] + ' </td>'
                                +'<td class="text-center"> ' + d2[i][2] + ' </td>'
                                +'<td class="text-center"> ' + d2[i][3] + ' </td>'
                                +'</tr> ';
                            str = str+tr;						
                        }  
                        // PRG_CODE, PRG_DESC , PRG_NAME ,PRG_ORDER 
                        let tr2 ='<tr>'
                                +'<td class="text-center"> <input type="number" value="" name="prgCode"  class="form-control h-50 d-none w-auto  "> </td>'
                                +'<td class="text-center"> <input type="text"   value="" name="prgDesc"  class="form-control h-50  "> </td>'
                                +'<td class="text-center"> <input type="text"   value="" name="prgName"  class="form-control h-50  "> </td>'
                                +'<td class="text-center"> <input type="number" value="" name="prgOrder" class="form-control h-50 d-none w-auto"> </td>'
                                +'</tr> ';
                        str = str+tr2;		
                        $("#monthTable").append(str);
                        $("#btnForm").removeClass("d-none");
                        	
                    }
                }
            });
        });


        function validate(fm) {
            console.log("hiii");
            $('#btnSave').attr("disabled", true);
            if (fm.prgCode.value == "") {
                fm.startDate.focus();
                alert("Program Code is Empty");
                return false;
            }
            if (fm.prgDesc.value == "") {
                fm.prgDesc.focus();
                alert("Program Description Empty");
                return false;
            }
            if (fm.prgName.value == "") {
                fm.prgName.focus();
                alert("Program  Name Empty");
                return false;
            }
            if (fm.prgOrder.value == "") { 
                fm.prgOrder.focus();
                alert("Program Order Name Empty");
                return false;
            }
            return true;
        }
        
        
    </script>
</body>

</html>
