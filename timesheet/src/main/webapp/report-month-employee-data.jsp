<%@ include file="menu.jsp" %>
  <!DOCTYPE html>

  <head>
    <title>Profie ${empName} </title>
    <link rel="stylesheet" href="css/form-style.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3/dist/chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
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

      tbody,
      td,
      td a tfoot,
      th,
      thead,
      tr {
        white-space: normal;
      }
      ::-webkit-scrollbar {
           width: 0px;
        }
    </style>
  </head>

  <body>
    <div class="progress-container d-none">
      <div class="progress-bar" id="myBar"></div>
    </div>
    <input type="hidden" name="monthSheetId" id="monthSheetId" value="${monthSheetId}">
    <div class="container-xl px-4 mt-4">

      <div class="row mb-2">
        <div class="col-md-6"> 
          <div class="card">  
            <div class="card-header">Profile Details</div>  
            <div class="card-body text-center" style="min-height: 131px;">  
              <div class="tab-pane fade show active profile-overview" id="profile-overview">
                <div class="row" >  
                  <div class="col text-start">  Employee Name</div>
                  <div class="col">
                    <span class="badge badge-soft-primary mb-0 fw-bold"> ${emp.getEmployeeName()}</span> 
                  </div>
                </div>
                <div class="row"> 
                  <div class="col text-start">Employee Id</div>
                  <div class="col">
                    <span class="badge badge-soft-primary mb-0 fw-bold">
                      ${emp.getEmpId()} 
                    </span>
                  </div>
                </div>
                <div class="row">
                  <div class="col text-start">Designation</div>
                  <div class="col">
                    <span class="badge badge-soft-success mb-0 fw-bold">
                      ${emp.getGroupDesc()}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-xl-6">
          <div class="card ">
            <div class="card-header">Leave Details</div>
            <div class="card-body text-center">
              <div class="row">
                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  <table class="table  project-list-table align-middle table-borderless">
                    <thead class="thead-dark"> 
                      <th class="text-center " scope="row">Type</th>
                      <th class="text-center " scope="row">From</th>
                      <th class="text-center " scope="row">To</th>
                      <th class="text-center " scope="row">Days</th>
                    </thead>
                    <c:forEach items="${leaveList}" var="l" varStatus="loop">
                      <tr>
                        <td class="text-center overflow-auto">${l.getLeaveType()}</td>
                        <td class="text-center overflow-auto">${l.getStartDate()} </td>
                        <td class="text-center overflow-auto">${l.getEndDate()} </td>
                        <td class="text-center overflow-auto">${l.getDyas()} </td>
                      </tr>
                    </c:forEach>
                    <c:if test='${leaveList.size() eq 0 }'>
                      <tr>
                        <td colspan="4" class="text-center"> No data </td>
                      </tr>
                    </c:if>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="row mb-2 d-none ">
        <div class="col-lg-6">
          <div class="card ">
            <div class="card-body">
              <h5 class="card-title">Month Chart</h5>
              <div id="pieChart" style="min-height: 250px;" class="echart"></div>
            </div> 
          </div>  
        </div>
        <div class="col-lg-6">
          <div class="card "> 
            <div class="card-body">
              <h5 class="card-title">Day Details</h5>
              <div id="columnChart" ></div>
            </div>
          </div>
        </div> 
      </div> 


      <div class="row">
        <div class="col-lg-12">
          <div class="card "> 
            <div class="card-body">
              <div class="table-responsive">
                <table class="table  project-list-table align-middle table-borderless" id="monthTable">
                  <thead class="thead-dark">
                    <th class="text-center" >Date</th>
                    <th class="text-center" >Hour</th>
                    <th class="text-center" colspan="6" >Description</th>
                  </thead>
                  <tbody>
                    <c:forEach items="${monthDto}" var="d">
                      <tr>
                        <td class="text-center" >${d.getDate()}</td>
                        <td class="text-center" >${d.getTotalHour()}</td> 
                         <td colspan="6">
                           <span style='font-size:28px;user-select: none;' >&#9656;</span>
                          <c:forEach items="${d.getDataDtos()}" var="dd">
                            <div style="display: none;"> 
                              <div class="row  m-0 p-0 d-flex ">
                                <div class="col-3 border flex-wrap align-items-center justify-content-start" style="white-space: nowrap; padding: 5px; overflow: overlay; " >${dd.getProjectName()}</div> 
                                <div class="col-8 border flex-wrap align-items-center justify-content-start" style="white-space: nowrap; padding: 5px; overflow: overlay; " > <p>${dd.getDescr()}</p> </div>   
                                <div class="col-1 border flex-wrap align-items-center justify-content-start" style="white-space: nowrap; padding: 5px; overflow: overlay; " >${dd.getHour()}</div>
                              </div>
                            </div> 
                          </c:forEach>
                        </td>
                      </tr> 
                    </c:forEach>
                  </tbody>
                </table> 
              </div>
            </div> 
          </div> 
          <div class="row m-1 ">
            <a class="btn btn-secondary btn-sm px-5 btn-sm  w-auto" href="report-month-employee"> Back </a>
          </div>
      </div>
    </div>
    <br>
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
      let data2 = [];
      $.ajax({
        async: false,
        type: 'POST',
        url: 'fetch-month-sheet-employee-chart?monthSheetId=' + $("#monthSheetId").val() + '',
        contentType: 'application/json',
        success: function (d, msg, xh) {
          for (let i = 0; i < d.length; i++) {
            data2[i] = { value: d[i]["dayCount"], name: d[i]["task"] }
          }
        },
        error: function (d, msg, xh) {
        }
      });
      document.addEventListener("DOMContentLoaded", () => {
        new ApexCharts(document.querySelector("#columnChart"), {
          series: [{
            name: 'Kotak-Payement Intrigration',
            data: [4, 5,5, 5, 6, 1, 5, 6, 6, 6, 5, 6, 1, 5, 6, 6, 6]
          }, {  
            name: 'BM-Transport Management',
            data: [7, 5,5, 1, 8, 7, 1, 9, 1, 4, 1, 8, 7, 1, 9, 1, 4]
          }, {
            name: 'Wipro - Project Work',
            data: [3, 1,1, 6, 6, 5, 4, 5, 5, 1, 6, 6, 5, 4, 5, 5, 1]
          }],
          chart: {
            type: 'bar',
            height: 235
          },
          plotOptions: {
            bar: {
              horizontal: false,
              columnWidth: '55%',
              endingShape: 'rounded'
            },
          },
          dataLabels: {
            enabled: false
          },
          stroke: {
            show: true,
            width: 2,
            colors: ['transparent']
          },
          xaxis: {
            categories: ['1', '2', '3', '4', '5', '8', '9', '10', '11',,'14','14','14','14','14','14'],
          },
          yaxis: {
            title: {
              text: 'Hour'
            }
          }, 
          fill: {
            opacity: 1
          },
          tooltip: {
            y: {
              formatter: function(val) {
                return "" + val + " Hour "
              }
            }
          }
        }).render();
      });
    </script>

    <script>
      	  $("td span").on("click",function(t1){
            $(this).siblings("div").toggle();
            if( $(this).siblings("div").css('display') == 'none'){
                $(this).html("&#9656;");
                $(this).css("color","#535352");
            }else{
                $(this).html("&#9662;"); 
                $(this).css("color","red");
            }
        });
      // scroller bar on header
      window.onscroll = function () { myFunction() };
      function myFunction() {
        var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
        var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
        var scrolled = (winScroll / height) * 100;
        document.getElementById("myBar").style.width = scrolled + "%";
      }
    </script>

    <script>
      // use to fetch monthly employee to table that not use
      // $(document).ready(function () {
      //   $.ajax({
      //     type: 'GET',
      //     url: 'fetch-month-sheet-employee-approve?monthSheetId=' + $("#monthSheetId").val() + '',
      //     contentType: 'application/json',
      //     success: function (d, msg, xh) {
      //       console.log(d);
      //       let d2 = [];
      //       let set = new Set();
      //       if (d.length > 0) {
      //         set.add(d[0]['date']);
      //         d2.push(d[0]);
      //         for (let i = 1; i < d.length; i++) {
      //           if (set.has(d[i]['date'])) {
      //             d2.push(d[i]);
      //           } else {
      //             let hour = parseInt(d2[0]['hour']);
      //             let hours = parseInt(d2[0]['hour']);
      //             let tr = '<tr>'
      //               + '<td class="text-center " rowspan= ' + parseInt(d2.length) + ' > ' + d2[0]['date'] + ' </td>'
      //               + '<td class="text-center " > ' + d2[0]['projectName'] + ' </td>'
      //               + '<td  > ' + d2[0]['descr'] + ' </td>'
      //               + '<td class="text-center " > ' + d2[0]['hour'] + ' </td>'
      //               + '</tr> ';
      //             console.log(tr);
      //             $("#monthTable").append(tr);
      //             for (let j = 1; j < d2.length; j++) {
      //               hours = hours + parseInt(d2[j]['hour']);
      //               let tri = '<tr > '
      //                 + '<td class="text-center" > ' + d2[j]['projectName'] + ' </td>'
      //                 + '<td  > ' + d2[j]['descr'] + ' </td>'
      //                 + '<td  class="text-center " > ' + d2[j]['hour'] + ' </td>'
      //                 + '</tr> ';
      //               console.log(tri);
      //               $("#monthTable").append(tri);
      //             }
      //             if (hour != hours) {
      //               $("#monthTable").append('<tr><td></td><td></td><td></td><td  class="text-center fw-bold">' + hours + '</td></tr>');
      //             }
      //             set.clear();
      //             set.add(d[i]['date']);
      //             d2 = [];
      //             d2.push(d[i]);
      //           }
      //           if (i == d.length - 1) {
      //             let hour = parseInt(d2[0]['hour']);
      //             let hours = parseInt(d2[0]['hour']);
      //             let tr = '<tr>'
      //               + '<td class="text-center " rowspan= ' + parseInt(d2.length) + ' > ' + d2[0]['date'] + ' </td>'
      //               + '<td class="text-center " > ' + d2[0]['projectName'] + ' </td>'
      //               + '<td  > ' + d2[0]['descr'] + ' </td>'
      //               + '<td class="text-center " > ' + d2[0]['hour'] + ' </td>'
      //               + '</tr> ';
      //             console.log(tr);
      //             $("#monthTable").append(tr);
      //             for (let j = 1; j < d2.length; j++) {
      //               hours = hours + parseInt(d2[j]['hour']);
      //               let tri = '<tr > '
      //                 + '<td class="text-center" > ' + d2[j]['projectName'] + ' </td>'
      //                 + '<td  > ' + d2[j]['descr'] + ' </td>'
      //                 + '<td  class="text-center " > ' + d2[j]['hour'] + ' </td>'
      //                 + '</tr> ';
      //               console.log(tri);
      //               $("#monthTable").append(tri);
      //             }
      //             if (hour != hours) {
      //               $("#monthTable").append('<tr><td></td><td></td><td ></td><td  class="text-center fw-bold">' + hours + '</td></tr>');
      //             }
      //           }
      //         }
      //       }
      //     }
      //   })
      // });
    </script>
  </body>