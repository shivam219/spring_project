<%@ include file="menu.jsp" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map.*"%>
<%@page import="java.util.Arrays"%> 
<html lang="en">
<head> 
    <title>Week Work Report</title>
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
    </style>
    
    <link href="css/select@2.4.1.0.min.css" rel="stylesheet" />
    </head>

    <body > 
      
        <div class="container" >
            <div class="row rounded m-0 p-0 ">
                <h5 class="text-center text-secondary h3 my-3 py-2 ">Approve Work Report</h5>
            </div>
            <div class="row align-middle  pt-2 mx-0 tblcolor rounded-top"  >
                <div class="col fw-bold text-center align-middle">
                    <select name="empList" id="empList" class="form-control sl-emp h-100" onchange="fetchEmpWork()" style="outline: none;"> 
                        <option ></option>
                        <c:forEach items="${empList}" var="empName" varStatus="loop">
                            <option value="${empName.getEmpId()}">${empName.getEmpName()}
                            </option>
                        </c:forEach>
                    </select>
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
                    <input type="button" class="btn btn-danger btn-sm pe-3 ps-3 me-2 h-75 rounded"  onclick="rejectWorkReport(this)" value="Reject" id="btnReject" disabled="disabled" >
                    <input type="button" class="btn btn-success btn-sm h-75 rounded" value="Approve" onclick="submitWorkReport(this)" id="btnApprove" disabled="disabled">
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
                <tfoot class="tblcolor" >
                    <td colspan="3" class="text-center"> </td>
                    <td id="mov_v_t"> <p class="text-center border rounded bg-white w-75 py-1" > 00</p> </td>
                    <td id="tue_v_t"> <p class="text-center border rounded bg-white w-75 py-1" > 00</p> </td>
                    <td id="web_v_t"> <p class="text-center border rounded bg-white w-75 py-1" > 00</p> </td>
                    <td id="thu_v_t"> <p class="text-center border rounded bg-white w-75 py-1" > 00</p> </td>
                    <td id="fri_v_t"> <p class="text-center border rounded bg-white w-75 py-1" > 00</p> </td>
                    <td id="sat_v_t"> <p class="text-center border rounded bg-white w-75 py-1" > 00</p> </td>
                    <td id="sun_v_t"> <p class="text-center border rounded bg-white w-75 py-1" > 00</p> </td>
                    <td id="htotal" > <p class="text-center border rounded bg-white w-75 py-1" > 00</p> </td>
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
                <textarea class="form-control" id="acti_desc"  rows="6"  style="resize: none;" readonly
                    placeholder="Enter description here....."></textarea>
            </div>
        </div> 
            <script src="js/select2@4.1.0.min.js"></script>
        <script>
            $('#empList').select2({
                placeholder: "Search employee's",
                allowClear: true
            });
    	</script>
        <script>
            
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
                        $(this).closest("tr").find("td:eq(9) p ").html(rsum==0?"00":rsum);
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
                $("#mov_v_t p").html(mon==0?"00":mon);
                let tue = 0;
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(3).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            tue=tue+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });
                $("#tue_v_t   p").html(tue==0?"00":tue);
                let wed = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(4).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            wed=wed+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });
                $("#web_v_t p").html(wed==0?"00":wed);
                let thu = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(5).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            thu=thu+Number(jQuery(this).find("input").val());
                        };
                    }) 
                }); 
                $("#thu_v_t p").html(thu==0?"00":thu);

                let fri = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(6).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            fri=fri+Number(jQuery(this).find("input").val());
                        };
                    }) 
                }); 
                $("#fri_v_t p").html(fri==0?"00":fri);
 
                let sat = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(7).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            sat=sat+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });  
                $("#sat_v_t p ").html(sat==0?"00":sat);

                let sun = 0;  
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(8).each(function(){
                        if(!isNaN(Number(jQuery(this).find("input").eq(0).val()))){
                            sun=sun+Number(jQuery(this).find("input").val());
                        };
                    }) 
                });  
                $("#sun_v_t p").html(sun==0?"00":sun);
                let total = 0;  
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(9).each(function(){
                        if(!isNaN(Number(jQuery(this).html()))){
                            total=total+Number(jQuery(this).html());
                        };
                    }) 
                });  
                $("#htotal p").html(total==0?"00":total); 
            };

      
            function fetchwork(){   
                for (let i = $('#tbtable tr').length -2 ; i > 0; i--) {
                    $('#tbtable tr').eq(i).remove();
                }
                let sd = $("#startDate").val();
                let ed = $("#endDate").val();
                let empId = $("#empList").val(); 

                let workStatus=0;
                let data = {
                        startDate:$("#startDate").val(),
                        endDate:$("#endDate").val(),
                        empId: $("#empList").val(),
                    }
                $.ajax({
                    async : false,
                    type: 'POST',
                    url: 'work-status',
                    data:JSON.stringify(data),
                    contentType :'application/json',
                    success: function (data) {
                        workStatus=data; 
                    }
                }); 
                if(workStatus == 'Pending' || workStatus == 'Approved' || workStatus == 'Rejected'){
                    let uri =  '/fetch-work-by-id?startDate='+sd+'&endDate='+ed+'&empId='+empId;
                        $.ajax({
                            url: uri,
                            type: 'GET',
                            dataType: 'json',
                            success: function(obj, success,event){ 
                                if( workStatus == 'Approved' ){
                                    $("#btnApprove").val("Approved").attr('disabled',true);
                                    $("#btnReject").val("Reject").attr('disabled',false);
                                } else if (workStatus == 'Rejected'){
                                    $("#btnApprove").val("Approve").attr('disabled',false);
                                    $("#btnReject").val("Rejected").attr('disabled',true);
                                } else{
                                    $("#btnApprove").val("Approve").attr('disabled',false);
                                    $("#btnReject").val("Reject").attr('disabled',false);
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
                                                +' <textarea class="h-n    '+ (descr==""?" h-n-empty":"")+'"  name="descr"   readonly  >'+descr +'</textarea>'  
                                                +'</td>';
                                            row.innerHTML = (( row.innerHTML.toString()) + t);
                                        }  
                                    }   
                                    row.innerHTML =  ( sl +( row.innerHTML.toString()) +'<td class="text-center">  <p class="text-center border rounded bg-white w-75 py-1 "> 00</p> </td>' );
                                    $("#tbtable").append(row);
                                }
                                    calRowOnLoad();
                                    AddHoverToHourIn();
                                    setWeekDates();
                            }
                        });
                    }
                    let rowCount = $('#tbtable tr').length;
                    if(rowCount == 2) {
                        $("#mov_v_t p ").html('00');
                        $("#tue_v_t p ").html('00');
                        $("#web_v_t p ").html('00');
                        $("#thu_v_t p ").html('00');
                        $("#fri_v_t p ").html('00');
                        $("#sat_v_t p ").html('00');
                        $("#sun_v_t p ").html('00');
                        $("#htotal  p ").html('00');
                        $("#btnApprove").val("Approve").attr('disabled',true);
                        $("#btnReject").val("Reject").attr('disabled',true);
                    }
                            
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
             
              

            function getMonday(d = new Date()) {
                d = new Date(d);
                var day = d.getDay(),
                diff = d.getDate() - day + (day == 0 ? -6:1); 
                return new Date(d.setDate(diff));
            }

            function settingLoadDate(){
                let sd = getMonday();
                let ed = getMonday();
                ed.setDate(sd.getDate()+6)
                $("#startDate").val(formatDate(sd));
                $("#endDate").val(formatDate(ed));
            }
            settingLoadDate();

            function rejectWorkReport(ref){
                if( $("#empList").val()){
                    let data = {
                            startDate:$("#startDate").val(),
                            endDate:$("#endDate").val(),
                            empId: $("#empList").val(),
                        }
                    $.ajax({
                        async : false,
                        type: 'POST',
                        url: 'reject-work',
                        data:JSON.stringify(data),
                        contentType :'application/json',
                        success: function () {
                          fetchwork();
                        }
                    }); 
                }else{
                    alert("No Employee Selected")
                }
                $(ref).blur();
            }
            function submitWorkReport(ref){
                if( $("#empList").val()){
                    let data = {
                            startDate:$("#startDate").val(),
                            endDate:$("#endDate").val(),
                            empId: $("#empList").val(),
                        }
                    $.ajax({
                        async : false,
                        type: 'POST',
                        url: 'approve-work',
                        data:JSON.stringify(data),
                        contentType :'application/json',
                        success: function () {
                          fetchwork();
                        }
                    }); 
                }else{
                    alert("No Employee Selected")
                }
                $(ref).blur();
			}
            function fetchEmpWork(){
                var empId = $("#empList").val(); 
                if(empId){
                    fetchwork();
                }else{
                    alert("No Employee Selected")
                }
            }

        </script>
    </body>
</html>
<%@ include file="footer-fixed-bottom.jsp" %>