<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Program Add </title>
    <link rel="stylesheet" href="css/form-style.css">
    <style>
    table {
       border-bottom: 1px solid #ff000d;
    }
    </style>
</head>

<body>

    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <div class="card mb-4">
                    <div class="card-header text-center">Add Program for Group</div>
                    <div class="card-body">
                        <div class="row gx-3 mb-3 justify-content-center">
                            <div class="col-md-6">
                               <div>
                                    <label class="small mb-1" for="ugrpCode">Group </label>
                                    <select name="ugrpCode" id="ugrpCode" class="form-control form-select">
                                        <option value="" ><-- Select Group --></option>
                                            <c:forEach items="${userGroupList}" var="group" varStatus="loop">
                                                <option value="${group.getUgrpCode()}">${group.getUgrpDesc()}</option>
                                            </c:forEach>         
                                    </select>
                               </div>

                               <c:forEach items="${programList}" var="pl" varStatus="loop">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            ${pl[1]}
                                        </label>
                                    </div>
                                        <div class="ms-4">
                                            <c:forEach items="${allProgramList}" var="alp" varStatus="loop">
                                                <c:if test = "${pl[0] eq alp[0]}">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                                        <label class="form-check-label" for="flexCheckDefault">
                                                            <p>${alp[1]} <p>
                                                        </label>
                                                    </div>
                                                </c:if>
                                            </c:forEach>    
                                        </div>
                               </c:forEach>     
                  


                                <!-- <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault">
                                        Create timesheet
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault">
                                        Approve timesheet
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault">
                                        change status
                                    </label>
                                </div>

                                <div class="card-body  holiday-leave-card">
                                    <ul class="list-group list-group-flush ms-3" id="weekHoliday">
                                        <li>Create timesheet</li>
                                        <li>Approve timesheet</li>
                                        <li>change status </li>
                                    </ul>
                                </div> -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>