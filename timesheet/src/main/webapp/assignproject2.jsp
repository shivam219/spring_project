<%@ include file="menu.jsp" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select 2</title>
 <link href="css/select@2.4.1.0.min.css" rel="stylesheet" />
 </head>

<body>

    <div class="card-body">
        <form action="assignprojectsave" method="POST">
            <div class="form-group mb-3">
                <label for="">Brands</label>
                <select name="brandlist[]" multiple id="brandlist1[]" class="form-control">
                  	<c:forEach items="${empList}" var="empName"
						varStatus="loop">
						<option value="${empName.getEmpId()}">${empName.getEmpName()}</option>
					</c:forEach>
                </select>
            </div>
             <div class="form-group mb-3">
                <label for="">Select Project</label>
                <select name="brandlist2[]" multiple id="brandlist2[]" class="form-control">
                   <c:forEach items="${projectList}" var="projectName"
						varStatus="loop">
						<option value="${projectName.getProjectid()}">${projectName.getProjectname()}</option>
					</c:forEach>
                </select>
                </div>
            <div class="form-group">
                <button type="submit" onclick="show()" name="save_multi_select" class="btn btn-primary">Save Data</button>
            </div>
        </form>
    </div>
    <script src="js/select2@4.1.0.min.js"></script>
    <script>
        $(".js-example-basic-multiple-limit").select2({
            maximumSelectionLength: 2
        });
        $('select').select2({
            placeholder: 'This is my placeholder',
            allowClear: true
        });
        function  show() {
            console.log($("#brandlist").val());
        }
    </script>

</body>

</html>