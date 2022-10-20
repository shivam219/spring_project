<%@ include file="menu.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<title>Approve Leave</title>

<link href="./assets/font-awesome.min.c" rel="stylesheet" >
<link href="./assets/animate.css"   rel="stylesheet" >
<link href="./assets/select2.min.css"	 rel="stylesheet" >
<link href="./assets/perfect-scrollbar.css"	 rel="stylesheet" >
<link href="./assets/util.css"		 rel="stylesheet" >
<link href="./assets/main.css"		 rel="stylesheet" >

<meta name="robots" content="noindex, follow">
</head>
<body style="background-color: #e2e2e2;">

	<div class="leave-reason-pop  ">
		<div class="mt-2 mb-3">
			<h4 class="text-dark  "
				style="font-size: 16px; font-family: Lato-Regular;">Leave
				Reason</h4>
			<p onclick="leaveReasonPopHide('')" class="close-btn">X</p>
		</div>
		<hr>
		<p id="msgLeaveReason"
			style="font-family: Lato-Regular; font-size: 16px;"></p>
	</div>

	<div class="approve-reason-pop  ">
		<div class="mt-2 mb-3">
			<h4 class="text-dark "
				style="font-size: 16px; font-family: Lato-Regular;">Approve
				Reason</h4>
			<p onclick="approveReasonPopHide()" class="close-btn">X</p>
		</div>
		<hr>
		<div class="form-group">
			<textarea class="form-control"
				style="font-family: Lato-Regular; font-size: 16px;"
				id="msgApproveReason" name="leaveReason" rows="3"
				placeholder="Approve reason here....."></textarea>
		</div>
		<button class="btn btn-sm btn-primary mt-2" type="submit"
			id="btnLeaveApprove" onclick="approveLeave()">
			<span id="loadingBtn"> </span> &nbsp; Submit &nbsp;
		</button>
	</div>


	<div class="reject-reason-pop  ">
		<div class="mt-2 mb-3">
			<h4 class="text-dark"
				style="font-size: 16px; font-family: Lato-Regular;">Reject
				Reason</h4>
			<p onclick="rejectReasonPopHide()" class="close-btn">X</p>
		</div>
		<hr>
		<div class="form-group">
			<textarea class="form-control"
				style="font-family: Lato-Regular; font-size: 16px;"
				id="msgRejectReason" name="leaveReason" rows="3"
				placeholder="Reject reason here....." required></textarea>
		</div>
		<button class="btn btn-sm btn-primary mt-2" type="submit"
			id="btnLeaveReject">
			<span id="loadingBtnR"> </span> &nbsp; Submit &nbsp;
		</button>

	</div>
	<form>
		<input type="hidden" name="LeaveId" id="LeaveId" >
   </form>
	<div class="container mt-4 ms-0 ">
		<div class="wrap-table100">
			<div class="table100 ver1 ms-5">
				<div class="table100-head">
					<table>
						<thead>
							<tr class="row100 head">
								<th class="cell100 column1">LeaveId</th>
								<th class="cell100 column2">Employee Name</th>
								<th class="cell100 column3">Leave Type</th>
								<th class="cell100 column4">Starting Date</th>
								<th class="cell100 column5">Ending Date</th>
								<th class="cell100 column6">Leave Reason</th>
								<th class="cell100 column7">Documents</th>
								<th class="btn-leave-approve ps-5"colspan="2">Action</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="table100-body js-pscroll ps ps--active-y"
					style="margin-top: -15px; height: 400px;">
					<table>
						<tbody>
						 <c:forEach items="${leaveList}" var="l">
							<tr class="row100 body">
								<td class="cell100 column1">${l.getLeaveId()}</td>
								<td class="cell100 column2">${l.getEmpName()}</td>
								<td class="cell100 column3">${l.getLeaveType()}</td>
								<td class="cell100 column4">${l.getStartDate()}</td>
								<td class="cell100 column5">${l.getEndDate()}</td>
								<td class="cell100 column6"><input class="btn btn-sm btn-primary px-3 text-center " type="button" value="View" onclick='leaveReasonPopShow(` <c:out value="${l.getLeaveReason()}" /> `)' ></td>
								<td class="cell100 column7"><a href='${l.getAttachment().contains("null")?"javascript:void(0)":l.getAttachment() }' 
								class='btn btn-sm btn-primary  px-3 ${l.getAttachment().contains("null")?"disabled": "" }'
								  target='${l.getAttachment().contains("null")? "": "_blank"}'>
								${l.getAttachment().contains("null")? "No file": "View"} </a>&nbsp;</td>
								<td class=""><input class="btn btn-sm btn-danger  px-3 " type="button"
									id="btnApprove" value="Approve"
									onclick="approveLeaveApplication('${l.getLeaveId()}')">
								
								<input class="btn btn-sm btn-primary px-3 ms-0" type="button" id="btnReject"
									value="Reject"
									onclick="rejectLeaveApplication('${l.getLeaveId()}')">
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

		$(document).ready(function() {
			$("#btnLeaveReject").on('click',
			function(event) {
				event.preventDefault();
				if (new String($('#msgRejectReason').val()).replace(/\s/g, '').length > 4) {
					$("#loadingBtnR").addClass("spinner-border spinner-border-sm");
					$('#btnLeaveReject').attr("disabled", true);
				let data = {
							leaveId :$('#LeaveId').val(),
							rejectReason:$('#msgRejectReason').val()
						}
						console.log(data);
						let uri = 'reject-leave-process'
						$.ajax({
							type: 'POST',
							url: uri,
							data:JSON.stringify(data),
							contentType :'application/json',
						success: function (data,msg,xh) {
							 location.replace('/home');
							 location.reload();
							console.log(data);
						},
						error : function(data,msg,xh){
						
						}
					}); 
				} 
				else if (new String($('#msgRejectReason').val()).replace(/\s/g, '').length == 0) {
					alert("Please enter reason");
					$('#msgRejectReason').focus();
				} 
				else {
					alert("Please enter valid reason");
					$('#msgRejectReason').focus();
				}});
		});
		function approveLeave() { 
			if (new String($('#msgApproveReason').val()).replace(/\s/g, '').length >= 0) {
				$("#loadingBtn").addClass("spinner-border spinner-border-sm");
				$('#btnLeaveApprove').attr("disabled", true);
				let data = {
					leaveId :$('#LeaveId').val(),
					approveReason:$('#msgApproveReason').val()
				}
				console.log(data);
				let uri = 'approve-leave-process'
				$.ajax({
					type: 'POST',
					url: uri,
					data:JSON.stringify(data),
					contentType :'application/json',
					success: function (data,msg,xhr) {
						 location.replace('/home');
						 location.reload();

					},
					error : function(data,msg,xhr){
						console.log(data);
						console.log(msg);
						console.log(xhr);
					}
				}); 
			}
			else if (new String($('#msgApproveReason').val()).replace(/\s/g, '').length == 0) {
				alert("Please enter reason");
				$('#msgApproveReason').focus();
			} 
			else {
				alert("Please enter valid reason");
				$('#msgApproveReason').focus();
			}
		}

		function approveReasonPopShow() {
			$(".approve-reason-pop").show();
		}
		function approveReasonPopHide() {
			$(".approve-reason-pop").hide();
		}
		function rejectReasonPopShow() {
			$(".reject-reason-pop").show();
		}
		function rejectReasonPopHide() {
			
			$(".reject-reason-pop").hide();
		}
		function leaveReasonPopShow(msg) {
			$("#msgLeaveReason").html(msg);
			$(".leave-reason-pop").show();
		}
		function leaveReasonPopHide(msg) {
			$("#msgLeaveReason").html(msg);
			$(".leave-reason-pop").hide();
		}
		function rejectLeaveApplication(LeaveId) {
			$('#LeaveId').val(LeaveId);
			console.log(LeaveId);
			rejectReasonPopShow();
		}
		function approveLeaveApplication(LeaveId) {
			$('#LeaveId').val(LeaveId);
			console.log(LeaveId);
			approveReasonPopShow();
		}
	</script>

	<script src="./assets/main.js"></script>


</body>
</html>