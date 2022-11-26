<%@ include file="menu.jsp" %>
<head>
<title>Project Master Dashboard</title>
<style>
	  .sidebyside {
            display: flex;
            justify-content: space-around;
        }
		table thead th , table tr td {
			text-align: center;
		}
</style>
</head>
<body>
	<div class="container"> 
		<h1 class="text-secondary h4 m-0 my-3 py-2 fw-normal  dashboard-headling "> Project Dashboard </h1>
		<div class="row align-items-center  ">
            <div class="col-md-6 mb-2 mb-md-0 ">
				<h6 class=" badge-soft-success d-inline px-3 py-2 rounded"> No of Projects <span class="text-muted fw-normal ">(${projectList.size()})</span></h6>
		    </div>
            <div class="col-md-6 "> 
                <div class="d-flex justify-content-md-end ">                         
					<a type="button" class="btn btn-primary   px-md-4  me-2 mb-1" href="project-map"  style="border-radius: 15px">  Employe Project Map</a>
					<a type="button" class="btn btn-primary   px-md-4  me-2 mb-1" href="add-project" style="border-radius: 15px"> <i class="bx bx-plus me-1"></i>  Add New Project</a>
                </div>
            </div>
			<div class="">
				<div class="table-responsive">
				<table class="table  pt-0 m-0 mt-1 table project-list-table word-wrap overflow-auto align-middle table-borderless" >
					<thead >
						<!-- <th scope="row">Project Id</th> -->
						<th  >Project Name</th>
						<th  >Project Timeline</th>
						<th  >Customer Name</th>
						<th  >Actions</th>
					</thead>
					<tbody>
						<c:forEach items="${projectList}" var="p" varStatus="loop">
							<tr>
								<!-- <td>${p.getProjectId()} </td>	 -->
								<td class=" overflow-auto">${p.getProjectName()}</td>
								<td>   
									<div class="sidebyside">
										<div > 
											Days : ${p.getProjectDay()}
										</div>
										<div >
											Hours : ${p.getProjectDay()*24}
										</div>
									</div>
								</td>
								<td>${p.getCustomer().getCustomerName()}</td>
								<td>
									<ul class="list-inline mb-0">
										<a href="/project-edit?projectId=${p.getProjectId()}" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit" class="px-2 text-primary"><i class="bx bx-pencil font-size-18"></i></a>
										<c:if test="${p.getProjectStatus()== '1'  }">
												<a href="#" data-bs-toggle="tooltip" data-bs-placement="top" title="Active" class="px-2 text-success">  <i class="fa-solid fa-circle"> </i>  </a>
										</c:if>
										<c:if test="${p.getProjectStatus()== '0'  }">
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