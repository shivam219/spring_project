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
                <h5 class="text-center text-secondary h4 ">Ess Work</h5>
            </div>
            <div class="row">
                <div class="col h6 text-center">
                    <p>Time Period</p>
                </div>
                <form action="fetchwork" method="post">
                    <div class="row">

                        <div class="col">  
                            <input  placeholder="Select date"  type="date"  id="startDate"  value="2022-08-22" name="startDate"  class="form-control datepicker w-75 d-flex   ">    
                        </div>
                        <div class="col">
                            <input  placeholder="Select date"  type="date" id="endDate"     value="2022-08-27" name="endDate" class="form-control datepicker w-75   ">
                        </div>
                        <div class="col">
                            <input type="submit" class="btn btn-primary btn-sm" value="fetch"  >
                        </div>
                        
                    </div>
                </form>
                <div class="col">
                    <input type="button" class="btn btn-primary btn-sm"  onclick="fetchwork()" value="Save">
                </div>
                <div class="col">
                    <input type="button" class="btn btn-primary btn-sm" value="Submit">
                </div>
            </div>
            <table class="table table-striped table-hover rounded mb-0" id="tbtable" >
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
                <c:if test = "${workMap.size()>0}">		                         
                    <c:forEach var="entry" items="${workMap}"> 
                        <tr>
                            <td colspan="2">
                                <select data-placeholder='<c:out value="${entry.key}"/>'  disabled="disabled" class="form-control selectProject" tabindex="1">
                                    <option value='<c:out value="${entry.getValue().get(0).getProjectId()}"/>'> <c:out value="${entry.key}"/></option>
                                </select>
                            </td>
                            <td> <p>Approved</p></td>
                            <c:forEach items="${entry.getValue()}" var="work" varStatus="loop">
                                <td>
                                    <input type="number" value='<c:out value="${work.getHours()}"/>' min='0' class="form-control input-sm w-100 " oninput="cal(this)"    onchange="cal(this)"  placeholder="HH">
                                </td>
                            </c:forEach>
                            <td class="text-center">00</td>
                        </tr>
                    </c:forEach> 
                </c:if>

			    <c:if test = "${workMap==null || workMap.size()==0}">			         
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
                        <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)"   placeholder="HH"></td>
                        <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)"   placeholder="HH"></td>
                        <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)"   placeholder="HH"></td>
                        <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)"   placeholder="HH"></td>
                        <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)"   placeholder="HH"></td>
                        <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)"   placeholder="HH"></td>
                        <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)"   placeholder="HH"></td>
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
                        if(!isNaN(Number(jQuery(this).find("input").val()))){
                            mon=mon+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });
                $("#mov_v_t").html(mon==0?"00":mon);
                let tue = 0;
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(3).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").val()))){
                            tue=tue+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });
                $("#tue_v_t").html(tue==0?"00":tue);
                let wed = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(4).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").val()))){
                            wed=wed+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });
                $("#web_v_t").html(wed==0?"00":wed);
                let thu = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(5).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").val()))){
                            thu=thu+Number(jQuery(this).find("input").val());
                        };
                    }) 
                }); 
                $("#thu_v_t").html(thu==0?"00":thu);

                let fri = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(6).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").val()))){
                            fri=fri+Number(jQuery(this).find("input").val());
                        };
                    }) 
                }); 
                $("#fri_v_t").html(fri==0?"00":fri);
 
                let sat = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(7).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").val()))){
                            sat=sat+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });  
                $("#sat_v_t").html(sat==0?"00":sat);

                let sun_v_t = 0;  
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(8).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").val()))){
                            sun_v_t=sun_v_t+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });  

                let total = 0;  
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(9).each(function(){
                        if(!isNaN(Number(jQuery(this).html()))){
                            total=total+Number(jQuery(this).html());
                        };
                    }) 
                });  
                $("#htotal").html(parseInt(total));   
            }

            function calRowOnLoad( ) {
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td input').eq(2).each(function(){
                        $(this).change(); 
                    })
                });
            }
            calRowOnLoad();


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
                        // console.log(typeof obj); //object
                        console.log(obj);
                        // console.log(obj[2]); // this work when list of object will return to from controller
                        // console.log(jqX.get("TCS")[0]);
                        // console.log(success);
                        // console.log(event); // states = 4 status code 400 and other
                        var result = Object.entries(obj);
                        // console.log(typeof result);//array date type 
                        // console.log( obj); //object
                        console.log( typeof (result[0][1][0]) );
                        console.log(result[0][1][0]['id'] );
                        // console.log(result[1]);
                    }
                });
            }
            // $.get( "/tester.mvc", function( data ) {
            //    alert( "Load was performed. Data : " + data );
            // });
        </script>
    </body>

    </html>
    <%@ include file="footer-fixed-bottom.jsp" %>