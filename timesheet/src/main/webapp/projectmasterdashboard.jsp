<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="menu.jsp" %>

<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Project Master Dashboard</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



</head>
<body>

<style>

body {
	font-size: medium;
	background-color:#e6f2ff;
}


table{
margin-top: 3%;
border-width: 5px;
background-color: rgb(119, 107, 107);
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
	background-image: linear-gradient(108.1deg, rgba(167, 220, 225, 1) 11.2%,rgba(217, 239, 242, 1) 88.9%);
	text-align: center;
	color: black;
	border-radius:20px;
	border-color:crimson;
}

}

button{

margin-top:20px;
width:200px;
text-indent: 10px;

}

.btn-primary{
 width:20%;
 border-radius:20px;
 margin-top:20px;

}

tr:hover{
background-color:grey;
}

table, th, td {
  border: 1px solid black;
  border-radius:10px;
  text-align:center;
}


</style>
	<div class="container">
		<h1><span class="glyphicon glyphicon-th"></span>  Project Master </h1>
		<button type="button" class="btn btn-primary" onclick="openPage('addproject.jsp')"/> <span class="glyphicon glyphicon-tasks"></span> Add New Project</button>
	
	
		<table class="table table-striped" >
			<thead class="thead-dark">
			    <th scope="row">Actions</th>
				<th scope="row">Project Id</th>
				<th scope="row">Project Name</th>
				<th scope="row">Project Status</th>
				<th scope="row">
			</thead>
			<tbody>
				<c:forEach items="${projectList}" var="p" varStatus="loop">
					<tr>
					<td><button type="button" class="btn btn-danger"  onclick="deleteprojectbyid('${p.getProjectId()}')"/> <span class="glyphicon glyphicon-remove"></span> Delete</button></td>
						<td onclick="showId(this)" >${p.getProjectId()} </td>	
			            <td>${p.getProjectName()}</td>
						<td>${p.getProjectStatus()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
	
		function showId(t){
			console.log($(t).html());
		}
		
		
	</script>
	<script>
		function deleteprojectbyid(ProjectId) {
			$.ajax({
				url : 'http://localhost:8080/deleteprojectbyid?project_id=' + ProjectId,
				method : 'GET',
				success : function() {
					alert('record has been deleted');
					location.reload();
				},
				error : function(error) {
					
				}

			})

		}
	</script>
	
	<script type="text/javascript">
 function openPage(pageURL)
 {
 window.location.href = pageURL;
 }
</script>
	
	<script> 
            function Geeks() {
                document.getElementById("row1").remove();
            }
        </script>
</body>

</html>