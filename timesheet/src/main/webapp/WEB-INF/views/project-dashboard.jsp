<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%@ include file="menu.jsp" %>

<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Project Master Dashboard</title>

</head>
<body>

<style>

body {
	font-size: medium;
	background-color:#e6f2ff;
	user-select: none;
}

table{
	margin-top: 3%;
	border-width: 5px;
	font-style:bold;
}

th{
	background-image: linear-gradient( 95.2deg,  rgba(173,252,234,1) 26.8%, rgba(192,229,246,1) 64% );
	border-top:5px;
	border-bottom:5px;
	border-left:5px;
	border-right:5px; 
	border-color: darkblue;
}
h1 {
	background-image: linear-gradient(108.1deg, rgba(167, 220, 225, 1) 11.2%,rgb(174, 221, 228) 88.9%);
	 
	border-radius:20px ;
}


tr:hover{
	background-color:rgb(190, 189, 189);
}
 
table, th, td {
  border: 1px solid transparent;
  border-radius:10px;
  text-align:center;
}


</style>
	<div class="container">
		<h1 class="h2 mt-4 text-center py-2 " >  Project Dashboard </h1>
		<a type="button" class="btn btn-primary mt-3 mx-2 px-4" href="add-project" style="border-radius: 20px;">   Add New Project</a>
	
		<table class="table table-striped pt-0" >
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
			            <td>${p.getProjectName()}</td>
						<td>${p.getProjectStatus()==1?"Active":"In-Active"}</td>
						<td>${p.getCustomerName()}</td>
						<td>
							<input type="button" class="btn btn-danger me-2  h-50 " value="Delete"  onclick="deleteprojectbyid('${p.getProjectId()}' , this)" > </input>
							<input type="button" class="btn btn-primary" value="Edit"  onclick="deleteprojectbyid('${p.getProjectId()}', this)" > </input>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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