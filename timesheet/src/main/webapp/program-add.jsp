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
                    <div class="card-header text-center">Add Program for Group</div>
                    <div class="card-body">
                        <form action="program-group-map" method="post" name="program-group-map" autocomplete="off">      
                        <div class="row gx-3 mb-3 justify-content-center">                        
                            <div class="col-md-6">
                               <div>
                                    <label class="small mb-1" for="ugrpCode">Group </label>
                                    <select id="ugrpCode" class="form-control form-select">
                                            <c:forEach items="${userGroupList}" var="group" varStatus="loop">
                                                <option value="${group.getUgrpCode()}">${group.getUgrpDesc()}</option>
                                            </c:forEach>         
                                    </select>
                               </div>
                               <c:forEach items="${programList}" var="pl" varStatus="loop">
                                    <div>
                                        <div class="form-check p">
                                            <input class="form-check-input" type="checkbox" name="${pl[1]}" value="${pl[0]}" id="${pl[1]}" >
                                            <label class="form-check-label" for="${pl[1]}" >${pl[1]}</label>
                                        </div>
                                        <c:forEach items="${allProgramList}" var="alp" varStatus="loop"> 
                                            <c:if test = "${pl[0] eq alp[0]}">
                                                <div class="form-check ms-4 in ">
                                                    <input class="form-check-input" type="checkbox"  name="${alp[1]}"  value="${alp[2]}"    id="${alp[1]}">
                                                    <label class="form-check-label" for="${alp[1]}" >  ${alp[1]}</label>
                                                </div>
                                                <c:forEach items="${allProgramList}" var="alp2" varStatus="loop"> 
                                                    <c:if test = "${alp[2] eq alp2[0]}">
                                                        <div class="form-check ms-5 in ">
                                                            <input class="form-check-input" type="checkbox" name="${alp2[1]}" value="${alp2[2]}"   id="${alp2[1]}">
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
                            <a class="btn btn-secondary btn-sm    btn-sm  px-4 w-auto" type="button" href="program-master" > Back </a> 
                            <button class="btn btn-primary btn-sm btn-sm  px-4 w-auto" type="submit" id="btnSave">
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