<%@ include file="menu.jsp" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map.*"%>
<%@page import="java.util.Arrays"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
                    <select data-placeholder="Choose Project" class="form-control selectProject" tabindex="1">
                        <option value="102">Abbott</option>
                        <option value="105">Tech Mahindra</option>
                    </select>
                </td>
                <td>  <p>Approved</p></td>
                <td><input type="number" value="" min="0" class="form-control input-sm w-100 mon_v  cal" oninput="cal(this)" onchange="cal(this)"   placeholder="HH"></td>
                <td><input type="number" value="" min="0" class="form-control input-sm w-100 tue_v  cal" oninput="cal(this)" onchange="cal(this)"   placeholder="HH"></td>
                <td><input type="number" value="" min="0" class="form-control input-sm w-100 web_v  cal" oninput="cal(this)" onchange="cal(this)"   placeholder="HH"></td>
                <td><input type="number" value="" min="0" class="form-control input-sm w-100 thu_v  cal" oninput="cal(this)" onchange="cal(this)"   placeholder="HH"></td>
                <td><input type="number" value="" min="0" class="form-control input-sm w-100 fri_v  cal" oninput="cal(this)" onchange="cal(this)"   placeholder="HH"></td>
                <td><input type="number" value="" min="0" class="form-control input-sm w-100 sat_v  cal" oninput="cal(this)" onchange="cal(this)"   placeholder="HH"></td>
                <td><input type="number" value="" min="0" class="form-control input-sm w-100 sun_v  cal" oninput="cal(this)" onchange="cal(this)"   placeholder="HH"></td>
                <td class="text-center">00 </td>
            </tr>
        </table>

        <div class="container">
            <form:form method="post" action="esswork3tnlModels" modelAttribute="workForm">
            <div class="row rounded ">
                <h5 class="text-center text-secondary h4 ">Ess Work Save Conde</h5>
            </div>
            <div class="row">
                <div class="col h6 text-center">
                    <p>Time Period</p>
                </div>
                <div class="col">
                    <input type="submit" class="btn btn-primary btn-sm" value="Save">
                </div>
                <div class="col">
                    <input type="button" class="btn btn-primary btn-sm" value="Submit">
                </div>
            </div>
            <table class="table table-striped table-hover rounded mb-0"  id="tbtable" >
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
                            <option value="102">Abbott</option>
                            <option value="105">Tech Mahindra</option>
                        </select>
                    </td>
                    <td> <input type="text" name="status" value="Approved" class="d-none">   <p>Approved</p></td>
                    <td><input type="number" value="" min="0" class="form-control input-sm w-100 mon_v " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                    <td><input type="number" value="" min="0" class="form-control input-sm w-100 tue_v " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                    <td><input type="number" value="" min="0" class="form-control input-sm w-100 web_v " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                    <td><input type="number" value="" min="0" class="form-control input-sm w-100 thu_v " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                    <td><input type="number" value="" min="0" class="form-control input-sm w-100 fri_v " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                    <td><input type="number" value="" min="0" class="form-control input-sm w-100 sat_v " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                    <td><input type="number" value="" min="0" class="form-control input-sm w-100 sun_v " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
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
        </form:form>
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
            function calRowOnLoad( ) {
                $(".mon_v:input").each(function(){
                    $(this).change();
                });
            }
            calRowOnLoad();
        </script>
        </script>
    </body>

    </html>
    <%@ include file="footer-fixed-bottom.jsp" %>