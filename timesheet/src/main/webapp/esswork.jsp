<%@ include file="menu.jsp" %>
    <html lang="en">

    <head>
        <title>Ess work</title>
        <style>
            table {
  table-layout: fixed;
}
        </style>
    </head>

    <body>

        <div class="container">
            <div class="row rounded  ">
                <h5 class="text-center text-secondary h4 ">Ess Work</h5>
            </div>
            <div class="row">
                <div class="col">
                    <p>Time Period</p>
                </div>
                <div class="col">
                    <input type="date" name="weekst" id="weekst">
                </div>
                <div class="col">
                    <input type="date" name="weeked" id="weeked">
                </div>
                <div class="col">
                    <input type="button" class="btn btn-primary btn-sm" value="Save">
                </div>
                <div class="col">
                    <input type="button" class="btn btn-primary btn-sm" value="Submit">
                </div>
            </div>
            <table class="table table-striped table-hover rounded mb-0" id="tbtable">
                    <tr class="table-dark ">
                        <td >Work Items</td>
                        <td >Status</td>
                        <td >Mon</td>
                        <td >Tue</td>
                        <td >wed</td>
                        <td >thu</td>
                        <td >Fri</td>
                        <td >Sat</td>
                        <td >Sun</td>
                        <td >Total</td>
                    </tr> 
                    <!-- <c:forEach items="${list}" var="u"> -->
                    <tr>
                        <td>
                            <div class="dropdown"><button class="btn btn-primary btn-sm dropdown-toggle" aria-expanded="false" data-bs-toggle="dropdown" type="button">Dropdown </button>
                                <div class="dropdown-menu"><a class="dropdown-item" href="#">First Item</a><a class="dropdown-item" href="#">Second Item</a><a class="dropdown-item" href="#">Third Item</a></div>
                            </div>
                        </td>
                        <td>  <p>Approved</p></td>
                        <td><input type="number" class="form-control w-75"   placeholder="HH"></td>
                        <td><input type="number" class="form-control w-75"   placeholder="HH"></td>
                        <td><input type="number" class="form-control w-75"   placeholder="HH"></td>
                        <td><input type="number" class="form-control w-75"   placeholder="HH"></td>
                        <td><input type="number" class="form-control w-75"   placeholder="HH"></td>
                        <td><input type="number" class="form-control w-75"   placeholder="HH"></td>
                        <td><input type="number" class="form-control w-75"   placeholder="HH"></td>
                        <td><label class="form-label">10</label></td>
                    </tr>
                    <!-- </c:forEach> -->
                    <tfoot>
                        <td colspan="2">  <input type="button" value="Duplicate" class="btn"></td>
                        <td >10</td>
                        <td >10</td>
                        <td >10</td>
                        <td >10</td>
                        <td >10</td>
                        <td >10</td>
                        <td >10</td>
                        <td >70</td>
                    </tfoot>
            </table>
        
        </div>

        <script>
            $(function () {
                $('select').select2();
            });
            $(document).ready(function () {
                $(".btn").on('click', function () {
                    event.preventDefault()
                    $(".selectProject.select2-hidden-accessible").select2('destroy');
                    var row = $("#tbtable tr").eq(1);
                    var newrow = row.clone();
                    $("#tbtable").append(newrow);
                    $('.selectProject').select2();
                    $(".btn").blur();
                });
            });
        </script>
    </body>

    </html>
    <%@ include file="footer-fixed-bottom.jsp" %>