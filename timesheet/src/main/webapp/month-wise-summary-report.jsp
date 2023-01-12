<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Monthly Wise Summary</title>
    <link rel="stylesheet" href="css/form-style.css">
</head>

<body>
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">
                <div class="card mb-4">
                    <div class="card-header text-center">Monthly Wise Summary Report</div>
                    <div class="card-body">
                        <form method="post" action="month-wise-summary-report-details" enctype="application/x-www-form-urlencoded" >
                            <div class="row gx-3 mb-3 justify-content-center">
                                <div class="col-md-4">
                                    <table>  
                                        <tr>
                                            <label class="small mb-1" for="from">From Date</label>
                                            <input class="form-control" id="from" name="from" type="date" required>
                                            <span class="form-text small text-danger ms-2  d-none">Specify Start date</span>
                                        </tr>  
                                        <tr>
                                            <label class="small mb-1" for="to">To Date</label>
                                            <input class="form-control" id="to" name="to" type="date" required>
                                            <span class="form-text small text-danger ms-2  d-none">Specify End date</span>
                                        </tr> 
                                    </table> 
                                </div> 
                                <div class="row justify-content-center gap-2  mt-3">  
                                    <a class="btn btn-secondary btn-sm px-5  btn-sm w-auto  order-md-1 order-2 "   href="home"> Back </a>
                                    <button class="btn btn-primary btn-sm px-5    btn-sm w-auto   order-md-2 order-1 " type="submit"> Show </button>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    </script>
</body>

</html>