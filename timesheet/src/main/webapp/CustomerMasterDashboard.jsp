<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="menu.jsp" %>
	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Customer Master Dashboard</title>
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
	font-style: bold;
	text-align: center;
	border-radius:5px;
	
}

th {
	border-top: 5px;
	margin-top:20px;
	border-bottom: 5px;
	border-left: 5px;
	border-right: 5px;
	border-color: darkblue;
	background-image: linear-gradient( 95.2deg,  rgba(173,252,234,1) 26.8%, rgba(192,229,246,1) 64% );
    text-align: center;
}

h1 {
	background-image: linear-gradient(108.1deg, rgba(167, 220, 225, 1) 11.2%,rgba(217, 239, 242, 1) 88.9%);
	text-align: center;
	color: black;
	border-radius:20px;
	border-color:crimson;
}

button {
	margin-top: 20px;
	width: 150px;
	text-indent: 10px;
}

tr:hover {
	background-color: lightgrey;
}

td:hover{
background-color: lightgrey;

}

table, th, td {
	border: 3px solid grey;
	padding: 5px;
	border-radius:10px;
}

td{
background-image: #c5c2c2;

}

.btn-primary{
 width:20%;
 border-radius:20px;

}

.container{
border-color:green;
border-width:20px;

}

#btndelete{
background-color:crimson;
border-radius:5px;
width:fit-content;
border:2px solid black;



}
</style>

    
	<div class="container">
		<h1>
			<span class="glyphicon glyphicon-th"></span> Customer Master
		</h1>
		<button type="button" class="btn btn-primary" id="btncreate"
			onclick="openPage('customermaster1.jsp')" />
			<span class="glyphicon glyphicon-tasks"></span> Add New Customer
		</button>
	   
	
		<table id="myTable" class="table table-striped" >
			<thead class="thead-dark">
			    <th scope="row">Actions</th>
				<th scope="row">Customer Id</th>
				<th scope="row">Customer Type</th>
				<th scope="row">Customer Name</th>
				<th scope="row">Project Id</th>
				<th scope="row">Project Name</th>
				<th scope="row">On Board Date</th>
				<th scope="row">Off Board Date</th>
				
			</thead>
			<tbody>
					<c:forEach items="${customerdata}" var="c" varStatus="loop">
					<tr id = "A001" >
					<td><button type="button" class="btn btn-Danger" id="btndelete" onclick="deleteCustomer('${c.getCustomerid()}')"><span class="glyphicon glyphicon-trash"></span>Delete</button></td>
						<td onclick="showId(this)" >${c.getCustomerid()} </td>	
						<td>${c.getCustomertype()}</td>
						<td>${c.getCustomername()}</td>
						<td>${c.getProjectid()}</td>
						<td>${c.getProjectname()}</td>
						<td>${c.getOnboarddate()}</td>
						<td>${c.getOffboarddate()}</td>						
						</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
		function showId(t) {
			console.log($(t).html());
		}
	</script>
	<script type="text/javascript">
		function openPage(pageURL) {
			window.location.href = pageURL;
		}
	</script>

	<script>
		function deleteCustomer(CustId) {
			$.ajax({
				url : 'http://localhost:8080/customerdelete?customerId=' + CustId,
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




</body>

</html>