<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head> 
    <title>Holiday Master </title>
</head>
<body>
    <div class="container">
        <h1 class=" h4 m-0 my-3 py-2 fw-normal  dashboard-headling ">Holiday Dashboard </h1>
        <div class="row align-items-center mt-3 mb-2">
            <div class="col-md-6 mb-2 mb-md-0">
                <div>
                    <h6 class=" badge-soft-success d-inline px-3 py-2 rounded"> Holidays <span class="text-muted fw-normal ms-1">(${listholiday.size()})</span></h6>
                </div>
            </div>
            <div class="col-md-6 "> 
                <div class="d-flex justify-content-md-end ">                          
					<a type="button" class="btn btn-primary align-self-center align-items-center" href="holiday-master-add">  <i class="bx bx-plus me-1"></i>  Create Holiday</a>
		        </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="">
                    <div class="table-responsive">
                        <table class="table project-list-table table-nowrap align-middle table-borderless" id="tableholiday">
                            <thead>
                                <tr>
                                    <th scope="col" class="overflow-auto">Date</th>
                                     <th scope="col" class="overflow-auto">Holiday</th>
                                    <th scope="col" class="overflow-auto">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listholiday}" var="h" varStatus="loop">
                                    <tr>
                                        <td class="overflow-auto"> ${h.gethDate()} </td>
                                         <td class="overflow-auto">${h.getDescription()}</td>
   
                                        <td class="overflow-auto">
                                            <ul class="list-inline mb-0">
                                                <li class="list-inline-item">
                                                    <a href="holiday-master-edit?hCode=${h.gethCode()}" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit" class="px-2 text-primary"><i class="bx bx-pencil font-size-18"></i></a>
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