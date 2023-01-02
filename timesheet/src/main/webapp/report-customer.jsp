<%@include file="menu.jsp" %>
  <!DOCTYPE html>

  <head>
    <title>Customer ${customer.getCustomerName()}</title>
    <link rel="stylesheet" href="css/form-style.css">
    <style>
      .card .card-title {
        margin-bottom: 10px;
        font-weight: 400;
        font-size: 18px;
      }
    </style>
  </head>
  <body>
    <input type="hidden" name="monthSheetId" id="monthSheetId" value="${monthSheetId}">
    <div class="container-xl px-4 mt-4">
      <div class="row mb-2">
        <div class="col-xl-4">
          <div class="card mb-4 mb-xl-0">
            <div class="card-header">Customer ${customer.getCustomerName()}</div>
            <div class="card-body text-center">
              <div class="tab-pane fade show active profile-overview" id="profile-overview">
                <div class="row">
                  <div class="col text-start">Domain</div>
                  <div class="col">
                    <span class="badge badge-soft-primary mb-0 fw-bold" style="font-size: 14px;">
                      ${customer.getCustomerDomain().getCustomerDomain()}</span>
                  </div>
                </div>
                <div class="row">
                  <div class="col text-start">On Board Date</div>
                  <div class="col">
                    <span class="badge badge-soft-primary mb-0 fw-bold" style="font-size: 14px;">
                      ${customer.getOnBoardDate()}
                    </span>
                  </div>
                </div>
                <div class="row">
                  <div class="col text-start">Customer Id</div>
                  <div class="col">
                    <span class="badge badge-soft-success mb-0 fw-bold" style="font-size: 14px;">
                      ${customer.getCustomerId()}
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card">
            <div class="card-header">Project</div>
            <div class="card-body">
              <h5 class="card-title"> No of Project</span></h5>
              <div class="d-flex align-items-center">
                <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                  <br><br>
                  <i class="fa fa-solid fa-bolt"></i>  <span class="ps-2 text-success fw-bold">${customer.getProject().size()}</span>   
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-12">
        <div class="card">
          <div class="card-header bg-white d-flex align-items-center">
            <h4 class="card-title mb-0">Project Overview</h4>
            <div class="card-actions ms-auto">**</div>
          </div>
          <div class="card-body collapse show">
            <div class="table-responsive no-wrap">
              <table class="table product-overview v-middle">
                <thead>
                  <tr>
                    <th class="border-0">Project</th>
                    <th class="border-0">Stage</th>
                    <th class="border-0">Employee</th>
                    <th class="border-0">Date</th>
                    <th class="border-0">Status</th>
                    <th class="border-0">Days</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${customer.getProject()}" var="l">
                    <tr>
                      <td><a  href="report-project?projectId=${l.getProjectId()}" class="text-body"> ${l.getProjectName()}</a></td>
                      <td>
                        Development
                      </td>
                      <td>${l.getUser().size()}</td>
                      <td>${l.getCreateTimeSort2()} </td>
                      <td>
                        <c:if test='${l.getProjectStatus() eq 1 }'>
                          <span class="px-2 py-1 badge bg-success font-weight-100 ">
                            Active
                          </span>
                        </c:if>
                        <c:if test='${l.getProjectStatus() eq 0 }'>
                          <span class="px-2 py-1 badge badge-soft-danger font-weight-100 ">
                            In-Active
                          </span>
                        </c:if>
                      </td>
                      <td>
                        ${l.getProjectDay()} Days
                      </td>
                    </tr>
                  </c:forEach>
                  <c:if test="${customer.getProject().size() eq 0}">
                    <tr>
                      <td colspan="6" class="text-center">
                        No Project
                      </td>
                    </tr>
                  </c:if>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="row mt-2">
        <div class="col-md-6">
          <div>
            <button class="btn btn-secondary btn-sm btn-sm px-5 py-1" type="button" onclick="history.back()"> Back </button>
          </div>
        </div>
      </div>
    </div>
  </body>