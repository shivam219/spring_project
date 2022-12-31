
<%@ include file="menu.jsp" %>
<head> 
    <script src="css/sweetalert.min.js"></script>
    <!-- <meta name="viewport" content="width=device-width, initial-scale=0.5"> -->
    <title> Work Report Day</title>
    <style> 
        table tr td ,  table tr th{
		overflow: hidden;
	    }
        table {
            table-layout: fixed;
        }
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        input[type=number] {
            -moz-appearance: textfield;
        }
 
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
            background-color: #e8eae6;
            box-sizing: border-box;
            padding: 20px;
            z-index: 10;
            display: none; 
            position: absolute;
            transition: all 0.4s ease-in-out;
            font-weight: bold;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

         .container{
            z-index: 1;
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
 
        .holiday-leave-card{
            height: 130px;
            overflow-y: auto;
        }

        table tbody tr td{
            overflow: overlay;
        }
    </style>     
    </head>
    <body > 
      
        <div class="acti_desc" class="rounded-start"  style="  border: 2px solid rgb(206, 204, 204);   ">
            <label onmouseenter="newActiDescPopSave()"  class=" text-start btn btn-sm btn-secondary me-4 ">close</label>
            <span class="align-middle text-secondary fw-normal h6">Activity Description </span>
            <hr>
            <div class="form-group mt-4 ">
                <textarea class="form-control" id="acti_desc"  rows="6"  style="resize: none;"
                    placeholder="Enter description here....."></textarea>
            </div>
         </div> 

        <div class="container" >
            <div class="row rounded m-0 p-0 ">
                <br><br>
                <h1 class=" h4 m-0 my-3 py-2 fw-normal  dashboard-headling  d-none">Weekly Updates </h1> 
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
                    <input type="button" class="btn btn-success btn-sm h-75 "  onclick="tblDataSubmit();this.blur();"    value="Submit" id="btnSubmit" >
                </div>
            </div>
            <div class="row ">
                <div class="col">
                    <div class="table-responsive">
                        <table class="table   mb-0 mt-0 " id="tbtable"  >
                            <thead>
                                <tr >
                                    <td colspan="2"> Customer </td>
                                    <td colspan="2.9"> Project </td> 
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
                </div>   
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
            
            <div class="row justify-content-around ">
                <div class="col"> 
                    <a class="btn btn-secondary btn-sm px-5 py-1" type="button" href="home" > Back  </a> 
                </div>
                <div class="col">
                        <a href="project-request" class="btn btn-sm btn-primary">Request Project</a>
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
                $("#startDate").val(formatDate(sd));
                $("#endDate").val(formatDate(ed));
                setWeekDates();
                fetchwork();
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
                     }); fetch
                });  
                $("#htotal").html(total==0?"":total); 
            };
            function fetchwork(){   
                let sd = $("#startDate").val();
                let ed = $("#endDate").val();
                let workStatus=0;
                $.ajax({
                    async : false,
                    type: 'POST',
                    url: 'day-sheet-status?startDate='+sd+'&endDate='+ed,
                    success: function (da) {
                        workStatus=  parseInt(da); 
                    }
                });
                let uri = 'fetch-day-sheet-week?startDate='+sd+'&endDate='+ed; 
                $.ajax({
                    async : false,
                    url: uri,
                    type: 'GET',
                    dataType: 'json',
                    success: function(obj, success,event){
                        for (let i = $('#tbtable tr').length -2 ; i > 0; i--) {
                            $('#tbtable tr').eq(i).remove();
                        }
                        if(workStatus == 2  || workStatus == 3 ){
                                for (let i = 0; i < obj.length; i++) {
                                let row = document.createElement("tr");
                                let sl = '<td  colspan="2" > '+ obj[i]['customerName'] +' </td>' 
                                        + '<td  colspan="2"> '+ obj[i]['projectName'] +'  </td> ';
                                for (let j = 0; j <obj[i]['daysheet'].length; j++) {  
                                    if( obj[i]['daysheet'][j]["daySheetId"] == 0){
                                        let hour = obj[i]['daysheet'][j]['hour'];
                                        let descr = obj[i]['daysheet'][j]['descr'];    
                                        let t = ' <td>'
                                            +' <input type="number"    name="hour"     readonly    oninput="cal(this)" onchange="cal(this)"  placeholder=""> ' 
                                            +' <textarea class="d-none h-n"             name="descr"          ></textarea>' 
                                            + '<div class="h-n"></div>' 
                                            +' </td>'; 
                                        row.innerHTML = (( row.innerHTML.toString()) + t);
                                    }
                                    else{ 
                                        let hour = obj[i]['daysheet'][j]['hour']; 
                                        let descr = obj[i]['daysheet'][j]['descr'];    
                                        let   t = ' <td> ' 
                                            +' <input type="number"  value='+hour+'  class="d-inline w-50 "  name="hour"  readonly   oninput="cal(this)" onchange="cal(this)"  placeholder="">' 
                                            +' <textarea class="d-none '+(descr==''?'h-n':'')+' "  name="descr" >' +descr +'</textarea>'  
                                            + '<div class="h-n class="d-inline w-50"></div>'
                                            +'</td>';
                                        row.innerHTML = (( row.innerHTML.toString()) + t);
                                    }  
                                }   
                                row.innerHTML =  ( sl +( row.innerHTML.toString()) +'<td>   <input  type="number"  readonly  />  </td>' );
                                $("#tbtable").append(row);
                            }
                            $("#btnSubmit").attr('disabled',true);
                            $("#btnSave").addClass("d-none");
                            if( workStatus == 3 ){
                                $("#btnSubmit").val("Approved");
                            }
                            else{
                                $("#btnSubmit").val("Pending");
                            }
                        }else{
                            for (let i = 0; i < obj.length; i++) {
                                let row = document.createElement("tr");
                                let sl = '<td  colspan="2" > '+ obj[i]['customerName'] +' </td>' 
                                        + '<td  colspan="2"> '+ obj[i]['projectName'] +'  </td> ';
                                for (let j = 0; j <obj[i]['daysheet'].length; j++) {     
                                    if( obj[i]['daysheet'][j]["daySheetId"] == 0){
                                        let hour = obj[i]['daysheet'][j]['hour']
                                        let pId =   obj[i]['daysheet'][j]['projectId']
                                        let dId =   obj[i]['daysheet'][j]['daySheetId']
                                        let MId = obj[i]['daysheet'][j]['monthId']
                                        let day =   obj[i]['daysheet'][j]['date']
                                        let descr = obj[i]['daysheet'][j]['descr'] 
                                        let t =  ' <td class="h-auto" >'
                                            +' <input type="number"  name="hour"        min="1" max="24"       class="d-inline  " oninput="cal(this)" onchange="cal(this)"  > ' 
                                            +' <input type="number"  value='+pId+'      name="projectId"      class="d-inline d-none"  > ' 
                                            +' <input type="number"  value='+MId+'      name="monthId"    class="d-inline d-none"  > ' 
                                            +' <input type="date"    value='+day+'      name="date"            class="d-inline d-none"  >'  
                                            +' <textarea class="d-none h-n"             name="descr"          ></textarea>' 
                                            + '<div class="h-n"></div>' 
                                            +' </td>';
                                            row.innerHTML = (( row.innerHTML.toString()) + t);
                                    }
                                    else{
                                        let hour = obj[i]['daysheet'][j]['hour']
                                        let pId =   obj[i]['daysheet'][j]['projectId']
                                        let dId =   obj[i]['daysheet'][j]['daySheetId']
                                        let MId = obj[i]['daysheet'][j]['monthId']
                                        let day =   obj[i]['daysheet'][j]['date'] 
                                        let descr = obj[i]['daysheet'][j]['descr'];      
                                        let   t = ' <td class="h-auto"> ' 
                                            +' <input type="number"  value='+hour+'  name="hour"        min="1" max="24"       class="d-inline  " oninput="cal(this)" onchange="cal(this)"  > ' 
                                            +' <input type="number"  value='+pId+'      name="projectId"      class="d-inline d-none"  > ' 
                                            +' <input type="number"  value='+dId+'      name="daySheetId"          class="d-inline d-none"  > ' 
                                            +' <input type="number"  value='+MId+'      name="monthId"    class="d-inline d-none"  > ' 
                                            +' <input type="date"    value='+day+'      name="date"            class="d-inline d-none"  >' 
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
                    let data = html2json();    
                    if(data.length>2){
                        $.ajax({
                            async:false,
                            type: 'post',
                            url: 'day-sheet-save?startDate='+ $("#startDate").val()+'&endDate='+ $("#endDate").val(),
                            data:  data,
                            contentType: "application/json; charset=utf-8",
                            traditional: true,
                            success: function () {
                                fetchwork();
                            }
                        }); 
                        swal({
                            position: 'end',
                            icon: 'success',
                            title: 'Your work has been saved',
                            showConfirmButton: false,
                            timer: 500
                        });      
                    }else{
                        alert("Please Enter work report data");
                        return 0;
                    }
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
          
            function tblDataSubmit(){
                if(confirm("Do you want to submit")){
                    let data = html2json();    
                    if(data.length>2){
                        $.ajax({
                            async:false,
                            type: 'post',
                            url: 'day-sheet-save?startDate='+ $("#startDate").val()+'&endDate='+ $("#endDate").val()+"&saveType=1" , 
                            data:  data,
                            contentType: "application/json; charset=utf-8",
                            traditional: true,
                            success: function () {
                                fetchwork();
                            }
                        });     
                    }else{
                        alert("Please Enter work report data");
                    }
                }
            }
            fetchworkCurrentReport();
        </script>
    </body>
</html>