<%@ include file="menu.jsp"%>
<html>
<head> 
<title>Month Sheet </title> 
	<style> 
	</style>
</head> 
<body>  
	<div class="container">  
	    <h1 class=" h4 m-0 my-3 py-2 fw-normal  dashboard-headling "> Approve Timesheet </h1>
		<div class="row align-items-center ">
    		<div class="">  
				<div class="table-responsive">
				<table id="myTable" class="table  pt-0 m-0 mt-1 table project-list-table word-wrap overflow-auto align-middle table-borderless">
					<thead class="thead-dark">
						<th scope="row">Employee Name</th>
						<th scope="row">Month</th>
						<th scope="row">Year</th> 
						<th scope="row">Submit Date</th>
						<th scope="row">Actions</th>
					</thead>
					<tbody>
						<c:forEach items="${monthSheetList}" var="ms" varStatus="loop">
							<tr>
                                <td>${ms.getEmployeeName()}</td>
								<td>${ms.getMonth()}</td> 
								<td>${ms.getYear()}</td>
								<td>${ms.getSubmitDate()}</td>  
								<td class="ms-md-2">   
									<a href="month-sheet-approve?monthSheetId=${ms.getMonthSheetId()}"   class="btn btn-success btn-sm"> <i class="fa fa-duotone fa-check"></i> Approve </a>                                    
								</td>
							</tr>
						</c:forEach>
						<c:if test='${monthSheetList.size() eq 0 }'> 
							<tr>
								<td colspan="5" class="text-center">  No data </td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-md-6">
				<div> 
					<a class="btn btn-secondary btn-sm btn-sm px-5 py-1" type="button" href="home" > Back  </a> 
				</div>
			</div>
		</div>
	</div>
</body>
</html>