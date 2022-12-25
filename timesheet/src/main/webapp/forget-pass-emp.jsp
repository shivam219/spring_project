<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Program master </title>
    <link rel="stylesheet" href="css/form-style.css">
    <style>       tr td input{
        text-align: center;
    }</style>
</head>

<body>
    <div class="container-xl px-4 mt-4">
        <div class="row px-4 ">
            <div class="col col-xl-12">

                <form action="forget-pass-emp"  method="post" >
                    <div class="card mb-4">
                        <div class="card-header text-center">Forget Password</div>
                        <div class="card-body">
                            <div class="row gx-3 mb-1 justify-content-center">
                                <div class="col-sm-8 col-md-4">
                                    <table>
                                        <tr>
                                            <label class="small mb-1" for="groupDesc">  Choose Employee</label>
                                            <select id="p_code" name="empId" class="form-control form-select"  autocomplete="off" required >
                                                <option value="">choose </option>
                                                <c:forEach items="${emp}" var="e" varStatus="loop">
                                                    <option value="${e.getEmpId()}">${e.getEmployeeName()}</option>
                                                </c:forEach>
                                            </select>  
                                        </tr> 
                                        <tr>  
                                            <div>
                                                <label class="small mb-1" for="password"> New Password</label>
                                                <input class="form-control" name="password" id="password" type="text" placeholder="Enter User Password" value="${user.getPassword()}" required>     
                                            </div>
                                        </tr>
                                        <div class="row justify-content-center mt-3 gap-2 "> 
                                            <button class="btn btn-sm btn-secondary    w-auto order-md-1  order-2 " type="button" onclick="history.back()" > Back  </button> 
                                            <button class="btn btn-sm btn-primary w-auto order-md-2 order-1" type="submit"  >
                                                <span id="loadingBtn"> </span> &nbsp; Save Changes &nbsp;
                                            </button>
                                        </div>
                                    </table>               
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>
