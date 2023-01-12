<%@ include file="menu.jsp" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Monthly Wise Summary Report Details</title>
    <style>
        .card{
            display: flex;
            flex-direction: row;
            justify-content: center;
        }
        .card-title{
            padding:0 7vw;
        }

    </style>
</head>

<body>
    <input type="hidden" value="${empMonthSheet.getMonthSheetId()}" id="monthSheetId">
    <div class="container">
        <h1 class=" h4 m-0 my-3 py-2 fw-normal  dashboard-headling ">Month Wise Summary Report Details</h1>
        <div class="">
            <div class="row py-1 ">
                <div class="col">   
                    <div class="card   py-1">
                        <div> 
                            <span class="card-title "> From  :   
                                <fmt:formatDate type = "date" value = "${fromDate}" /> 
                            </span>
                        </div>
                        <div> 
                            <span class="card-title "> To  :   
                                <fmt:formatDate type = "date" value = "${toDate}" /> 
                            </span>
                        </div>
                </div>
            </div>  
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table  project-list-table align-middle table-borderless" id="monthTable">
                        <thead class="thead-dark">
                            <th class="text-center" >Employee Name</th>
                            <th class="text-center" > <div>  
                                <div class="row  m-0 p-0 ">
                                    <div class="col-6"> Project Name  </div>   
                                    <div class="col-3">Hour</div> 
                                    <div class="col-3">Hour % </div> 
                                </div>  
                            </th> 
                            <th class="text-center" >Total Hour</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${dto}" var="d">
                                <tr>
                                    <td class="text-center" >${d.getEmpName()}</td>
                                    <td >
                                        <c:forEach items="${d.getPl()}" var="dd">
                                            <div>  
                                                <div class="row  m-0 p-0 ">
                                                    <div class="col-6 text-center ">  ${dd.getName()}  </div>   
                                                    <div class="col-3 text-center ">${dd.getHour()}</div> 
                                                    <div class="col-3 text-center ">${dd.getHourPer()}</div> 
                                                </div>
                                            </div>  
                                        </c:forEach>
                                    </td>
                                    <td class="text-center" >${d.getTotalHour()}</td> 
                                </tr> 
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div>
                    <button class="btn btn-secondary btn-sm btn-sm px-5 py-1" type="button" onclick="history.back()"> Back
                    </button>
                </div>
            </div>
        </div>
        <br><br><br>
    </div>

</html>