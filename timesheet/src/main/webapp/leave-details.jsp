<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Leave Details </title>
    <style>
        	.leave-reason-pop {
				position: absolute;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				width: 455px;
				text-align: center;
				background-color: white;
				padding: 10px;
				z-index: 100;
				display: none;
				border-radius: 5px;
				border: 2px solid rgb(219, 218, 218);
			}

    </style>
    
</head>
<body>
    <div class="container">
        <h1 class=" h4 m-0 my-3 py-2 fw-normal  dashboard-headling ">Leave Dashboard </h1>
        <div class="leave-reason-pop ">
			<div class=" d-flex justify-content-between">
				<label class="badge-soft-primary py-2 px-2 fw-normal mx-2 d-inline-block " style="width: 40%;"
					id="DayCount"> Leave Reason </label>
				<button onclick="leaveReasonPopHide('')" class="btn badge-soft-primary text-secondary me-0"><i
						class="fa fa-duotone fa-circle-xmark"></i></button>
			</div>
			<hr>
			<p id="msgLeaveReason" style="font-family: Lato-Regular; font-size: 16px;"></p>
		</div>   
        <input type="hidden" value="${option}" id="option">
        <form action="leave-details" method="get"> 
            <div class="row align-items-center mt-3 mb-1"> 
                <div class="col-md-8  mb-2 mb-md-0 ">   
                    <h6 class=" badge-soft-success d-inline px-2 py-2 rounded d-none"> No of Leave  <span class="text-muted fw-normal ms-1">(${empListSize})</span></h6>
                    <div class="d-flex flex-wrap align-items-center gap-1 "> 
                        <span class="bg-white rounded small mb-1 ps-2 p-2 pe-1 border mt-1" for="startDate">From  </span>
                        <div>  
                            <input class="form-control "  type="date"  id="startDate" name="startDate" value="${startDate}" onchange="dateChange()">
                            <span class="form-text small text-danger ms-2  d-none">From </span>
                        </div>
                        <span class="bg-white rounded small mb-1 ps-2 p-2 pe-1 border mt-1" for="endDate">To </span>
                        <div >    
                            <input class="form-control "  type="date"   id="endDate"  name="endDate" value="${endDate}"  onchange="dateChange()">
                            <span class="form-text small text-danger ms-2   d-none">To Date</span>  
                        </div>
                        <span class="bg-white rounded small mb-1 ps-2 p-2 border mt-1" for="dateOfJoin">Leave Status</span>
                        <div > 
                            <select name="status" class="form-select d-flex" onchange="document.forms[0].submit()" aria-selected="true" id="selectedOption">
                                <option value="">All</option>
                                <option value="Approved">Approved</option>
                                <option value="Cancelled">Cancelled</option>
                                <option value="Pending">Pending</option>
                                <option value="Rejected">Rejected</option>
                            </select>
                        </div> 
                        <button class="btn btn-sm btn-secondary text-white p-1"  type="reset" onclick="clearAll()"> <i class="fa fa-duotone fa-broom"></i></button>
                    </div> 
            
                </div> 
                <div class="col-md-4"> 
                    <div class="d-flex flex-wrap align-items-center justify-content-md-end gap-2 ">    
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
        </form>
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table project-list-table table-nowrap align-middle table-borderless">
                        <thead>
                            <tr>
                                <th scope="col" class="" >Leave Id</th>
                                <th scope="col" class="" >Type</th>
                                <th scope="col" class="" >From</th>
                                <th scope="col" class="" >To</th>
                                <th scope="col">Reason</th>
                                <th scope="col">Documents</th>
                                <th scope="col">Status</th>
                                <th scope="col">Manager</th>
                                <th scope="col">Days</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="l" varStatus="loop"> 
                                <tr>
                                    <td class="overflow-auto">${l.getLeaveId()}</td>
                                    <td class="overflow-auto">${l.getLeaveType()}</td>
                                    <td class="overflow-auto">${l.getStartDateSort()}</td> 
                                    <td class="overflow-auto">${l.getendDateSort()}</td>
                                    <td class="text-center ">
                                        <button class="btn btn-sm badge-soft-primary w-50 py-1 " type="button"
                                            onclick='leaveReasonPopShow(` <c:out value="${l.getLeaveReason()}" /> `);this.blur()'>
                                            <i class="fa fa-duotone fa-comments"></i>
                                        </button>
                                        <td class="text-center">
											<c:if test='${!(l.getAttachment().trim().length()>0)}'>
												<button class="btn btn-sm badge-soft-primary w-75 py-1" type="button"
													disabled>
													<i class="fa fa-sharp fa-solid fa-ban"></i>
												</button>
											</c:if>
											<c:if test='${l.getAttachment().trim().length()>0}'>
												<a href='${l.getAttachment()}' onclick="this.blur()"
													class='btn btn-sm badge-soft-primary px-3 ' target='_blank'>
													<i class="fa fa-duotone fa-eye"></i> view
												</a>
											</c:if>
										</td> 
                                    <td class="overflow-auto">${l.getSecondStatus()}</td>
                                    <td class="overflow-auto">${l.getManagerName()}</td>
                                    <td class="overflow-auto">${l.getDays()}</td>
                                </tr>
                            </c:forEach> 
                            <c:if test='${list.size()==0}'>   
									<tr class="border">
										<td colspan="9" class="bg-white text-center fw-normal h5 p-2 "> No Data</td>
									</tr> 
								</c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- hide need add from backend -->
        <!-- align-items-center vertical center -->
        <div class="row g-0 align-items-center pb-4">
            <div class="col-sm-6">
                <div><p class="mb-sm-0">Showing ${currentPage} to ${totalPages} of (${empListSize}) entries</p></div>
            </div>
            <div class="col-sm-6">
                <div class="float-sm-end">
                    <ul class="pagination mb-sm-0">
                        <li class="page-item  <c:if test='${currentPage eq 1 }'> disabled</c:if> "> 
                            <a class="page-link"  href="leave-details?page=${currentPage-1}&status=${option}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>   
                        <c:forEach var = "i" begin = "1" end = "${totalPages}"> 
                            <li class="page-item <c:if test='${currentPage eq i }'>active</c:if>" ><a href ="leave-details?page=${i}&status=${option}"  class="page-link">${i}</a></li>
                         </c:forEach>
                        <li class="page-item  <c:if test='${currentPage eq totalPages }'> disabled</c:if> ">
                            <a class="page-link" href="leave-details?page=${currentPage+1}&status=${option}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                              </a>
                        </li>
                    </ul>
                </div>     
            </div>
        </div>
    </div>
    <script> 
            $(document).ready(function () {
                $("#selectedOption").val($("#option").val()); 
            });
        	function leaveReasonPopShow(msg) { 
				$("#msgLeaveReason").html(msg);
				$(".leave-reason-pop").show();
			}
            function leaveReasonPopHide(msg) {
				$("#msgLeaveReason").html(msg);
				$(".leave-reason-pop").hide();
			}
            function clearAll() {
                document.forms[0].reset();  
                $("#startDate").val('');
                $("#endDate").val('');
                document.forms[0].submit(); 
            }
            function dateChange() {
                if($("#endDate").val() && $("#startDate").val()){
                    document.forms[0].submit();
                }  
            }  
    </script>
</body>

</html>
 

