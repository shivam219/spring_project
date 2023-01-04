<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Project Employee Breakdown</title>
  <link rel="stylesheet" href="css/form-style.css">

</head>
 
<body>
 
  <div class="container-xl px-4 mt-4 ">
    <div class="row mb-2 justify-content">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header text-center">Project Employee Breakdown Report: ${p.getProjectName()}</div>
          <div class="card-body collapse show">
            <div class="table-responsive no-wrap">
              <table class="table product-overview v-middle">
                <thead>
                  <tr>
                    <th class="border-0">Employee</th>
                    <th class="border-0">Total Hour</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${empList}" var="l">
                    <tr>
                      <td>${l.getName()}</td> 
                      <td>${l.getHour()}</td>
                    </tr>
                  </c:forEach>
                  <c:if test="${empList.size() eq 0}">
                    <tr>
                      <td colspan="2" class="text-center"> No Data </td>
                    </tr>
                  </c:if>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="row justify-content-around ">
      <div class="col"> 
        <button class="btn btn-secondary btn-sm btn-sm px-5 py-1" type="button" onclick="history.back()"  > Back </button>
      </div>
    </div>
    
  </div>
    

</body>

</html>