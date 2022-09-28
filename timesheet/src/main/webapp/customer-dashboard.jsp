<%@ include file="menu.jsp"%>
<head>
<meta charset="UTF-8">
<title>Customer Master Dashboard</title>

</head>
<body>

	<style>
body {
	font-size: medium;
	background-color: #e6f2ff;
}

table {
	margin-top: 3%;
	border-width: 5px;
	font-style: bold;
	text-align: center;
	border-radius: 5px;
}

th {
	border-top: 5px;
	margin-top: 20px;
	border-bottom: 5px;
	border-left: 5px;
	border-right: 5px;
	border-color: darkblue;
	background-image: linear-gradient(95.2deg, rgba(173, 252, 234, 1) 26.8%,
		rgba(192, 229, 246, 1) 64%);
	text-align: center;
}

h1 {
	background-image: linear-gradient(108.1deg, rgba(167, 220, 225, 1) 11.2%,
		rgba(217, 239, 242, 1) 88.9%);
	text-align: center;
	color: black;
	border-radius: 20px;
	border-color: crimson;
}

button {
	margin-top: 20px;
	width: 150px;
	text-indent: 10px;
}

tr:hover {
	background-color: lightgrey;
}

td:hover {
	background-color: lightgrey;
}

table, th, td {
	border: 3px solid grey;
	padding: 5px;
	border-radius: 10px;
}

td {
	background-image: #c5c2c2;
}

.btn-primary {
	width: 20%;
	border-radius: 20px;
}

.container {
	border-color: green;
	border-width: 20px;
}

#btndelete {
	background-color: crimson;
	border-radius: 5px;
	width: fit-content;
	border: 2px solid black;
}
</style>


	<div class="container">
		<h1>
			<span class="glyphicon glyphicon-th"></span> Customer Master
		</h1>
		<a type="button" class="btn btn-primary" id="btncreate"
			href='add-customer'> <span class="glyphicon glyphicon-tasks"></span>
			Add New Customer
		</a>
		<table id="myTable" class="table table-striped">
			<thead class="thead-dark">
				<th scope="row">Actions</th>
				<th scope="row">Customer Id</th>
				<th scope="row">Customer Type</th>
				<th scope="row">Customer Name</th>
				<th scope="row">On Board Date</th>
				<th scope="row">Off Board Date</th>
			</thead>
			<tbody>
				<c:forEach items="${customerdata}" var="c" varStatus="loop">
					<tr id="A001">
						<td><button type="button" class="btn btn-Danger" id="btndelete" onclick="deleteCustomer('${c.getCustomerId()}')">
							<span class="glyphicon glyphicon-trash"></span>Delete </button></td>
						<td>${c.getCustomerId()}</td=>
						<td>${c.getCustomerType()}</td>
						<td>${c.getCustomerName()}</td>
						<td>${c.getOnBoardDate()}</td>
						<td>${c.getOffBoardDate()}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

	<script>
		function deleteCustomer(customerId) { 
			let uri =  'customer-delete?customerId='+customerId;
			$.ajax({
				type: 'GET',
				url: uri,
				contentType: false,
				success: function () {
					location.reload();
				}
			}); 
		}
	</script>




</body>

</html>