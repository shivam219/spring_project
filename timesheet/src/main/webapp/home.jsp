<%@ include file="menu.jsp"%>
<head>
<title>ESS Home</title>
<link rel='icon' type='image/ico' href='ESSLogo.png' />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<style>
		::-webkit-scrollbar {
			width: 0px;
        } 
		.card-body{
			overflow: auto;
			height: 300px;
		} 
		table tr td ,  table tr th{
			font-size: 13px;
			overflow: hidden;
	    }

	  table tbody tr td {
		border-collapse:collapse;
	  } 
    
</style>
<body>
	<div class="container-fluid">
		<div class="row py-4">
			<div class="col-md-4">
				<div class="card text-secondary rounded ">
					<div class="card-header text-center ">
						<h6 class="text-center">Your Leave Balance Details&nbsp;<i class="fa-solid fa-user"></i></h6>
					</div>
					<div class="card-body">    
						<table class="table">
							<thead> 
								<tr>
									<td>Month</td>
									<td>Approve</td>
									<td>Reject</td>
									<td>Cancel</td>
									<td>Pending</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td id="yearmonth"></td>
									<td>${ac}</td>
									<td>${rc}</td>
									<td>${cc}</td>
									<td>${pc}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>                    
			</div> 
			<div class="col-md-4"> 
				<div class="card text-secondary rounded">
					<div class="card-header text-center   ">
						<h6>Current Month Holidays&nbsp;<i class="fa-solid fa-calendar-days"></i></h6>

					</div>
					<div class="card-body mt-2">
						<!-- <table class=" table">
							<tbody>
								<c:forEach items="${holidayList}" var="l">
									<tr> 
										<td class="text-center fw-normal"> <span style="font-size: 14px;">${l}</span></td>
									</tr>
								</c:forEach>	
							</tbody>
						</table>  -->
						<div class="mb-2">  
 							<ul class="list-group list-group ms-3" >
								<c:forEach items="${holidayList}" var="l"> 
									<li class="list-group-item fw-light" style="font-size: 14px;">${l}</li>	
								</c:forEach>	
							</ul> 
						</div>
					</div>
				</div>                    
			</div>  
			<div class="col-md-4"> 
				<div class="card text-secondary">
					<div class="card-header text-center   ">
						<h6 class="text-center" >Birthday's for this month&nbsp;<i class="fa fa-birthday-cake" aria-hidden="true"></i></h6>
					</div>
					<div class="card-body  holiday-leave-card">
						<table class="table overflow-auto ">
							<tbody>
								<c:forEach items="${empList}" var="l">
									<tr>
										<td class="text-center">${l}</td>
									</tr>
								</c:forEach>	
							</tbody>
						</table>
					</div>
				</div>                    
			</div>   
		</div>   
	</div>

	
	<script>

		const date = new Date();
		const month = date.toLocaleString('default', { month: 'long' });
		$("#yearmonth").html(month);
	</script>
</body>
</html>