
<%@ include file="menu.jsp" %>
<head> 
    <meta name="viewport" content="width=device-width, initial-scale=0.5">
    <title> Work Report</title>
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
            vertical-align: middle;
            padding: 0.2rem 0.2rem;

        }
        p, h1,h2,h3,h4,h5,h6{
            font-family: Verdana, Geneva, Tahoma, sans-serif;
        }

        .holiday-leave-card{
            height: 130px;
            overflow-y: auto;
        }

    </style>     
    </head>
    <body > 
      
        <div class="container" >
            <div class="row rounded m-0 p-0 ">
                <br><br>
                <h1 class="text-secondary h4 m-0 my-3 py-2 fw-normal  dashboard-headling ">Weekly Updates </h1> 
            </div>
            <div class="row align-middle  pt-2 mx-0  rounded-top row-color "   >
                <div class="col fw-bold text-center align-middle">
                    <span class="align-middle text-gray fw-light h5 "> Time Period</span>
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
                    <input type="button" class="btn badge-soft-primary btn-sm pe-3 ps-3 me-2 h-75 "  onclick="tblDataSave()" value="save" id="btnSave" >
                    <input type="button" class="btn btn-success btn-sm h-75 "  onclick="btnSubmitWorkReport(this)"    value="Submit" id="btnSubmit" >
                </div>
            </div>
            <table class="table   mb-0 mt-0 " id="tbtable"  >
                <thead>
                    <tr >
                        <td colspan="2"> Customer </td>
                        <td colspan="2"> Project </td> 
                        <td  id="monDate" >  Mon </td>
                        <td  id="tueDate" >  Tue </td>
                        <td  id="wedDate" >  Wed </td>
                        <td  id="thuDate" >  Thu </td>
                        <td  id="friDate" >  Fri </td>
                        <td  id="satDate" >  Sat </td>
                        <td  id="sunDate" >  Sun </td>
                        <td class="text-center" id="Date">Total</td>  
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
                <tfoot >
                    <td colspan="4" class="text-center"> </td>
                    <td id="mov_v_t" ></td>
                    <td id="tue_v_t" ></td>
                    <td id="web_v_t" ></td>
                    <td id="thu_v_t" ></td>
                    <td id="fri_v_t" ></td>
                    <td id="sat_v_t" ></td>
                    <td id="sun_v_t" ></td>
                    <td id="htotal"  ></td>
                </tfoot>
            </table>
        </div>
       
        <div class="acti_desc" class="rounded-start"  style="  border: 2px solid rgb(206, 204, 204);   float: right;">
            <div class="mt-3 ">
                <p onclick="newActiDescPopSave()" class="close-btn  ">X</p>
                <span class="align-middle text-gray fw-normal h5">Activity Description </span>
            </div>
            <hr>
            <div class="form-group mt-4 ">
                <textarea class="form-control" id="acti_desc"  rows="6"  style="resize: none;"
                    placeholder="Enter description here....."></textarea>
            </div>
         </div> 
        <div class="container">
            <div class="row py-4">
                <div class="col-md-6">
                    <div class="card text-secondary">
                        <div class="card-header text-center text-success">
                            Holidays 
                        </div>
                        <div class="card-body  holiday-leave-card">
                            <ul class="list-group list-group-flush ms-3" id="weekHoliday" >
                            </ul> 
                        </div>
                    </div>                    
                </div> 
                <div class="col-md-6"> 
                    <div class="card text-secondary">
                        <div class="card-header text-center text-success  ">
                            Leaves 
                        </div>
                        <div class="card-body  holiday-leave-card">
                            <ul class="list-group list-group-flush ms-3" id="weekLeaves">
                            </ul> 
                        </div>
                    </div>                    
                </div>                         
            </div>
        </div>
        <script>
             function actiDescPopShow (){
                $(".acti_desc").show();
            }
            var prevActivityDesc = null ;
            function newActiDescPopSave(){
                $(prevActivityDesc).html($("#acti_desc").val());
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
                let uri = '/week-holidays?startDate='+ $("#startDate").val()+'&endDate='+ $("#endDate").val(); 
                $.ajax({
                    async : false,
                    type: 'GET',
                    url: uri,
                    contentType :'application/json',
                    success: function (da) {
                        let str = '';
                        for (let i = 0; i < da.length; i++) { 
                            let ss = (da[i]);
                            str = str + '<li>'  + ss+'  </li>';
                        }
                        $("#weekHoliday").html(str);
                    }
                });
                let uri2 = '/week-leaves?startDate='+ $("#startDate").val()+'&endDate='+ $("#endDate").val(); 
                $.ajax({
                    async : false,
                    type: 'GET',
                    url: uri2,
                    contentType :'application/json',
                    success: function (da) {
                        let str = '';
                        for (let i = 0; i < da.length; i++) { 
                            let ss = (da[i]);
                            str = str + '<li>'  + ss+'  </li>';
                        }
                        $("#weekLeaves").html(str);
                    }
                });
                $("#monDate").html('Mon &nbsp'+ (new Date($("#startDate").val()).getDate()));
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 1);
                $("#tueDate").html('Tue &nbsp;'+ (new Date((formatDate(sd))).getDate()));
                
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 2);
                $("#wedDate").html('Wed &nbsp;'+(new Date((formatDate(sd))).getDate()));
                
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 3);
                $("#thuDate").html('Thu &nbsp;'+ (new Date((formatDate(sd))).getDate()));
                
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 4);
                $("#friDate").html('Fri &nbsp;' +(new Date((formatDate(sd))).getDate()));
                
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 5);
                $("#satDate").html('Sat &nbsp;'+(new Date((formatDate(sd))).getDate()));
                
                var sd = new Date($("#startDate").val());
                sd.setDate(sd.getDate() + 6);
                $("#sunDate").html('Sun &nbsp;'+(new Date((formatDate(sd))).getDate()));
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
            //    new code 
                $("#startDate").val(formatDate(sd));
                $("#endDate").val(formatDate(ed));
                setWeekDates();
                fetchwork();
                // end here
                // commenting some code 
                // if(now>sd){
                //     $("#startDate").val(formatDate(sd));
                //     $("#endDate").val(formatDate(ed));
                //     setWeekDates();
                //     fetchwork();
                // }else{
                //     alert("Unable to fetch next week data");
                // }
                $("#btnNextWeekReport").blur();
            }
            function cal(ob){
                if($(ob).val()>24){
                    $(ob).val(''); 
                    calculate();
                }
                else if($(ob).val()=="" || $(ob).val()>0){
                    let rsum=0;   
                    $(ob).closest("tr").find("td:eq(9) ").html('');
                    $(ob).closest('tr').find('td').each(function(){
                        if(!isNaN(Number(jQuery(this).find("input:first").val()))){
                            rsum=rsum+Number(jQuery(this).find("input:first").val());
                        };
                        rsum;
                    });
                    $(ob).closest("tr").find("td:eq(9) ").html(rsum==0?"":rsum);
                    calculate();
                } 
            }

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
                            console.log(obj);
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
                                    let sl = '<td  colspan="2"> '+arr[0] +' </td>' 
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
                                $("#btnSubmit").attr('disabled',true);
                                $("#btnSave").addClass("d-none");
                                if( workStatus == 'Approved' ){
                                    $("#btnSubmit").val("Approved");
                                }
                                else if (workStatus == 'Rejected' ){
                                    $("#btnSubmit").val("Rejected");
                                }
                                else{
                                    $("#btnSubmit").val("Submitted");
                                }
                            }else{
                                for (let i = 0; i < d.length; i++) {
                                    let row = document.createElement("tr");
                                    let spn = d[i][0];
                                    let cstr = spn.replace("[",'').replace("]",'').replace(",",'');
                                    let arr = cstr.split(' ');
                                    let sl = '<td  colspan="2" > '+arr[0] +' </td>' 
                                            + '<td  colspan="2"> '+arr[1] +'  </td> ' ;
                                       
                                    for (let j = 0; j <d[i][1].length; j++) {
                                        if( d[i][1][j]["id"] == 0){
                                            let eId = d[i][1][j]["empId"];
                                            let pId = d[i][1][j]["projectId"];
                                            let pName = d[i][1][j]["projectName"];
                                            let hours = d[i][1][j]["hours"]; 
                                            let descr = d[i][1][j]["descr"];   
                                            let day = d[i][1][j]["day"];    
                                            let t =  ' <td class="h-auto" >'
                                                +' <input type="number"  name="hours"       min="1" max="24"      class="d-inline  " oninput="cal(this)" onchange="cal(this)"  placeholder=""> ' 
                                                +' <input type="number"  value='+eId+'      name="empId"          class="d-inline d-none"  > ' 
                                                +' <input type="number"  value='+pId+'      name="projectId"      class="d-inline d-none"  > ' 
                                                +' <input type="text"    value='+pName+'    name="projectName"    class="d-inline d-none"  > ' 
                                                +' <input type="date"    value='+day+'      name="day"            class="d-inline d-none"  >'  
                                                +' <textarea class="d-none h-n"          name="descr"          ></textarea>' 
                                                + '<div class="h-n"></div>'
                                                +' </td>';
                                            row.innerHTML = (( row.innerHTML.toString()) + t);
                                        }
                                        else{
                                            let id = d[i][1][j]["id"];
                                            let eId = d[i][1][j]["empId"];
                                            let pId = d[i][1][j]["projectId"];
                                            let pName = d[i][1][j]["projectName"];
                                            let hours = d[i][1][j]["hours"]; 
                                            let descr = d[i][1][j]["descr"]=="null"?"":d[i][1][j]["descr"];  
                                            let day = d[i][1][j]["day"];      
                                            let   t = ' <td class="h-auto"> ' 
                                                +' <input type="number"  value='+hours+'    name="hours" min="1"  max="24"  class=" d-inline " oninput="cal(this)" onchange="cal(this)"  placeholder="">' 
                                                +' <input type="number"  value='+id+'       name="id"                       class=" d-inline d-none"  > ' 
                                                +' <input type="number"  value='+eId+'      name="empId"                    class=" d-inline d-none"  > ' 
                                                +' <input type="number"  value='+pId+'      name="projectId"                class=" d-inline d-none"  > ' 
                                                +' <input type="text"    value='+pName+'    name="projectName "             class=" d-inline d-none"  > ' 
                                                +' <input type="date"    value='+day+'      name="day"                      class=" d-inline d-none" > ' 
                                                +' <textarea class="d-none" name="descr" >' +descr +'</textarea>'  
                                                + '<div class="h-n"></div>'
                                                +'</td>';
                                            row.innerHTML = (( row.innerHTML.toString()) + t);
                                        }  
                                    }   
                                    row.innerHTML =  ( sl +( row.innerHTML.toString()) +'<td> <input  type="number"  readonly  />  </td>' );
                                    $("#tbtable").append(row);
                                }
                                $("#btnSubmit").val("Submit").attr('disabled',false);
                                $("#btnSave").removeClass("d-none");
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
                    $("#tue_v_t").html('');
                    $("#mov_v_t").html('');
                    $("#web_v_t").html('');
                    $("#thu_v_t").html('');
                    $("#fri_v_t").html('');
                    $("#sat_v_t").html('');
                    $("#sun_v_t").html('');
                    $("#htotal") .html(''); 
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