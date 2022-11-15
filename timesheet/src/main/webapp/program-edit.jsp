<%@ include file="menu.jsp" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <title>Program Add </title>
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
                            <form method="post" name="frmGroupmasteredit" class="form" autocomplete="off">
                                <div class="row gx-3 mb-3 justify-content-center">
                                    <div class="col-md-6">
                                        <div>
                                            <h5 class=" mb-1 text-center">Group : ${ugrpCode} </h5>
                                            <input type="hidden" value="${ugrpCode}" readonly id="ugrpCode">
                                        </div>
                                        <div class="form-check">
                                            <input type="checkbox" name="ALL" id="ALL" value="Y"
                                                class="form-check-input" 
                                                onclick="checkAll('frmGroupmasteredit')">
                                            <label class="form-check-label" for="ALL">
                                                Check All
                                            </label>
                                        </div>
                                        <c:forEach items="${programList}" var="pl" varStatus="loop">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value=""   onclick="checkInnerLink(this)"
                                                    id="flexCheckDefault">
                                                <label class="form-check-label" for="flexCheckDefault">
                                                    ${pl[1]}
                                                </label>
                                            </div>
                                            <div class="ms-4">
                                                <c:forEach items="${allProgramList}" var="alp" varStatus="loop">
                                                    <c:if test="${pl[0] eq alp[0]}">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value=""
                                                                id="flexCheckDefault">
                                                            <label class="form-check-label" for="flexCheckDefault">
                                                                ${alp[1]}
                                                            </label>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </c:forEach>
                                    </div>
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
            
        </script>
    </body>

    </html>