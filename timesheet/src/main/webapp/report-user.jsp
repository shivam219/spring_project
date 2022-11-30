<%@ include file="menu.jsp" %>
  <!DOCTYPE html>

  <head>
    <title>Profie ${empName} </title>
    <link rel="stylesheet" href="css/form-style.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3/dist/chart.min.js"></script>
  </head>

  <body>

    <div class="container-xl px-4 mt-4">

      <!-- <div class="row "> -->
        <div class="row justify-content-center ">
        <div class="col-md-8">
          <div class="card mb-4 mb-xl-0">
            <div class="card-header">Profile Details</div>
            <div class="card-body text-center ">
              <div class="tab-pane fade show active profile-overview" id="profile-overview">
                <div class="row gap-2 ">
                  <div class="col text-start">Employee Name</div>
                  <div class="col">
                    <span class="badge badge-soft-primary mb-0 fw-bold" style="font-size: 14px;">  ${user.getFullName()}</span>
                  </div>
                </div>

                <div class="row">
                  <div class="col text-start">Employee Id</div>
                  <div class="col">${user.getEmpId()}</div>
                </div>

                <div class="row">
                  <div class="col text-start">Designation</div>
                  <div class="col">
                    <span class="badge badge-soft-success mb-0 fw-bold" style="font-size: 14px;"> Java Developer</span>
                  </div>
                </div>

                <div class="row">
                  <div class="col text-start">Email</div>
                  <div class="col">${user.getEmpEmail()}</div>
                </div>

                <div class="row">
                  <div class="col text-start">Join : </div>
                  <div class="col">${user.getDateOfJoin()}</div>
                </div>

                <div class="row">
                  <div class="col text-start">Birth: </div>
                  <div class="col">${user.getBirthDate()}</div>
                </div>

                <div class="row justify-content-between">
                  <div class="col-3 text-start">Address</div>
                  <div class="col-6  ">${user.getEmpCity()}, Pincode :
                    ${user.getEmpPincode()}, ${user.getEmpAddress()}</div>
                </div> 

                <div class="row">
                  <div class="col text-start">Phone</div>
                  <div class="col">${user.getEmpPhone()}</div>
                </div>

                <div class="row">
                  <div class="col text-start">Company</div>
                  <div class="col">Enhanced Software solution.</div>
                </div>

              </div>
            </div>
          </div>
        </div>

        <div class="col-xl-8 d-none">
          <!-- Account details card-->
          <div class="card mb-4">
            <div class="card-header">Account Details</div>
            <div class="card-body">
              <div class="row">
                <div class="col-6">
                  <canvas id="myChart" width="400" height="400"></canvas>
                </div>
                <div class="col-6">
                  <canvas id="myChart2" width="400" height="400"></canvas>
                </div>
              </div>
              <div class="row"> 
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="row d-none ">
        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Month Chart</h5>
              <div id="pieChart" style="min-height: 400px;" class="echart"></div>
              <script>
                // let mymydatadata = [{ value:12 , name:'rohit'}]
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#pieChart")).setOption({
                    title: {
                      text: 'Work',
                      subtext: 'Montly Employee Master',
                      left: 'center'
                    },
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      orient: 'vertical',
                      left: 'left'
                    }, 
                    series: [{
                      name: 'Access From',
                      type: 'pie',
                      radius: '50%',
                      data: [{
                          value: 10,
                          name: 'Timesheet'
                        },
                        {
                          value: 30,
                          name: 'KOTAK Payment'
                        },
                        {
                          value: 10,
                          name: 'Leave Application'
                        },
                        {
                          value: 6,
                          name: 'ON Leave'
                        },
                        {
                          value: 44,
                          name: 'IBM Transport '
                        }, 
                        
                      ],
                      // data: mymydatadata,
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
            </div>
          </div>
        </div>
      </div>



    </div>
    </div>

    <!-- <script src="js/chart.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.3.2/echarts.min.js"
      integrity="sha512-weWXHm0Ws2cZKjjwugRMnnOAx9uCP/wUVf84W7/fXQimwYUK28zPDGPprDozomQLpKv6U99xN9PI9+yLI9qxNw=="
      crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
      const ctx = document.getElementById('myChart').getContext('2d');
      console.log(ctx);
      const myChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange', 'Orange', 'sandeep'],
          datasets: [{
            label: '# of ss',
            data: [12, 19, 3, 5, 2, 3, 2, 4],
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
        },
        options: {
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      });

      const ctx2 = document.getElementById('myChart2').getContext('2d');
      const myChart2 = new Chart(ctx2, {
        type: 'bar',
        data: {
          labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange', 'Orange', 'sandeep'],
          datasets: [{
            label: '# of ss',
            data: [12, 19, 3, 5, 2, 3, 2, 4],
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
        },
        options: {
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      });


    </script>
    <script>
 
    </script>

  </body>