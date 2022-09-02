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
         /* Chrome, Safari, Edge, Opera */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
        }
        /* Firefox */
        input[type=number] {
        -moz-appearance: textfield;
        }

        .inner{display:none; float: right}
        
         /* alt + shift  + arrow */
         td:focus-within > .h-n {
            visibility: visible;
            width: 140px;
            height: 65px; 
            padding-left: 7px;
            padding-right: 7px;
            font-size: 15px;  
             
        }
        .h-n:focus-visible {
            visibility: visible;
        }
        .h-n{  
        color: rgb(52, 52, 52);
        width: 0px;
        resize: none;
        height: 0px;
        visibility: hidden;
        position: absolute;  /* fixed that to contain*/
        overflow: hidden;
        font-family: Verdana;
        text-align: center;
        font-size: 12px;
        letter-spacing: 0;
        transition: all 0.2s ease-in-out;
        box-shadow: 4px 4px 4px rgb(0 0 0 / 25%);
        border-radius:3px ;
        border: none;
        outline: none;
        background-color: rgba(217.0000022649765, 236.00000113248825, 233.00000131130219, 1);  
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
            <div class="row align-middle  pt-2 mx-0 " style="background-color: rgb(168, 174, 193);">
                <div class="col fw-bold text-center align-middle">
                    <span class="align-middle"> Time Period</span>
                </div>
                <div class="col d-flex justify-content-between  align-middle">  
                     <button class="rounded btn-secondary h-75">
                        <i class="fa-solid fa-caret-left"></i> 
                    </button>
                    <input  placeholder="Select date"  type="date"  id="startDate"  value="2022-08-22" name="startDate"  class="form-control   w-75  h-75    ">    
                    <span class="   align-self-start  "> To </span>
                </div>
                <div class="col d-flex justify-content-between align-middle">
                    <input  placeholder="Select date"  type="date" id="endDate"     value="2022-08-28" name="endDate" class="form-control   w-75  h-75 ">
                    <button class="rounded btn-secondary h-75"><i class="fa-solid fa-caret-right rounded"></i> 
                </div>
                <div class="col  d-flex justify-content-center align-middle">
                    <input type="button" class="btn btn-primary btn-sm pe-3 ps-3 me-2 h-75 rounded"  onclick="tblDataSave()" value="save" id="btnSave" >
                    <input type="button" class="btn btn-primary btn-sm h-75 rounded" value="Submit">
                </div>
                
            </div>
            <table class="table table-striped table-hover rounded mb-0 mt-1" id="tbtable" >
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
                <tbody>
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
                        <td>
                            <input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH">
                            <span class="h-n ">  Lorem Ipsum is simply dummy text of the printing and typesetting industry </span>
                        </td>
                        <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                        <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                        <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                        <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                        <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                        <td><input type="number" value="" min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"></td>
                        <td class="text-center">00 </td>
                    </tr>
                </tbody>
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

                let sun = 0;  
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(8).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            sun=sun+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });  
                $("#sun_v_t").html(sun==0?"00":sun);
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
                                     console.log(( new String( d[i][1][j]["descr"]).replace(/[\r\n\s]/gm, '').length > 1) && d[i][1][j]["hour"] == 0  ); 
                                    if( d[i][1][j]["id"] == 0){
                                        let eId = d[i][1][j]["empId"];
                                        let pId = d[i][1][j]["projectId"];
                                        let pName = d[i][1][j]["projectName"];
                                        let hours = d[i][1][j]["hours"]; 
                                        let descr = d[i][1][j]["descr"];   
                                        let day = d[i][1][j]["day"];   
                                        let status = d[i][1][j]["status"];   
    
                                        let t =  '<td>'
                                            +' <input type="number"    name="hours"          min="0" class="form-control input-sm w-100 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"> ' 
                                            +' <input type="number"  value='+eId+'      name="empId"       class="d-none"  > ' 
                                            +' <input type="number"  value='+pId+'      name="projectId"   class="d-none"  > ' 
                                            +' <input type="text"    value='+pName+'    name="projectName" class="d-none"  > ' 
                                            +' <input type="date"    value='+day+'     name="day"         class="d-none"  >'  
                                            +' <input type="text"    value='+status+'     name="status"       class="d-none"  > '
                                            +' <textarea class="h-n "  name="descr"  >  '+descr+'     </textarea>' 
                                            +' </td>';
                                            row.innerHTML = (( row.innerHTML.toString()) + t);
                                    } else if (d[i][1][j]["id"] == -1) {
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
                                            +' <input type="number"  value='+id+'       name="id"        class="d-none"  > ' 
                                            +' <input type="number"  value='+eId+'      name="empId"        class="d-none"  > ' 
                                            +' <input type="number"  value='+pId+'      name="projectId"    class="d-none"  > ' 
                                            +' <input type="text"    value='+pName+'    name="projectName"  class="d-none"  > ' 
                                            +' <input type="date"  value='+day+'        name="day"            class="d-none" > ' 
                                            +' <input type="text"  value='+status+'     name="status"       class="d-none"  > '
                                            +' <textarea class="h-n "  name="descr"  >'+descr+'</textarea>' 
                                            +'</td>';
                                            row.innerHTML = (( row.innerHTML.toString()) + t);
                                    } 
                                    else{
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
                                            +' <input type="number"  value='+id+'       name="id"        class="d-none"  > ' 
                                            +' <input type="number"  value='+eId+'      name="empId"        class="d-none"  > ' 
                                            +' <input type="number"  value='+pId+'      name="projectId"    class="d-none"  > ' 
                                            +' <input type="text"    value='+pName+'    name="projectName"  class="d-none"  > ' 
                                            +' <input type="date"  value='+day+'        name="day"            class="d-none" > ' 
                                            +' <input type="text"  value='+status+'     name="status"       class="d-none"  > '
                                            +' <textarea class="h-n "  name="descr"  >'+descr+'</textarea>' 
                                            +'</td>';
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
                function  tblDataSave(){
                    $("#btnSave").blur();
                    $.ajax({
                    type: 'post',
                    url: 'savework',
                    data:  html2json(),
                    contentType: "application/json; charset=utf-8",
                    traditional: true,
                    success: function (data) {
                        console.log("update data");
                        fetchwork();
                        }
                    });
                }
                function html2json() {
                    var json = '[';
                    var otArr = [];
                    $('#tbtable tbody tr').each(function(i) {  
                        var itArr = []; 
                        $(this).find("td:eq(2)").each(function () { 
                            if($(this).find("input:first").val() > 0 ){
                                $(this).find("input").each(function () {
                                   if(!isNaN(Number(jQuery(this).val()))){
                                       itArr.push('"' + $(this).attr("name") + '" ' + ': ' + $(this).val() + ' ');
                                   }
                                   else{
                                       itArr.push('"' + $(this).attr("name") + '" ' + ': "' + $(this).val() + '" ');
                                   }
                               });
                               $(this).find("textarea").each(function () {
                                itArr.push('"' + $(this).attr("name") + '" ' + ': "' +  new String( $(this).val()).replace(/[\r\n]/gm, ' ') + '" '); 
                               });
                               otArr.push('{' + itArr.join(',') + '}');
                           }else if(new String( $(this).find("textarea:first").val()).replace(/[\r\n\s]/gm, '').length > 1){
                                $(this).find("input").each(function () {
                                    if (!isNaN(Number(jQuery(this).val()))){
                                        if($(this).attr("name")=="hours"){
                                            itArr.push('"' + $(this).attr("name") + '" ' + ': 0 ');
                                        }
                                        else if(!isNaN(Number(jQuery(this).val()))){
                                            itArr.push('"' + $(this).attr("name") + '" ' + ': ' + $(this).val() + ' ');
                                        }
                                    }
                                    else{
                                        itArr.push('"' + $(this).attr("name") + '" ' + ': "' + $(this).val() + '" ');
                                    }
                                });
                                $(this).find("textarea").each(function () {
                                    itArr.push('"' + $(this).attr("name") + '" ' + ': "' +  new String( $(this).val()).replace(/[\r\n]/gm, ' ') + '" '); 
                                });
                                otArr.push('{' + itArr.join(',') + '}');
                           };
                        });
                    }); 
                    $('#tbtable tbody tr').each(function(i) {  
                        var itArr = []; 
                        $(this).find("td:eq(3)").each(function () {
                            if($(this).find("input:first").val() > 0 ){
                               $(this).find("input").each(function () {
                                   if(!isNaN(Number(jQuery(this).val()))){
                                       itArr.push('"' + $(this).attr("name") + '" ' + ': ' + $(this).val() + ' ');
                                   }
                                   else{
                                       itArr.push('"' + $(this).attr("name") + '" ' + ': "' + $(this).val() + '" ');
                                   }
                               });
                               $(this).find("textarea").each(function () {
                                itArr.push('"' + $(this).attr("name") + '" ' + ': "' +  new String( $(this).val()).replace(/[\r\n]/gm, ' ') + '" '); 
                               });
                               otArr.push('{' + itArr.join(',') + '}');
                           }else if(new String( $(this).find("textarea:first").val()).replace(/[\r\n\s]/gm, '').length > 1){
                                $(this).find("input").each(function () {
                                    if (!isNaN(Number(jQuery(this).val()))){
                                        if($(this).attr("name")=="hours"){
                                            itArr.push('"' + $(this).attr("name") + '" ' + ': 0 ');
                                        }
                                        else if(!isNaN(Number(jQuery(this).val()))){
                                            itArr.push('"' + $(this).attr("name") + '" ' + ': ' + $(this).val() + ' ');
                                        }
                                    }
                                    else{
                                        itArr.push('"' + $(this).attr("name") + '" ' + ': "' + $(this).val() + '" ');
                                    }
                                });
                                $(this).find("textarea").each(function () {
                                    itArr.push('"' + $(this).attr("name") + '" ' + ': "' +  new String( $(this).val()).replace(/[\r\n]/gm, ' ') + '" '); 
                                });
                                otArr.push('{' + itArr.join(',') + '}');
                           };
                        });
                    });
                    $('#tbtable tbody tr').each(function(i) {  
                        var itArr = []; 
                        $(this).find("td:eq(4)").each(function () {
                            if($(this).find("input:first").val() > 0 ){
                                $(this).find("input").each(function () {
                                   if(!isNaN(Number(jQuery(this).val()))){
                                       itArr.push('"' + $(this).attr("name") + '" ' + ': ' + $(this).val() + ' ');
                                   }
                                   else{
                                       itArr.push('"' + $(this).attr("name") + '" ' + ': "' + $(this).val() + '" ');
                                   }
                               });
                               $(this).find("textarea").each(function () {
                                itArr.push('"' + $(this).attr("name") + '" ' + ': "' +  new String( $(this).val()).replace(/[\r\n]/gm, ' ') + '" '); 
                               });
                               otArr.push('{' + itArr.join(',') + '}');
                           }else if(new String( $(this).find("textarea:first").val()).replace(/[\r\n\s]/gm, '').length > 1){
                                $(this).find("input").each(function () {
                                    if (!isNaN(Number(jQuery(this).val()))){
                                        if($(this).attr("name")=="hours"){
                                            itArr.push('"' + $(this).attr("name") + '" ' + ': 0 ');
                                        }
                                        else if(!isNaN(Number(jQuery(this).val()))){
                                            itArr.push('"' + $(this).attr("name") + '" ' + ': ' + $(this).val() + ' ');
                                        }
                                    }
                                    else{
                                        itArr.push('"' + $(this).attr("name") + '" ' + ': "' + $(this).val() + '" ');
                                    }
                                });
                                $(this).find("textarea").each(function () {
                                    itArr.push('"' + $(this).attr("name") + '" ' + ': "' +  new String( $(this).val()).replace(/[\r\n]/gm, ' ') + '" '); 
                                });
                                otArr.push('{' + itArr.join(',') + '}');
                           };
                        });
                    }); 
                    $('#tbtable tbody tr').each(function(i) {  
                        var itArr = []; 
                        $(this).find("td:eq(5)").each(function () {
                            if($(this).find("input:first").val() > 0 ){
                               $(this).find("input").each(function () {
                                   if(!isNaN(Number(jQuery(this).val()))){
                                       itArr.push('"' + $(this).attr("name") + '" ' + ': ' + $(this).val() + ' ');
                                   }
                                   else{
                                       itArr.push('"' + $(this).attr("name") + '" ' + ': "' + $(this).val() + '" ');
                                   }
                               });
                               $(this).find("textarea").each(function () {
                                itArr.push('"' + $(this).attr("name") + '" ' + ': "' +  new String( $(this).val()).replace(/[\r\n]/gm, ' ') + '" '); 
                              });
                               otArr.push('{' + itArr.join(',') + '}');
                           }else if(new String( $(this).find("textarea:first").val()).replace(/[\r\n\s]/gm, '').length > 1){
                                $(this).find("input").each(function () {
                                    if (!isNaN(Number(jQuery(this).val()))){
                                        if($(this).attr("name")=="hours"){
                                            itArr.push('"' + $(this).attr("name") + '" ' + ': 0 ');
                                        }
                                        else if(!isNaN(Number(jQuery(this).val()))){
                                            itArr.push('"' + $(this).attr("name") + '" ' + ': ' + $(this).val() + ' ');
                                        }
                                    }
                                    else{
                                        itArr.push('"' + $(this).attr("name") + '" ' + ': "' + $(this).val() + '" ');
                                    }
                                });
                                $(this).find("textarea").each(function () {
                                    itArr.push('"' + $(this).attr("name") + '" ' + ': "' +  new String( $(this).val()).replace(/[\r\n]/gm, ' ') + '" '); 
                                });
                                otArr.push('{' + itArr.join(',') + '}');
                           };
                        });
                    }); 
                    $('#tbtable tbody tr').each(function(i) {  
                        var itArr = []; 
                        $(this).find("td:eq(6)").each(function () {
                            if($(this).find("input:first").val() > 0 ){
                               $(this).find("input").each(function () {
                                   if(!isNaN(Number(jQuery(this).val()))){
                                       itArr.push('"' + $(this).attr("name") + '" ' + ': ' + $(this).val() + ' ');
                                   }
                                   else{
                                       itArr.push('"' + $(this).attr("name") + '" ' + ': "' + $(this).val() + '" ');
                                   }
                               });
                               $(this).find("textarea").each(function () {
                                itArr.push('"' + $(this).attr("name") + '" ' + ': "' +  new String( $(this).val()).replace(/[\r\n]/gm, ' ') + '" '); 
                                 });
                               otArr.push('{' + itArr.join(',') + '}');
                           }else if(new String( $(this).find("textarea:first").val()).replace(/[\r\n\s]/gm, '').length > 1){
                                $(this).find("input").each(function () {
                                    if (!isNaN(Number(jQuery(this).val()))){
                                        if($(this).attr("name")=="hours"){
                                            itArr.push('"' + $(this).attr("name") + '" ' + ': 0 ');
                                        }
                                        else if(!isNaN(Number(jQuery(this).val()))){
                                            itArr.push('"' + $(this).attr("name") + '" ' + ': ' + $(this).val() + ' ');
                                        }
                                    }
                                    else{
                                        itArr.push('"' + $(this).attr("name") + '" ' + ': "' + $(this).val() + '" ');
                                    }
                                });
                                $(this).find("textarea").each(function () {
                                    itArr.push('"' + $(this).attr("name") + '" ' + ': "' +  new String( $(this).val()).replace(/[\r\n]/gm, ' ') + '" '); 
                                });
                                otArr.push('{' + itArr.join(',') + '}');
                           };
                        });
                    }); 
                    $('#tbtable tbody tr').each(function(i) {  
                        var itArr = []; 
                        $(this).find("td:eq(7)").each(function () {
                            if($(this).find("input:first").val() > 0 ){
                               $(this).find("input").each(function () {
                                   if(!isNaN(Number(jQuery(this).val()))){
                                       itArr.push('"' + $(this).attr("name") + '" ' + ': ' + $(this).val() + ' ');
                                   }
                                   else{
                                       itArr.push('"' + $(this).attr("name") + '" ' + ': "' + $(this).val() + '" ');
                                   }
                               });
                               $(this).find("textarea").each(function () {
                                itArr.push('"' + $(this).attr("name") + '" ' + ': "' +  new String( $(this).val()).replace(/[\r\n]/gm, ' ') + '" '); 
                              });
                               otArr.push('{' + itArr.join(',') + '}');
                           }
                           else if(new String( $(this).find("textarea:first").val()).replace(/[\r\n\s]/gm, '').length > 1){
                                $(this).find("input").each(function () {
                                    if (!isNaN(Number(jQuery(this).val()))){
                                        if($(this).attr("name")=="hours"){
                                            itArr.push('"' + $(this).attr("name") + '" ' + ': 0 ');
                                        }
                                        else if(!isNaN(Number(jQuery(this).val()))){
                                            itArr.push('"' + $(this).attr("name") + '" ' + ': ' + $(this).val() + ' ');
                                        }
                                    }
                                    else{
                                        itArr.push('"' + $(this).attr("name") + '" ' + ': "' + $(this).val() + '" ');
                                    }
                                });
                                $(this).find("textarea").each(function () {
                                    itArr.push('"' + $(this).attr("name") + '" ' + ': "' +  new String( $(this).val()).replace(/[\r\n]/gm, ' ') + '" '); 
                                });
                                otArr.push('{' + itArr.join(',') + '}');
                           };
                        });
                    }); 
                    $('#tbtable tbody tr').each(function(i) {  
                        var itArr = []; 
                        $(this).find("td:eq(8)").each(function () {
                            if($(this).find("input:first").val() > 0 ){
                               $(this).find("input").each(function () {
                                   if(!isNaN(Number(jQuery(this).val()))){
                                       itArr.push('"' + $(this).attr("name") + '" ' + ': ' + $(this).val() + ' ');
                                   }
                                   else{
                                       itArr.push('"' + $(this).attr("name") + '" ' + ': "' + $(this).val() + '" ');
                                   }
                               });
                               $(this).find("textarea").each(function () {
                                itArr.push('"' + $(this).attr("name") + '" ' + ': "' +  new String( $(this).val()).replace(/[\r\n]/gm, ' ') + '" '); 
                               });
                               otArr.push('{' + itArr.join(',') + '}');
                           }else if(new String( $(this).find("textarea:first").val()).replace(/[\r\n\s]/gm, '').length > 1){
                                $(this).find("input").each(function () {
                                    if (!isNaN(Number(jQuery(this).val()))){
                                        if($(this).attr("name")=="hours"){
                                            itArr.push('"' + $(this).attr("name") + '" ' + ': 0 ');
                                        }
                                        else if(!isNaN(Number(jQuery(this).val()))){
                                            itArr.push('"' + $(this).attr("name") + '" ' + ': ' + $(this).val() + ' ');
                                        }
                                    }
                                    else{
                                        itArr.push('"' + $(this).attr("name") + '" ' + ': "' + $(this).val() + '" ');
                                    }
                                });
                                $(this).find("textarea").each(function () {
                                    itArr.push('"' + $(this).attr("name") + '" ' + ': "' +  new String( $(this).val()).replace(/[\r\n]/gm, ' ') + '" '); 
                                });
                                otArr.push('{' + itArr.join(',') + '}');
                           };
                        });
                    }); 
                    json += otArr.join(",") + ']';
                    console.log(json);
                    return json;
          
            }
        </script>
    </body>

    </html>
    <%@ include file="footer-fixed-bottom.jsp" %>