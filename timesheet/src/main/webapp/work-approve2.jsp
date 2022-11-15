<%@ include file="menu.jsp" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map.*"%>
<%@page import="java.util.Arrays"%> 
<html lang="en">
<head> 
    <title>Approve Work Report</title>
    <style> 
      table tr td ,  table tr th{
		overflow: hidden;
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
        .h-n{
            cursor:grab;
            border-top: 12px solid transparent;
            border-right: 12px solid transparent; 

        }
        .acti_desc {
            right: 0px;
            height: 100vh;
            width: 350px;
            text-align: center;
            background-color: #e8eae6;
            box-sizing: border-box;
            padding: 20px;
            z-index: 10;
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
            z-index: 1;
         }
        table tfoot tr:last-child td:first-child {
            border-bottom-left-radius: 5px;
        }
    
        table tfoot tr:last-child td:last-child {
            border-bottom-right-radius: 5px;
        }
        h5{
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            background-image: linear-gradient(108.1deg, rgba(167, 220, 225, 1) 11.2%,rgb(174, 221, 228) 88.9%); 
            border-radius:20px ;
        }
        #tbtable thead { 
            border-radius: 3px;  
         }
         .op{opacity: 0.9;}
         tbody, td, tfoot, th, thead, tr { 
            border-bottom: none !important;
            border-width: 1px; 
            border-collapse: separate;
            font-style: normal;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            text-align: center;
            color: rgb(70, 69, 67);
        } 
        tr td input{
            text-align: center;
            color: rgb(70, 69, 67);
            border: none !important;
            outline: none;
            box-shadow: none; 
            width: 100%;
        }
        table tr,.row-color {
            background-color: #fff
        }   
 
        .table>:not(caption)>*>* {
            padding: 0.50rem 0.75rem;
        }
        p, h1,h2,h3,h4,h5,h6{
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }
        ul li{
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-weight: 500;
            color: rgb(131, 130, 130); 
        }   
        .holiday-leave-card{
            height: 130px;
            overflow-y: auto;
        }
    </style>
    
    <link href="css/select@2.4.1.0.min.css" rel="stylesheet" />
    </head>

    <body > 
      
        <div class="container" >
            <div class="row rounded m-0 p-0  ">
                <br><br> 
                <!-- <h5 class="text-center text-secondary h3 my-3 py-2 ">Approve Work Report</h5> -->
            </div>
            <div class="row align-middle bg-white pt-2 mx-0  rounded-top"  >
                <div class="col align-middle">
                    <select name="empList" id="empList" class="w-100" onchange="fetchEmpWork()" style="outline: none;"> 
                        <option ></option>
                        <c:forEach items="${empList}" var="emp" varStatus="loop">
                            <option value="${emp.getEmpId()}">${emp.getFirstName()} ${emp.getLastName()}
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
            <table class="table mb-0 mt-0 rounded " id="tbtable"  >
                <thead>
                    <tr class="   "  >
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
                    <td colspan='11' >No Data available</td>
                </tbody>
                <tfoot class="" >
                    <td colspan="3" class="text-center"> </td>
                    <td id="mov_v_t"> </td>
                    <td id="tue_v_t"> </td>
                    <td id="web_v_t"> </td>
                    <td id="thu_v_t"> </td>
                    <td id="fri_v_t"> </td>
                    <td id="sat_v_t"> </td>
                    <td id="sun_v_t"> </td>
                    <td id="htotal" > </td>
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
                        prevActivityDesc = $(this).siblings("textarea:first"); 
                        $("#acti_desc").val($(this).siblings("textarea").html());
                        actiDescPopShow();
                    }
                });
                $('#tbtable tr').addClass("");
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
                $("#monDate").html('Mon &nbsp; '+ new Date($("#startDate").val()).getDate());
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 1);
                $("#tueDate").html('Tue &nbsp; '+ ( new Date((formatDate(sd))).getDate()));
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 2);
                $("#wedDate").html('Wed &nbsp;'+ ( new Date((formatDate(sd))).getDate()));
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 3);
                $("#thuDate").html('Thu &nbsp;'+ ( new Date((formatDate(sd))).getDate()));
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 4);
                $("#friDate").html('Fri &nbsp; '+ ( new Date((formatDate(sd))).getDate()));
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 5);
                $("#satDate").html('Sat &nbsp; '+ ( new Date((formatDate(sd))).getDate()));
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 6);
                $("#sunDate").html('Sun &nbsp;'+ ( new Date((formatDate(sd))).getDate()));
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
            /*horizontal total*/
            function cal(ob){
                if($(ob).val()>24){
                    $(ob).val('');
                }
                else if($(ob).val()=="" || $(ob).val()>0){
                    let rsum=0;    
                    $(ob).closest('tr').find('td').each(function(){
                        if(!isNaN(Number(jQuery(this).find("input:first").val()))){
                            rsum=rsum+Number(jQuery(this).find("input:first").val());
                        };
                        rsum;
                    });
                    $(ob).closest("tr").find("td:eq(9) input:first ").val(rsum==0?"":rsum);
                    calculate();
                }
            } 
            /*vertical total*/
            function calculate(){      
                tblRefresh();
                let mon = 0;             
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(2).each(function(){
                        if($(this).find("input").eq(0).val()){
                            mon=mon+Number($(this).find("input").val());
                            $(this).find("input").eq(0).siblings("div").eq(0).css({"border-right":"12px solid #555"});
                        }else{
                            $(this).find("input").eq(0).siblings("div").eq(0).css({"border-right":"12px solid transparent"});
                        }
                     }) 
                });
              
                $("#mov_v_t ").html(mon==0?"":mon);
                let tue = 0;
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(3).each(function(){
                        if($(this).find("input").eq(0).val()){
                            tue=tue+Number(jQuery(this).find("input").val());
                            $(this).find("input").eq(0).siblings("div").eq(0).css({"border-right":"12px solid #555"});
                        }else{
                            $(this).find("input").eq(0).siblings("div").eq(0).css({"border-right":"12px solid transparent"});
                        }
                    }) 
                });
                $("#tue_v_t   ").html(tue==0?"":tue);
                let wed = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(4).each(function(){
                        if($(this).find("input").eq(0).val()){
                            wed=wed+Number(jQuery(this).find("input").val());
                            $(this).find("input").eq(0).siblings("div").eq(0).css({"border-right":"12px solid #555"});
                        }else{
                            $(this).find("input").eq(0).siblings("div").eq(0).css({"border-right":"12px solid transparent"});
                        }
                    }) 
                });
                $("#web_v_t ").html(wed==0?"":wed);
                let thu = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(5).each(function(){ 
                        if($(this).find("input").eq(0).val()){
                            thu=thu+Number(jQuery(this).find("input").val());
                            $(this).find("input").eq(0).siblings("div").eq(0).css({"border-right":"12px solid #555"});
                        }else{
                            $(this).find("input").eq(0).siblings("div").eq(0).css({"border-right":"12px solid transparent"});
                        }
                    }) 
                }); 
                $("#thu_v_t ").html(thu==0?"":thu);

                let fri = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(6).each(function(){
                        if($(this).find("input").eq(0).val()){
                            fri=fri+Number(jQuery(this).find("input").val());
                            $(this).find("input").eq(0).siblings("div").eq(0).css({"border-right":"12px solid #555"});
                        }else{
                            $(this).find("input").eq(0).siblings("div").eq(0).css({"border-right":"12px solid transparent"});
                        }
                    }) 
                }); 
                $("#fri_v_t ").html(fri==0?"":fri);
 
                let sat = 0; 
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(7).each(function(){
                        if($(this).find("input").eq(0).val()){
                            sat=sat+Number(jQuery(this).find("input").val());
                            $(this).find("input").eq(0).siblings("div").eq(0).css({"border-right":"12px solid #555"});
                        }else{
                            $(this).find("input").eq(0).siblings("div").eq(0).css({"border-right":"12px solid transparent"});
                        }
                    }) 
                });  
                $("#sat_v_t  ").html(sat==0?"":sat);

                let sun = 0;  
                $('#tbtable tr' ).each( function () {
                    jQuery(this).find('td').eq(8).each(function(){
                        if($(this).find("input").eq(0).val()){
                            sun=sun+Number(jQuery(this).find("input").val());
                            $(this).find("input").eq(0).siblings("div").eq(0).css({"border-right":"12px solid #555"});
                        }else{
                            $(this).find("input").eq(0).siblings("div").eq(0).css({"border-right":"12px solid transparent"});
                        }
                    }) 
                });  
                $("#sun_v_t ").html(sun==0?"":sun);
                /*vertically calulating last td data*/
                let total = 0;  
                $('#tbtable tr' ).each( function () {
                    $(this).find('td').eq(9).each(function(){
                       if(!(isNaN(new String($(this).html()).trim() ))){
                        total = total +  Number( $(this).html());
                       }
                     }); 
                });  
                $("#htotal").html(total==0?"":total); 
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
                    let uri =  '/fetch-work-submitted?startDate='+sd+'&endDate='+ed+'&empId='+empId;
                        $.ajax({
                            async : false,
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
                                    let sl = '<td> '+arr[0] +' </td>' 
                                            + '<td  colspan="2"> '+arr[1] +'  </td> ' ;      
                                            for (let j = 0; j <d[i][1].length; j++) {
                                        if( d[i][1][j]["id"] == 0){
                                            let hours = d[i][1][j]["hours"]; 
                                            let descr = d[i][1][j]["descr"];   
                                            let t =  ' <td>'
                                                +' <input type="number"    name="hours"     readonly    oninput="cal(this)" onchange="cal(this)"  placeholder=""> ' 
                                                +' <textarea class="d-none h-n"          name="descr"          ></textarea>' 
                                                +' </td>';
                                            row.innerHTML = (( row.innerHTML.toString()) + t);
                                        }
                                        else{
                                            let hours = d[i][1][j]["hours"]; 
                                            let descr = d[i][1][j]["descr"];    
                                            let   t = ' <td> ' 
                                                +' <input type="number"  value='+hours+'    name="hours"  readonly   oninput="cal(this)" onchange="cal(this)"  placeholder="">' 
                                                +' <textarea class="d-none" name="descr" >' +descr +'</textarea>'  
                                                + '<div class="h-n"></div>'
                                                +'</td>';
                                            row.innerHTML = (( row.innerHTML.toString()) + t);
                                        }  
                                    }   
                                    row.innerHTML =  ( sl +( row.innerHTML.toString()) +'<td>   <input  type="number"  readonly  />  </td>' );
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
                        let row = document.createElement("tr");
                        row.innerHTML= "<td colspan='11' > <p class='text-center text-dark p-0 m-0'>No Data available</p></td>";
                        $("#tbtable").append(row);
                        tblRefresh();
                        $("#btnApprove").val("Approve").attr('disabled',true);
                        $("#btnReject").val("Reject").attr('disabled',true);
                    }
                            
                }
                function tblRefresh(){
                    $("#tue_v_t").html('');
                    $("#mov_v_t").html('');
                    $("#web_v_t").html('');
                    $("#thu_v_t").html('');
                    $("#fri_v_t").html('');
                    $("#sat_v_t").html('');
                    $("#sun_v_t").html('');
                    $("#htotal ").html(''); 
                }
                function calRowOnLoad() { 
                    let rowCount = $('#tbtable tr').length;
                    for (let i = 1; i < rowCount; i++) {
                        $('#tbtable tr:eq('+i+') td:eq(2) input:first').change();
                    }
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
                    // alert("No Employee Selected")
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
                }
                $(ref).blur();
			}
            function fetchEmpWork(){
                var empId = $("#empList").val(); 
                if(empId){
                    fetchwork();
                }else{
                    for (let i = $('#tbtable tr').length -2; i > 0; i--) {
                    $('#tbtable tr').eq(i).remove();
                }
                let row = document.createElement("tr");
                    row.innerHTML= "<td colspan='11' > <p class='text-center text-dark p-0 m-0'>No Data available</p></td>";
                    $("#tbtable").append(row);
                    tblRefresh();
                }
            }

        </script>
    </body>
</html>
<%@ include file="footer-fixed-bottom.jsp" %>