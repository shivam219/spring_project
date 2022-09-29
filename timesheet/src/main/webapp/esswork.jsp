<%@ include file="menu.jsp" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map.*"%>
<%@page import="java.util.Arrays"%> 
<html lang="en">
<head> 
    <title>Week Work Report</title>
    <style> 
        body{
            height: 100vh;
            background: #e1edf9;
            width: 100%;
            margin-right: 800px;
        }
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

        /* width */
        ::-webkit-scrollbar {
           width: 0px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 5px grey; 
            border-radius: 10px;
        }
        
        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: rgb(241, 216, 216); 
            border-radius: 10px;
        }

        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
            background: #00ff40; 
        }    
        .h-n{  
            color: rgb(52, 52, 52);
            width: 8px;
            height: 8px;
            resize: none;
            overflow-y: auto;
            visibility: visible;
            position: absolute;  /* fixed that to contain*/
            overflow: hidden;
            font-family: Verdana;
            text-align: center;
            letter-spacing: 0; 
            
            transition: all 0.2s ease-in-out;
            /* box-shadow: 4px 4px 4px rgb(0 0 0 / 25%); */
            border-radius:3px ;
            border: none;
            outline: none;
            cursor: pointer;
            background-color: rgb(203, 238, 233);  
            margin-left: 2px;
        }
       
        /* .h-n:: */
       .tblcolor{
            background-color: rgb(168, 174, 193);
       }
       table tr td p {
            overflow: hidden;
       }
        /* h-n-blank  */
        .h-n-blank{
            background-color: rgb(233, 233, 73);
        }
        .h-n-empty{
            background-color: rgb(250, 162, 104);
        }
        .h-n-fill{
            background-color: rgb(203, 238, 233); 
        }
        td ::-moz-selection { /* Code for Firefox */
            color: red;
            background: yellow;
        }

      
        .acti_desc {
            right: 0px;
            height: 100vh;
            width: 350px;
            text-align: center;
            background-color: #e8eae6;
            box-sizing: border-box;
            padding: 20px;
            z-index: 1000;
            display: none; 
            position: absolute;
            border-radius: 8px 0px; 
            top: 75px;
            transition: all 0.4s ease-in-out;
            font-weight: bold;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }
        

        .close-btn {
            position: absolute;
            background-color: rgb(255, 255, 255);
            color: rgb(0, 0, 0);
            border-radius: 30%;
            padding: 4px 16px; 
            cursor: pointer;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }
        .close-btn:hover {
            background-color: rgb(255, 246, 246);
        }
         .container{
            z-index: 100;
         }
        table tfoot tr:last-child td:first-child {
            border-bottom-left-radius: 5px;
        }
    
        table tfoot tr:last-child td:last-child {
            border-bottom-right-radius: 5px;
        }
        table , .row{
            user-select: none;
        }
    </style>
    
    </head>

    <body > 
      
        <div class="container" >
            <div class="row rounded  ">
                <h5 class="text-center text-secondary h4 mt-2">Ess Work</h5>
            </div>
            <div class="row align-middle  pt-2 mx-0 tblcolor rounded-top"  >
                <div class="col fw-bold text-center align-middle">
                    <span class="align-middle"> Time Period</span>
                </div>
                <div class="col d-flex justify-content-between  align-middle">  
                    <button class="rounded btn btn-secondary h-75 px-2 me-2"  onclick="PrevWeekReport()" id="btnPrevWeekReport" >
                        <i class="fa-solid fa-caret-left  d-flex"></i> 
                    </button>
                    <input  placeholder="Select date"  type="date" disabled id="startDate"   name="startDate"  class="form-control   w-75  h-75 me-2    ">    
                    <span class=" align-self-start me-2 "> To </span>
                
                    <input  placeholder="Select date"  type="date" id="endDate" disabled  name="endDate" class="form-control   w-75  h-75 me-2 ">
                    <button class="rounded btn btn-secondary h-75 px-2 " onclick="nextWeekReport()" id="btnNextWeekReport" >
                        <i class="fa-solid fa-caret-right rounded  d-flex "></i>
                    </button> 
                </div>
                <div class="col  d-flex justify-content-center align-middle">
                    <input type="button" class="btn btn-primary btn-sm pe-3 ps-3 me-2 h-75 rounded"  onclick="tblDataSave()" value="save" id="btnSave" >
                    <input type="button" class="btn btn-primary btn-sm h-75 rounded" value="Submit">
                </div>
                
            </div>
            <table class="table table-striped table-hover  mb-0 mt-0 rounded " id="tbtable"  >
                <thead>
                    <tr class=" tblcolor  "  >
                        <td class="text-center" >Customer</td>
                        <td class="text-center" colspan="2">Work Items</td>
                        <td class="text-center" id="monDate">Mon</td>
                        <td class="text-center" id="tueDate">Tue</td>
                        <td class="text-center" id="wedDate">Wed</td>
                        <td class="text-center" id="thuDate">Thu</td>
                        <td class="text-center" id="friDate">Fri</td>
                        <td class="text-center" id="satDate">Sat</td>
                        <td class="text-center" id="sunDate">Sun</td>
                        <td class="text-center" id="Date">Total</td>
                    </tr> 
                </thead>
                <tbody>
                    
                </tbody>
                <tfoot >
                    <td colspan="3" class="text-center"> </td>
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
       
        <div class="acti_desc" class="rounded-start"  style="  border: 2px solid rgb(206, 204, 204);   float: right;">
            <div class="mt-3 ">
                <p onclick="actiDescPopHide()" class="close-btn  ">X</p>
                <span style="font-size: 16px;">Activity Description </span>
            </div>
            <hr>
            <div class="form-group mt-4 ">
                <textarea class="form-control" id="acti_desc"  rows="6"  style="resize: none;"
                    placeholder="Enter description here....."></textarea>
            </div>
             <input type="button" value="save" class="btn btn-success px-4 py-1 mt-3 fw-bold"  onclick="newActiDescPopSave()" >
        </div> 
        <script>
            var prevActivityDesc = null ;
            function newActiDescPopSave(){
                $(prevActivityDesc).val($("#acti_desc").val());
                actiDescPopHide();
            }
            function actiDescPopShow (){
                $(".acti_desc").show();
            }
            function actiDescPopHide (){
                $(".acti_desc").hide();
            }
            
            function AddHoverToHourIn(){           
                $(".h-n").click( function (event) {
                    if($(this).siblings("input:first").val()){
                        prevActivityDesc = $(this);
                        $(this).blur();
                        $("#acti_desc").val($(this).val());
                        actiDescPopShow();
                    }
                });
                $('#tbtable tr').addClass("tblcolor");
            };
            function padTo2Digits(num) {
                return num.toString().padStart(2, '0');
            }
            function formatDate(date) {
                return [
                    date.getFullYear(),
                    padTo2Digits(date.getMonth() + 1),
                    padTo2Digits(date.getDate()),
                ].join('-');
            }
            function setWeekDates() {  
                $("#monDate").html('mon  &nbsp; '+ new Date($("#startDate").val()).getDate());
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 1);
                $("#tueDate").html('tue  &nbsp; '+ ( new Date((formatDate(sd))).getDate()));
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 2);
                $("#wedDate").html('wed   &nbsp;'+ ( new Date((formatDate(sd))).getDate()));
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 3);
                $("#thuDate").html('thu   &nbsp;'+ ( new Date((formatDate(sd))).getDate()));
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 4);
                $("#friDate").html('fri  &nbsp; '+ ( new Date((formatDate(sd))).getDate()));
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 5);
                $("#satDate").html('sat   &nbsp; '+ ( new Date((formatDate(sd))).getDate()));
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 6);
                $("#sunDate").html('sun  &nbsp;'+ ( new Date((formatDate(sd))).getDate()));
            }
            function PrevWeekReport(){
                let sd = new Date($("#startDate").val());
                let ed = new Date($("#endDate").val());
                sd.setDate(sd.getDate() - 7);
                ed.setDate(ed.getDate() - 7);
                $("#startDate").val(formatDate(sd));
                $("#endDate").val(formatDate(ed));
                $("#btnPrevWeekReport").blur();
                setWeekDates();
                fetchwork();
            }   
            function nextWeekReport(){
                let sd = new Date($("#startDate").val());
                let ed = new Date($("#endDate").val());
                sd.setDate(sd.getDate() + 7);
                ed.setDate(ed.getDate() + 7);
                $("#startDate").val(formatDate(sd));
                $("#endDate").val(formatDate(ed));
                $("#btnNextWeekReport").blur();
                setWeekDates();
                fetchwork();
            }
            function cal(ob){
                if($(ob).val()>24){
                    $(ob).val('');
                }
                else if($(ob).val()=="" || $(ob).val()>0){
                    let rsum=0;   
                    $(ob).closest('tr').find('td').each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").val()))){
                            rsum=rsum+Number(jQuery(this).find("input").val());
                        };
                        $(this).closest("tr").find("td:eq(9) ").html(rsum==0?"00":rsum);
                    });
                    calculate();
                }
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
            };

      
            function fetchwork(){   
                let atsd = $("#startDate").attr("name");
                let sd = $("#startDate").val();
                let ated = $("#endDate").attr("name");
                let ed = $("#endDate").val();
                let uri = '/fetchworkjson?'+atsd+'='+sd+'&'+ated+'='+ed; 
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
                                let cstr = spn.replace("[",'').replace("]",'').replace(",",'');
                                let arr = cstr.split(' ');
                                let sl = '<td><p class="text-center border rounded p-1 mt-1 bg-white" >'+arr[0] +' </p></td>' 
                                        + '<td  colspan="2"> <p class="text-center border rounded bg-white p-1 mt-1" > '+arr[1] +' </p> </td> ' ;
                                    
                                for (let j = 0; j <d[i][1].length; j++) {
                                    if( d[i][1][j]["id"] == 0){
                                        let eId = d[i][1][j]["empId"];
                                        let pId = d[i][1][j]["projectId"];
                                        let pName = d[i][1][j]["projectName"];
                                        let hours = d[i][1][j]["hours"]; 
                                        let descr = d[i][1][j]["descr"];   
                                        let day = d[i][1][j]["day"];   
                                        let status = d[i][1][j]["status"];   
                                        let t =  ' <td>'
                                            +' <input type="number"    name="hours"          min="1" max="24" class="d-inline form-control input-sm w-75 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"> ' 
                                            +' <input type="number"  value='+eId+'      name="empId"          class="d-inline d-none"  > ' 
                                            +' <input type="number"  value='+pId+'      name="projectId"      class="d-inline d-none"  > ' 
                                            +' <input type="text"    value='+pName+'    name="projectName"    class="d-inline d-none"  > ' 
                                            +' <input type="date"    value='+day+'     name="day"             class="d-inline d-none"  >'  
                                            +' <textarea class="h-n h-n-blank"   name="descr"       ></textarea>' 
                                            +' </td>';
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
                                            +' <input type="number"  value='+hours+'    name="hours" min="1"  max="24"  class=" d-inline form-control input-sm w-75 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH">' 
                                            +' <input type="number"  value='+id+'       name="id"                       class=" d-inline d-none"  > ' 
                                            +' <input type="number"  value='+eId+'      name="empId"                    class=" d-inline d-none"  > ' 
                                            +' <input type="number"  value='+pId+'      name="projectId"                class=" d-inline d-none"  > ' 
                                            +' <input type="text"    value='+pName+'    name="projectName "             class=" d-inline d-none"  > ' 
                                            +' <input type="date"  value='+day+'        name="day"                      class=" d-inline d-none" > ' 
                                            +' <textarea class="h-n    '+ (descr==""?" h-n-empty":"")+'"  name="descr"     >'+descr +'</textarea>'  
                                            +'</td>';
                                        row.innerHTML = (( row.innerHTML.toString()) + t);
                                    }  
                                }   
                                row.innerHTML =  ( sl +( row.innerHTML.toString()) +'<td class="text-center">00</td>' );
                                $("#tbtable").append(row);
                            }
                            calRowOnLoad();
                            AddHoverToHourIn();
                            setWeekDates();
                            /*reset horizontal total when now row found*/
                            let rowCount = $('#tbtable tr').length;
                            if(rowCount == 2) {
                                $("#mov_v_t").html('00');
                                $("#tue_v_t").html('00');
                                $("#web_v_t").html('00');
                                $("#thu_v_t").html('00');
                                $("#fri_v_t").html('00');
                                $("#sat_v_t").html('00');
                                $("#sun_v_t").html('00');
                                $("#htotal").html('00');
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
                function tblDataSave(){
                    $("#btnSave").blur();
                    $.ajax({
                        type: 'post',
                        url: 'deletework',
                        data:  html2jsonForDelete(),
                        contentType: "application/json; charset=utf-8",
                        traditional: true,
                        success: function () {
                        }
                    });     
                    $.ajax({
                        type: 'post',
                        url: 'savework',
                        data:  html2json(),
                        contentType: "application/json; charset=utf-8",
                        traditional: true,
                        success: function () {
                            fetchwork();
                        }
                    });     
                }
                
                function html2jsonForDelete(){
                    var json = '[';
                    var otArr = [];
                    $('#tbtable tbody tr').each(function(i) {  
                        var itArr = []; 
                        $(this).find("td").each(function () { 
                            if($(this).find("input[name='id']").val()){
                                if($(this).find("input[name='hours']").val()==""){
                                    itArr.push('"id" ' + ': ' + $(this).find("input[name='id']").val() + ' ');
                                    otArr.push('{' + itArr.join(',') + '}');
                                    itArr.shift();
                                }
                            }                        
                        });
                    }); 
                    json += otArr.join(",") + ']';
                    return json;
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
                           }
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
                           }
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
                           } 
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
                           } 
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
                           } 
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
                           }
                        });
                    }); 
                json += otArr.join(",") + ']';
                console.log(json);
                return json;
            }

            function getMonday(d = new Date()) {
                d = new Date(d);
                var day = d.getDay(),
                diff = d.getDate() - day + (day == 0 ? -6:1); 
                return new Date(d.setDate(diff));
            }
            function fetchworkCurrentReport(){
                let sd = getMonday();
                let ed = getMonday();
                ed.setDate(sd.getDate()+6)
                $("#startDate").val(formatDate(sd));
                $("#endDate").val(formatDate(ed));
                fetchwork();
            }
            fetchworkCurrentReport();
        </script>
    </body>
</html>
<%@ include file="footer-fixed-bottom.jsp" %>