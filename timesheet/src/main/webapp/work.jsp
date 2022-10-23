<%@ include file="menu.jsp" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map.*"%>
<%@page import="java.util.Arrays"%> 
<html lang="en">
<head> 
    <meta name="viewport" content="width=device-width, initial-scale=1">	
    <title> Work Report</title>
    <style> 
        body{
            background: #e1edf9;
            scroll-behavior: smooth;
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
        h5{
            background-image: linear-gradient(108.1deg, rgba(167, 220, 225, 1) 11.2%,rgb(174, 221, 228) 88.9%);
			 
             border-radius:20px ;
        }
        #tbtable thead .tblcolor{
            border-radius: 3px;
         }
         .op{opacity: 0.9;}
    </style>
    
    </head>

    <body > 
      
        <div class="container" >
            <div class="row rounded m-0 p-0 ">
                <h5 class="text-center text-secondary h3 my-3 py-2 ">Work Report</h5>
            </div>
            <div class="row align-middle  pt-2 mx-0 tblcolor rounded-top"  >
                <div class="col fw-bold text-center align-middle">
                    <span class="align-middle text-gray fw-bold"> Time Period</span>
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
                    <input type="button" class="btn  btn-sm h-75 rounded btn-success" value="Submit" onclick="btnSubmitWorkReport(this)" id="btnSubmit" >
                </div>
                
            </div>
            <table class="table table-striped table-hover  mb-0 mt-0 rounded " id="tbtable"  >
                <thead>
                    <tr class="tblcolor"  >
                        <td>               
                            <span class="text-center rounded bg-white text-dark p-2 op">  Customer </span>
                        </td>
                        <td class="text-center op" colspan="2"> 
                                            <span class=" rounded bg-white text-dark p-2 op px-5"> Work Items</span> </td>
                        <td  id="monDate" class="op">  <span class=" rounded bg-white text-dark p-2 op  "> Mon </span> </td>
                        <td  id="tueDate" class="op">  <span class=" rounded bg-white text-dark p-2 op  "> Tue </span> </td>
                        <td  id="wedDate" class="op">  <span class=" rounded bg-white text-dark p-2 op  "> Wed </span> </td>
                        <td  id="thuDate" class="op">  <span class=" rounded bg-white text-dark p-2 op  "> Thu </span> </td>
                        <td  id="friDate" class="op">  <span class=" rounded bg-white text-dark p-2 op  "> Fri </span> </td>
                        <td  id="satDate" class="op">  <span class=" rounded bg-white text-dark p-2 op  "> Sat </span> </td>
                        <td  id="sunDate" class="op">  <span class=" rounded bg-white text-dark p-2 op  "> Sun </span> </td>
                        <td class="text-center" id="Date">    
                            <span class="text-center rounded bg-white text-dark p-2 op px-3  "> Total</span> 
                        </td>
                    </tr> 
                </thead>
                <tbody>
                    
                </tbody>
                <tfoot >
                    <td colspan="3" class="text-center"> </td>
                    <td id="mov_v_t"><input  type="number"   readonly    class="d-inline form-control input-sm w-75 "  placeholder="HH"  > </input> </td>
                    <td id="tue_v_t"><input  type="number"   readonly    class="d-inline form-control input-sm w-75 "  placeholder="HH"  > </input> </td>
                    <td id="web_v_t"><input  type="number"   readonly    class="d-inline form-control input-sm w-75 "  placeholder="HH"  > </input> </td>
                    <td id="thu_v_t"><input  type="number"   readonly    class="d-inline form-control input-sm w-75 "  placeholder="HH"  > </input> </td>
                    <td id="fri_v_t"><input  type="number"   readonly    class="d-inline form-control input-sm w-75 "  placeholder="HH"  > </input> </td>
                    <td id="sat_v_t"><input  type="number"   readonly    class="d-inline form-control input-sm w-75 "  placeholder="HH"  > </input> </td>
                    <td id="sun_v_t"><input  type="number"   readonly    class="d-inline form-control input-sm w-75 "  placeholder="HH"  > </input> </td>
                    <td id="htotal" ><input  type="number"   readonly    class="d-inline form-control  w-75 ms-2"      placeholder="HH"  > </input> </td>
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
             <input type="button" value="Save" class="btn btn-success px-4 py-1 mt-3 fw-bold"  onclick="newActiDescPopSave()" >
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
                let uri = '/get-week-holidays?startDate='+ $("#startDate").val()+'&endDate='+ $("#endDate").val(); 
                let obj='';
                $.ajax({
                    async : false,
                    type: 'GET',
                    url: uri,
                    contentType :'application/json',
                    success: function (da) {
                        obj= da;
                    }
                });
                
                $("#monDate span ").addClass("bg-white text-dark").removeClass("bg-success text-white");
                $("#tueDate span ").addClass("bg-white text-dark").removeClass("bg-success text-white");
                $("#wedDate span ").addClass("bg-white text-dark").removeClass("bg-success text-white");
                $("#thuDate span ").addClass("bg-white text-dark").removeClass("bg-success text-white");
                $("#friDate span ").addClass("bg-white text-dark").removeClass("bg-success text-white");
                $("#satDate span ").addClass("bg-white text-dark").removeClass("bg-success text-white");
                $("#sunDate span ").addClass("bg-white text-dark").removeClass("bg-success text-white");
                $("#monDate span ").html('Mon &nbsp;'+ (new Date($("#startDate").val()).getDate()));
                if(obj[0]){$("#monDate span ").removeClass("bg-white text-dark").addClass("bg-success text-white")}

                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 1);
                $("#tueDate span ").html('Tue &nbsp;'+ (new Date((formatDate(sd))).getDate()));
                if(obj[1]){ $("#tueDate span ").removeClass("bg-white text-dark").addClass("bg-success text-white")}
                
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 2);
                $("#wedDate span ").html('Wed &nbsp;'+(new Date((formatDate(sd))).getDate()));
                if(obj[2]){ $("#wedDate span ").removeClass("bg-white text-dark").addClass("bg-success text-white")}
                
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 3);
                $("#thuDate span ").html('Thu &nbsp;'+ (new Date((formatDate(sd))).getDate()));
                if(obj[3]){ $("#thuDate span ").removeClass("bg-white text-dark").addClass("bg-success text-white")}
                
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 4);
                $("#friDate span ").html('Fri &nbsp;' +(new Date((formatDate(sd))).getDate()));
                if(obj[4]){ $("#friDate span ").removeClass("bg-white text-dark").addClass("bg-success text-white")}
                
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 5);
                $("#satDate span ").html('Sat &nbsp;'+(new Date((formatDate(sd))).getDate()));
                if(obj[5]){ $("#satDate span ").removeClass("bg-white text-dark").addClass("bg-success text-white")}
                
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 6);
                $("#sunDate span ").html('Sun &nbsp;'+(new Date((formatDate(sd))).getDate()));
                if(obj[6]){ $("#sunDate span ").removeClass("bg-white text-dark").addClass("bg-success text-white")}
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
                let now = getMonday();
                if(now>sd){
                    $("#startDate").val(formatDate(sd));
                    $("#endDate").val(formatDate(ed));
                    setWeekDates();
                    fetchwork();
                }else{
                    alert("Unable to fetch next week data");
                }
                $("#btnNextWeekReport").blur();
            }
            function cal(ob){
                if($(ob).val()>24){
                    $(ob).val('');
                }
                else if($(ob).val()=="" || $(ob).val()>0){
                    let rsum=0;   
                    $(ob).closest("tr").find("td:eq(9) input:first ").val('00');
                    $(ob).closest('tr').find('td').each(function(){
                        if(!isNaN(Number(jQuery(this).find("input:first").val()))){
                            rsum=rsum+Number(jQuery(this).find("input:first").val());
                        };
                        rsum;
                    });
                    $(ob).closest("tr").find("td:eq(9) input:first ").val(rsum==0?"00":rsum);
                    calculate();
                }
            }

            function calculate(){
                tblRefresh();
                let mon = 0;             
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(2).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            mon=mon+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });
              
                $("#mov_v_t input:first").val(mon==0?"00":mon);
                let tue = 0;
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(3).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            tue=tue+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });
                $("#tue_v_t   input:first").val(tue==0?"00":tue);
                let wed = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(4).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            wed=wed+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });
                $("#web_v_t input:first").val(wed==0?"00":wed);
                let thu = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(5).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            thu=thu+Number(jQuery(this).find("input").val());
                        };
                    }) 
                }); 
                $("#thu_v_t input:first").val(thu==0?"00":thu);

                let fri = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(6).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            fri=fri+Number(jQuery(this).find("input").val());
                        };
                    }) 
                }); 
                $("#fri_v_t input:first").val(fri==0?"00":fri);
 
                let sat = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(7).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            sat=sat+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });  
                $("#sat_v_t input:first ").val(sat==0?"00":sat);

                let sun = 0;  
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(8).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            sun=sun+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });  
                $("#sun_v_t input:first").val(sun==0?"00":sun);
                let total = 0;  
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(9).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input:first").val()))){
                            total=total+Number(jQuery(this).find("input:first").val());
                        };
                    }); 
                });  
                $("#htotal input:first").val(total==0?"00":total); 
            };

      
            function fetchwork(){   
                let sd = $("#startDate").val();
                let ed = $("#endDate").val();
                let workStatus=0;
                let data = {
                        startDate:$("#startDate").val(),
                        endDate:$("#endDate").val(),
                    }
                $.ajax({
                    async : false,
                    type: 'POST',
                    url: 'work-status',
                    data:JSON.stringify(data),
                    contentType :'application/json',
                    success: function (da) {
                        workStatus=da; 
                    }
                });
                let uri = ''; 
                if(workStatus == 'Pending' ||  workStatus == 'Approved' || workStatus == 'Rejected'){
                    uri = '/fetch-work-by-id?startDate='+sd+'&endDate='+ed; 
                }else{
                    uri = '/fetchworkjson?startDate='+sd+'&endDate='+ed; 
                }
                    $.ajax({
                        async : false,
                        url: uri,
                        type: 'GET',
                        dataType: 'json',
                        success: function(obj, success,event){
                            for (let i = $('#tbtable tr').length -2 ; i > 0; i--) {
                                $('#tbtable tr').eq(i).remove();
                            }
                        
                            var d = Object.entries(obj); 
                            if(workStatus == 'Pending' ||  workStatus == 'Approved' || workStatus == 'Rejected' ){
                                    for (let i = 0; i < d.length; i++) {
                                    let row = document.createElement("tr");
                                    let spn = d[i][0];
                                    let cstr = spn.replace("[",'').replace("]",'').replace(",",'');
                                    let arr = cstr.split(' ');
                                    let sl = '<td><p class="text-center border rounded p-1 mt-1 bg-white"  style="opacity: 0.8;" >'+arr[0] +' </p></td>' 
                                            + '<td  colspan="2"> <p class="text-center border rounded bg-white p-1 mt-1"  style="opacity: 0.8;" > '+arr[1] +' </p> </td> ' ;
                                        
                                    for (let j = 0; j <d[i][1].length; j++) {
                                        if( d[i][1][j]["id"] == 0){
                                            let hours = d[i][1][j]["hours"]; 
                                            let descr = d[i][1][j]["descr"];   
                                            let t =  ' <td>'
                                                +' <input type="number"    name="hours"     readonly    class="d-inline form-control input-sm w-75 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH"> ' 
                                                +' <textarea class="h-n h-n-blank"   name="descr"   readonly    ></textarea>' 
                                                +' </td>';
                                            row.innerHTML = (( row.innerHTML.toString()) + t);
                                        }
                                        else{
                                            let hours = d[i][1][j]["hours"]; 
                                            let descr = d[i][1][j]["descr"];    
                                            let   t = ' <td> ' 
                                                +' <input type="number"  value='+hours+'    name="hours"  readonly  class=" d-inline form-control input-sm w-75 " oninput="cal(this)" onchange="cal(this)"  placeholder="HH">' 
                                                +' <textarea class="h-n    '+ (descr==""?" h-n-empty":"")+'"  name="descr"   readonly  >' +descr +'</textarea>'  
                                                +'</td>';
                                            row.innerHTML = (( row.innerHTML.toString()) + t);
                                        }  
                                    }   
                                    row.innerHTML =  ( sl +( row.innerHTML.toString()) +'<td class="text-center">   <input input type="number"  readonly  class="d-inline form-control input-sm w-75 " />  </td>' );
                                    $("#tbtable").append(row);
                                }
                                $("#btnSubmit").val("Approved").attr('disabled',true).removeClass("btn-success btn-danger  btn-primary ");
                                $("#btnSave").val("Saved").attr('disabled',true);
                                if( workStatus == 'Approved' ){
                                    $("#btnSubmit").val("Approved").addClass("btn-success");
                                }
                                else if (workStatus == 'Rejected' ){
                                    $("#btnSubmit").val("Rejected").addClass("btn-danger");
                                }
                                else{
                                    $("#btnSubmit").val("Submitted").addClass("btn-primary");
                                }
                            }else{
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
                                                +' <textarea class="h-n    '+ (descr==""?" h-n-empty":"")+'"  name="descr"     >' +descr +'</textarea>'  
                                                +'</td>';
                                            row.innerHTML = (( row.innerHTML.toString()) + t);
                                        }  
                                    }   
                                    row.innerHTML =  ( sl +( row.innerHTML.toString()) +'<td class="text-center">   <input input type="number"  readonly  class="d-inline form-control input-sm w-75 " /> </td>' );
                                    $("#tbtable").append(row);
                                }
                                $("#btnSubmit").val("Submit").attr('disabled',false).removeClass("btn-success btn-danger  btn-primary ").addClass("btn-success");
                                $("#btnSave").val("Save").attr('disabled',false);
                            }
                            calRowOnLoad();
                            AddHoverToHourIn();
                            setWeekDates();
                            let rowCount = $('#tbtable tr').length;
                            if(rowCount == 2) { tblRefresh();}
                        }
                    });
                }
                function tblRefresh(){
                    $("#tue_v_t input:first ").val('00');
                    $("#mov_v_t input:first ").val('00');
                    $("#web_v_t input:first ").val('00');
                    $("#thu_v_t input:first ").val('00');
                    $("#fri_v_t input:first ").val('00');
                    $("#sat_v_t input:first ").val('00');
                    $("#sun_v_t input:first ").val('00');
                    $("#htotal  input:first ").val('00'); 
                }
                function calRowOnLoad() { 
                    let rowCount = $('#tbtable tr').length;
                    for (let i = 1; i < rowCount; i++) {
                        $('#tbtable tr:eq('+i+') td:eq(2) input:first').change();
                    }
                };
                function tblDataSave(){
                    $("#btnSave").blur();
                    $.ajax({
                        async:false,
                        type: 'post',
                        url: 'deletework',
                        data:  html2jsonForDelete(),
                        contentType: "application/json; charset=utf-8",
                        traditional: true,
                        success: function () {
                        }
                    }); 
                    let data = html2json();    
                    if(data.length>2){
                        $.ajax({
                            async:false,
                            type: 'post',
                            url: 'savework',
                            data:  data,
                            contentType: "application/json; charset=utf-8",
                            traditional: true,
                            success: function () {
                                fetchwork();
                            }
                        });     
                    }else{
                        alert("Please Enter work report data");
                        return 0;
                    }
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
          
            function btnSubmitWorkReport(ref){
                if(confirm("Do you want to Submit !!!") &&  tblDataSave()!=0){
               
                let data = {
                    startDate:$("#startDate").val(),
                    endDate:$("#endDate").val(),
                    status:'Pending'
                }
               let uri =  'submit-work';
				$.ajax({
                    async : false,
					type: 'POST',
					url: uri,
					data:JSON.stringify(data),
				    contentType :'application/json',
					success: function () {
                        fetchwork();
                    }
				}); 
			}
            $(ref).blur();
            }
            fetchworkCurrentReport();
        </script>
    </body>
</html>
<%@ include file="footer-fixed-bottom.jsp" %>