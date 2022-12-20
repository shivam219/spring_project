<%@ include file="menu.jsp" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <title>Program Edit </title>
        <link rel="stylesheet" href="css/form-style.css">
        <style>
            table {
                border-bottom: 1px solid #ff000d;
            }
        </style>
    </head>

    <body>

        <div class="container-xl px-4 mt-4">
            <div class="row px-4 ">
                <div class="col col-xl-12"> 
                    <div class="card mb-4">
                        <div class="card-header text-center">Edit Program for Group</div>
                        <div class="card-body"> 
                            <form method="post" name="frmGroupmasteredit" id="frmGroupmasteredit" class="form" autocomplete="off" action="program-group-edit-map">
                                <div class="row gx-3 mb-3 justify-content-center">
                                    <div class="col-md-6">
                                        <div>
                                            <h5 class=" mb-1  text-primary text-center">Group : ${ugrpDesc} </h5>
                                            <input type="hidden" value="${ugrpCode}" readonly id="ugrpCode">
                                        </div> 
                                        <div class="form-check"> 
                                            <input type="checkbox" id="ALL" value="Y" class="form-check-input" onclick="checkAll('frmGroupmasteredit')">
                                            <label class="form-check-label" for="ALL"> Change All</label>
                                        </div>
                                        <c:forEach items="${programList}" var="pl" varStatus="loop">
                                            <div>
                                                <div class="form-check p">
                                                    <input class="form-check-input" type="checkbox" name="${pl[1]}" value="${pl[0]}" id="${pl[1]}" ${pl[2]} >
                                                    <label class="form-check-label" for="${pl[1]}" >${pl[1]}</label>
                                                </div>
                                                <c:forEach items="${allProgramList}" var="alp" varStatus="loop"> 
                                                    <c:if test = "${pl[0] eq alp[0]}">
                                                        <div class="form-check ms-4 in ">
                                                            <input class="form-check-input" type="checkbox"  name="${alp[1]}"  value="${alp[2]}" id="${alp[1]}" ${alp[3]}>
                                                            <label class="form-check-label" for="${alp[1]}" >  ${alp[1]}</label>
                                                        </div>
                                                        <c:forEach items="${allProgramList}" var="alp2" varStatus="loop"> 
                                                            <c:if test = "${alp[2] eq alp2[0]}">
                                                                <div class="form-check ms-5 in ">
                                                                    <input class="form-check-input" type="checkbox" name="${alp2[1]}" value="${alp2[2]}"   id="${alp2[1]}" ${alp2[3]}>
                                                                    <label class="form-check-label" for="${alp2[1]}" >  ${alp2[1]}</label>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                       </c:forEach>      
                                    </div>
                                </div>
                                <div class="row justify-content-center gap-2">
                                    <a class="btn btn-secondary    btn-sm  px-4 w-auto" type="button" href="program-master" > Back </a> 
                                    <button class="btn btn-primary btn-sm  px-4 w-auto" type="submit" id="btnSave">
                                        <span id="loadingBtn"></span>&nbsp;Save &nbsp; 
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var isCheck = false;
            function checkAll(formname) {
                var checkboxes = new Array();
                checkboxes = document[formname].getElementsByTagName('input');
                for (var i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].type == 'checkbox') {
                        if (checkboxes[i].checked == true)
                            checkboxes[i].checked = false;
                        else
                            checkboxes[i].checked = true;
                    }
                }
                if(isCheck){
                    $( "#ALL" ).prop( "checked", false ); // it not working for checked box  --- $("#ALL").attr('checked', false); 
                    isCheck=false;
                }else{
                    isCheck=true;
                    $( "#ALL" ).prop( "checked", true );
                }
            }
            function checkInnerLink(thi) {
                console.log("shivam");
                console.log(thi);
                console.log( $(thi).closest("div"));
                // var checkboxes = new Array();
                $(thi).closest("div").find('input:checkbox').each(function() {
                    console.log(this);
                    $(this).removeAttr('checked');
                });
                // checkboxes = thi.getElementsByTagName('input');
                // for (var i = 0; i < checkboxes.length; i++) {
                //     if (checkboxes[i].type == 'checkbox') {
                //         if (checkboxes[i].checked == true)
                //             checkboxes[i].checked = false;
                //         else
                //             checkboxes[i].checked = true;
                //     }
                // }
                // if(isCheck){
                //     $(thi ).prop( "checked", false ); // it not working for checked box  --- $("#ALL").attr('checked', false); 
                //     isCheck=false;
                // }else{
                //     isCheck=true;
                //     $( thi ).prop( "checked", true );
                // }
            }
            $("#frmGroupmasteredit").on("submit",function(event) {
                event.preventDefault();
                let ugrpCode = $("#ugrpCode").val()
                $("#frmGroupmasteredit").attr("action","program-group-edit-map?"+"ugrpCode="+ugrpCode);
                document.forms[0].submit(); 
            });  
        </script>
        <script>
            $(".p input[type=checkbox]").on("click",function (event) {
                console.log(this);
                if($(this).is(":checked")){
                    $(this) .parent("div"). siblings("div").find(" input[type=checkbox]").each(function (i,e) {
                        $(e).prop("checked",true);  
                    });
                }else{
                    $(this) .parent("div"). siblings("div").find(" input[type=checkbox]").each(function (i,e) {
                        $(e).prop("checked",false);    
                    });
                }
            });
    
            $(".in input[type=checkbox]").on("click",function(event){ 
                let isMark = false;
                if ($(event.target).is(":checked")) {
                    isMark = true;
                }
                $(this).parent("div:first").siblings("div").not(".p").each(function (i,e) {
                    if($(this).find("input[type=checkbox]").is(":checked")){
                        isMark = true;
                    }
                }); 
                if(isMark){
                    $(this).parent("div:first").parent("div").find("div").first().find("input[type=checkbox]").prop('checked',true);
                }else{ 
                    $(this).parent("div:first").parent("div").find("div").first().find("input[type=checkbox]").prop('checked',false);
                } 
            });
        </script>
    </body>
</html>