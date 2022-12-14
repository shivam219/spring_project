<%@include file="menu.jsp" %>
<!DOCTYPE html>

<head>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@3/dist/chart.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
  <title>Project ${customer.getCustomerName()}</title>
  <link rel="stylesheet" href="css/form-style.css">
  <style>
    .h1,
    .h2,
    .h3,
    .h4,
    .h5,
    .h6,
    h1,
    h2,
    h3,
    h4,
    h5,
    h6 {
      margin-top: 0;
      margin-bottom: .5rem;
      font-weight: 400;
      line-height: 1.2;
      color: var(--bs-heading-color);
    }

    .no-wrap td,
    .no-wrap th {
      white-space: nowrap;
    }

    .card .card-title {
      margin-bottom: 10px;
      font-weight: 400;
      font-size: 18px;
    }
  </style>
</head>

<body>
  <input type="hidden" name="projectId" id="projectId" value="${p.getProjectId()}">
  <div class="container-xl px-4 mt-4 ">
    <div class="row mb-2 justify-content">
      <div class="col-md-6"> 
        <div class="card mb-4 mb-xl-0">
          <div class="card-header">Project ${p.getProjectName()}</div>
          <div class="card-body text-center">
            <div class="tab-pane fade show active profile-overview" id="profile-overview">
              <div class="row">
                <div class="col text-start">Project ID </div>
                <div class="col">
                  <span class="badge text-secondary " style="font-size: 14px;">
                    ${p.getProjectId()}
                  </span>
                </div>
              </div>
              <div class="row">
                <div class="col text-start">Domain</div>
                <div class="col">
                  <span class="badge  text-secondary  mb-0 fw-bold" style="font-size: 14px;">
                    ${p.getCustomer().getCustomerDomain().getCustomerDomain()}</span>
                </div>
              </div>
              <div class="row">
                <div class="col text-start">Customer </div>
                <div class="col">
                  <span class="badge  text-secondary mb-0 fw-bold" style="font-size: 14px;">
                    ${p.getCustomer().getCustomerName()}
                  </span>
                </div>
              </div>
              <div class="row">
                <div class="col text-start">Start Date</div>
                <div class="col">
                  <span class="badge  text-secondary mb-0 fw-bold" style="font-size: 14px;">
                    ${p.getCreateTimeSort()}
                  </span>
                </div>
              </div>
              <div class="row">
                <div class="col text-start">No of Employee</div>
                <div class="col">
                  <span class="badge  text-secondary mb-0 fw-bold" style="font-size: 14px;">
                    ${empList.size()}
                  </span>
                </div>
              </div>
            </div>
          </div>
          <br>
        </div> 
      </div>

      <div class="col-md-6 badge ">
        <div class="row  justify-content-end me-2 ">
          <div class="col-md-11 card bg-white rounded "> 
            <canvas id="myChart"></canvas>  
          </div>   
        </div>
      </div>
    </div>
    <div class="col-md-12">
      <div class="card">
        <div class="card-header bg-white d-flex align-items-center">
          <h4 class="card-title mb-0">Project Overview</h4>
          <div class="card-actions ms-auto">
            **
          </div>
        </div>
        <div class="card-body collapse show">
          <div class="table-responsive no-wrap">
            <table class="table product-overview v-middle">
              <thead>
                <tr>
                  <th class="border-0">Employee</th>
                  <th class="border-0">Desgination</th>
                  <!-- <th class="border-0">Employee Joining</th> -->
                  <th class="border-0">Total Hour</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${empList}" var="l">
                  <tr>
                    <td>${l.getEmpName()}</td>
                    <td>
                      <span class="badge badge-soft-success  mb-0 fw-bold p-1" style="font-size: 14px;">
                        ${l.getGroupDes()}
                      </span>
                    </td>
                    <td>${l.getHour()}</td>
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

    <div class="row justify-content-center mt-2 d-none ">
      <div class="col-xl-12 ">
        <!-- Montyly task-->
        <div class="card mb-4">
          <div class="card-header">Total hour</div>
          <div class="card-body">
            <div class="row">
              <div class="col-lg-12">
                <!-- <canvas id="myChart"></canvas>  -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row mt-2">
      <div class="col-md-6">
        <div>
          <button class="btn btn-secondary btn-sm px-5 py-1" type="button" onclick="location='project-master'"> Back </button>
        </div>
      </div>
    </div>
    <br><br>

  </div>
  <script>
    $(document).ready(function () {
      $.ajax({
        type: 'POST',
        url: 'fetch-project-employee-sheet?projectId=' + $("#projectId").val() + '',
        contentType: 'application/json',
        success: function (d, msg, xh) {
          let data = [];
          let labels = [];
          for (let i = 0; i < d.length; i++) {
            data[i] = parseInt(d[i]["hour"]);
            labels[i] = d[i]["empName"];
            // labels[i] = d[i]["date"] + ' ' + d[i]["projectName"]; // 
          }
          const ctx = document.getElementById('myChart').getContext('2d');
          const myChart = new Chart(ctx, {
            type: 'bar',
            data: {
              labels: labels,
              datasets: [{
                label: 'hours ',
                data: data,
                backgroundColor: [
                  'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 206, 86, 0.2)',
                  'rgba(75, 192, 192, 0.2)',
                  'rgba(153, 102, 255, 0.2)',
                  'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
              }]
            }
          });
        }, error: function (data, msg, xh) {

        }
      });
    });
    
  </script>

<!-- <div class="col-md-8 bg-white ">
  <div id="chart" style="min-height: 200px; max-height:200px ;">
  </div>  
</div> -->
<script>
  // apexchart on project timeline
    // var options = {
    //       series: [
    //       {
    //         data: [
    //           {
    //             x: 'Code',
    //             y: [
    //               new Date('2019-03-02').getTime(),
    //               new Date('2019-03-04').getTime()
    //             ]
    //           },
    //           {
    //             x: 'Test',
    //             y: [
    //               new Date('2019-03-04').getTime(),
    //               new Date('2019-03-08').getTime()
    //             ]
    //           },
    //           {
    //             x: 'Validation',
    //             y: [
    //               new Date('2019-03-08').getTime(),
    //               new Date('2019-03-12').getTime()
    //             ]
    //           },
    //           {
    //             x: 'Deployment',
    //             y: [
    //               new Date('2019-03-12').getTime(),
    //               new Date('2019-03-18').getTime()
    //             ]
    //           }
    //         ]
    //       }
    //     ],
    //       chart: {
    //       height: 350,
    //       type: 'rangeBar'
    //     },
    //     plotOptions: {
    //       bar: {
    //         horizontal: true
    //       }
    //     },
    //     xaxis: {
    //       type: 'datetime'
    //     }
    //     };

    //     var chart = new ApexCharts(document.querySelector("#chart"), options);
    //     chart.render();
</script>
</body>