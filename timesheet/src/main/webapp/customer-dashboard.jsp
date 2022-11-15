<%@ include file="menu.jsp"%>
<html>
<head>
<title>Customer Master Dashboard</title>
</head>
<body>
	<div class="container">  
	    <h1 class="text-secondary h4 m-0 my-3 py-2 fw-normal  dashboard-headling ">Customer Dashboard </h1>
		<div class="row align-items-center ">
            <div class="col-md-6 ">                     
				<h6 class=" badge-soft-success d-inline px-2 py-2 rounded">No of Customer <span class="text-muted fw-normal ms-1">(${customerdata.size()})</span></h6>
            </div>
            <div class="col-md-6 ">
                <div class="d-flex justify-content-end  ">                        
					<a type="button" class="btn btn-primary   px-4  me-2 mb-1" href="customer-add" style="border-radius: 15px"> Add New Customer</a>
                </div>
            </div> 
			<div class="">
				<div class="table-responsive">
		
				<table id="myTable" class="table  pt-0 m-0 mt-1 table project-list-table word-wrap overflow-auto align-middle table-borderless">
					<thead class="thead-dark">
						<!-- <th scope="row">Customer Id</th> -->
						<th scope="row">Customer Domain</th>
						<th scope="row">Customer Name</th>
						<th scope="row">On Board Date</th>
						<th scope="row">Off Board Date</th>
						<th scope="row">Actions</th>
					</thead>
					<tbody>
						<c:forEach items="${customerdata}" var="c" varStatus="loop">
							<tr id="A001">
								<!-- <td>${c.getCustomerId()}</td=> -->
								<td>${c.getCustomerType()}</td>
								<td>${c.getCustomerName()}</td>
								<td>${c.getOnBoardDate()}</td>
								<td>${c.getOffBoardDate()}</td>
								<td>
									<a href="/customerId-edit?customerId=${c.getCustomerId()}" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit" class="px-2 text-primary"><i class="bx bx-pencil font-size-18"></i></a>                                    
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
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