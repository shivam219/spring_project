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
        <script>
          
        </script>

        <table class="table table-striped table-hover rounded mb-0 d-none " id="dptable" >        
            <tr>
                <td colspan="2">
                    <select data-placeholder="Choose Project" class="form-control selectProject" tabindex="1">
                        <option value=""></option>
                        <c:forEach items="${projectList}" var="project" varStatus="loop">
                            <option value="${project.getProjectId()}">${project.getProjectName()}</option>
                        </c:forEach>
                    </select>
                </td>
                <td>  <p>Approved</p></td>
                <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                <td class="text-center">00 </td>
            </tr>
        </table>
        <div class="container">
            <div class="row rounded  ">
                <h5 class="text-center text-secondary h4 mt-2">Ess Work</h5>
            </div>
            <div class="row">
                <div class="col fw-bold text-center align-middle">
                    <span class="align-middle"> Time Period</span>
                </div>
                <div class="col d-flex justify-content-between ">  
                     <button class="rounded btn-secondary h-75"><i class="fa-solid fa-caret-left"></i> </button>
                    <input  placeholder="Select date"  type="date"  id="startDate"  value="2022-08-22" name="startDate"  class="form-control   w-75  h-75    ">    
                    <span class="   align-self-start  "> To </span>
                </div>
                <div class="col d-flex justify-content-between ">
                    <input  placeholder="Select date"  type="date" id="endDate"     value="2022-08-28" name="endDate" class="form-control   w-75  h-75 ">
                    <button class="rounded btn-secondary h-75"><i class="fa-solid fa-caret-right rounded"></i> 
                </div>
                <div class="col  d-flex justify-content-center">
                    <input type="button" class="btn btn-primary btn-sm pe-3 ps-3 me-2 h-75 rounded"  onclick="show()" value="save" >
                    <input type="button" class="btn btn-primary btn-sm h-75 rounded" value="Submit">
                </div>
                
            </div>
            <table class="table table-striped table-hover rounded mb-0 mt-1" id="tbtable" >
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
                <tr>
                    <td colspan="2">
                        <select data-placeholder="Choose Project" class="form-control selectProject" tabindex="1">
                            <option value=""></option>
                            <c:forEach items="${projectList}" var="project" varStatus="loop">
                                <option value="${project.getProjectId()}">${project.getProjectName()}</option>
                            </c:forEach>
                            </select>
                    </td>
                    <td>  <p>Approved</p></td>
                    <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                    <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                    <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                    <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                    <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                    <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                    <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                    <td class="text-center">00 </td>
                </tr>
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
                let rsum=0;   
                $(ob).closest('tr').find('td').each(function(){
                    if(!isNaN(Number(jQuery(this).find("input").val()))){
                        rsum=rsum+Number(jQuery(this).find("input").val());
                    };
                    $(this).closest("tr").find("td:eq(9) ").html(rsum==0?"00":rsum);
                });
                calculate();
            }

           function calculate(){
                let mon = 0;             
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(2).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            mon=mon+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });
                $("#mov_v_t").html(mon==0?"00":mon);
                let tue = 0;
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(3).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            tue=tue+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });
                $("#tue_v_t").html(tue==0?"00":tue);
                let wed = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(4).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            wed=wed+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });
                $("#web_v_t").html(wed==0?"00":wed);
                let thu = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(5).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            thu=thu+Number(jQuery(this).find("input").val());
                        };
                    }) 
                }); 
                $("#thu_v_t").html(thu==0?"00":thu);

                let fri = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(6).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            fri=fri+Number(jQuery(this).find("input").val());
                        };
                    }) 
                }); 
                $("#fri_v_t").html(fri==0?"00":fri);
 
                let sat = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(7).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            sat=sat+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });  
                $("#sat_v_t").html(sat==0?"00":sat);

                let sun_v_t = 0;  
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(8).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            sun_v_t=sun_v_t+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });  
                $("#sun_v_t").html(sat==0?"00":sat);
                let total = 0;  
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(9).each(function(){
                        if(!isNaN(Number(jQuery(this).html()))){
                            total=total+Number(jQuery(this).html());
                        };
                    }) 
                });  
                $("#htotal").html(total==0?"00":total); 
            }

      
            function fetchwork(){   
                let atsd = $("#startDate").attr("name");
                let sd = $("#startDate").val();
                let ated = $("#endDate").attr("name");
                let ed = $("#endDate").val();
                let uri = '/fetchworkjson?'+atsd+'='+sd+'&'+ated+'='+ed;
                console.log(uri);
                    $.ajax({
                        url: uri,
                        type: 'GET',
                        dataType: 'json',
                        success: function(obj, success,event){
                           
                            console.log(obj);
                            for (let i = $('#tbtable tr').length -2 ; i > 0; i--) {
                                $('#tbtable tr').eq(i).remove();
                            }
                            var d = Object.entries(obj); 
                            for (let i = 0; i < d.length; i++) {
                                let row = document.createElement("tr");
                                let spn = d[i][0];
                               
                                    let sl = '<td  colspan="2"> <select data-placeholder="'+ spn+'" disabled="disabled"  class="form-control selectProject" tabindex="1">' 
                                    + '<option value="'+ spn+'" >'+ spn +'</option> '
                                    + '</select> </td> '
                                    + '<td><p>Approved</p></td>';

                                for (let j = 0; j <d[i][1].length; j++) {
                                     
                                    if( d[i][1][j]["id"] == 0){
                                        let eId = d[i][1][j]["empId"];
                                        let pId = d[i][1][j]["projectId"];
                                        let pName = d[i][1][j]["projectName"];
                                        let hours = d[i][1][j]["hours"]; 
                                        let descr = d[i][1][j]["descr"];   
                                        let day = d[i][1][j]["day"];   
                                        let status = d[i][1][j]["status"];   
    
                                        let t =  '<td>'
                                            +' <input type="number"  value='+hours+'    name="hours"          min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH">' 
                                            +' <input type="number"  value='+eId+'  name="empId"       class="d-none"  >' 
                                            +' <input type="number"  value='+pId+'      name="projectId"   class="d-none"  >' 
                                            +' <input type="text"    value='+pName+'    name="projectName" class="d-none"  >' 
                                            +' <input type="text"    value='+descr+'    name="descr"       class="d-none"  >' 
                                            +' <input type="date"    value='+day+'      name="day"         class="d-none"  >' 
                                            +' <input type="text"  value='+status+'   name="status"      class="d-none"  ></td>';
                                            row.innerHTML = (( row.innerHTML.toString()) + t);
                                          
                                    } else{
                                        let id = d[i][1][j]["id"];
                                        let eId = d[i][1][j]["empId"];
                                        let pId = d[i][1][j]["projectId"];
                                        let pName = d[i][1][j]["projectName"];
                                        let hours = d[i][1][j]["hours"]; 
                                        
                                        let descr = d[i][1][j]["descr"];   
                                        let day = d[i][1][j]["day"];   
                                        let status = d[i][1][j]["status"];   
                                        let   t = ' <td> ' 
                                            +' <input type="number"  value='+hours+'    name="hours"        min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH">' 
                                            + '<input type="number"  value='+id+'   name="id"        class="d-none"  >' 
                                            +' <input type="number"  value='+eId+'      name="empId"        class="d-none"  >' 
                                            +' <input type="number"  value='+pId+'      name="projectId"    class="d-none"  >' 
                                            +' <input type="text"    value='+pName+'    name="projectName"  class="d-none"  >' 
                                            +' <input type="text"    value='+descr+'    name="descr"        class="d-none"  >' 
                                            +' <input type="date"  value='+day+'        name="day"            class="d-none"  >' 
                                            +' <input type="text"  value='+status+'   name="status"       class="d-none"  ></td>'
                                            row.innerHTML = (( row.innerHTML.toString()) + t);
                                          
                                    }  
                                }   
                                row.innerHTML =  ( sl +( row.innerHTML.toString()) +'<td class="text-center">00</td>' );
                                $("#tbtable").append(row);
                                $(".selectProject.select2-hidden-accessible").select2('destroy');
                                $('.selectProject').select2();
                                calculate();
                                calRowOnLoad();
                            }
                        }
                    });
                }
                function calRowOnLoad( ) {
                    $('#tbtable tr' ).each( function () {
                        $(this).find('td').each(function(){
                            $(this).find('input').eq(0).each(function(){
                                $(this).change();
                            })
                        })  
                    });
                };
                fetchwork();
                function  show(){
                    console.log( html2json());
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
                        otArr.push('{' + itArr.join(',') + '}');
                    });
                })
                json += otArr.join(",") + ']'
                return json;
            }
        </script>
    </body>

    </html>
    <%@ include file="footer-fixed-bottom.jsp" %>