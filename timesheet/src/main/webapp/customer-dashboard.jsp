<%@ include file="menu.jsp"%>
<head>
<meta charset="UTF-8">
<title>Customer Master Dashboard</title>

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
		<h1 class="h2 mt-4 text-center py-2 " >  Customer  Dashboard</h1>
		<a type="button" class="btn btn-primary mt-3 mx-2 px-4" href="add-customer" style="border-radius: 20px;">  Add New Customer</a>
	 	 
		<table id="myTable" class="table table-striped">
			<thead class="thead-dark">
				<th scope="row">Customer Id</th>
				<th scope="row">Customer Type</th>
				<th scope="row">Customer Name</th>
				<th scope="row">On Board Date</th>
				<th scope="row">Off Board Date</th>
				<th scope="row">Actions</th>
			</thead>
			<tbody>
				<c:forEach items="${customerdata}" var="c" varStatus="loop">
					<tr id="A001">
						<td>${c.getCustomerId()}</td=>
						<td>${c.getCustomerType()}</td>
						<td>${c.getCustomerName()}</td>
						<td>${c.getOnBoardDate()}</td>
						<td>${c.getOffBoardDate()}</td>
						<td>
							<input type="button" class="btn btn-danger me-2  h-50 " value="Delete"  onclick="deleteCustomerById('${c.getCustomerId()}' , this)" > </input>
							<input type="button" class="btn btn-primary" value="Edit"  onclick="deleteCustomerById('${c.getCustomerId()}' , this)" > </input>
						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

	<script>
		function deleteCustomerById(customerId,ref) { 
			if(confirm("Do you want to delete customer")){
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
			$(ref).blur();
		}
	</script>




</body>

</html>