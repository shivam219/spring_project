<%@ include file="menu.jsp" %>
    <html lang="en">

    <head>
        <title>Ess work</title>
    </head>

    <body>

        <div class="container">
            <div class="row rounded  ">
                <h5 class="text-center text-secondary h4 ">Ess Work</h5>
            </div>
            <table class="table table-striped table-hover rounded mb-0" id="tbtable">
                    <tr class="table-dark ">
                        <td scope="col" >Menu</td>
                        <td scope="col">Date </td>
                        <td scope="col">Project Name</td>
                        <td scope="col">Start Time</td>
                        <td scope="col">End Time</td>
                    </tr> 
                    <!-- <c:forEach items="${list}" var="u"> -->
                    <tr>
                        <td></td>
                        <td>10/10/2002</td>
                        <td>Timesheet</td>
                        <td>9:30 am</td>
                        <td>6:30 pm</td>
                    </tr>
                    <!-- </c:forEach> -->
            </table>
            <input type="button" value="Duplicate" class="btn">
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