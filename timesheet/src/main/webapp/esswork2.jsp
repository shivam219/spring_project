<%@ include file="menu.jsp" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map.*"%>
<%@page import="java.util.Arrays"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head> 
    <title>Week Work Report</title>
    <style> 
        table {
            table-layout: fixed;
        }
    </style>
    <link href="css/select@2.4.1.0.min.css" rel="stylesheet" />
    </head>

    <body>

        <table class="table table-striped table-hover rounded mb-0 d-none " id="dptable" >        
            <tr>
                <td colspan="2">
                    <select data-placeholder="Choose Project" class="form-control selectProject" tabindex="1" >
                        <option value=""> </option>
                        <c:forEach items="${projectList}" var="project" varStatus="loop">
                            <option value="${project.getProjectid()}">${project.getProjectname()}</option>
                        </c:forEach>
                    </select>
                    <input type="text" name="id"          class="d-none" value=''/>
                    <input type="text" name="empId"       class="d-none" value=''/>
                    <input type="text" name="projectId"   class="d-none" value=''/>
                    <input type="text" name="projectName" class="d-none" value=''/>            
                </td>
                <td> <p> Approved</p></td>
                <td>
                    <input type="number" value="" min="1" name="mon" class="form-control input-sm w-100 mon_v  cal" oninput="cal(this)"  onchange="cal(this)" placeholder="HH">
                    <input type="text"  name="monDes"class="d-none" value=''/>
                </td>
                <td>
                    <input type="number" value="" min="1" name="tue" class="form-control input-sm w-100 tue_v  cal" oninput="cal(this)"  onchange="cal(this)" placeholder="HH">
                    <input type="text"  name="tueDes"class="d-none" value=''/>
                </td>
                
                <td>
                    <input type="number" value="" min="1" name="wed" class="form-control input-sm w-100 web_v  cal" oninput="cal(this)"  onchange="cal(this)" placeholder="HH">
                    <input type="text"  name="wedDes"class="d-none" value=''/>
                </td>
                <td>
                    <input type="number" value="" min="1" name="thu" class="form-control input-sm w-100 thu_v  cal" oninput="cal(this)"  onchange="cal(this)" placeholder="HH">
                    <input type="text"  name="thuDes"class="d-none" value=''/>
                </td>
                <td>
                    <input type="number" value="" min="1" name="fri" class="form-control input-sm w-100 fri_v  cal" oninput="cal(this)"  onchange="cal(this)" placeholder="HH">
                    <input type="text"  name="friDes"class="d-none" value=''/>
                </td>
                <td>
                    <input type="number" value="" min="1" name="sat" class="form-control input-sm w-100 sat_v  cal" oninput="cal(this)"  onchange="cal(this)" placeholder="HH">
                    <input type="text"  name="satDes"class="d-none" value=''/>
                </td>
                <td>
                    <input type="number" value="" min="1" name="sun" class="form-control input-sm w-100 sun_v  cal" oninput="cal(this)"  onchange="cal(this)" placeholder="HH">
                    <input type="text"  name="sunDes"class="d-none" value=''/>
                </td>
                <td class="text-center" id="htotol">00 </td>
            </tr>
        </table>
        <div class="container">
            <div class="row rounded  ">
                <h5 class="text-center text-secondary h4 ">Ess Workwww</h5>
            </div>
            <div class="row">
                <div class="col h6 text-center">
                    <p>Time Period</p>
                </div>
                <form action="fetchwork2" method="post">
                    <div class="row">
                        <div class="col">  
                            <input  placeholder="Select date"  type="date"  id="startDate"   name="startDate"  class="form-control datepicker w-75 d-flex   ">    
                        </div>
                        <div class="col">
                            <input  placeholder="Select date"  type="date" id="endDate"   name="endDate" class="form-control datepicker w-75   ">
                        </div>
                        <div class="col">
                            <input type="submit" class="btn btn-primary btn-sm" value="fetch"  >
                        </div>
                    </div>
                </form>
                <div class="col">
                    <input type="button" class="btn btn-primary btn-sm" value="Save">
                </div>
                <div class="col">
                    <input type="button" class="btn btn-primary btn-sm" value="Submit">
                </div>
            </div>
            <table class="table table-striped table-hover rounded mb-0" id="tbtable" >
                <thead>
                    <tr class="table-dark "> 
                        <td class="text-center" colspan="2">Work Items</td>
                        <td class="text-center" >Status</td>
                        <td class="text-center" >Mon</td>
                        <td class="text-center" >Tue</td>
                        <td class="text-center" >Wed</td>
                        <td class="text-center" >Thu</td>
                        <td class="text-center" >Fri</td>
                        <td class="text-center" >Sat</td>
                        <td class="text-center" >Sun</td>
                        <td class="text-center" >Total</td>
                    </tr> 
                </thead>
                 <c:set var="i" value="1" scope="page" />
                 <c:if test = "${workList.size()>0}">			                         
	             	<c:forEach var="work" items="${workList}"  varStatus="idx"> 
	                    <tr>
	                        <td colspan="2">
	                            <select data-placeholder='<c:out value="${work.getProjectName()}"/>'   disabled class="form-control selectProject" tabindex="1">
	                                <option value='<c:out value="${work.getProjectId()}"/>'> <c:out value="${work.getProjectName()}" /></option>
	                              </select>
                                  <input type="text" name="projectId" class="d-none" value='<c:out value="${work.getProjectId()}"/>'/>
                                  <input type="text" name="id" class="d-none" value='<c:out value="${work.getId()}"/>'/>
                                  <input type="text" name="empId" class="d-none" value='<c:out value="${work.getEmpId()}"/>'/>
                                  <input type="text" name="projectName" class="d-none" value='<c:out value="${work.getProjectName()}"/>'/>
	                        </td>
	                        <td> <p> <c:out value="${work.getStatus()}"/><p> </td>
                            <td>
                                <input type="number" name="mon" value='<c:out value="${work.getMon()}"/>' min='1' class="form-control input-sm w-100 mon_v " oninput="cal(this)"     onchange="cal(this)"  placeholder="HH">
                                <input type="text"  name="monDes"class="d-none" value='<c:out value="${work.getMonDes()}"/>'/>
                            </td>
                            <td>
                                <input type="number" name="tue"  value='<c:out value="${work.getTue()}"/>' min='1' class="form-control input-sm w-100 tue_v " oninput="cal(this)"     onchange="cal(this)"  placeholder="HH">
                                <input type="text"   name="tueDes"class="d-none" value='<c:out value="${work.getTueDes()}"/>'/>
                            </td>
                            <td>
                                <input type="number" name="wed" value='<c:out value="${work.getWed()}"/>' min='1' class="form-control input-sm w-100 web_v " oninput="cal(this)"     onchange="cal(this)"  placeholder="HH">
                                <input type="text" name="wedDes" class="d-none" value='<c:out value="${work.getWedDes()}"/>'/>
                            </td>
                            <td>
                                <input type="number" name="thu" value='<c:out value="${work.getThu()}"/>' min='1' class="form-control input-sm w-100 thu_v " oninput="cal(this)"     onchange="cal(this)"  placeholder="HH">
                                <input type="text"  name="thuDes"class="d-none" value='<c:out value="${work.getThuDes()}"/>'/>
                            </td>
                            <td>
                                <input type="number" name="fri" value='<c:out value="${work.getFri()}"/>' min='1' class="form-control input-sm w-100 fri_v " oninput="cal(this)"     onchange="cal(this)"  placeholder="HH">
                                <input type="text" name="friDes" class="d-none" value='<c:out value="${work.getFriDes()}"/>'/>
                            </td>
                            <td>
                                <input type="number" name="sat"value='<c:out value="${work.getSat()}"/>' min='1' class="form-control input-sm w-100 sat_v " oninput="cal(this)"     onchange="cal(this)"  placeholder="HH">
                                <input type="text" name="satDes"class="d-none" value='<c:out value="${work.getSatDes()}"/>'/>
                            </td>
                            <td>
                                <input type="number" name="sun" value='<c:out value="${work.getSun()}"/>' min='1' class="form-control input-sm w-100 sun_v " oninput="cal(this)"     onchange="cal(this)"  placeholder="HH">
                                <input type="text" name="sunDes" class="d-none" value='<c:out value="${work.getSunDes()}"/>'/>
                            </td>
	                        <td class="text-center">00 </td>
	                    </tr>
					</c:forEach> 
			     </c:if>
			      <c:if test = "${workList==null || workList.size()==0}">			         
                    <tr>
                        <td colspan="2">
                            <select data-placeholder="Choose Project" class="form-control selectProject" tabindex="1">
                                <option value=""></option>
                                <c:forEach items="${projectList}" var="project" varStatus="loop">
                                    <option value="${project.getProjectid()}">${project.getProjectname()}</option>
                                </c:forEach>
                              </select>
                        </td>
                        <td>  <input type="text" name="status" value="Approved" class="d-none">    <p>Approved</p></td>
                        <td><input type="number" value="" min="1" class="form-control input-sm w-100 mon_v " oninput="cal(this)"  onchange="cal(this)" placeholder="HH"></td>
                        <td><input type="number" value="" min="1" class="form-control input-sm w-100 tue_v " oninput="cal(this)"  onchange="cal(this)" placeholder="HH"></td>
                        <td><input type="number" value="" min="1" class="form-control input-sm w-100 web_v " oninput="cal(this)"  onchange="cal(this)" placeholder="HH"></td>
                        <td><input type="number" value="" min="1" class="form-control input-sm w-100 thu_v " oninput="cal(this)"  onchange="cal(this)" placeholder="HH"></td>
                        <td><input type="number" value="" min="1" class="form-control input-sm w-100 fri_v " oninput="cal(this)"  onchange="cal(this)" placeholder="HH"></td>
                        <td><input type="number" value="" min="1" class="form-control input-sm w-100 sat_v " oninput="cal(this)"  onchange="cal(this)" placeholder="HH"></td>
                        <td><input type="number" value="" min="1" class="form-control input-sm w-100 sun_v " oninput="cal(this)"  onchange="cal(this)" placeholder="HH"></td>
                        <td class="text-center">00 </td>
                    </tr>
			     </c:if>
                    
                    <tfoot>
                        <td colspan="3" class="text-center ">  
                            <input type="button" value="+" id="addRow"   class="btn btn-success btn-sm rounded-circle me-4 " style="height: 40px; width: 40px; " >
                            <input type="button" value="-" id="removeRow"   class="btn btn-success btn-sm rounded-circle  " style="height: 40px; width: 40px; " >
                        </td>
                        <td class="text-center" id="mov_v_t">00</td>
                        <td class="text-center" id="tue_v_t">00</td>
                        <td class="text-center" id="web_v_t">00</td>
                        <td class="text-center" id="thu_v_t">00</td>
                        <td class="text-center" id="fri_v_t">00</td>
                        <td class="text-center" id="sat_v_t">00</td>
                        <td class="text-center" id="sun_v_t">00</td>
                        <td class="text-center" id="htotal"  >00</td>
                    </tfoot>
            </table>
            <input type="button" id="btnSave" class="btn btn-primary btn-sm" value="Convert" onclick="save()">
        </div>
        <!-- <script src="js/esswork.js"></script> -->
        <script src="js/select2@4.1.0.min.js"></script>
        <script>
            $(function () {
                $('select').select2();
            });
            $(document).ready(function () {
                $("#addRow").on('click', function () {
                    event.preventDefault()
                    $(".selectProject.select2-hidden-accessible").select2('destroy');
                    var row = $("#dptable tr").eq(0);
                    var newrow = row.clone();
                    $("#tbtable").append(newrow);
                    $('.selectProject').select2();
                    $("#addRow").blur();
                    tblRefresh();
                });
            });
            $('#removeRow').click(function(){
                let rowCount = $('#tbtable tr').length;
                if((rowCount)>=4 ){
                $('#tbtable tr').eq(parseInt(rowCount)-2).remove();
                $("#removeRow").blur();
                calculate();
                }
            });
            function tblRefresh(){
                $(".mon_v:last").val('');
                $(".tue_v:last").val('');
                $(".web_v:last").val('');
                $(".thu_v:last").val('');
                $(".fri_v:last").val('');
                $(".sat_v:last").val('');
                $(".sun_v:last").val('');
                let rowCount = $('#tbtable tr').length-1;
                $('#tbtable tr:nth-child('+ rowCount+ ')').find("td:eq(9)").html("00");
            }  
            function cal(ob){
                let sum=0;   
                $(ob).closest('tr').find('td').each(function(){
                    if(!isNaN(Number(jQuery(this).find("input").val()))){
                        sum=sum+Number(jQuery(this).find("input").val());
                    };
                    $(this).closest("tr").find("td:eq(9) ").html(sum==0?"00":sum);
                });
                calculate();
            }

           function calculate(){
                let sum=0;   
                let mov_v_t = 0; 
                $('.mon_v:input').each(function() {
                    if($(this).val() !=""){
                        mov_v_t = mov_v_t + parseInt($(this).val());
                    }
                });
                $("#mov_v_t").html(mov_v_t==0?"00":mov_v_t);
                sum = sum+mov_v_t;
                let tue_v_t = 0; 
                $('.tue_v:input').each(function() {
                    if($(this).val() !=""){
                        tue_v_t = tue_v_t + parseInt($(this).val());
                    }
                });
                sum = sum+tue_v_t;
                $("#tue_v_t").html(tue_v_t==0?"00":tue_v_t);

                let web_v_t = 0; 
                $('.web_v:input').each(function() {     
                    if($(this).val() !=""){
                        web_v_t = web_v_t + parseInt($(this).val());
                    }
                });
                sum = sum+web_v_t;
                $("#web_v_t").html(web_v_t==0?"00":web_v_t);
                
                let thu_v_t = 0; 
                $('.thu_v:input').each(function() {     
                    if($(this).val() !=""){
                        thu_v_t = thu_v_t + parseInt($(this).val());
                    }
                });
                sum = sum+thu_v_t;
                $("#thu_v_t").html(thu_v_t==0?"00":thu_v_t);

                let fri_v_t = 00; 
                $('.fri_v:input').each(function() {     
                    if($(this).val() !=""){
                        fri_v_t = fri_v_t + parseInt($(this).val());
                    }
                });
                sum = sum+fri_v_t;
                $("#fri_v_t").html(fri_v_t==0?"00":fri_v_t);
 
                let sat_v_t = 0; 
                $('.sat_v:input').each(function() {     
                    if($(this).val() !=""){
                        sat_v_t = sat_v_t + parseInt($(this).val());
                    }
                });
                sum = sum+sat_v_t;
                $("#sat_v_t").html(sat_v_t==0?"00":sat_v_t);

                let sun_v_t = 0; 
                $('.sun_v:input').each(function() {     
                    if($(this).val() !=""){
                        sun_v_t = sun_v_t + parseInt($(this).val());
                    }
                });
                sum = sum+sun_v_t;
                $("#sun_v_t").html(sun_v_t==0?"00":sun_v_t);
                $("#htotal").html(parseInt(sum));
            }
            
            function validateDate() {
                let today = new Date($("#startDate").val());
                today.setDate((today.getDate() + 6));
                today.setMonth(today.getMonth()+1);
                let day =   today.getDate().toString().length==1?   "0"+(today.getDate().toString())  : today.getDate().toString();
                let month = today.getMonth().toString().length==1?  "0"+(today.getMonth().toString()) : today.getMonth().toString();
                let year = today.getYear();
                
                console.log(year+"-"+month+"-"+day);
              
            }

            function calRowOnLoad( ) {
                $(".mon_v:input").each(function(){
                    $(this).change();
                });
            }
            calRowOnLoad();
            function save(){
              
            console.log(html2json());
            // console.log(JSON.stringify(html2json()));
            // console.log(JSON.stringify(html2json()));
            
                $.ajax({
                type: 'post',
                url: 'savework2',
                data:  html2json(),
                contentType: "application/json; charset=utf-8",
                traditional: true,
                success: function (data) {
                  
                    }
                })
            }
            function html2json() {
                var json = '[';
                var otArr = [];
                var tbl2 = $('#tbtable tbody tr').each(function(i) {        
                    var itArr = []; 
                    $(this).find("td  ").each(function(){
                        $(this).find("input").each(function(){
                            if(!isNaN(Number(jQuery(this).val()))){
                                
                                itArr.push('"' + $(this).attr("name") + '" ' + ': ' + $(this).val() + ' ');
                            }
                            else{
                                itArr.push('"' + $(this).attr("name") + '" ' + ': "' + $(this).val() + '" ');
                            }
                        });
                    });
                    otArr.push('{' + itArr.join(',') + '}');
                })
                json += otArr.join(",") + ']'
                return json;
            }

        </script>
    </body>

    </html>
    <%@ include file="footer-fixed-bottom.jsp" %>