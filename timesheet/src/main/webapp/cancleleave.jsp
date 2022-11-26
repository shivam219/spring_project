<%@ include file="menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cancle Leave</title>


<meta name="robots" content="noindex, follow">
</head>
<body style="background-color: #dcdcdc;">
  	<div class="container mt-4 ms-0 ">
		<div class="wrap-table100">
			<div class="table100 ver1 ms-5">
				<div class="table100-head">
					<table>
						<thead>
							<tr class="row100 head">
								<th class="cell100 column1">LeaveId</th>
								<th class="cell100 column3">Leave Type</th>
								<th class="cell100 column3">Day Mode</th>
								<th class="cell100 column4">Starting Date</th>
								<th class="cell100 column5">Ending Date</th>
								<th class="cell100 column5">Status</th>
								<th class="cell100 column7"></th>
								
							</tr>
						</thead>
					</table>
				</div>
				<div class="table100-body js-pscroll ps ps--active-y"
					style="margin-top: -15px; height: 400px;">
					<table>
						<tbody>
						<c:forEach items="${getAllLeave}" var="l">
							<tr class="row100 body">
								<td class="cell100 column1">${l.getLeaveId()}</td>
								<td class="cell100 column3">${l.getLeaveType()}</td>
								<td class="cell100 column4">${l.getDayMode()}</td>
								<td class="cell100 column5">${l.getStartDate()}</td>
								<td class="cell100 column6">${l.getEndDate()}</td>
								<td class="cell100 column7">${l.getStatus()}</td>
								<td class="cell100 column8"><input class="btn btn-sm btn-primary px-3" type="button" id="btnCancle"
									value="Cancel Request"
									onclick="cancelLeaveApplication('${l.getLeaveId()}')">
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="ps__rail-x"></div>
					<div class="ps__rail-y" style="height: 585px;"></div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" async="" src="./asstes/analytics.js"></script>
	<script src="./assets/jquery-3.2.1.min.js"></script>


	<script src="./assets/select2.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<script src="./assets/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>

	<script async="" src="./assets/js"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());
		gtag('config', 'UA-23581568-13');
		
		function cancelLeaveApplication(LeaveId) {
			console.log();
			$('#btnCancel').attr("disabled", true);
			let data = {leaveId : LeaveId}
			console.log(data);
			$.ajax({
				type: 'POST',
				url: 'cancle-leave-process',
				data:JSON.stringify(data),
				contentType :'application/json',
			success: function (data,msg,xh) {
					// location.replace('/home');
					// location.reload();
			swal({
				title: "Success",
				text: "Cancel Leave Request successfully",
				icon: "success",
			}).
			then(function (isOkay) {
				if (isOkay) {
					location.reload();
				}
			});
				console.log(data);
			},
			error : function(data,msg,xh){
			
			}
		}); 
		}
	</script>

	<script src="./assets/main.js"></script>


</body>
</html>