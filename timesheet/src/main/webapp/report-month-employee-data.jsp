<%@ include file="menu.jsp" %>
  <!DOCTYPE html>

  <head>
    <title>Profie ${empName} </title>
    <link rel="stylesheet" href="css/form-style.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3/dist/chart.min.js"></script>
    <style>
      .progress-container {
        top: 0;
        position: sticky;
        width: 100%;
        height: 7px;
        background: #ccc;
        z-index: 10;
      }

      .progress-bar {
        height: 100%;
        background: #04AA6D;
        width: 0%;
      }
    </style>
  </head>

  <body>
    <div class="progress-container">
      <div class="progress-bar" id="myBar"></div>
    </div>
    <input type="hidden" name="monthSheetId" id="monthSheetId" value="${monthSheetId}">
    <div class="container-xl px-4 mt-4">

      <div class="row mb-2">
        <div class="col-xl-5">
          <div class="card mb-4 mb-xl-0">
            <div class="card-header">Profile Details</div>
            <div class="card-body text-center">
              <div class="tab-pane fade show active profile-overview" id="profile-overview">
                <div class="row">
                  <div class="col text-start">Employee Name</div>
 
                  <div class="col">
                    <span class="badge badge-soft-primary mb-0 fw-bold" style="font-size: 14px;">
                      ${emp.getEmployeeName()}</span>
                  </div>
                </div>

                <div class="row">
                  <div class="col text-start">Employee Id</div>
                  <div class="col">
                    <span class="badge badge-soft-primary mb-0 fw-bold" style="font-size: 14px;">
                      ${emp.getEmpId()}
                    </span>
                  </div>
                </div>

                <div class="row">
                  <div class="col text-start">Designation</div>
                  <div class="col">
                    <span class="badge badge-soft-success mb-0 fw-bold" style="font-size: 14px;">
                      ${emp.getGroupDesc()}</span>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>

        <div class="col-lg-7">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Month Chart</h5>
              <div id="pieChart" style="min-height: 400px;" class="echart"></div>
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-12">
          <div class="table-responsive">
            <table class="table table-fixed project-list-table table-nowrap align-middle table-borderless">
              <thead class="thead-dark">
                <th class="text-center overflow-auto" scope="row">Date</th>
                <th class="text-center overflow-auto" scope="row">Project Name</th>
                <th class="text-center overflow-auto" scope="row">Description</th>
                <th class="text-center overflow-auto" scope="row">Hour</th>
              </thead>
              <tbody>

                <c:forEach items="${monthSheetDataList}" var="md" varStatus="loop">
                  <tr>
                    <td class="text-center overflow-auto">${md.getDate()}</td>
                    <td class="text-center overflow-auto">${md.getProjectName()}</td>
                    <td class="text-center overflow-auto">${md.getDescr()}</td>
                    <td class="text-center overflow-auto">${md.getHour()}</td>
                  </tr>
                </c:forEach>
                <c:if test='${monthSheetDataList.size() eq 0 }'>
                  <tr>
                    <td colspan="4" class="text-center"> No data </td>
                  </tr>
                </c:if>

              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.3.2/echarts.min.js"
      integrity="sha512-weWXHm0Ws2cZKjjwugRMnnOAx9uCP/wUVf84W7/fXQimwYUK28zPDGPprDozomQLpKv6U99xN9PI9+yLI9qxNw=="
      crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
      let data = [];
      $.ajax({
        async: false,
        type: 'POST',
        url: 'fetch-month-sheet-employee-chart?monthSheetId=' + $("#monthSheetId").val() + '',
        contentType: 'application/json',
        success: function (d, msg, xh) {
          for (let i = 0; i < d.length; i++) {
            data[i] = { value: d[i]["dayCount"], name: d[i]["task"] }
          }
        },
        error: function (d, msg, xh) {
        }
      });

      document.addEventListener("DOMContentLoaded", () => {
        echarts.init(document.querySelector("#pieChart")).setOption({
          title: {
            text: '',
            subtext: ' ',
            left: 'right'
          },
          tooltip: {
            trigger: 'item'
          },
          legend: {
            orient: 'vertical',
            left: 'left'
          },
          series: [{
            name: 'Activity ',
            type: 'pie',
            radius: '50%',
            data: data,
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }]
        });
      });
    </script>


    <script>
      // When the user scrolls the page, execute myFunction 
      window.onscroll = function () { myFunction() };

      function myFunction() {
        var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
        var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
        var scrolled = (winScroll / height) * 100;
        document.getElementById("myBar").style.width = scrolled + "%";
      }
    </script>

  </body>