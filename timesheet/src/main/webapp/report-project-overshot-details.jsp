<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Project Summary Details</title>
  <link rel="stylesheet" href="css/form-style.css">
</head>
<body>
  <div class="container-xl px-4 mt-4 ">
    <div class="row mb-2 justify-content">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header text-center">Project OverShot Details</div>
          <div class="card-body collapse show">
            <div class="table-responsive no-wrap">
              <table class="table product-overview v-middle">
                <thead>
                  <tr>
                    <th class="border-0">Project </th> 
                    <th class="border-0">Total Hour</th>
                  </tr>
                </thead>
                <tbody>
                    <tr>
                      <td>${p.getProjectName()}</td>
                      <td>
                        <span class="badge badge-soft-primary  mb-0 fw-bold p-1" style="font-size: 14px;">
                          ${totalHour}
                        </span>
                      </td>
                    </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="row justify-content-around ">
      <div class="col"> 
        <button class="btn btn-secondary btn-sm px-5 py-1" type="button" onclick="history.back()"  > Back </button>
      </div>
    </div>
    
  </div>
    

</body>

</html>