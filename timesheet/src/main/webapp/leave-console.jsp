<%@ include file="menu.jsp" %>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Leave Console</title>
		<link href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css" rel="stylesheet">
		<link href="Include/css/dataTables.dateTime.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
		<style>
			table {
				table-layout: auto;
			}

			.project-list-table {
				border-collapse: separate;
				/* border-spacing: 0 12px */
			}

			.project-list-table tr {
				background-color: #fff
			}

			.table-nowrap td,
			.table-nowrap th {
				white-space: nowrap;
			}

			.table-borderless>:not(caption)>*>* {
				border-bottom-width: 0;
			}

			.table>:not(caption)>*>* {
				padding: 0.75rem 0.75rem;
				background-color: var(--bs-table-bg);
				border-bottom-width: 1px;
				box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
			}

			.dataTables_info {
				visibility: hidden;
			}

			.dataTables_length {
				visibility: hidden;
			}

			.dataTables_filter {
				visibility: hidden;
			}

			.dataTables_wrapper {
				background-color: #fff;
			}

			tbody,
			td,
			td a tfoot,
			th,
			thead,
			tr {
				border-width: 0px;
			}
		</style>
	</head>

	<body>

		<div class="container">
			<div class="row align-items-center mt-5">
				<div class="col d-inline-flex align-items-center justify-content-center mb-2">
					<label for="min">Start date</label> <input type="text" id="min" name="min" placeholder="select date"
						class="form-control w-auto mx-2" style="font-size:14px;">
					<label for="max">End date</label> <input type="text" id="max" name="max" placeholder="select date"
						class="form-control w-auto mx-2" style="font-size:14px;">
					<input type="button" value="Reset" class="btn btn-sm btn-danger mx-3 fw-normal w-auto "
						id="btnReset" onclick="resetStartEndDate()"></td>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="">
						<div class="table-responsive">
							<table class="table project-list-table table-nowrap align-middle table-borderless"
								id="example">
								<thead style="font-size:14px;">
									<tr class="text-white" style="background-color:#124265;">
										<th scope="col" class="text-white">Leave Type</th>
										<th scope="col" class="text-white">Start Date</th>
										<th scope="col" class="text-white">End Date</th>
										<th scope="col" class="text-white">Status</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="l" varStatus="loop">
										<tr>
											<td class="overflow-auto" style="font-size:13px; border-width: 1px;">
												${l.getLeaveType()}</td>
											<td class="overflow-auto" style="font-size:13px; border-width: 1px;">
												${l.getStartDate()}</td>
											<td class="overflow-auto" style="font-size:13px; border-width: 1px;">
												${l.getEndDate()}</td>
											<td class="overflow-auto" style="font-size:13px; border-width: 1px;">
												${l.getStatus()}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="row align-items-center mt-4">
				<div class="col">
					<div class="d-flex flex-wrap align-items-center justify-content-start gap-2 ms-1 mb-1 ">
						<div>
							<a href="home" data-bs-target=".add-new" onclick="this.blur()" class="btn btn-primary"><i
									class="bx bx-minus ms-1"></i>Back</a>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="d-flex flex-wrap align-items-center justify-content-end gap-2 me-2 mb-1 ">
						<div>
							<a href="apply-leave" data-bs-target=".add-new" onclick="this.blur()"
								class="btn btn-primary"><i class="bx bx-plus me-1"></i>Apply leave</a>
						</div>
						<div>
							<a href="cancle-leave" data-bs-target=".add-new" onclick="this.blur()"
								class="btn btn-primary"><i class="bx bx-plus me-1"></i>Cancel leave</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- </form> -->
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>
		<script src="https://cdn.datatables.net/datetime/1.1.2/js/dataTables.dateTime.min.js"></script>
		<script>
			var minDate, maxDate;
			function formatDate(date) {
				var d = new Date(date),
					month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear();
				if (month.length < 2)
					month = '0' + month;
				if (day.length < 2)
					day = '0' + day;

				return parseInt([year, month, day].join(''));
			}
			var minDate, maxDate;
			var mi = { January: 0, February: 1, March: 2, April: 3, May: 4, June: 5, July: 6, August: 7, September: 8, October: 9, November: 10, December: 11 }
			/* Custom filtering function which will search data in column four between two values */
			$.fn.dataTable.ext.search.push(
				function (settings, data, dataIndex) {
					// 0 true
					var min = formatDate(minDate.val()); //10 th octorber 2022
					var max = formatDate(maxDate.val());
					let sd = new String(data[1]).replace("th", '').split(" ");
					var startDate = formatDate(new Date(sd[2], mi[sd[1]], sd[0]));
					let ed = new String(data[1]).replace("th", '').split(" ");
					var endDate = formatDate(new Date(ed[2], mi[ed[1]], ed[0]));
					if (min <= startDate && max == 19700101) {
						console.log("same or greater for min");
						return true;
					}
					else if (min == 19700101 && max >= endDate) {
						console.log("same or greater for max");
						return true;
					} else if (min <= startDate && max >= endDate) {

						return true;
					}
					return false;
				}
			);

			$(document).ready(function () {
				// Create date inputs
				minDate = new DateTime($('#min'), {
					format: 'Do MMMM YYYY'
				});
				maxDate = new DateTime($('#max'), {
					format: 'Do MMMM YYYY'
				});

				// DataTables initialisation
				var table = $('#example').DataTable();

				// Refilter the table
				$('#min, #max').on('change', function () {
					table.draw();
				});
				$('select:first option[value="10"]').remove();
				$('select:first option[value="25"]').remove();
				$('select:first option[value="50"]').remove();
				$('select:first option[value="100"]').remove();
				$('select:first').append($('<option>').val('5').text('5'));
				$('select:first').append($('<option>').val('10').text('10'));
				$('select:first').change();
			});
			function resetStartEndDate() {
				$("#btnReset").blur();
				$("#min").val('');
				$("#max").val('');
				minDate.val('');
				maxDate.val('');
				$("#min").change();
				$("#max").change();

				var table = $('#example').DataTable();
				table.draw();
			}
		</script>
	</body>

	</html>