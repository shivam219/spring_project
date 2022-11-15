<%@ include file="menu.jsp" %>
<head>
<title>Project Master Dashboard</title>
</head>
<body>
	<div class="container"> 
		<h1 class="text-secondary h4 m-0 my-3 py-2 fw-normal  dashboard-headling "> Project Dashboard </h1>
		<div class="row align-items-center  ">
            <div class="col-md-6 mb-3 mb-md-0 ">
				<h6 class=" badge-soft-success d-inline px-3 py-2 rounded"> No of Projects <span class="text-muted fw-normal ">(${projectList.size()})</span></h6>
		    </div>
            <div class="col-md-6 "> 
                <div class="d-flex justify-content-md-end ">                         
					<a type="button" class="btn btn-primary   px-md-4  me-2 mb-1" href="projectmap"  style="border-radius: 15px">  Employe Project Map</a>
					<a type="button" class="btn btn-primary   px-md-4  me-2 mb-1" href="add-project" style="border-radius: 15px"> Add New Project</a>
                </div>
            </div>
			<div class="">
				<div class="table-responsive">
				<table class="table  pt-0 m-0 mt-1 table project-list-table word-wrap overflow-auto align-middle table-borderless" >
					<thead class="">
						<th scope="row">Project Id</th>
						<th scope="row">Project Name</th>
						<th scope="row">Project Status</th>
						<th scope="row">Customer Name</th>
						<th scope="row">Actions</th>
					</thead>
					<tbody>
						<c:forEach items="${projectList}" var="p" varStatus="loop">
							<tr>
								<td>${p.getProjectId()} </td>	
								<td class=" overflow-auto">${p.getProjectName()}</td>
								<td>${p.getProjectStatus()==1?"Active":"In-Active"}</td>
								<td>${p.getCustomerName()}</td>
								<td>
									<ul class="list-inline mb-0">
										<a href="/employee-edit?empId=${emp.getEmpId()}" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit" class="px-2 text-primary"><i class="bx bx-pencil font-size-18"></i></a>
										<c:if test='${p.getProjectStatus().equals("1")}'>
												<a href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Active" class="px-2 text-success">  <i class="fa-solid fa-circle"> </i>  </a>
										</c:if>
										<c:if test='${!p.getProjectStatus().equals("1")}'>
												<a href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="In-Active" class="px-2 text-danger">  <i class="fa-solid fa-circle"> </i>  </a>
										</c:if>                                           
									</ul>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		function deleteprojectbyid(ProjectId,ref) {
				if(confirm("Do you want to delete Project")){
				let uri =  'delete-project-by-id?projectId='+ProjectId;
				$.ajax({
					type: 'GET',
					url: uri,
					contentType: false,
					success: function () {
						location.reload();
					}
				});     
			}
			$(ref).blur();
		}
	</script>
	
</body>

</html>